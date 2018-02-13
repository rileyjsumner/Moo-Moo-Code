<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
</head>
<body>
<div class = "vertical-fill-container">
<div id="banner" class = "vertical-compact">
<p class="banner-text">Moo Moo Code</p>
</div>
<div id="menu" class = "vertical-compact">
<div class="menu-item bracket-hover" onclick="location.href='${pageContext.request.contextPath}/Home'">
<p class="menu-text">Home</p>
</div>
<div class="menu-item bracket-hover" onclick="location.href='${pageContext.request.contextPath}/Learn'">
<p class="menu-text">Learn</p>
</div>
<div class="menu-item bracket-hover" onclick="location.href='${pageContext.request.contextPath}/Code'">
<p class="menu-text">Code</p>
</div>
<div class="menu-item bracket-hover" onclick="location.href='${pageContext.request.contextPath}/LevelSelect'">
<p class="menu-text">Play</p>
</div>
</div>
<div id="content" class = "vertical-fill">
<div id = "content-relative">