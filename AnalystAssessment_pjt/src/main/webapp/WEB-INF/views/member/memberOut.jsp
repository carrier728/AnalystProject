<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 여부</title>
</head>
<body>
	<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 60%;">
		<div class="alert alert-dismissible alert-warning">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <h4 class="alert-heading">경고!</h4>
		  <p class="mb-0">회원탈퇴를 진행하실 경우, 회원아이디 복구가 힘들어질 수 있습니다. 그래도 괜찮으시겠습니까?</p>
		</div>
		<div><button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath }/memberOutOk'">회원 탈퇴</button>&nbsp; &nbsp;
		<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/'">메인으로 가기</button></div>
	</div>
</body>
</html>