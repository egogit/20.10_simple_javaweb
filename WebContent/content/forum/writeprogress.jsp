<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ page import="jsp.gain.board.BoardBean" %>
<%@ page import="jsp.gain.board.BoardDAO" %>
<%@ page import="java.io.PrintWriter"  %>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<jsp:useBean id="board" class="jsp.gain.board.BoardBean" scope="page" />
<jsp:setProperty name="board" property="boardtitle"/>
<jsp:setProperty name="board" property="boardcontent"/>


<html>
<head>
<meta charset="EUC-KR">
<title>write progress</title>
</head>
<body>
	<%
		
		request.setCharacterEncoding("euc-kr");
	
	
		String sessionID =null;
		if (session.getAttribute("sessionID") != null) {
			sessionID = (String) session.getAttribute("sessionID");
		}
		if (sessionID == null){
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('Plz login.');");
			pw.println("location.href='/gain/content/login/loginform.jsp';");
			pw.println("</script>");
		}
		else{
			if (board.getBoardtitle() == null){
				PrintWriter pw = response.getWriter();
				pw.println("<script>");
				pw.println("alert('Plz input boardtitle.');");
				pw.println("history.back();");
				pw.println("</script>");
			}
			else if (board.getBoardcontent() == null){
				PrintWriter pw = response.getWriter();
				pw.println("<script>");
				pw.println("alert('Plz input boardcontent.');");
				pw.println("history.back();");
				pw.println("</script>");
			}
			else{
				BoardDAO boarddao = new BoardDAO();
				
				int result = boarddao.boardinsert( sessionID,board.getBoardtitle(), board.getBoardcontent());
				
				if (result == -1){
					PrintWriter pw = response.getWriter();
					pw.println("<script>");
					pw.println("alert('Fail to write content.');");
					pw.println("history.back();");
					pw.println("</script>");
				}
				else{
					PrintWriter pw = response.getWriter();
					pw.println("<script>");
					pw.println("alert('Success Write.');");
					pw.println("location.href='/gain/content/forum/forum.jsp'");
					pw.println("</script>");
					
				}
			}
		}
	%>

</body>
</html>