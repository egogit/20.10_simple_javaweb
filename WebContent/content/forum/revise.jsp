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
	
	if(sessionID == null){
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('plz Login')");
		pw.println("location.href = '/gain/content/login/loginform.jsp");
		pw.println("</script>");
	}
	
	int boardidx = 0;
	if (request.getParameter("idx")!= null){
		boardidx = Integer.parseInt(request.getParameter("idx"));
	}
	if (boardidx == 0){
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('Invalid!!')");
		pw.println("location.href='/gain/content/forum/forum.jsp'");
		pw.println("</script>");
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
			
			conn = DBConn.getConnection();
			stmt = conn.createStatement();
			
			String qry="SELECT BOARDUSERNAME, BOARDTITLE, BOARDCONTENT FROM GAIN.BOARD WHERE BOARDIDX = " + boardidx;
			rs = stmt.executeQuery(qry);
			
			if(rs.next()){
				String name = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
			
				
	%>
	
	
	<!--  수정시 같은 사람이 썼는지 확인하기.... -->
	<%@include file ="../../s_element/header.jsp" %>
	<div>
	
		<form method="post" action="/gain/content/forum/reviseprogress.jsp?boardidx=<%=boardidx%>">
			<table>
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;"> Content Revision </th>
			
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="boardtitle" name="boardtitle" maxlength="50" value="<%=title%>"></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="boardname" name="boardname" value="<%=name%>" readonly></td>
					</tr>
					<tr>
						<td><textarea placeholder="boardcontent" name="boardcontent" maxlength="2048" style="height:350px; width:100%"><%=content %></textarea></td>
					</tr>
				</tbody>
			</table>
			<button type="submit">Content revision</button>
		
		</form>
	
	</div>
	<%
			}else{
			out.println("Fail");
		}
	} catch (SQLException e){
		out.println(e.toString());
	}
	
	
	%>
	<%@include file ="/s_element/footer.jsp" %>
</body>
</html>