<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Admin</title>
<link rel="stylesheet" href="<c:url value="/css/lesson.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div>
	<form>
		<input type="text" name="lesson_title" />
		<textarea name="lesson_text" />
		
	</form>
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />