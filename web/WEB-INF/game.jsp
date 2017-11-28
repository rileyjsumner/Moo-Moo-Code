<%@ page import="com.data.Map.MapData" %>
<%@ page import="com.data.Map.Tile" %>
<%@ page import="com.data.Map.Entity" %>
<%@ page import="com.data.Game.GameOutput" %>
<%@ page import="com.data.Game.GameFrame" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.util.Html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />

<title>Moo Moo Code - Game</title>
<link rel="stylesheet" href="<c:url value="/css/map.css"/>">
<link rel="stylesheet" href="<c:url value="/css/levels.css"/>">

<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<% MapData mapData = (MapData) request.getAttribute("level_data");
boolean exec = (boolean) request.getAttribute("exec");%>

<div id="desc-modal" class="modal" <%if(!exec){%>style = 'display:block'<%}%>>
	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<pre class = 'map-desc'><%=mapData.Map.Desc%></pre>
	</div>
</div>

<div id="help-modal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<pre class = 'map-desc'><%=mapData.Map.Help%></pre>
	</div>
</div>


<div class = 'play-code-panel'>
	<form id = 'code-input-form' style="height:calc(100% - 400px);margin: 0px;" action = '<c:url value="/Game?level="/><%=mapData.Map.Id%>'  method = 'post'>
		<div style = 'width:100%;height:100%;position: relative;overflow: hidden'>
			<textarea name = 'player-code' style = "text-align:left;display: none;" id = 'code'><%if(exec){out.print((String)request.getAttribute("code"));}else{out.print(mapData.Map.Code);}%></textarea>
		</div>
	</form>
	<div style = 'width:100%;height:50px;' class = 'bracket-hover'>
		<p style = 'font-size: 22px;text-align: center;color: greenyellow;cursor: pointer;padding: 10px;background-color: #181916;' onclick="$('#code-input-form').submit();">Run</p>
	</div>
	<div style="height: 350px;background-color:inherit;position: relative">
		<p style="height:30px;display: block;text-align: center;font-size: 18px;font-weight: bold;">Output:</p>
		<pre id = 'code-output' style="height: 320px;max-height: 330px; overflow-y: scroll; display: block;text-align: left;margin: 0px 0px 0px 5px;"></pre>
	</div>
</div>
<div style="display:inline-block;width:calc(100% - 552px);height:100%;text-align:center;float:right;position: relative">
	<div style = 'position:absolute;display: inline-block;right:0;top:0;z-index: 1;'>
		<i id = 'desc-open' style = 'left:10px' class = 'modal-open-btn fa fa-sliders'></i>
		<i id = 'help-open' class = 'modal-open-btn fa fa-question'></i>
	</div>
	<div style = 'position: absolute;top: 0;width: 100%;font-weight: bold;'>
		<div style = 'display: inline-block;width: 100px;height: 50px;background-color: #75715E; border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;'>
			<p id = 'clock-s' style = 'display: inline-block;font-size: 40px;'>8</p><p id = 'clock-ms' style = 'display: inline-block;margin-left: 10px;'>0</p>
		</div>
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
	var desc_modal = document.getElementById('desc-modal');
	var help_modal = document.getElementById('help-modal');
	
	// When the user clicks on the button, open the modal
	$("#desc-open").click(function() {
		desc_modal.style.display = "block";
	});
	$("#help-open").click(function() {
		help_modal.style.display = "block";
	});
	
	// When the user clicks on <span> (x), close the modal
	$(".close").click(function() {
		help_modal.style.display = "none";
		desc_modal.style.display = "none";
	});
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target === help_modal) {
			help_modal.style.display = "none";
		}
		else if (event.target === desc_modal) {
			desc_modal.style.display = "none";
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
	function setTime(time)
	{
		$("#clock-s").html(Math.floor(time*.1));
		$("#clock-ms").html(time % 10);
	}
	function addConsole(text,error)
	{
		var code_out = $("#code-output");
		if(error){code_out.append("<pre class = 'error'>"+text+"</pre>");}
		else{code_out.append(text);}
		code_out.scrollTop(code_out[0].scrollHeight);
	}
	function win()
	{
		// Make the clock Green
		$("#clock-s").css("color","#A6E22E");
		$("#clock-ms").css("color","#A6E22E");
		
		// Add COMPLETE to console
		var code_out = $("#code-output");
		code_out.append("<pre class = 'win'>LEVEL COMPLETE!</pre>");
		code_out.scrollTop(code_out[0].scrollHeight);
	}
	function lose()
	{
		// Make the clock Green
		$("#clock-s").css("color","#ff4841");
		$("#clock-ms").css("color","#ff4841");
		
		// Add COMPLETE to console
		var code_out = $("#code-output");
		code_out.append("<pre class = 'error'>LEVEL FAILED</pre>");
		code_out.scrollTop(code_out[0].scrollHeight);
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
					int time =((100*80) - (frame.TimeLeft*100));
					out.print("\nsetTimeout(function(){setTime("+frame.TimeLeft+");moveEntity(0,"+frame.Data.PlayerX+","+frame.Data.PlayerY+");");
					if(!Objects.equals(frame.ConsoleOut, "")){out.print("addConsole(\""+ Html.encode(frame.ConsoleOut)+"\","+frame.ConsoleError+")");}
					for(Entity entity : frame.Data.Entities)
					{
						out.print("\nmoveEntity("+entity.Id+","+entity.X+","+entity.Y+");");
					}
					if(frame.GameState==1){out.print("win();");}
					else if(frame.GameState == -1){out.print("lose();");}
					out.print("},"+time+");");
				}
			}
		%>
	});
</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />