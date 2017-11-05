<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code - Code</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />

<div>
	<p class = "content-header">Test your code</p>
</div>
<div>
	<textarea title="code" id="code">print("Moo Moo Code!");</textarea>
</div>
<div class = "code-submit bracket-hover" onclick="submitCode()"><p class="menu-text">Run</p></div>
<div style="display: block;width:500px;margin-left:auto;margin-right:auto;margin-top:10px;border:solid 5px #49483E;padding:10px;">
	<p style="font-size:20px;font-family:Consolas,serif">Output:</p>
	<pre id="output"></pre>
</div>
<script>
	var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"), {
		theme: "monokai",
		lineNumbers: true,
		mode: "javascript",
		autoCloseBrackets: true,
		matchBrackets: true,
		showCursorWhenSelecting: true
	});
	
	function submitCode() {
		$.post("RawCodeExec", {code: codeMirror.getValue()}, function (data) {
			console.log(data);
			var json = JSON.parse(data);
			
			var output = $("#output");
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