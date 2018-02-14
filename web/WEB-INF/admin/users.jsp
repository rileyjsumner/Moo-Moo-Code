<%@ page import="com.data.User" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Login</title>
<link rel="stylesheet" href="<c:url value="/css/table.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<div class="wrapper">
<%
	int nextId = 0;
	if((boolean)request.getAttribute("admin")){
		
		out.print("<h2>Users</h2>" +
				"<div class='table'>" +
				"<div class='row header'>" +
					"<div class='cell'>Id</div>" +
					"<div class='cell'>Username</div>" +
					"<div class='cell'>Password</div>" +
					"<div class='cell'>Category Progress</div>" +
					"<div class='cell'>Lesson Progress</div>" +
					"<div class='cell'>Admin</div>" +
					"<div class='cell'>Delete</div>" +
				"</div>");
		for (User user : (ArrayList<User>)request.getAttribute("users")) {
			out.print(
					"<div class='row'>" +
							"<div class='cell'><input data-user='" + user.id + "' data-type='id' type='number' value='" + user.id + "'/></div>" +
							"<div class='cell'><input data-user='" + user.id + "' class='autoupdate' data-type='username' type='text' value='" + user.username + "'/></div>" +
							"<div class='cell'><input data-user='" + user.id + "' class='autoupdate' data-type='password' type='text' value='" + user.password + "'/></div>" +
							"<div class='cell'><input data-user='" + user.id + "' class='autoupdate' data-type='progress_learn_category' type='number' value='" + user.categoryProgress + "'/></div>" +
							"<div class='cell'><input data-user='" + user.id + "' class='autoupdate' data-type='progress_learn_lesson' type='number' value='" + user.lessonProgress + "'/></div>" +
							"<div class='cell'><input data-user='" + user.id + "' class='autoupdate' data-type='admin' type='text' value='" + user.admin + "'/></div>" +
							"<div class='cell'><input data-user='" + user.id + "' class='delete button button-red' id='delete' type='button' value='Delete'/></div>" +
					"</div>"
			);
			nextId = user.id+1;
		}
		out.print("</div>");
	} else {
		out.print("Not an Admin");
	}
%>
		<form method="post" action="<c:url value="/Admin/Users"/>">
			<div class="table">
				<div class="row">
					<div class="cell"><input type="number" name="id" value="<% out.print(nextId);%>"/></div>
					<div class="cell"><input type='text' name='username' placeholder='username' /></div>
					<div class="cell"><input type='text' name='password' placeholder='password' /></div>
					<div class="cell"><input type='number' name='categoryProgress' placeholder='category progress'/></div>
					<div class="cell"><input type='number' name='lessonProgress' placeholder='lesson progress'/></div>
					<div class="cell"><input type='text' name='admin' placeholder='admin'/></div>
					<input type="hidden" name="type" value="add"/>
					<div class="cell"><input type='submit' class="button" name='add' value='Add User'/></div>
				</div>
			</div>
		</form>
	</div>
<script>
	$(".autoupdate").blur(function() {
		var test = {
			type: $(this).data("type"),
			value: $(this).val(),
			user: $(this).data("user")
		};
		$.post("<c:url value="/Admin/Users"/>", test);
		location.reload();
	});
	$(".delete").click(function() {
		var test = {
			type: "delete",
			user: $(this).data("user")
		};
		$.post("<c:url value='/Admin/Users'/>", test);
		location.reload();
	});
</script>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />