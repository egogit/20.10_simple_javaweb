<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
	<head>
    <title>Gain - Login</title>
   <meta charset="utf-8">
   
   <!--  Boot Strap File  -->
   <link rel="stylesheet" href="../../css/style.css">
   <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="../bootstrap/js/bootstrap.js"></script> 
    <style>
    </style>
    
    <script>
    
    function inputcheck()
	{
    	if(!document.user.name.value){
    		alert("Input your name");
    		return false;
    	}
		if(!document.user.email1.value){
			alert("Input Email");
			return false;
		}

		if(!document.user.password.value){
			alert ("Input password");
			return false;
		
		}

		if(!(document.user.password.value == document.user.checkpassword.value) ){
			alert (" Plz input same password");
			return false;

		}

	}

	function loginForm() {
		location.href="loginform.jsp";
	}

	
	function mailcheck(){
		index=document.user.email2.selectedIndex
		var mail=document.join.email2.option[index].value
		document.user.mail2.value=mail
	}
	
	function selectedEmail(form){
		var selectOption = document.getElementById("emailSelect");
		selectOption = $("#emailSelect option:selected").val();
		document.user.email2.value =  selectOption;
	}
    
    </script>
    
    
  </head>

  <body style="bodystrct">

	<%@include file ="../../s_element/header.jsp" %>
	
	<form method="post" action="joinprogress.jsp" name="user" onsubmit="return inputcheck()">
		<table>
			<tr>
				<td id="element">Name</td>
				<td>
				<input type="text" class="name" name="name" maxlength="45"/>
				</td>
			</tr>
			<tr>
				<td id="element">Email</td>
				<td>
					<input type="text" class="email" name="email1" maxlength="50">
					@
					<input type="text" class="email2" name="email2" maxlength="30">
					<select id="emailSelect" name="emailSelect" onChange="selectedEmail(this.emailSelect)">
						<option value="" selected="selected">Self input</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gc.gachon.ac.kr">gc.gachon.ac.kr</option>
					</select>				
				</td>
			</tr>
			<!-- 선택하면 비활성화 시키는 것을 추가하기.. -->
			<tr>
				<td id="element">Password</td>
				<td>
					<input type="password" name="password" maxlength="45"/>
				</td>
			</tr>
			
			<tr>
				<td id="element">Check password</td>
				<td>
					<input type="password" name="checkpassword" maxlength="45"/>
				</td>
			</tr>
			
			<tr>
				<td id="element">Phone number </td>
				<td>
					<input type="text" name="phonenum"/>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="Submit"/>
		<button type="reset">Reset</button>
		<input type="button" value="Cancle" onclick=loginForm()>
	
	</form>
	
	<%@include file ="../../s_element/footer.jsp" %>
  </body>
	
</html>

