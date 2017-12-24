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
		String start = (String)request.getAttribute("start_code");
		String output = (String)request.getAttribute("output");
		if(success == null) {
		
	%>
	<form action="${pageContext.request.contextPath}/Lesson?lesson=<%=lesson%>" method="POST">
		<div class = "lesson-codebed">
			<textarea style="height:1000px;" name="code" id="code"><%=start%></textarea>
		</div>
		
		<div class="lesson-codebed-submit"><input class = "edit-btn" type="submit" name="submit" value="Run Code"/></div>
		<div class = "lesson-codebed-output"><pre id = "lesson-code-output">Output:</pre></div>
	</form>
</div>
<%
	} else if(!success) { %>
		<form action="${pageContext.request.contextPath}/Lesson?lesson=<%=lesson%>" method="POST">
			<div class = "lesson-codebed">
				<textarea style="height:1000px;" name="code" id="code"><%=start%></textarea>
			</div>
			
			<div class="lesson-codebed-submit"><input class = "edit-btn" name="submit" type="submit" value="Run Code"/></div>
			<div class = "lesson-codebed-output"><pre id = "lesson-code-output">Output:<%=output%></pre></div>
		</form>
	<% } else {
%>
	<script>
		$(".lesson-content-container").remove();
		$(".lesson-codebed-container").remove();
		$("#content-relative").append("" +
			"<h1>Great Work!</h1>" +
			"<form action=\"${pageContext.request.contextPath}/Lesson?lesson=<%=lesson%>\" method=\"POST\">" +
			"<input type='hidden' value='<%=lesson%>' name='lesson'/>" +
			"<input id='review' type='submit' class='success edit-btn' name='submit' value='Review Lesson'/>" +
			"</form>" +
			"<form action=\"${pageContext.request.contextPath}/Lesson?lesson=<%=lesson+1%>\" method=\"POST\">" +
			"<input type='hidden' value='<%=lesson%>' name='lesson'/>" +
			"<input id='continue' type='submit' class='success edit-btn' name='submit' value='Advance'/>" +
			"</form>");
	</script>
<%
	}
%>
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