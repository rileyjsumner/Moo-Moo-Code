function makeMenu(signed_in,account)
{
	$(document).mouseup(function(e)
	{
		var container = $("#account-dropdown");
		
		// if the target of the click isn't the container nor a descendant of the container
		if (!container.is(e.target) && container.has(e.target).length === 0)
		{
			container.hide();
		}
	});
	if(signed_in === "true")
	{
		$("body").append("<div id = \"account-container\">\n" +
			"\t<div id=\"account-box\" onclick=\"toggleAccountDropdown()\">\n" +
			"\t<table><tr><td><p id =\"account-signed-in\">Signed in as</p><p id =\"account-name\">" + account + "</p><td><div id =\"account-picture\"></div></td></tr></table>\n" +
			"</div>\n" +
			"<div id = \"account-dropdown\" style=\"display:none\">\n" +
			"\t<div class=\"account-dropdown-option\" onclick=\"location.href = 'Admin'\"><i class=\"fa fa-sliders account-icon\"></i>Options</div>\n" +
			"<div class=\"account-dropdown-option\" onclick = \"location.href = 'Logout'\" ><i class=\"fa fa-sign-out account-icon\"></i>Sign out</div></div></div>");
	}
	else
	{
		$("body").append(
			"<div id = \"account-container\">\n" +
				"\t<div>" +
					"<div class=\"account-sign-in\" onclick=\"location.href='Login'\"><p>Sign in</p></div>" +
					"<div class=\"account-sign-in\" onclick=\"location.href='CreateAccount'\"><p>Create Account</p></div>" +
				"</div>" +
			"</div>");
	}
}
function toggleAccountDropdown() {
	$("#account-dropdown").show();
}