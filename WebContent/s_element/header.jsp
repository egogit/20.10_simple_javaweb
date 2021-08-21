<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>


</head>
<body style="bodystruct">

	<header class="headstyle">
		<h3 class="title"><a href="/gain/content/index.jsp">Gain</a></h3>
		<input type="search" class="searchkeyword" placeholder="What game are you searching for">
		
		<%
		
			if (session.getAttribute("sessionID") == null)
			{
		%>
			<a href="/gain/content/login/loginform.jsp" class="login">login</a>	
				
		<% 
			}else
			{
			%>
				<a href="/gain/content/memberinfo/memberinfo.jsp"><font color="red"><%=session.getAttribute("sessionID")%></font></a>님 로그인되었습니다
				<br><br>
				<input type="button" value="Logout" onclick="location.href='/gain/content/login/logoutprogress.jsp'"/>
			<% } %>
	</header>
	<nav>
		<div class="navmenu">
			<ul>
				<li><a href="/gain/content/home/home.jsp" class="navlink">Home</a></li>
				<li><a href="/gain/content/forum/forum.jsp" class="navlink">Forum</a></li>
				<li><a href="/gain/content/news/news.jsp" class="navlink">News</a></li>
				<li><a href="/gain/content/chat/chat.jsp" class="navlink">Realtime Chat</a></li>
			</ul>
		
		</div>
	
	</nav>

</body>
</html>