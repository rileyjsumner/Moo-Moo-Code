<%@ page import="com.data.User" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Login</title>
<link rel="stylesheet" href="<c:url value="/css/table.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<div class="reports">
	<h2>Reports</h2>
	<div class="table">
		<div class="row header">
			<div class="cell">Statistic</div>
			<div class="cell">Value</div>
		</div>
		<div class="row">
			<div class="cell">Total Users</div>
			<div class="cell"><%=request.getAttribute("userCount")%></div>
		</div>
		<%
			ArrayList<Integer> categoryCount = (ArrayList<Integer>)request.getAttribute("user_progress");
			int i = 1;
			for(int count : categoryCount) {
				%>
					<div class="row">
						<div class="cell">Users at Lesson Category <%=i%></div>
						<div class="cell"><%=count%></div>
					</div>
				<%
				i++;
			}
		%>
	</div>
</div>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />