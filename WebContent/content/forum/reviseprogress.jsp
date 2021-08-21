<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="jsp.gain.board.BoardDAO" %>    
<%@ page import="jsp.gain.board.BoardBean" %>
<%@ page import="jsp.gain.board.BoardInfo" %>
<%@ page import="jsp.gain.member.UserBean" %>
<%@ page import="jsp.gain.member.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="jsp.util.DBConn"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<jsp:useBean id="board" class="jsp.gain.board.BoardBean" scope="page" />
<jsp:setProperty name="board" property="boardtitle"/>
<jsp:setProperty name="board" property="boardcontent"/>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%!

	private PreparedStatement pstmt;
	private Statement stmt;
	private Connection conn;
	private ResultSet rs;



%>



<%
	request.setCharacterEncoding("euc-kr");

	String sessionID =null;
	if (session.getAttribute("sessionID") != null) {
		sessionID = (String) session.getAttribute("sessionID");
	}

	try{
		conn = null;
		pstmt = null;
		rs = null;
		int idx = Integer.parseInt(request.getParameter("boardidx"));
	
		String title = request.getParameter("boardtitle");
		String content = request.getParameter("boardcontent");
		
		conn = DBConn.getConnection();
		
		String qry = "UPDATE GAIN.BOARD SET BOARDTITLE = ?, BOARDCONTENT = ? WHERE BOARDIDX =?";
		pstmt = conn.prepareStatement(qry);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3,idx);
		pstmt.executeUpdate();

%>
	<script>
		self.window.alert("Revision Success!!");
		location.href="view.jsp?idx=<%=idx%>";
	</script>
<%

	pstmt.close();
	conn.close();
	
	}catch(SQLException e) {
		out.println(e.toString());
	}

%>

</body>
</html>