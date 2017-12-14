<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Lesson</title>
<link rel="stylesheet" href="<c:url value="/css/lesson.css"/>">
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div class = "lesson-content-container">
	<pre style="white-space: pre-wrap; word-wrap: break-word; text-align: left"><%=request.getAttribute("lesson_text")%></pre>
</div>
<div class = "lesson-codebed-container">
	<%
		int lesson = (int)request.getAttribute("lesson");
		Boolean success = (Boolean)request.getAttribute("success");
		if(success == null) {
		
	%>
	<form action="${pageContext.request.contextPath}/Lesson?lesson=<%=lesson%>" method="POST">
		<div class = "lesson-codebed">
			<textarea style="height:1000px;" name="code" id="code">//Type your code here:&#13;&#10;&#13;&#10;print("Moo Moo Code!");&#13;&#10;&#13;&#10;</textarea>
		</div>
		
		<div class = "lesson-codebed-submit" onclick="$(this).closest('form').submit()"><div class = "bracket-hover"><p>Run Code</p></div></div>
		<div class = "lesson-codebed-output"><pre id = "lesson-code-output"></pre></div>
	</form>
	<%
		if(!success) {
			
			}else {
	%>
		<h1>Success!</h1>
	<%
			}
		}
	%>
</div>
<script>
	var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"), {
		height:"100%",
		theme: "monokai",
		lineNumbers: true,
		mode: "javascript",
		autoCloseBrackets: true,
		matchBrackets: true,
		showCursorWhenSelecting: true
	});
	codeMirror.setSize("100%","60%");
</script>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />