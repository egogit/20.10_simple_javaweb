<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ page import="jsp.gain.chat.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-widthm, intial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">

<title>Chatting site</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/custom.js"></script>
</head>
<body style="bodystruct">
	<%@include file="/s_element/header.jsp"%>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>실시간채팅방
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList" class="portlet-body char-widget"
								style="overflow-y: auto; width: auto; height: 600px;">
							</div>
						</div>
						<div class="portlet-footer">
							<div class="row">
								<div class="form-group col-xs-4">
									<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="Username" maxlength="8">
								</div>
							</div>
							<div class="row" style="height: 90px">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="chatContent"
										class="form-control" placeholder="Input Message" maxlength="100"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">Submit</button>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			 </div>
		</div>
			<div class="alert alert-success" id="successMessage" style="display: none;">
				<strong>메시지 전송에 성공하였습니다.</strong>
			</div>
			<div class="alert alert-danger" id="dangerMessage"	style="display: none;">
				<strong>이름과 내용을 모두 입력해주세요.</strong>
			</div>
			<div class="alert alert-warning" id="warningMessage" style="display: none;">
				<strong>데이터베이스 오류가 발생했습니다.</strong>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				chatListFunction('ten');
				getInfiniteChat();
			});
		</script>
<%@include file ="/s_element/footer.jsp" %>
</body>
</html>