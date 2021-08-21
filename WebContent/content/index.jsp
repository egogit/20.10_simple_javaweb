<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
	<head>
    <title>Gain - Intro</title>
   <meta charset="utf-8">
   <link rel="stylesheet" href="../css/style.css">
   <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../bootstrap/js/bootstrap.js"></script>
    <script>
    </script>
    <style>
  
		.welcome p { text-align:center; }
    </style>
  </head>

  <body style="bodystruct">
	<% 
	String sessionID = null;
	if (session.getAttribute("sessionID")!= null) {
		sessionID = (String) session.getAttribute("sessionID");
	}
	
	%>
	
	<%@include file ="/s_element/header.jsp" %>	
	<section class="welcome">
	
		<p> Welcome to visiting Gain </p>
		<p> This service for Game Discount Information from public-shop</p>
		<p> I strongly recommend that you use Chrome browser.</p>
		<p> Because of including recent grammer like HTML5,CSS3, etc..</p>
	</section>

  </body>
  
  <%@include file ="../s_element/footer.jsp" %>
	
  
</html>