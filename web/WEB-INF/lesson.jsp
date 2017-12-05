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
	<div class = "lesson-codebed">
		<textarea style="height:1000px;" title="code" id="code">//Type your code here:&#13;&#10;&#13;&#10;print("Moo Moo Code!");&#13;&#10;&#13;&#10;</textarea>
	</div>
	<div class = "lesson-codebed-submit" onclick="submitCode()"><div class = "bracket-hover"><p>Run Code</p></div></div>
	<div class = "lesson-codebed-output"><pre id = "lesson-code-output"></pre></div>
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
	
	function submitCode() {
		$.post("RawCodeExec", {code: codeMirror.getValue()}, function (data) {
			console.log(data);
			var json = JSON.parse(data);
			
			var output = $("#lesson-code-output");
			output.html(json["data"]);
			
			if (json["error"]) {
				output.css("color", "red");
			}
			else {
				output.css("color", "inherit");
			}
		});
	}
</script>

<c:import url="/WEB-INF/page_defaults/footer.jsp" />