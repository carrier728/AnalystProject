<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function(){
		$("#name").focus();		
		
	});
	// 폼의 내용을 지우고 커서를 이름입력하는 곳으로 이동
	function formReset(){
		$("#m_userId").val("");
		$("#m_userPw").val("");
		$("#b_title").val("");
		$("#b_content").val("");
		$("#b_title").focus();	
	}
	// 폼의 내용의 유효성을 검사하는 함수
	function formCheck(){
		var name = $("#m_userId").val();
		if(name==null || name.trim().length==0){
			alert('이름은 반드시 입력해야 합니다.');
			$("#m_userId").val("");
			$("#m_userId").focus();
			return false;
		}
		var password = $("#m_userPw").val();
		if(password==null || password.trim().length==0){
			alert('비밀번호는 반드시 입력해야 합니다.');
			$("#m_userPw").val("");
			$("#m_userPw").focus();
			return false;
		}
		var subject = $("#b_title").val();
		if(subject==null || subject.trim().length==0){
			alert('제목은 반드시 입력해야 합니다.');
			$("#b_title").val("");
			$("#b_title").focus();
			return false;
		}
		var content = $("#b_content").val();
		if(content==null || content.trim().length==0){
			alert('내용은 반드시 입력해야 합니다.');
			$("#b_content").val("");
			$("#b_content").focus();
			return false;
		}
		return true;		
	}
</script>
<style type="text/css">
	table {	width: 900px; margin: auto;padding: 5px; border: none; } 
    .title { font-size: 18pt; text-align: center; border: none;padding: 5px; }
    th { padding: 5px; background-color: silver; border: 1px solid gray;}
    td { padding: 5px; border: 1px solid gray;}
    /*
    tr:hover {  background-color: #ffff99;  }
    */
</style>
</head>
<body>
<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 60%;">
	<form action="writeOk" method="post" onsubmit="return formCheck();" id="myForm">
		<input type="hidden" name="p" value="${p }">
		<input type="hidden" name="s" value="${s }">
		<input type="hidden" name="b" value="${b }">
		<input type="hidden" name="m_userId" value="${svo.m_userId}">
		<input type="hidden" name="m_userPw" value="${svo.m_userPw}">
		<table class="table table-hover">
			<tr>
				<td colspan="4" class="title" style="border:none; border-bottom: 1px solid gray;">자유게시판 글쓰기</td>
			</tr>
			<tr>
				<th width="15%" class="table-primary" style="text-align: center; vertical-align: middle;">아이디</th>
				<td width="35%"><input type="text" name="m_userId" id="m_userId" size="25" value="${svo.m_userId }" disabled="disabled"></td>
				<th width="15%" class="table-primary" style="text-align: center; vertical-align: middle;">비밀번호</th>
				<td width="35%"><input type="password" name="m_userPw" id="m_userPw" size="25" value="${svo.m_userPw }" disabled="disabled"></td>
			</tr>
			<tr>
				<th width="15%" class="table-primary" style="text-align: center; vertical-align: middle;">제목</th>
				<td width="35%" colspan="3">
					<input type="text" name="b_title" id="b_title" size="100" required="required">
				</td>
			</tr>
			<tr>
				<th width="15%" valign="top" class="table-primary" style="text-align: center; vertical-align: middle;">내용</th>
				<td width="35%" colspan="3">
					<textarea rows="15" cols="100" name="b_content" id="b_content" required="required"></textarea>					
				</td>
			</tr>
			<tr>
			
				<td colspan="4" align="right" style="border: none;">
					<input type="submit" value="저장하기">					
					<input type="button" value="다시쓰기" onclick="formReset();">					
					<input type="button" value="돌아가기" onclick="post_to_url('list', {'p':'${p }','s':'${s }','b':'${b }'});">					
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>