<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="jsp.gain.member.UserDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	
		request.setCharacterEncoding("euc-kr");
	
	
		String email = request.getParameter("email");
		String pw = request.getParameter("password");
		
		
		UserDAO dao = UserDAO.getInstance();
		int check = dao.loginCheck(email, pw);
		String name = dao.getname(email);
	
		String msg = "";
		
		if (check == 1)
		{
			
			session.setAttribute("sessionID", name);
			msg = "/gain/content/home/home.jsp";
			
		}
		else if (check == 0)
		{
			msg = "loginform.jsp?msg=0";
		}
		else
		{
			msg = "loginform.jsp?msg=-1";
		}
	
	
	
		response.sendRedirect(msg);
	%>



</body>
</html>