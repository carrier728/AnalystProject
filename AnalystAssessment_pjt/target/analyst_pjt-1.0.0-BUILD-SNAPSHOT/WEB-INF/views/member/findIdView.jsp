<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<div class="container" style="margin-top: 10%; width: 20%;">
	<span style="width: 100%;">
	회원님의 아이디는 "${member.m_userId}" 입니다. 
	</span>
	<div style="margin-top: 15px;width: 100%;">
	<button type="button" style="max-width:100px;width: 50%;" class="btn btn-primary" onclick="location.href='logIn'">로그인<br>하러가기</button>
	<button type="button" style="max-width:100px;width: 50%;" class="btn btn-primary" onclick="location.href='findPw'">비밀번호<br>찾기</button>
	</div>
</div>
</body>
</html>