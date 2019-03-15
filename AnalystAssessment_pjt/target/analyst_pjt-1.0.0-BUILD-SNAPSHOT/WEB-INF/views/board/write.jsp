<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function(){
		$("#b_title").focus();		
		
	});
	// 폼의 내용을 지우고 커서를 이름입력하는 곳으로 이동
	function formReset(){
		$("#b_title").val("");
		$("#b_content").val("");
		$("#b_title").focus();	
	}
	// 폼의 내용의 유효성을 검사하는 함수
	function formCheck(){
		var b_title = $("#b_title").val();
		if(b_title==null || b_title.trim().length==0){
			alert('제목은 반드시 입력해야 합니다.');
			$("#b_title").val("");
			$("#b_title").focus();
			return false;
		}
		var b_content = $("#b_content").val();
		if(b_content==null || b_content.trim().length==0){
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
	<form action="writeOk" method="post" onsubmit="return formCheck();" id="myForm">
		<input type="hidden" name="p" value="${p }">
		<input type="hidden" name="s" value="${s }">
		<input type="hidden" name="b" value="${b }">
		<input type="hidden" name="m_userId" value="${id }">
		<input type="hidden" name="m_userPw" value="${password }">
		<table>
			<tr>
				<td colspan="4" class="title">자유 게시판 글쓰기</td>
			</tr>
			<tr>
				<th width="15%">아이디 </th>
				<td width="35%">${id}</td>
			</tr>
			<tr>
				<th width="15%">제목</th>
				<td width="35%" colspan="3">
					<input type="text" name="b_title" id="b_title" size="100" required="required">
				</td>
			</tr>
			<tr>
				<th width="15%" valign="top">내용</th>
				<td width="35%" colspan="3">
					<textarea rows="15" cols="80" name="b_content" id="b_content" required="required"></textarea>					
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
</body>
</html>