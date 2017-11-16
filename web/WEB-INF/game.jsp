<%@ page import="com.data.MapData" %>
<%@ page import="com.data.Tile" %>
<%@ page import="com.data.Entity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />

<title>Moo Moo Code - Game</title>
<link rel="stylesheet" href="<c:url value="/css/map.css"/>">
<link rel="stylesheet" href="<c:url value="/css/levels.css"/>">

<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<% MapData mapData = (MapData) request.getAttribute("level_data");%>

<div id="myModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<p><%=mapData.Map.Desc%></p>
	</div>
</div>

<div style="display:inline-block;width:40%;height:100%;text-align:left;float:right;position: relative">
	<textarea style = "text-align:left;display: none;" id = 'code'><%=mapData.Map.Code%></textarea>
</div>
<div style="display:inline-block;width:60%;height:100%;text-align:center;float:right">
	<div style = 'position:absolute;display: inline-block;left:0;top:0'>
		<i class = 'fa fa-sliders'></i>
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
	$(document).ready(function(){
		
		var max_x = <%= mapData.Map.DimX %>;
		var max_y = <%= mapData.Map.DimY %>;
		function addEntity(entity_class,x,y)
		{
			$("#entity-reference").append("<div class = 'map-entity pixel "+entity_class+"' style=\"" +
				"right:" + (( max_x - x - 1) * 50) + "px;" +
				"top:" + (( max_y - y - 1) * 50) + "px\">");
		}
		addEntity("entity-player",<%= mapData.Map.SpawnX %>,<%= mapData.Map.SpawnY %>);
		<%
			for(Entity entity : mapData.MapEntities)
			{
				out.print("addEntity('");
				if(entity.Type==0)
				{
					out.print("entity-cow");
				}
				out.print("',"+entity.X+","+entity.Y+");");
			}
		%>
	});
</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />