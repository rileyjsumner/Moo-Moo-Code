<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<c:import url="/WEB-INF/page_defaults/header.jsp" />
<title>Moo Moo Code</title>
<c:import url="/WEB-INF/page_defaults/menu.jsp" />
<h2>Welcome to Moo Moo Code!</h2>
<img class="home_image" src="${pageContext.request.contextPath}/icons/characters/dan/still.png" height="400px" width="400px"/>
<img class="home_image" src="${pageContext.request.contextPath}/icons/entities/cow.png" height="400px" width="400px"/>
<p>With Moo Moo Code you can {Learn} Javascript with our comprehensive lessons. You can also {Play} our game and help Farmer Dan on his quest to find his cows!</p>
<p>With {Code}, you have a free area to try running any javascript code you want.</p>
<p>This website was developed by Anoka High School Software Development Team A</p>
<p>30-0005-0018 | 30-0005-0024</p>
<c:import url="/WEB-INF/page_defaults/footer.jsp" />