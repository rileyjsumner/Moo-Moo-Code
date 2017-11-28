<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div class="lesson_text">
	
	<% int lesson_id = (int)request.getAttribute("lesson_id"); %>
	<textarea name="lesson_content" id="<% out.print(lesson_id); %>" cols="30" rows="100">
		<% out.print((String)request.getAttribute("lesson_text")); %>
	</textarea>
</div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />