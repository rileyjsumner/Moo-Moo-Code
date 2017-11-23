<%@ page import="com.data.Lesson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.LessonCategory" %>
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
			ArrayList<LessonCategory> lessonCategories = (ArrayList<LessonCategory>)request.getAttribute("categories");
				if((boolean)request.getAttribute("admin")) {
					if(lesson_id == -1)
					{
						ArrayList<Lesson> lessons = (ArrayList<Lesson>)request.getAttribute("lessons");
						
						int categoryProgress = (int)request.getAttribute("progress_category");
						int lessonProgress = (int)request.getAttribute("progress_lesson");
						
						out.print("<p class=\"content-header\">Select a lesson</p>");
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
		
				}
				else
				{
					ArrayList<Lesson> lessons = (ArrayList<Lesson>)request.getAttribute("lessons");
					String lesson_text = "";
					String lesson_title = "";
					int lesson_category = -1;
					int lesson_num = -1;
					for(Lesson lesson : lessons) {
						if(lesson.Id == lesson_id) {
							lesson_text = lesson.text;
							lesson_title = lesson.Name;
							lesson_category = lesson.CategoryNum;
							lesson_num = lesson.Num;
						}
					}
					
			%>
					<div class="lesson_text">
						<h2><% out.print(lesson_title); %></h2>
						<p><% out.print(lesson_text); %></p>
					</div>
					<div class="code">
					
					</div>
					
			<%
				}
			
		%>
	</div>
	
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />