<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

	// 폼 유효성 검사하기
	function formCheck(){
		if(!emailCheck($("#m_email"))){
			return false; // 사용자 이메일이 이메일형식인지 판단.
		}
		// 사용 불가능 체크 
		if($("#userEmailMessage").text()==="사용 불가능"){
			alert("사용할 수 없는 이메일입니다.\n다시 확인해주시기 바랍니다.");
			return false;
		}
		// 비번이 같은지 판단
		if($("#m_userPw").val()!==$("#m_userPw2").val()){
			alert("비밀번호가 일치하지 않습니다.\n다시 확인해주시기 바랍니다.");
			$("#m_userPw2").val("");
			$("#m_userPw2").focus();
			return false;
		}
		if($("#m_userPw").val()!==$("#pw").val()){
			alert("비밀번호가 옳지 않습니다.");
			$("#m_userPw").val("");
			$("#m_userPw2").val("");
			$("#m_userPw").focus();
			return false;
		}
		return true;
	}
	
	// 이메일 검사하는 함수
	function emailCheck(obj) {		
		var email = obj.val();
		if(!validateEmail(email)){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이메일 형식이 올바르지 않습니다.");
			obj.val("");
			obj.focus();
			return false;
		}
		return true;
	}
	// 이메일 검증
	function validateEmail(email) {
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return re.test(email);
	}
	// 비밀번호 맞는지
	
</script>
</head>
<body>
<div class="container" style="margin-top: 10%; width: 25%;">
<form action="updateMemberOk" method="post" onsubmit="return formCheck();">
	<fieldset>
    	<legend>회원정보 수정</legend>
    	<div class="form-group row">
    </div>
    <div class="form-group">
		<label class="control-label" for="disabledInput">회원아이디</label>
		<input class="form-control" id="disabledInput" type="text" value="${vo.m_userId }" disabled="disabled">
    </div>
    <input type="hidden" value="${m_userPw }" id="pw">
    <div class="form-group">
    	<label for="exampleInputEmail1">이름</label>
      	<input type="text" class="form-control" id="m_userName" name="m_userName"
       	required="required" value="${vo.m_userName }">
      	<small id="nameMsg" class="form-text text-muted"></small>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">이메일 주소</label>
      <input type="email" class="form-control" id="m_email" name="m_email" required="required"
      aria-describedby="emailHelp" value="${vo.m_email}" onkeyup="userEmailCheck()">
      <small id="userEmailMessage" class="form-text text-muted"></small>
    </div>    
	    <button type="submit" class="btn btn-primary">회원정보 수정하기</button>
	    <button type="reset" class="btn btn-primary">다시쓰기</button>
	    <button type="button" class="btn btn-primary" onclick="location.href='${prevUrl}'">돌아가기</button>
  </fieldset>
</form> 
</div>
</body>
</html>