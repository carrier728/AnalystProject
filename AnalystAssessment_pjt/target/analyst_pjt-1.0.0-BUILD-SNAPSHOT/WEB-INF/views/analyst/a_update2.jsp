<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애널리스트 정보</title>
<script type="text/javascript">
	//폼 체크
	$(function(){
		$("#analystName").focus();
	});
	// 폼의 내용을 지우고 커서를 이름입력하는 곳으로 이동
	function formReset(){
		$("#analystName").val("");
		$("#firmName").val("");
		$("#industryName").val("");
		$("#analystName").focus();	
	}
	// 폼의 내용의 유효성을 검사하는 함수
	function formCheck(){
		var name = $("#analystName").val();
		if(name==null || name.trim().length==0){
			alert('애널리스트 이름을 반드시 입력해야 합니다.');
			$("#analystName").val("");
			$("#analystName").focus();
			return false;
		}
		var f_name = $("#firmName").val();
		if(f_name==null || f_name.trim().length==0){
			alert('소속 증권사를 반드시 입력해야 합니다.');
			$("#firmName").val("");
			$("#firmName").focus();
			return false;
		}
		var i_name = $("#industryName").val();
		if(i_name==null || i_name.trim().length==0){
			alert('담당 분야를 반드시 입력해야 합니다.');
			$("#industryName").val("");
			$("#industryName").focus();
			return false;
		}
	}
</script>
<style type="text/css">
table {width: 700px;padding: 5px;border: none;}
.title {font-size: 18pt;text-align: center;	border: none;padding: 5px;}
th {padding: 5px;background-color: silver;border: 1px solid gray;}
td {padding: 5px;border: 1px solid gray;}
</style>
</head>
<body>
	<fieldset>
		<legend>애널리스트 수정</legend>
		<form action="a_updateOk" method="post" onsubmit="return formCheck();" id="myForm">
		<input type="hidden" name="analystCode" value="${vo.analystCode }">		
		
		<table>
			<tr>
				<th align="right" width="17%">애널리스트 이름</th>
				<td style="border: none;">
				<input type="text" name="analystName" id="analystName" style="width: 280px;" value="${vo.analystName }" required="required">	</td>
			</tr>
			<tr>
				<th align="right" width="17%">소속 증권사</th>
				<td style="border: none;">
				<input type="text" name="firmName"	id="firmName" style="width: 280px;" value="${vo.firmName }"  required="required"></td>
			</tr>
			<tr>
				<th align="right" width="17%">담당 분야</th>
				<td style="border: none;">
				<input type="text"	name="industryName" id="industryName" style="width: 280px;" value="${vo.industryName }" required="required"></td>
			</tr>
			<tr>
				<td style="border: none;" colspan="4" align="left">
					<input type="submit"	value="수정하기"> 
					<input type="reset" value="다시쓰기">
					<input type="button" value="돌아가기" onclick="post_to_url('a_list', {'p':'${p }','s':'${s }','b':'${b }'});">
				</td>
			</tr>
		</table>
		</form>
	</fieldset>
</body>
</html>