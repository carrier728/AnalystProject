<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<script type="text/javascript" src="resources/js/signInform.js"></script>
</head>
<body>
<div class="container" style="margin-top: 10%; width: 25%;">
<form action="signInOk" method="post" onsubmit="return formCheck();">
	<fieldset>
    	<legend>회원가입</legend>
    	<div class="form-group row">
    </div>
    <div class="form-group">
    	<label for="exampleInputEmail1">회원 아이디</label>
      	<input type="text" class="form-control" id="m_userId" name="m_userId" onkeyup="userIdCheck()"
       	required="required" placeholder="아이디를 입력해주세요.">
      	<small id="idMsg" class="form-text text-muted"></small>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">비밀번호</label>
    	<input type="password" class="form-control" name="m_userPw" id="m_userPw" 
    	required="required" placeholder="비밀번호를 입력해주세요.">
    	<small id="pwMsg" class="form-text text-muted"></small>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">비밀번호 확인</label>
    	<input type="password" class="form-control" name="m_userPw2" id="m_userPw2" 
    	required="required" placeholder="비밀번호 다시 한번 입력해주세요.">
    	<small id="pwChMsg" class="form-text text-muted"></small>
    </div>
    <div class="form-group">
    	<label for="exampleInputEmail1">이름</label>
      	<input type="text" class="form-control" id="m_userName" name="m_userName"
       	required="required" placeholder="이름을 입력해주세요.">
      	<small id="nameMsg" class="form-text text-muted"></small>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">이메일 주소</label>
      <input type="email" class="form-control" id="m_email" name="m_email" required="required"
      aria-describedby="emailHelp" placeholder="이메일을 입력해주세요." onkeyup="userEmailCheck()">
      <small id="emailMsg" class="form-text text-muted"></small>
    </div>    
	    <button type="submit" class="btn btn-primary">가입하기</button>
	    <button type="reset" class="btn btn-primary">다시쓰기</button>
	    <button type="button" class="btn btn-primary" onclick="location.href='${prevUrl}'">돌아가기</button>
  </fieldset>
</form>
</div>     
</body>
</html>