<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.data.LessonCategory" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.Lesson" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Learn</title>
<link rel="stylesheet" href="<c:url value="/css/lesson.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

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
		location.href = "/Lesson?lesson="+$(this).data("lesson");
	});
</script>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />