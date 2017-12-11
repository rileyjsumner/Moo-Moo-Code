<%@ page import="com.data.Lesson.Lesson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.Lesson.LessonCategory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Admin</title>
<link rel="stylesheet" href="<c:url value="/css/lesson.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
		<p class="content-header">Select a lesson</p>
		<%
		ArrayList<LessonCategory> lessonCategories = (ArrayList<LessonCategory>) request.getAttribute("lessons");
		boolean first = true;
		for (LessonCategory lessonCategory : lessonCategories) {%>
			<div class = "category-container">
				<div class="lesson-category bracket-hover lesson-category-complete <%=(first?" style='background-color:#49483E'":"")%>">
					<p class="lesson-text"><%=lessonCategory.Name%></p>
				</div>
				<div class = "lessons-container" <% if(!first) {out.print(" style=\"display:none\"");}%>>
				<%
					ArrayList<Lesson> lessons = lessonCategory.getLessons();
					for (Lesson lesson : lessons) { %>
						<div data-lesson="<%=lesson.Id%>" class="lesson bracket-hover-mini lesson-complete">
							<p class="lesson-text"><%=lesson.Name%></p>
						</div>
					<% }
					first = false; %>
					<div data-category="<%=lessonCategory.Id%>" data-lesson="-1" class="lesson bracket-hover-mini lesson-complete">
						<p class="lesson-text">New Lesson</p>
					</div>
				</div>
			</div>
		<% } %>
			<div class = "category-container" id="new_category_wrapper">
				<div class="lesson-category bracket-hover lesson-category-complete" id="lesson_new_category">
					<p class="lesson-text">New Lesson Category</p>
				</div>
			</div>
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
			var destination = "?id="+$(this).data("lesson");
			location.href = destination;
		});
		$("#lesson_new_category").click(function()
		{
			$(this).remove();
			$("#new_category_wrapper").append("" +
				"<form action=\"<c:url value='/Admin/Lessons'/>\" method=\"POST\">" +
					"<input type=\"text\" name=\"category_name\"/>" +
					"<input type=\"submit\" name=\"submit\" value=\"Add Category\"/>" +
				"</form>");
			
		});
	</script>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />