<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Login</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div class="content-header" style ="margin:20px">Log in</div>
<div class="content-container">
	<form action="Login" method = "POST">
		<p class = "content-container-header">Username</p>
		<input type ="text" name = "username" class = "content-container-input" />
		<p class = "content-container-header">Password</p>
		<input type ="password" name = "password" class = "content-container-input" />
		<input type="hidden" name = "action" value="<%= request.getAttribute("action")%>"/>
		<button class = "content-container-button">Log in</button>
	</form>
	<p class = "login-failed" style="<% if(!(Boolean) request.getAttribute("failed")){out.print("display:none");}%>">login failed</p>
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />