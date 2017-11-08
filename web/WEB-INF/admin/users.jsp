<%@ page import="com.data.User" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Login</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<%
	if((boolean)request.getAttribute("admin")){
		
		out.print("<h2>Users</h2>" +
				"<table>" +
				"<tr>" +
					"<th>Id</th>" +
					"<th>Username</th>" +
					"<th>Password</th>" +
					"<th>Category Progress</th>" +
					"<th>LessonEditor Progress</th>" +
					"<th>Admin</th>" +
					"<th>Delete</th>" +
				"</tr>");
		for (User user : (ArrayList<User>)request.getAttribute("users")) {
			out.print(
					"<tr>" +
						"<td><input data-user='" + user.id + "' data-type='id' type='text' value='" + user.id + "'/></td>" +
						"<td><input data-user='" + user.id + "' class='autoupdate' data-type='username' type='text' value='" + user.username + "'/></td>" +
						"<td><input data-user='" + user.id + "' class='autoupdate' data-type='password' type='text' value='" + user.password + "'/></td>" +
						"<td><input data-user='" + user.id + "' class='autoupdate' data-type='progress_learn_category' type='text' value='" + user.categoryProgress + "'/></td>" +
						"<td><input data-user='" + user.id + "' class='autoupdate' data-type='progress_learn_lesson' type='text' value='" + user.lessonProgress + "'/></td>" +
						"<td><input data-user='" + user.id + "' class='autoupdate' data-type='admin' type='text' value='" + user.admin + "'/></td>" +
						"<td><input data-user='" + user.id + "' class='delete' type='button' value='Delete'/></td>" +
					"</tr>"
			);
		}
		out.print("</table>");
	
	} else {
		out.print("You ain't no admin boi check how you sound");
	}
%>
<script>
	$(".autoupdate").blur(function() {
		var test = {
			type: $(this).data("type"),
			value: $(this).val(),
			user: $(this).data("user")
		};
		$.post("/Admin/Users", test);
	});
	$(".delete").onclick(function() {
		var test = {
			type: "delete",
			user: $(this).data("user")
		};
		$.post("/Admin/Users", test);
	})
</script>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />