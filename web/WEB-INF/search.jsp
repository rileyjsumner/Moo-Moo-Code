<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Search</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<%

	if (!(Boolean)request.getAttribute("empty")) {
		ArrayList<String> results = (ArrayList<String>)request.getAttribute("results");
		for(String lessonResult : results) {
			out.print(lessonResult);
		}
	} else {
		out.print("<p>The Search Returned No Results</p>");
	}
	out.print("<br/><a href=\"/Learn\">Back to Lesson Select</a>");
%>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />