<%@ page import="com.data.Map.MapData" %>
<%@ page import="com.data.Map.Tile" %>
<%@ page import="com.data.Map.Entity" %>
<%@ page import="com.data.Game.GameOutput" %>
<%@ page import="com.data.Game.GameFrame" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />

<title>Moo Moo Code - Game</title>
<link rel="stylesheet" href="<c:url value="/css/map.css"/>">
<link rel="stylesheet" href="<c:url value="/css/levels.css"/>">

<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<% MapData mapData = (MapData) request.getAttribute("level_data");
boolean exec = (boolean) request.getAttribute("exec");%>

<div id="myModal" class="modal" <%if(!exec){%>style = 'display:block'<%}%>>
	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<pre class = 'map-desc'><%=mapData.Map.Desc%></pre>
	</div>
</div>

<div class = 'play-code-panel'>
	<form action = '<c:url value="/Game?level="/><%=mapData.Map.Id%>'  method = 'post'>
	<div style = 'width:100%;height:400px;position: relative;overflow: hidden'>
		<textarea name = 'player-code' style = "text-align:left;display: none;" id = 'code'><%if(exec){out.print((String)request.getAttribute("code"));}else{out.print(mapData.Map.Code);}%></textarea>
	</div>
	<div style = 'width:100%;height:50px;'>
		<div class = 'bracket-hover'><p style = 'font-size: 22px;text-align: center;color: greenyellow;cursor: pointer;padding: 10px;background-color: #181916;' onclick="$(this).closest('form').submit();">Run</p></div>
	</div>
	</form>
	<div style = 'height:calc(100% - 450px);width:100%'>
		<p style="display: block;text-align: center;font-size: 18px;font-weight: bold;">Output:</p>
		<p id = 'code-output' style="display: block;text-align: left;padding: 5px;margin: 5px;border-left: 1px solid #49483E;"></p>
	</div>
</div>
<div style="display:inline-block;width:calc(100% - 552px);height:100%;text-align:center;float:right">
	<div style = 'position:absolute;display: inline-block;left:0;top:0'>
		<i id = 'desc-open' class = 'fa fa-sliders'></i>
	</div>
	<table class = 'map-table'>
		<%
			for(int y =mapData.Map.DimY-1;y>=0;y--)
			{
				out.print("<tr><td class = 'map-label-cell'><div class = 'map_label_y'>"+y+"</div></td>");
				for(int x = 0 ;x<mapData.Map.DimX;x++)
				{
					if(x == mapData.Map.DimX-1 && y ==mapData.Map.DimY-1){out.print("<td id = 'entity-reference' class = 'map-tile-cell'>");}
					else{out.print("<td class = 'map-tile-cell'>");}
					final Tile tile = mapData.GetTile(x, y);
					if(tile != null)
					{
						out.print("<div class = \"map-tile pixel\" data-x = '"+x+"' data-y='"+y+"' data-type=\""+tile.Type+"\" data-id=\""+tile.Id+"\" style = \"cursor:pointer;background-image: url(/icons/map_tiles/");
						out.print(tile.Icon);
					}
					else
					{
						out.print("<div class = \"map-tile pixel\" data-x = '"+x+"' data-y='"+y+"' data-type=\"0\" style = \"cursor:pointer;background-image: url(/icons/map_tiles/");
						out.print("null");
					}
					if(y == 0)
					{
						out.print(".png);\"></div><div class = 'map_label_x'>"+x+"</div></td>");
					}
					else{
						out.print(".png);\"></div></td>");
					}
				}
				out.print("</tr>");
			}
		%>
	</table>
</div>
<script>
	// Get the modal
	var modal = document.getElementById('myModal');
	
	// When the user clicks on the button, open the modal
	$("#desc-open").click(function() {
		modal.style.display = "block";
	});
	
	// When the user clicks on <span> (x), close the modal
	$(".close").click(function() {
		modal.style.display = "none";
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target === modal) {
			modal.style.display = "none";
		}
	};
	var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"), {
		theme: "monokai",
		lineNumbers: true,
		mode: "javascript",
		autoCloseBrackets: true,
		matchBrackets: true,
		showCursorWhenSelecting: true
	});
	codeMirror.setSize("100%","100%");
	var max_x = <%= mapData.Map.DimX %>;
	var max_y = <%= mapData.Map.DimY %>;
	function moveEntity(id,x,y)
	{
		var ent = $("#entity-ref-"+id);
		ent.css("right",(( max_x - x - 1) * 50) + "px");
		ent.css("top",(( max_y - y - 1) * 50) + "px");
	}
	function addEntity(entity_class,x,y,id)
	{
		$("#entity-reference").append("<div id = 'entity-ref-"+id+"' class = 'map-entity pixel "+entity_class+"' style=\"" +
			"right:" + (( max_x - x - 1) * 50) + "px;" +
			"top:" + (( max_y - y - 1) * 50) + "px\">");
	}
	$(document).ready(function()
	{
		addEntity("entity-player",<%= mapData.Map.SpawnX %>,<%= mapData.Map.SpawnY %>,0);
		<%
			for(Entity entity : mapData.MapEntities)
			{
				out.print("addEntity('");
				if(entity.Type==0)
				{
					out.print("entity-cow");
				}
				out.print("',"+entity.X+","+entity.Y+","+entity.Id+");");
			}
			if(exec)
			{
				GameOutput animations = (GameOutput) request.getAttribute("game_data");
				// Add the animations
				for(GameFrame frame: animations.GameChanges)
				{
					int time =((200*10) - (frame.TimeLeft*200));
					out.print("\nsetTimeout(function(){moveEntity(0,"+frame.Data.PlayerX+","+frame.Data.PlayerY+");},"+time+");");
					for(Entity entity : frame.Data.Entities)
					{
						out.print("\nsetTimeout(function(){moveEntity("+entity.Id+","+entity.X+","+entity.Y+");},"+time+");");
					}
				}
			}
		%>
	});
</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />