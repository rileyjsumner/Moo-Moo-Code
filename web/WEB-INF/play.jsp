<%@ page import="com.data.LevelId" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.LevelIds" %><%--@elvariable id="signed_in" type="Boolean"--%>
<%--@elvariable id="account_name" type="java.lang.String"--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<script src="../js/jquery-3.2.1.js"></script>
		
		<script src="../codemirror/lib/codemirror.js"></script>
		<link rel="stylesheet" href="../codemirror/lib/codemirror.css">
		<link rel="stylesheet" href="../codemirror/theme/monokai.css">
		<script src="../codemirror/mode/javascript/javascript.js"></script>
		<script src="../codemirror/addon/edit/closebrackets.js"></script>
		
		<title>Moo Moo Code</title>
		
		<script src = "../js/login.js"></script>
		<link rel="stylesheet" href="../css/main.css">
		<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
		
		<!-- FAVICONS -->
		<link rel="apple-touch-icon" sizes="57x57" href="../icons/apple-icon-57x57.png">
		<link rel="apple-touch-icon" sizes="60x60" href="../icons/apple-icon-60x60.png">
		<link rel="apple-touch-icon" sizes="72x72" href="../icons/apple-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="76x76" href="../icons/apple-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="114x114" href="../icons/apple-icon-114x114.png">
		<link rel="apple-touch-icon" sizes="120x120" href="../icons/apple-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="144x144" href="../icons/apple-icon-144x144.png">
		<link rel="apple-touch-icon" sizes="152x152" href="../icons/apple-icon-152x152.png">
		<link rel="apple-touch-icon" sizes="180x180" href="../icons/apple-icon-180x180.png">
		<link rel="icon" type="image/png" sizes="192x192"  href="../icons/android-icon-192x192.png">
		<link rel="icon" type="image/png" sizes="32x32" href="../icons/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="96x96" href="../icons/favicon-96x96.png">
		<link rel="icon" type="image/png" sizes="16x16" href="../icons/favicon-16x16.png">
		<link rel="manifest" href="../manifest.json">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="msapplication-TileImage" content="../icons/ms-icon-144x144.png">
		<meta name="theme-color" content="#ffffff">
	</head>
	<body>
		<div id="banner">
			<p class="banner-text">Moo Moo Code</p>
		</div>
		<div id="menu">
			<div class="menu-item bracket-hover" onclick = "location.href='Home';">
				<p class="menu-text">Home</p>
			</div>
			<div class="menu-item bracket-hover" onclick = "location.href='Learn';">
				<p class="menu-text">Learn</p>
			</div>
			<div class="menu-item bracket-hover" onclick="location.href='Code';">
				<p class="menu-text">Code</p>
			</div>
			<div class="menu-item bracket-hover" onclick="location.href='Play';">
				<p class="menu-text">Play</p>
			</div>
			<div class="menu-item bracket-hover">
				<p class="menu-text">Compete</p>
			</div>
		</div>
		<div id="content" class = "vertical-fill">
			<div class = "levels_container vertical-fill">
				<div class = "levels_container_center">
					<%
						LevelIds levelObj = (LevelIds)request.getAttribute("levels");
						for(LevelId level : levelObj.levels)
						{
							if(level.State == 3){out.print("<div style=\"left: "+(level.PosX*10 - 37.5)+"px; bottom: "+(level.PosY*10 - 37.5)+"px\" class=\"levels_container_level levels_container_level_complete\"><p class=\"levels_container_level_name\">"+level.Name+"</p></div>");}
							else if(level.State == 2){out.print("<div style=\"left: "+(level.PosX*10 - 37.5)+"px; bottom: "+(level.PosY*10 - 37.5)+"px\" class=\"levels_container_level levels_container_level_active\"><p class=\"levels_container_level_name\">"+level.Name+"</p></div>");}
							else if(level.State == 1){out.print("<div style=\"left: "+(level.PosX*10 - 37.5)+"px; bottom: "+(level.PosY*10 - 37.5)+"px\" class=\"levels_container_level levels_container_level_locked\"><p class=\"levels_container_level_name\"><i class = 'fa fa-lock' style='font-size:40px;'></i></p></div>");}
							//else if(level.State == 0){out.print("></div>");}
						}
					%>
				</div>
				<svg class = "levels_container_svg vertical-fill" id = "svg_container">
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
		</div>
		<script>makeMenu("<%=request.getSession().getAttribute("signed_in")%>","<%=request.getSession().getAttribute("username")%>");</script>
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
			/*
			var pulseFunc = function(targetElement){
				console.log("HERE");
				targetElement.css({left:'-200px'});
				targetElement.animate({'stroke': "#75715E"},
					{
						duration: 400,
						step: function(foo){
							$(this).attr('stroke', foo);
						}
					});
				targetElement.animate(
					{
						'stroke': "black"
					},
					{
						step: function(foo){
							$(this).attr('stroke', foo);
						},
						duration: 400,
						complete: function(){
							pulseFunc(targetElement);
						}
					}
				);
			};
			$("line").each(function(){
				console.log($(this));
				pulseFunc($(this));
			});*/
		</script>
	</body>
</html>
