<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Account Options</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div class="content-header" style ="margin:20px">User Options</div>
<div class="content-container">
	<p class = "content-container-header">Username</p>
	<input type ="text" name = "username" class = "content-container-input" value = "<%=session.getAttribute("username")%>"/>
	<p class = "content-container-header">Password</p>
	<input type ="password" name = "password" class = "content-container-input" value = "<%=session.getAttribute("password")%>"/>
	<button class = "content-container-button">This doesn't work yet</button>
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />