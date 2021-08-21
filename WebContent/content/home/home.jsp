<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%@ page import="jsp.gain.ranking.RankingServlet" %>
    
<!DOCTYPE html>
<html>
	<head>
    <title>Gain - Home</title>
   <meta charset="utf-8">
   <link rel="stylesheet" href="../css/style.css">
   <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../bootstrap/js/bootstrap.js"></script>
    <script>
    </script>
    <style>
    </style>
  </head>
	 <% 
	String sessionID = null;
	if (session.getAttribute("sessionID")!= null) {
		sessionID = (String) session.getAttribute("sessionID");
	}
	%>
	
  <body style="bodystrct">
	<%@include file ="/s_element/header.jsp" %>
	<div>
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">Rank</th>
					<th style="background-color: #eeeeee; text-align:center;">Appimg</th>
					<th style="background-color: #eeeeee; text-align:center;">Apptitle</th>
					<th style="background-color: #eeeeee; text-align:center;">Appprice</th>
				</tr>
		</thead>
		<tbody>
		<%
		try{
			String[] rank = new String[45];
			
			rank = RankingServlet.appRank();
			int j=1;
			
			for (int i=0;i<45;i+=3) {
		%>
			<tr height="25" align="center">
			<td align="left"><%= j %></td>
			<td align="center"><img src="<%=rank[i]%>"></td>
			<td align="center"><%=rank[i+1] %></td>
			<td align="center"><%=rank[i+2] %></td>
			</tr>
		<%
		j+=1;
		}
		%>
		</tbody>
	</table>
	<%
	}catch (Exception e){
		e.printStackTrace();
	}
	%>
	</div>
	<%@include file ="/s_element/footer.jsp" %>
  </body>
 </html>