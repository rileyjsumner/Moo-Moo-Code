<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Admin</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div class="content-header" style ="margin:20px">Admin Panel</div>
<div class="content-container">
	<button class = "content-container-button" onclick = "location.href='/Admin/Levels'">Go to Level Editor</button>
	<button class = "content-container-button" onclick = "location.href='/Admin/Users'">Go to User Editor</button>
	<button class = "content-container-button" onclick = "location.href='/Admin/Lessons'">Go to Lesson Editor</button>
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />