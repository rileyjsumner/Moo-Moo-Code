<%@ page import="com.data.Lesson.Lesson" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.data.Lesson.LessonCategory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<form action="/Admin/Lessons" method="POST">
	<input type="hidden" value="<%=request.getParameter("id")%>" name="id"/>
	<input type="text" value="<%=request.getAttribute("lesson_title")%>" name="lesson_title_text"/>
	<select name="category">
		<%
			for(LessonCategory category : (ArrayList<LessonCategory>)request.getAttribute("categories"))
			{
				%>
				<option value="<%=category.Id%>"><%=category.Name%></option>
				<%
			}
		%>
	</select>
	<textarea name="lesson_content"><%=(String)request.getAttribute("lesson_content") %></textarea>
	<div style="text-align:left;">
		<textarea name="lesson_start_code" id="code"><%=(String)request.getAttribute("lesson_start_code") %></textarea>
	</div>
	<input type="submit" value="Delete" name="submit"/>
	<input type="submit" value="Save" name="submit"/>
</form>

<script>
	var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"), {
		theme: "monokai",
		lineNumbers: true,
		mode: "javascript",
		autoCloseBrackets: true,
		matchBrackets: true,
		showCursorWhenSelecting: true
	});
	codeMirror.setSize("50%", "400px");
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