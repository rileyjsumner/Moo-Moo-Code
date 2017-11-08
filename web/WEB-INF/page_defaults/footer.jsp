</div>
</div>
<%
if((boolean)session.getAttribute("signed_in"))
{
	out.print("<div id = \"account-container\">\n" +
	"<div id=\"account-box\" onclick=\"toggleAccountDropdown()\">" +
	"<table><tr><td><p id =\"account-signed-in\">Signed in as</p><p id =\"account-name\">" + session.getAttribute("username") + "</p><td><div id =\"account-picture\"></div></td></tr></table>" +
	"</div>" +
	"<div id = \"account-dropdown\" style=\"display:none\">");
	if((boolean)session.getAttribute("admin"))
	{
		out.print("<div class=\"account-dropdown-option\" onclick=\"location.href = '/Admin/Home'\"><i class=\"fa fa-sliders account-icon\"></i>Admin Panel</div>");
	}
	out.print("<div class=\"account-dropdown-option\" onclick = \"location.href = '/Logout'\" ><i class=\"fa fa-sign-out account-icon\"></i>Sign out</div></div></div>");
}
else
{
	out.print(
	"<div id = \"account-container\">" +
	"<div>" +
	"<div class=\"account-sign-in\" onclick=\"location.href='/Login'\"><p>Sign in</p></div>" +
	"<div class=\"account-sign-in\" onclick=\"location.href='/CreateAccount'\"><p>Create Account</p></div>" +
	"</div>" +
	"</div>");
}
%>
</body>
</html>