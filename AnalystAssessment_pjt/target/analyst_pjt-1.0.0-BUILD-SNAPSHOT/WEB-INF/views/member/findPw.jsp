<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/js/find.js"></script>
</head>
<body>
<div class="container" style="margin-top: 10%; width: 25%;">
	<form action="findPwOk" method="post" onsubmit="return formCheck();" id="myForm">
		<fieldset>
	    	<legend>비밀번호 찾기</legend>
	    	<div class="form-group row">
	    </div>
	    <div class="form-group">
	      	<label for="exampleInputEmail1">회원 아이디</label>
	      	<input type="text" class="form-control" id="m_userId" name="m_userId" required="required"
	      	placeholder="아이디를 입력해주세요." onkeyup="userIdCheck()">
	      	<small id="idMsg" class="form-text text-muted"></small>
	    </div>    
		    <button type="submit" class="btn btn-primary">비번 찾기</button>
	  	</fieldset>
	</form>
</div>
</body>
</html>