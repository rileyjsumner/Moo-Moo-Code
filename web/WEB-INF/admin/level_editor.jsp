<%@ page import="com.data.MapData" %>
<%@ page import="com.data.Tile" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Level Editor</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div style="text-align: center;">
	<table class = "map-table">
	<%
		MapData mapData = (MapData) request.getAttribute("map_data");
		out.print(mapData.Map.DimX+","+mapData.Map.DimY);
		
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