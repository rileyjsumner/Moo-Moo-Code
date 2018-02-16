<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Login</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<p style="font-size:20px;padding: 40px 20px;">You need to be logged in to <%=request.getAttribute("action_text")%></p>
<div class="bracket-hover lesson-codebed-submit" onclick = "location.href='${pageContext.request.contextPath}/Login?action=<%=request.getAttribute("action")%>'"><p>Log in</p></div>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />