<%@ page import="com.data.Lesson.Lesson" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Admin</title>
<link rel="stylesheet" href="<c:url value="/css/lesson.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<div>
	<div class="lesson_content">
		<%
			int lesson_id = (int)request.getAttribute("lesson_id");
			if((boolean)request.getAttribute("admin")) {
				if(lesson_id == -1)
				{
					ArrayList<Lesson> lessons = (ArrayList<Lesson>)request.getAttribute("lessons");
					
					for(Lesson lesson : lessons) {
			%>
					<div class="lesson_box" onclick="location.href='?lesson=<% out.print(lesson.Id); %>'">
						<h2><% out.print(lesson.Name); %></h2>
					</div>
			<%
					}
				}
				else
				{
					ArrayList<Lesson> lessons = (ArrayList<Lesson>)request.getAttribute("lessons");
					Lesson current_lesson = lessons.get(lesson_id);
					String lesson_text = current_lesson.text;
					String lesson_title = current_lesson.Name;
					int lesson_category = current_lesson.CategoryNum;
					int lesson_num = current_lesson.Num;
			%>
					<div class="lesson_text">
						<h2><% out.print(lesson_title); %></h2>
						<p><% out.print(lesson_text); %></p>
					</div>
					<div class="code">
					
					</div>
					
			<%
				}
			}
		%>
	</div>
	
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />