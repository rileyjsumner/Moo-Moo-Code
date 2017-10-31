<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<script src="../js/jquery-3.2.1.js"></script>
		
		<script src="../codemirror/lib/codemirror.js"></script>
		<link rel="stylesheet" href="../codemirror/lib/codemirror.css">
		<link rel="stylesheet" href="../codemirror/theme/monokai.css">
		<script src="../codemirror/mode/javascript/javascript.js"></script>
		<script src="../codemirror/addon/edit/closebrackets.js"></script>
		
		<title>Moo Moo Code</title>
		
		<script src = "../js/login.js"></script>
		<link rel="stylesheet" href="../css/main.css">
		<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
		
		<!-- FAVICONS -->
		<link rel="apple-touch-icon" sizes="57x57" href="../icons/apple-icon-57x57.png">
		<link rel="apple-touch-icon" sizes="60x60" href="../icons/apple-icon-60x60.png">
		<link rel="apple-touch-icon" sizes="72x72" href="../icons/apple-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="76x76" href="../icons/apple-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="114x114" href="../icons/apple-icon-114x114.png">
		<link rel="apple-touch-icon" sizes="120x120" href="../icons/apple-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="144x144" href="../icons/apple-icon-144x144.png">
		<link rel="apple-touch-icon" sizes="152x152" href="../icons/apple-icon-152x152.png">
		<link rel="apple-touch-icon" sizes="180x180" href="../icons/apple-icon-180x180.png">
		<link rel="icon" type="image/png" sizes="192x192"  href="../icons/android-icon-192x192.png">
		<link rel="icon" type="image/png" sizes="32x32" href="../icons/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="96x96" href="../icons/favicon-96x96.png">
		<link rel="icon" type="image/png" sizes="16x16" href="../icons/favicon-16x16.png">
		<link rel="manifest" href="../manifest.json">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="msapplication-TileImage" content="../icons/ms-icon-144x144.png">
		<meta name="theme-color" content="#ffffff">
	</head>
	<body>
		<div id="banner">
			<p class="banner-text">Moo Moo Code</p>
		</div>
		<div id="menu">
			<div class="menu-item bracket-hover" onclick = "location.href='Home';">
				<p class="menu-text">Home</p>
			</div>
			<div class="menu-item bracket-hover" onclick = "location.href='Learn';">
				<p class="menu-text">Learn</p>
			</div>
			<div class="menu-item bracket-hover" onclick="location.href='Code';">
				<p class="menu-text">Code</p>
			</div>
			<div class="menu-item bracket-hover" onclick="location.href='Play';">
				<p class="menu-text">Play</p>
			</div>
			<div class="menu-item bracket-hover">
				<p class="menu-text">Compete</p>
			</div>
		</div>
		<div id="content">
			<div class="content-header" style ="margin:20px">Log in</div>
			<div style = "text-align: center;">
				<div class="content-container">
					<form action="Login" method = "POST">
						<p class = "content-container-header">Username</p>
						<input type ="text" name = "username" class = "content-container-input" />
						<p class = "content-container-header">Password</p>
						<input type ="password" name = "password" class = "content-container-input" />
						<input type="hidden" name = "action" value="<%= request.getAttribute("action")%>"/>
						<button class = "content-container-button">Log in</button>
					</form>
					<p class = "login-failed" style="<% if(!(Boolean) request.getAttribute("failed")){out.print("display:none");}%>">login failed</p>
				</div>
			</div>
		</div>
		<script>makeMenu("<%=request.getSession().getAttribute("signed_in")%>","<%=request.getSession().getAttribute("username")%>");</script>
	</body>
</html>
