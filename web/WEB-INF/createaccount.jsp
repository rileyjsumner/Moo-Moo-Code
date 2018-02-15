<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Create Account</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<script>
	function validateForm() {
		var user = document.forms["login"]["username"].value;
		var pass = document.forms["login"]["password"].value;
		if(user === "" || pass === "") {
			$("#blank").css("display", "block");
			$("#blank").css("color", "red");
			return false;
		}
		return true;
	}
</script>
<div class="content-header" style ="margin:20px">Create Account</div>
<div style = "text-align: center;">
	<div class="content-container" id="login-wrapper">
		<form name="login" action="${pageContext.request.contextPath}/CreateAccount" method = "POST" onsubmit="return validateForm()">
			<p class = "content-container-header">Username</p>
			<input type ="text" name = "username" class = "content-container-input" />
			<p class = "content-container-header">Password</p>
			<input type ="password" name = "password" class = "content-container-input" />
			<button class = "content-container-button">Create Account</button>
		</form>
		<p class = "login-failed" style="<% if(!(Boolean) request.getAttribute("failed")){out.print("display:none");}%>">username taken</p>
		<p class = "blank" id="blank" style="display:none;">Username and Password cannot be blank</p>
	</div>
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />