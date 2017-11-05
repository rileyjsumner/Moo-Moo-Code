<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.data.LevelId" %>
<%@ page import="com.data.LevelIds" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Admin</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div id = "total_container" style="height: 100%;">
	<div id = "level-editor" style="width:298px; background-color:#272822;height:100%; display: inline-block;position: relative;float:left;border-right:2px solid #49483E;"><!-- -->
		<p style="margin:20px;font-size:20px">Level Properties:</p>
		<form>
			<table style = "width: 100%;overflow: hidden;white-space: nowrap;">
				<tr><td><label class = "admin-levels-label" for="data-name">Name:</label></td><td><input class = "admin-levels-input" id = "data-name" name = "name" type = "text"/></td></tr>
				<tr><td><label class = "admin-levels-label" for="data-x-position">X Position:</label></td><td><input class = "admin-levels-input" id= "data-x-position" name ="x_position" type = "text" /></td></tr>
				<tr><td><label class = "admin-levels-label" for="data-y-position">Y Position:</label></td><td><input class = "admin-levels-input" id= "data-y-position" name ="y_position" type = "text" /></td></tr>
			</table>
		</form>
	</div>
	<div style="width:calc(100% - 300px);height: 100%; display: inline-block;float:right;" class = "levels_container">
		<div class = "levels_container_center">
			<%
				LevelIds levelObj = (LevelIds)request.getAttribute("levels");
				for(LevelId level : levelObj.levels)
				{
					out.print("<div data-pos-x='"+level.PosX+"' data-pos-y='"+level.PosY+"' data-name='"+level.Name+"' data-id='"+level.Id+"' data-unlock-1='"+level.UnlocksFrom_1+"' data-unlock-2='"+level.UnlocksFrom_2+"' data-unlock-3='"+level.UnlocksFrom_3+"' "+
							"style=\"left: "+(level.PosX*10 - 37.5)+"px; bottom: "+(level.PosY*10 - 37.5)+"px\" class=\"levels_container_level levels_container_level_complete\"><p class=\"levels_container_level_name\">"+level.Name+"</p></div>");
				}
			%>
		</div>
		<svg class = "levels_container_svg" id = "svg_container" style = "    left: 0;">
			<%
				for(LevelId level : levelObj.levels)
				{
					if(level.UnlocksFrom_1 != -1)
					{
						LevelId connectTo = levelObj.find(level.UnlocksFrom_1);
						
						out.print("<line class = 'test-line' data-x1='"+level.PosX+"' data-y1 = '"+level.PosY+"' data-x2 = '"+connectTo.PosX+"' data-y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' ></line>" +
								"<line class = 'test-line' data-x1='"+level.PosX+"' data-y1 = '"+level.PosY+"' data-x2 = '"+connectTo.PosX+"' data-y2 = '"+connectTo.PosY+"' style = 'stroke:#87BA20;stroke-width:7' stroke-dasharray='5,5'>" +
								"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
								"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
								"</line>");
					}
					if(level.UnlocksFrom_2 != -1)
					{
						LevelId connectTo = levelObj.find(level.UnlocksFrom_2);
						out.print("<line class = 'test-line' data-x1='"+level.PosX+"' data-y1 = '"+level.PosY+"' data-x2 = '"+connectTo.PosX+"' data-y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' ></line>" +
								"<line class = 'test-line' data-x1='"+level.PosX+"' data-y1 = '"+level.PosY+"' data-x2 = '"+connectTo.PosX+"' data-y2 = '"+connectTo.PosY+"' style = 'stroke:#87BA20;stroke-width:7' stroke-dasharray='5,5'>" +
								"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
								"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
								"</line>");
					}
					if(level.UnlocksFrom_3 != -1)
					{
						LevelId connectTo = levelObj.find(level.UnlocksFrom_3);
						out.print("<line class = 'test-line' data-x1='"+level.PosX+"' data-y1 = '"+level.PosY+"' data-x2 = '"+connectTo.PosX+"' data-y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' ></line>" +
								"<line class = 'test-line' data-x1='"+level.PosX+"' data-y1 = '"+level.PosY+"' data-x2 = '"+connectTo.PosX+"' data-y2 = '"+connectTo.PosY+"' style = 'stroke:#87BA20;stroke-width:7' stroke-dasharray='5,5'>" +
								"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
								"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
								"</line>");
					}
				}
			%>
		</svg>
	</div>
</div>
<script>
	function resizeLines() {
		var svgEl = $("#svg_container");
		var svgWidth = svgEl.width();
		var svgHeight = svgEl.height();
		svgEl.children("line").each(function () {
			$(this).attr("x1", $(this).data("x1") * 10 + svgWidth * .5);
			$(this).attr("x2", $(this).data("x2") * 10 + svgWidth * .5);
			$(this).attr("y1", $(this).data("y1") * -10 + svgHeight * .5);
			$(this).attr("y2", $(this).data("y2") * -10 + svgHeight * .5);
		});
	}
	resizeLines();
	$(window).resize(function(){
		resizeLines();
	});
	// Add minor grid
	
	for(var x =-10;x<=10;x++)
	{
		$(".levels_container_center").append("<div class = \"levels_container_line_horizontal levels_container_line_minor\" style = 'bottom:"+(x*100 + 50)+"px'></div>");
	}
	for(var y =-10;y<=10;y++)
	{
		$(".levels_container_center").append("<div class = \"levels_container_line_vertical levels_container_line_minor\" style = 'left:"+(y*100 + 50)+"px'></div>");
	}
	
	// Add Major grid
	for(var x =-10;x<=10;x++)
	{
		$(".levels_container_center").append("<div class = \"levels_container_line_horizontal\" style = 'bottom:"+(x*100)+"px'></div><div class = \"levels_container_line_unit_horizontal\" style = 'bottom:"+(x*100)+"px'>"+(x*10)+"</div>");
	}
	for(var y =-10;y<=10;y++)
	{
		$(".levels_container_center").append("<div class = \"levels_container_line_vertical\" style = 'left:"+(y*100)+"px'></div><div class = \"levels_container_line_unit_vertical\" style = 'left:"+(y*100)+"px'>"+(y*10)+"</div>");
	}
	
	// Make Levels selectable
	$(".levels_container_level").click(function()
	{
		var clicked = $(this);
		var clicked_id = clicked.data("id");
		// Deselect other levels
		$(".levels_container_level").each(function()
		{
			if($(this).data("id") === clicked_id)
			{
				clicked.css("box-shadow","0 0 20px 3pt #A6E22E");
			}
			else
			{
				$(this).css("box-shadow","");
			}
		});
		// Add data to the left
		$("#data-name").val(clicked.data("name"));
		$("#data-x-position").val(clicked.data("pos-x"));
		$("#data-y-position").val(clicked.data("pos-y"));
	});
</script>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />