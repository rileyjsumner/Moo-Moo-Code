<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.data.Level.LevelId" %>
<%@ page import="com.data.Level.LevelIds" %>

<%--@elvariable id="signed_in" type="Boolean"--%>
<%--@elvariable id="account_name" type="java.lang.String"--%>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Level Select</title>
<link rel="stylesheet" href="<c:url value="/css/levels.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div class = "levels_container" style="height:100%">
	<div class = "levels_container_center">
		<%
			LevelIds levelObj = (LevelIds)request.getAttribute("levels");
			for(LevelId level : levelObj.levels)
			{
				if(level.State == 3){out.print("<div onclick = \"location.href='/Game?level="+level.Id+"'\" style=\"left: "+(level.PosX*10 - 37.5)+"px; bottom: "+(level.PosY*10 - 37.5)+"px\" class=\"levels_container_level levels_container_level_complete\"><p class=\"levels_container_level_name\">"+level.Name+"</p></div>");}
				else if(level.State == 2){out.print("<div onclick = \"location.href='/Game?level="+level.Id+"'\" style=\"left: "+(level.PosX*10 - 37.5)+"px; bottom: "+(level.PosY*10 - 37.5)+"px\" class=\"levels_container_level levels_container_level_active\"><p class=\"levels_container_level_name\">"+level.Name+"</p></div>");}
				else if(level.State == 1){out.print("<div style=\"left: "+(level.PosX*10 - 37.5)+"px; bottom: "+(level.PosY*10 - 37.5)+"px\" class=\"levels_container_level levels_container_level_locked\"><p class=\"levels_container_level_name\"><i class = 'fa fa-lock' style='font-size:40px;'></i></p></div>");}
				//else if(level.State == 0){out.print("></div>");}
			}
		%>
	</div>
	<svg class = "levels_container_svg" id = "svg_container">
		<%
			for(LevelId level : levelObj.levels)
			{
				if(level.State != 0)
				{
					if(level.UnlocksFrom_1 != -1)
					{
						LevelId connectTo = levelObj.find(level.UnlocksFrom_1);
						if(level.PathState_1 == 1)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
						else if(level.PathState_1 == 0)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#75715E;stroke-width:7' ></line>" +
									"<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#49483E;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
						else if(level.PathState_1 == 2)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' ></line>" +
									"<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#87BA20;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
					}
					if(level.UnlocksFrom_2 != -1)
					{
						LevelId connectTo = levelObj.find(level.UnlocksFrom_2);
						if(level.PathState_2 == 1)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
						else if(level.PathState_2 == 0)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#75715E;stroke-width:7' ></line>" +
									"<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#49483E;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
						else if(level.PathState_2 == 2)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' ></line>" +
									"<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#87BA20;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
					}
					if(level.UnlocksFrom_3 != -1)
					{
						LevelId connectTo = levelObj.find(level.UnlocksFrom_3);
						if(level.PathState_3 == 1)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
						else if(level.PathState_3 == 0)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#75715E;stroke-width:7' ></line>" +
									"<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#49483E;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
						else if(level.PathState_3 == 2)
						{
							out.print("<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#A6E22E;stroke-width:7' ></line>" +
									"<line class = 'test-line' x1='"+level.PosX+"' y1 = '"+level.PosY+"' x2 = '"+connectTo.PosX+"' y2 = '"+connectTo.PosY+"' style = 'stroke:#87BA20;stroke-width:7' stroke-dasharray='5,5'>" +
									"<animate id = 'anim1' attributeType=\"XML\" attributeName=\"stroke-dashoffset\" from=\"0\" to=\"10\"" +
									"        dur=\".5s\" begin=\"0s;\" repeatcount=\"indefinite\"/>" +
									"</line>");
						}
					}
				}
			}
		%>
	</svg>
</div>
<script>
	var svgEl = $("#svg_container");
	var svgWidth = svgEl.width();
	var svgHeight = svgEl.height();
	svgEl.children("line").each(function(){
		console.log($(this));
		console.log($(this).attr("x1"));
		$(this).attr("x1",$(this).attr("x1") * 10 + svgWidth * .5);
		$(this).attr("x2",$(this).attr("x2") * 10 + svgWidth * .5);
		$(this).attr("y1",$(this).attr("y1") * -10 + svgHeight * .5);
		$(this).attr("y2",$(this).attr("y2") * -10 + svgHeight * .5);
	});
</script>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />