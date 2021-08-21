<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
  		if (session.getAttribute("sessionID")!= null){
  			sessionID = (String) session.getAttribute("sessionID");
  		}
  	
  	%>

	<%@include file ="/s_element/header.jsp" %>
	
	<div class="container">
		<form method="post" action="/gain/content/forum/writeprogress.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>    
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">New Content</th>
					</tr>
					
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="Content Title" name="boardtitle" maxlength="45" style="width:50%; color:gray;"></td>
					</tr>
					<tr>
						<td><textarea placeholder="Content" name="boardcontent" maxlength="2048" style="height: 400px ; width:100%;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="register">
			<input type="reset" value="reset">
		</form>
	</div>

	<%@include file ="/s_element/footer.jsp" %>
  </body>
	
</html>