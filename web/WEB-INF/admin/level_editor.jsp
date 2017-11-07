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
	}
	.tile-icon
	{
		width:40px;
		height:40px;
		text-align:center;
		display: inline-block;
		vertical-align: middle;
	}
</style>
<div style="display:inline-block;width:295px;height:100%;float:left;border-right:5px solid #49483E;">
	<p style="font-size:18px;padding:20px;">Select a tile to apply:</p>
		<%
			MapData mapData = (MapData) request.getAttribute("map_data");
			
			ArrayList<Tile> tiles = mapData.Tiles.getAllTiles();
			
			for(Tile tile : tiles)
			{
				out.print("<div class = 'level-tile-select horizontal-fill-container' data-tile-id = '"+tile.Id+"'><div class = 'horizontal-fill'><div class = 'tile-icon' style = 'background-color:"+tile.Icon+"'></div></div><div class = 'horizontal-fill'><div class = 'tile-name'>"+tile.Name+"</div></div></div>");
			}
		%>
</div>
<div style="display:inline-block;width:calc(100% - 300px);height:100%;text-align:center;">
	<table class = "map-table" style = "position: relative; top: 50%;transform: translateY(-50%);">
	<%
		for(int y =mapData.Map.DimY-1;y>=0;y--)
		{
			out.print("<tr>");
			for(int x = 0 ;x<mapData.Map.DimX;x++)
			{
				out.print("<td><div class = \"map-tile\" data-x = '"+x+"' data-y='"+y+"' style = \"background-color:");
				final Tile tile = mapData.GetTile(x, y);
				if(tile != null)
				{
					out.print(tile.Icon);
				}
				else
				{
					out.print("green");
				}
				out.print(";\"></div></td>");
			}
			out.print("</tr>");
		}
	%>
	</table>
</div>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />