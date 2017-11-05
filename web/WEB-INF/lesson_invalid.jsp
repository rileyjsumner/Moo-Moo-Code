<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Invalid</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<p>Lesson not available</p>
<p><%=request.getAttribute("user_progress")%></p>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />