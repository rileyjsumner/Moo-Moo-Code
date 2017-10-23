<%@ page import="com.data.LessonCategory" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.Lesson" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<script src="../js/jquery-3.2.1.js"></script>
		<script src="../js/jquery.color.js"></script>
		
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
					int categoryProgress = (int)request.getAttribute("progress_category");
					int lessonProgress = (int)request.getAttribute("progress_lesson");
					
					out.print("<p class=\"content-header\">Select a lesson</p>");
					ArrayList<LessonCategory> lessonCategories = (ArrayList<LessonCategory>) request.getAttribute("lessons");
					for (LessonCategory lessonCategory : lessonCategories) {
						boolean locked =false;
						boolean open = false;
						out.print("<div class = \"category-container\"><div class=\"lesson-category");
						if(categoryProgress == lessonCategory.Num){
							out.print(" bracket-hover lesson-category-active");
							open=true;
						}
						else if(categoryProgress < lessonCategory.Num){
							out.print(" lesson-category-locked");
							locked = true;
						}
						else{
							out.print(" bracket-hover lesson-category-complete");
						}
						out.print("\">");
						if(categoryProgress < lessonCategory.Num){out.print("<i style=\"margin-right:10px;\" class=\"fa fa-lock\"></i>");}
						out.print("<p class=\"lesson-text\">" + lessonCategory.Name + "</p></div>");
						if(!locked)
						{
							out.print("<div class = \"lessons-container\"");
							if(!open){out.print(" style=\"display:none\"");}
							out.print(">");
							ArrayList<Lesson> lessons = lessonCategory.getLessons();
							for (Lesson lesson : lessons) {
								out.print("<div data-lesson=\""+lesson.Id+"\" class=\"lesson");
								if(categoryProgress == lessonCategory.Num && lessonProgress == lesson.Num){
									out.print(" bracket-hover-mini lesson-active\">");
								}
								else if(categoryProgress < lessonCategory.Num || (categoryProgress == lessonCategory.Num && lessonProgress < lesson.Num)){
									out.print(" lesson-locked\">");
								}
								else{
									out.print(" bracket-hover-mini lesson-complete\">");
								}
								out.print("<p class=\"lesson-text\">" + lesson.Name + "</p></div>");
							}
							out.print("</div>");
						}
						out.print("</div>");
					}
				}
				else
				{
					out.print("<p style=\"text-align:center;display:block;margin-top:10px\">Sign in to view lessons</p>");
				}
			%>
		</div>
		<script>makeMenu("<%=request.getSession().getAttribute("signed_in")%>","<%=request.getSession().getAttribute("username")%>");</script>
		<script>
			// Switch categories
			$(".lesson-category-active, .lesson-category-complete").click(function()
			{
				var clicked = $(this).next();
				$(".lessons-container").each(function()
				{
					if(clicked[0] === $(this)[0])
					{
						$(this).slideDown({duration:100,easing:"linear"});
						$(this).prev().animate({backgroundColor: "#49483E"},100);
					}
					else
					{
						$(this).prev().animate({backgroundColor: "#272822"},100);
						$(this).slideUp({duration:100,easing:"linear"});
					}
				});
			});
			// Go to a lesson
			$(".lesson-complete, .lesson-active").click(function()
			{
				location.href = "Lesson?lesson="+$(this).data("lesson");
			});
		</script>
	</body>
</html>
