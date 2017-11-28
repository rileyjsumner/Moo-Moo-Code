<%@ page import="com.data.Lesson.Lesson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.Lesson.LessonCategory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Admin</title>
<link rel="stylesheet" href="<c:url value="/css/lesson.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<%
		out.print("<p class=\"content-header\">Select a lesson</p>");
		ArrayList<LessonCategory> lessonCategories = (ArrayList<LessonCategory>) request.getAttribute("lessons");
		boolean first = true;
		for (LessonCategory lessonCategory : lessonCategories) {
			out.print("<div class = \"category-container\">" +
						"<div class=\"lesson-category bracket-hover lesson-category-complete\" "+(first?" style='background-color:#49483E'":"")+">");
							out.print("<p class=\"lesson-text\">" + lessonCategory.Name + "</p>" +
						"</div>");
			out.print("<div class = \"lessons-container\"");
				if(!first){out.print(" style=\"display:none\"");}
				out.print(">");
			ArrayList<Lesson> lessons = lessonCategory.getLessons();
			for (Lesson lesson : lessons) {
				out.print("<div data-lesson=\""+lesson.Id+"\" class=\"lesson bracket-hover-mini lesson-complete\">");
					out.print("<p class=\"lesson-text\">" + lesson.Name + "</p>" +
						"</div>");
			}
			first = false;
			out.print("</div></div>");
		}
%>
	<script>
		// Switch categories
		$(".lesson-category-complete").click(function()
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
			location.href = "?id="+$(this).data("lesson");
		});
	</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />