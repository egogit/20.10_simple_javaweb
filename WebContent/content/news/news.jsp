<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="jsp.gain.news.NewsServlet" %>
<%@ page import="jsp.util.URLConn" %>
    
    
<!DOCTYPE html>
<html>
	<head>
    <title>Gain - News</title>
   <meta charset="utf-8">
   <link rel="stylesheet" href="/css/style.css">
   <link rel="stylesheet" href="/bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../bootstrap/js/bootstrap.js"></script>
    <script>
    </script>

  </head>

  	<% 
	String sessionID = null;
	if (session.getAttribute("sessionID")!= null) {
		sessionID = (String) session.getAttribute("sessionID");
	}
	%>
	
	 <body style="bodystrct">
  
  	<%@include file ="/s_element/header.jsp" %>
	<div class="container">
	
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">AppId</th>
					<th style="background-color: #eeeeee; text-align:center;">Title</th>
					<th style="background-color: #eeeeee; text-align:center;">Author</th>
					<th style="background-color: #eeeeee; text-align:center;">Date</th>
				</tr>
		</thead>
		<tbody>
		<%
		try{
			String[] newsinfo = new String[50];
			
			newsinfo = NewsServlet.gamenewsjson();
			
			for (int i=0;i<50;i+=5) {
		%>
			<tr height="25" align="center">
			<td align="left"><%=newsinfo[i] %></td>
			<td align="center"><a href="<%=newsinfo[i+2]%>"><%=newsinfo[i+1] %></a></td>
			<td align="left"><%=newsinfo[i+3] %></td>
			<td align="left"><%=newsinfo[i+4] %></td>
			</tr>
		<%
		}
		%>
		</tbody>
	</table>
	<%@include file ="/s_element/footer.jsp" %>
	<%
	}catch (Exception e){
		e.printStackTrace();
	}
	%>
	</div>
  </body>
	
</html>