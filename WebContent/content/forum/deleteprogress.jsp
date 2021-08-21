<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jsp.gain.board.BoardDAO" %>    
<%@ page import="jsp.gain.board.BoardBean" %>
<%@ page import="jsp.gain.board.BoardInfo" %>
<%@ page import="jsp.gain.member.UserBean" %>
<%@ page import="jsp.gain.member.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="jsp.util.DBConn"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%!
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
%>


<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	conn = null;
	stmt = null;
	rs = null;
	
	try{
		conn = DBConn.getConnection();
		stmt = conn.createStatement();
		
		String qry = "DELETE FROM GAIN.BOARD WHERE BOARDIDX=" + idx;
		stmt.executeUpdate(qry);
%>
		<script>
			self.window.alert("Delete Success!!");
			location.href="forum.jsp";
		</script>
		
		
<%	

	stmt.close();
	conn.close();
		
	} catch(SQLException e) {
		out.println(e.toString());
	}

%>









</body>
</html>