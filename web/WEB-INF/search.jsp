<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Search</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<div class="search_wrapper">
	<form action="${pageContext.request.contextPath}/LessonSearch" method="POST">
		<input type="text" name="query" placeholder="search"/>
		<input type="submit" class="edit-btn edit-btn-green" name="submit" value="Search Lessons"/>
	</form>
<%

	if (!(Boolean)request.getAttribute("empty")) {
		ArrayList<String> results = (ArrayList<String>)request.getAttribute("results");
		out.print("<div class=\"results\">");
		for(String lessonResult : results) {
			out.print(lessonResult);
		}
		out.print("</div>");
	} else {
		out.print("<p>The Search Returned No Results</p>");
	}
%><br/><a href="${pageContext.request.contextPath}/Learn">Back to Lesson Select</a>
</div>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />