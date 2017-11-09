<%@ page import="com.data.MapData" %>
<%@ page import="com.data.Tile" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Level Editor</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<style>
	.level-tile-select
	{
		transition: background-color .2s;
		cursor: pointer;
		padding: 10px;
		width: calc(100% - 20px);
	}
	.level-tile-select:hover
	{
		background-color: #49483E;
	}
	.tile-name
	{
		display: inline-block;
		margin:10px;
	}
	.tile-icon
	{
		width:40px;
		height:40px;
		text-align:center;
		display: inline-block;
		vertical-align: middle;
		margin:10px;
	}
	.action
	{
		margin:3px;
		padding: 2px;
		border: 1px solid #75715E;
		height: 83px;
		vertical-align: middle;
		overflow: hidden;
		cursor:pointer;
		transition: background-color .15s, box-shadow .15s;
		border-radius:5px;
		box-shadow: inset 0 0 1px 1pt #49483E;
	}
	.action:hover
	{
		background-color: #49483E;
		box-shadow: inset 0 0 1px 1pt #A6E22E;
	}
	.action:hover>i.action-icon
	{
		color:#A6E22E;
	}
	.action-icon
	{
		transition: color .15s;
		font-size: 65px;
		color: #75715E;
		margin-bottom: 5px;
	}
	.action-text
	{
		font-size:10px;
	}
</style>
<div style="display:inline-block;width:95px;height:100%;float:left;border-right:5px solid #49483E;">
	<div class = "action"><i class = "fa fa-gear action-icon"></i><p class = "action-text">Level Settings</p></div>
	<div class = "action"><i class = "fa fa-th action-icon"></i><p class = "action-text">Tile Editor</p></div>
	<div class = "action"><i class = "fa fa-street-view action-icon"></i><p class = "action-text">Entity Editor</p></div>
</div>
<div style="display:inline-block;width:295px;height:100%;float:left;border-right:5px solid #49483E;">
	<p style="font-size:18px;padding:20px;">Select a tile to apply:</p>
	<table style = "border-collapse: collapse;width:100%;text-align:center;">
		<%
			MapData mapData = (MapData) request.getAttribute("map_data");
			
			ArrayList<Tile> tiles = mapData.Tiles.getAllTiles();
			
			for(Tile tile : tiles)
			{
				out.print("<tr class = 'level-tile-select' data-tile-icon='"+tile.Icon+"' data-tile-type = '"+tile.Type+"' data-tile-id = '"+tile.Id+"'><td><div class = 'tile-icon pixel' style = 'background-image: url(/map_tiles/"+tile.Icon+".png)'></div></td><td><div class = 'tile-name'>"+tile.Name+"</div></td></tr>");
			}
		%>
	</table>
</div>
<div style="display:inline-block;width:calc(100% - 400px);height:100%;text-align:center;">
	<table class = "map-table" style = "position: relative; top: 50%;transform: translateY(-50%);">
	<%
		for(int y =mapData.Map.DimY-1;y>=0;y--)
		{
			out.print("<tr>");
			for(int x = 0 ;x<mapData.Map.DimX;x++)
			{
				final Tile tile = mapData.GetTile(x, y);
				if(tile != null)
				{
					out.print("<td><div class = \"map-tile pixel\" data-x = '"+x+"' data-y='"+y+"' data-type=\""+tile.Type+"\" data-id=\""+tile.Id+"\" style = \"cursor:pointer;background-image: url(/map_tiles/");
					out.print(tile.Icon);
				}
				else
				{
					out.print("<td><div class = \"map-tile pixel\" data-x = '"+x+"' data-y='"+y+"' data-type=\"0\" style = \"cursor:pointer;background-image: url(/map_tiles/");
					out.print("null");
				}
				out.print(".png);\"></div></td>");
			}
			out.print("</tr>");
		}
	%>
	</table>
</div>
<script>
	$(document).ready(function(){
		var selected_tile_type=null;
		var selected_tile_icon=null;
		$(".level-tile-select").click(function(){
			
			var selected = $(this).data("tile-id");
			selected_tile_type = $(this).data("tile-type");
			selected_tile_icon = $(this).data("tile-icon");
			
			$(".level-tile-select").each(function(){
				if($(this).data("tile-id") === selected)
				{
					$(this).css("background-color","#75715E");
				}
				else
				{
					$(this).css("background-color","");
				}
			});
		});
		
		// make the stuff draggable
		var isMouseDown = false;
		$('body').mousedown(function() {isMouseDown = true;}).mouseup(function() {isMouseDown = false;});
		$(".map-tile").mouseenter(function()
		{
			if(isMouseDown)
			{
				changeTile($(this));
			}
		});
		$(".map-tile").mousedown(function(){
			changeTile($(this));
		});
		function changeTile(selected_el)
		{
			if(selected_tile_type !== null)
			{
				selected_el.css("background-image","url(/map_tiles/"+selected_tile_icon+".png)");
				$.post("/Admin/LevelEditor",{
						action:"tile",
						x:selected_el.data("x"),
						y:selected_el.data("y"),
						type:selected_tile_type,
						map: "<%= mapData.Map.Id%>"})
			}
		}
		$(".")
	});
</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />