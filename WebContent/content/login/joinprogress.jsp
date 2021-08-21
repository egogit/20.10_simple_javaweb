<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%@ page import="jsp.gain.member.UserBean" %> 
 <%@ page import="jsp.gain.member.UserDAO" %>   
    
<!DOCTYPE html>
<html>

   <head>
   
   <link rel="stylesheet" href="../../css/style.css">
   <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../bootstrap/js/bootstrap.js"></script>    
   
   </head>

  <body>
  
  <% request.setCharacterEncoding("euc-kr"); %>
  
  <jsp:useBean id="UserBean" class="jsp.gain.member.UserBean"/>
  <jsp:setProperty property="*" name="UserBean"/>
  
  <%
  	UserDAO dao = UserDAO.getInstance();
  
  	dao.insertUser(UserBean);
  
  %>
  
  <%@include file ="../../s_element/header.jsp" %>
  
  <div id="wrap">
  	<br><br>
  	<b>Thank you for joining our webpage!!</b>
  	<b>Check your information</b>
  	<br><br>
  	Welcome <font color="skyblue"><%=UserBean.getName() %></font>!.
  	<br><br>
  	
  	<table>
  		<tr>
  			<td id="title">Email: </td>
  			<td><%=UserBean.getEmail1()%>@<%=UserBean.getEmail2() %></td>
  		</tr>
  	</table>
  	<table>
  		<tr>
  			<td id="title">Phone Number: </td>
  			<td><%=UserBean.getPhonenum() %></td>
  		</tr>
  	</table>
  	<br>
  	<input type="button" value="check" onclick="location.href='../index.jsp'"/>
  </div>
  
  <%@include file="../../s_element/footer.jsp" %>
  
  </body>
</html>

