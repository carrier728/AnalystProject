<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<script type="text/javascript" src="resources/js/find.js"></script>
</head>
<body>
<div class="container" style="margin-top: 10%; width: 25%;">
<form action="findIdOk" method="post" onsubmit="return formCheck();" id="myForm">
	<fieldset>
    	<legend>아이디 찾기</legend>
    	<div class="form-group row">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">가입 이메일</label>
      <input type="email" class="form-control" id="m_email" name="m_email" required="required"
      aria-describedby="emailHelp" placeholder="이메일을 입력해주세요." onkeyup="emailCheck()">
      <small id="emailMsg" class="form-text text-muted"></small>
    </div>    
	    <button type="submit" class="btn btn-primary">아이디 조회</button>
  </fieldset>
</form>
</div>      
</body>
</html>