<%--
  Created by IntelliJ IDEA.
  User: owner
  Date: 10/5/2017
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <script src="js/jquery-3.2.1.js" ></script>
    <title>$Title$</title>
  </head>
  <body>
    <textarea title="code" id = "code"></textarea>
    <button onclick = "submitCode()">Submit</button>
  </body>
  <script>
    function submitCode()
    {
      $.post("CodeExec",{code:$("#code").val()},function(data){console.log(data);});
    }
  </script>
</html>
