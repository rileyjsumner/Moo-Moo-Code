<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
</div>
</div>
</div>
<%
if((boolean)session.getAttribute("signed_in"))
{
	%><div id = "account-container">
	<div id="account-box" onclick="toggleAccountDropdown()">
	<table><tr><td><p id ="account-signed-in">Signed in as</p><p id ="account-name"><%=session.getAttribute("username")%></p><td><div id ="account-picture"></div></td></tr></table>
	</div>
	<div id = "account-dropdown" style="display:none"><%
	if((boolean)session.getAttribute("admin"))
	{
		%><div class="account-dropdown-option" onclick="location.href = '${pageContext.request.contextPath}/Admin/Home'"><i class="fa fa-sliders account-icon"></i>Admin Panel</div><%
	}
	%><div class="account-dropdown-option" onclick = "location.href = '${pageContext.request.contextPath}/Logout' " ><i class="fa fa-sign-out account-icon"></i>Sign out</div></div></div><%
}
else
{
	%>
	<div id = "account-container">
	<div>
	<div class="account-sign-in" onclick="location.href='${pageContext.request.contextPath}/Login'"><p>Sign in</p></div>
	<div class="account-sign-in" onclick="location.href='${pageContext.request.contextPath}/CreateAccount'"><p>Create Account</p></div>
	</div>
	</div><%
}
%>
</body>
</html>