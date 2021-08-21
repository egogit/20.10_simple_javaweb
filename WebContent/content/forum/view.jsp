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
<meta charset="EUC-KR">
<title>Gain - Forum</title>
   <meta charset="utf-8">
   <link rel="stylesheet" href="../../css/style.css">
   <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../../bootstrap/js/bootstrap.js"></script>
</head>
 <body style="bodystruct">
  	<%
  		String sessionID = null;
  		if (session.getAttribute("sessionID")!= null){
  			sessionID = (String) session.getAttribute("sessionID");
  		}
  	
  	%>
  	<%!
		private PreparedStatement pstmt;
		private Statement stmt;
		private Connection conn;
		private ResultSet rs;	
	
	%>
	<%
		try{
			conn = null;
			stmt = null;
			rs = null;
			int idx = Integer.parseInt(request.getParameter("idx"));
			
			conn = DBConn.getConnection();
			stmt = conn.createStatement();
			
			String qry="SELECT BOARDUSERNAME, BOARDTITLE, BOARDCONTENT, BOARDDATE, BOARDHIT FROM GAIN.BOARD WHERE BOARDIDX = " + idx;
			rs = stmt.executeQuery(qry);
			
			if (rs.next()){
				String name = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String date = rs.getString(4);
				int hit = rs.getInt(5);
				hit ++;
	%>

	<%@include file ="/s_element/header.jsp" %>
	<table>
		<tr>
			<td>
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tr style="text-align:center">
						<td>&nbsp;</td>
						<td>Boardidx</td>
						<td><%=idx %></td>
						<td>&nbsp;</td>
					</tr>
					<tr style="text-align:center">
						<td>&nbsp;</td>
						<td>Boardhit</td>
						<td><%=hit %></td>
						<td>&nbsp;</td>
					</tr>
					<tr style="text-align:center">
						<td>&nbsp;</td>
						<td>Content Title</td>
						<td><%=title %></td>
						<td>&nbsp;</td>
					</tr>
					<tr style="text-align:center">
						<td>&nbsp;</td>
						<td>Writer</td>
						<td><%=name %></td>
						<td>&nbsp;</td>
					</tr>
					<tr style="text-align:center">
						<td>&nbsp;</td>
						<td>Board Content</td>
						<td><%=content %></td>
						<td>&nbsp;</td>
					</tr>
					<tr style="text-align:center">
						<td>&nbsp;</td>
						<td>Boarddate</td>
						<td><%=date %></td>
						<td>&nbsp;</td>
					</tr>
					<%
					String sql = "UPDATE GAIN.BOARD SET BOARDHIT = BOARDHIT+1 WHERE BOARDIDX =" +idx;
					stmt.executeUpdate(sql);
					%>
				</table>
				
			</td>
		</tr>
	</table>
	<table>
			<tr>
				<td>
				<input type=button value="Write Content" OnClick="window.location='/gain/content/forum/newcontent.jsp'">
				<input type=button value="List" OnClick="window.location='/gain/content/forum/forum.jsp'">
				<input type=button value="Revise" OnClick="window.location='/gain/content/forum/revise.jsp?idx=<%= idx%>'">
				<input type=button value="Delete" OnClick="window.location='/gain/content/forum/deleteprogress.jsp?idx=<%= idx%>'">
				</td>
			</tr>
			<%
			rs.close();
			stmt.close();
			conn.close();
			}else{
				out.print("Fail");
			}
			
			} catch(SQLException e){
				out.println(e.toString());
			}
			
			%>
	
	</table>
	<%@include file ="/s_element/footer.jsp" %>
</body>
</html>