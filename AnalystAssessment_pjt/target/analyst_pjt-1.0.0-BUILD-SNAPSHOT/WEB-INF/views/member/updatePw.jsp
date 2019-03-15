<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="resources/js/signInform.js"></script>
</head>
<body>
<form action="updatePwOk" method="post" onsubmit="return formCheck2();">
<input type="hidden" value="${vo.m_userPw}" id="pw">
<input type="hidden" value="${vo.m_userId}" name="m_userId">
	<fieldset>
    	<legend>비밀번호 변경</legend>
    	<div class="form-group row">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">비밀번호 확인</label>
    	<input type="password" class="form-control" id="currentPw" 
    	required="required" placeholder="기존의 비밀번호를 입력해주세요.">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">새로운 비밀번호</label>
    	<input type="password" class="form-control" name="m_userPw" id="m_userPw" 
    	required="required" placeholder="새로운 비밀번호를 입력해주세요.">
    	<small id="pwMsg" class="form-text text-muted"></small>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">새로운 비밀번호 확인</label>
    	<input type="password" class="form-control" name="m_userPw2" id="m_userPw2" 
    	required="required" placeholder="비밀번호 다시 한번 입력해주세요.">
    	<small id="pwChMsg" class="form-text text-muted"></small>
    </div>
	    <button type="submit" class="btn btn-primary">비밀번호 변경하기</button>
	    <button type="reset" class="btn btn-primary">다시쓰기</button>
	    <button type="button" class="btn btn-primary" onclick="location.href='${prevUrl}'">돌아가기</button>
  </fieldset>
</form>
</body>
</html>