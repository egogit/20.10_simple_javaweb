<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jsp.gain.board.BoardDAO" %>    
<%@ page import="jsp.gain.board.BoardBean" %>
<%@ page import="jsp.gain.member.UserBean" %>
<%@ page import="jsp.gain.member.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="jsp.util.DBConn"%>
    
<!DOCTYPE html>
<html>
	<head>
    <title>Gain - Forum</title>
   <meta charset="utf-8">
   <link rel="stylesheet" href="../../css/style.css">
   <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../../bootstrap/js/bootstrap.js"></script>
    <script>
    
	
    </script>
    <style>
    </style>
  </head>

  <body style="bodystruct">
	<% 
	String sessionID = null;
	if (session.getAttribute("sessionID")!= null) {
		sessionID = (String) session.getAttribute("sessionID");
	}
	
	%>
	
	<%@include file ="../../s_element/header.jsp" %>
	<div class="container">
	<%!
		private PreparedStatement pstmt;
		private Statement stmt;
		private Connection conn;
		private ResultSet rs;	
	
	%>
	<%
		int total = 0;
		try{
			conn = null;
			pstmt = null;
			rs = null;
			String qrycount = "SELECT COUNT(*) FROM board";
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(qrycount);
			rs = pstmt.executeQuery();
			
			if (rs.next()){
				total = rs.getInt(1);
			}
			rs.close();
			out.print("BoardCount: "+ total +"th");
			
			String querylist = "SELECT BOARDIDX, BOARDUSERNAME, BOARDTITLE, BOARDDATE, BOARDHIT FROM GAIN.BOARD ORDER BY BOARDIDX DESC ";
			rs = pstmt.executeQuery(querylist);
	%>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align:center;">idx</th>
					<th style="background-color: #eeeeee; text-align:center;">Title</th>
					<th style="background-color: #eeeeee; text-align:center;">Username</th>
					<th style="background-color: #eeeeee; text-align:center;">Date</th>
					<th style="background-color: #eeeeee; text-align:center;">Readcount</th>
				</tr>
			</thead>
			<tbody>
			<%
			
			if (total ==0) {
			
			%>
			<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">No write</td>
			</tr>
			<%
			}else {
				while(rs.next()) {
					int boardidx = rs.getInt(1);
					String name = rs.getString(2);
					String title = rs.getString(3);
					String date = rs.getString(4);
					int count = rs.getInt(5);
					
			%>
			<tr height="25" align="center">
			<td><%=boardidx %></td>
			<td align="left"><a href="/gain/content/forum/view.jsp?idx=<%=boardidx%>"><%=title %></a></td>
			<td align="center"><%=name %></td>
			<td align="center"><%=date %></td>
			<td align="center"><%=count %></td>
			</tr>
			<%
				}
			}
			rs.close();
			pstmt.close();
			conn.close();
			} catch(SQLException e){
				out.println(e.toString());
			}
			
			
			%>
			</tbody>		
		</table>
		<%
		if (sessionID != null)
		{
		%>
			<a href="/gain/content/forum/newcontent.jsp">New write</a>
		<%
		}
		
		
		%>
		
	
	</div>
	
	<%@include file ="../../s_element/footer.jsp" %>
  </body>
	
</html>