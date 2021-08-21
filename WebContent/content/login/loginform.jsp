<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
	<head>
    <title>Gain - Login</title>
   <meta charset="utf-8">
   
   <!--  Boot Strap File  -->
   <link rel="stylesheet" href="../../css/style.css">
   <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../bootstrap/js/bootstrap.js"></script>
    
    
    <style>
    </style>
    
  </head>
  
   <script type="text/javascipt">
    	
		function allcheck()
		{
			inputval = eval("document.loginform");
			if(!inputval.email.value)
			{
				alert("Input Email");
				inputval.email.focus();
				return false;
			}
			if(!inputval.password.value)
			{
				alert("Input password");
				inputval.password.focus();
				return false;
			}
		}

		function goJoinForm()
		{
			location.href="./joinform.jsp";
		}

    
    </script>

  <body style="bodystrct">

	<%@include file ="../../s_element/header.jsp" %>
	
	<div class="login_container">
	
		<form name="loginform" method="post" action="loginprogress.jsp" onsubmit="return allcheck()">
		
			<table>
				<tr>
					<td bgcolor="skyblue">Email</td>
					<td><input type="text" name="email" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">Password</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="Login"/>
			<input type="button" value="Create new account" onclick="location.href='./joinform.jsp'" />
		</form>
		<%@page import="java.io.PrintWriter" %>
		<%
		
		
			String msg=request.getParameter("msg");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter show = response.getWriter();
		
			if(msg!=null && msg.equals("0"))
			{
				show.println("<script>alert('Check your password')");
			}
			else if (msg!=null && msg.equals("-1"))
			{
				
				show.println("<script>alert('Check your email')");
			}
			
		%>
	</div>
	
	
	
	<%@include file ="../../s_element/footer.jsp" %>
  </body>
	
</html>