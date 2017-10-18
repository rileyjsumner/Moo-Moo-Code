<%@ page import="com.data.LessonCategory" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.Lesson" %>
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
		<div id="banner-compact">
			<p class="banner-text">Moo Moo Code</p>
		</div>
		<div id="menu">
			<div class="menu-item bracket-hover" onclick="location.href='Home';">
				<p class="menu-text">Home</p>
			</div>
			<div class="menu-item bracket-hover">
				<p class="menu-text">Learn</p>
			</div>
			<div class="menu-item bracket-hover" onclick="location.href='Code';">
				<p class="menu-text">Code</p>
			</div>
			<div class="menu-item bracket-hover">
				<p class="menu-text">Compete</p>
			</div>
		</div>
		<div id="content">
			<%
				if((Boolean) request.getAttribute("show_lessons"))
				{
					out.print("<p class=\"content-header\">Select a lesson</p>");
					ArrayList<LessonCategory> lessonCategories = (ArrayList<LessonCategory>) request.getAttribute("lessons");
					for (LessonCategory lessonCategory : lessonCategories) {
						out.print("<div class = \"category-container\"><div class=\"lesson-category\">" +
								"<p class = \"lesson-num\">" + lessonCategory.Num + "</p><p class=\"lesson-text\">" + lessonCategory.Name + "</p></div>");
						
						ArrayList<Lesson> lessons = lessonCategory.getLessons();
						for (Lesson lesson : lessons) {
							out.print("<div class=\"lesson\"><p class = \"lesson-num\">" + lesson.Num + "</p><p class=\"lesson-text\">" + lesson.Name + "</p></div>");
						}
						out.print("</div>");
					}
				}
				else
				{
					out.print("<p>Sign in to view lessons</p>");
				}
			%>
		</div>
		<script>makeMenu("<%=request.getSession().getAttribute("signed_in")%>","<%=request.getSession().getAttribute("username")%>");</script>
	</body>
</html>
