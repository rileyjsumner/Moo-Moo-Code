<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <script src="js/jquery-3.2.1.js" ></script>
        <script src="codemirror/lib/codemirror.js"></script>
        <link rel="stylesheet" href="codemirror/lib/codemirror.css">
        <script src="codemirror/mode/javascript/javascript.js"></script>
        <title>Home</title>
    </head>
    <body>
        <form>
            <textarea title="code" id = "code">print("Moo Moo Code!");</textarea>
        </form>
        <button onclick = "submitCode()">Submit</button>
        <p style = "font-size:20px;">Output:</p>
        <p id ="output"></p>
    </body>
    <script>
        var codeMirror = CodeMirror.fromTextArea(document.getElementById("code"));
        function submitCode()
        {
        $.post("CodeExec",{code:codeMirror.getValue()},function(data){$("#output").html(data);console.log(data);});
        }
    </script>
</html>
