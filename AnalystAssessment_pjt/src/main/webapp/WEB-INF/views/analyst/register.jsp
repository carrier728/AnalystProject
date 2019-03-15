<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애널리스트 등록</title>
<script type="text/javascript" src="resources/js/analyst.js"></script>
</head>
<body>
<div class="container" style="margin-top: 10%; width: 50%;">
<form action="registerOk" method="post" onsubmit="return formCheck();">
	<fieldset>
    	<legend>애널리스트 등록</legend>
    	<div class="form-group row"></div>
    <div class="form-group">
    	<label for="exampleInputEmail1">애널리스트 이름</label>
      	<input type="text" class="form-control" id="analystName" name="analystName"
       	required="required" placeholder="애널리스트 이름을 입력해주세요.">
    </div>
    <div class="form-group">
    	<label for="exampleInputEmail1">소속 증권사</label>
      	<input type="text" class="form-control" id="firmName" name="firmName"
       	required="required" placeholder="소속 증권사를 입력해주세요.">
    </div>
    <div class="form-group">
    	<label for="exampleInputEmail1">담당 분야</label>
      	<input type="text" class="form-control" id="industryName" name="industryName"
       	required="required" placeholder="담당 분야를 입력해주세요.">
    </div>
	    <button type="submit" class="btn btn-primary">등록하기</button>
	    <button type="reset" class="btn btn-primary">다시쓰기</button>
  </fieldset>
</form> 
</div>
</body>
</html>