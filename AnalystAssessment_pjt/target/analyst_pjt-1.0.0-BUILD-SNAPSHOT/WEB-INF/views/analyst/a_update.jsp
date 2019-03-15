<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body>
<form action="a_updateOk" method="post" onsubmit="return formCheck();">
<input type="hidden" name="analystCode" value="${vo.analystCode }">
	<fieldset>
    	<legend>애널리스트 수정</legend>
    	<div class="form-group row"></div>
    <div class="form-group">
    	<label for="exampleInputEmail1">애널리스트 이름</label>
      	<input type="text" class="form-control" id="analystName" name="analystName"
       	required="required" value="${vo.analystName }">
    </div>
    <div class="form-group">
    	<label for="exampleInputEmail1">소속 증권사</label>
      	<input type="text" class="form-control" id="firmName" name="firmName"
       	required="required" value="${vo.firmName }">
    </div>
    <div class="form-group">
    	<label for="exampleInputEmail1">담당 분야</label>
      	<input type="text" class="form-control" id="industryName" name="industryName"
       	required="required" value="${vo.industryName }">
    </div>
	    <button type="submit" class="btn btn-primary">등록하기</button>
	    <button type="reset" class="btn btn-primary">다시쓰기</button>
	    <button type="button" class="btn btn-primary" onclick="post_to_url('a_list', {'p':'${p }','s':'${s }','b':'${b }'});">돌아가기</button>
  </fieldset>
</form>    
</body>
</html>