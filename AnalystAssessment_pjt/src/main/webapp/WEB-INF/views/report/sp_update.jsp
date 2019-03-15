<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주가 입력</title>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
table {width: 900px;padding: 5px;border: none;}
.title {font-size: 18pt;text-align: center;	border: none;padding: 5px;}
th {padding: 5px;background-color: silver;border: 1px solid gray;}
td {padding: 5px;border: 1px solid gray;}
</style>
</head>
<body>
<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 40%;">				
		<form action="sp_updateOk" method="post" onsubmit="return formCheck();">
		<input type="hidden" name="p" value="${p }">
		<input type="hidden" name="s" value="${s }">
		<input type="hidden" name="b" value="${b }">
		<input type="hidden" name="reportNo" value="${vo.reportNo }">	
		<input type="hidden" name="vo" value="${vo}">	
		<fieldset>
	    	<legend>경과 후 주가 입력</legend>
	    	<div class="form-group row">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">보고서 번호</label>
	      	<input type="text" class="form-control" id="disabledInput" name="reportNo"
	       	required="required" value="Report_No_${vo.reportNo }" disabled="disabled">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">종목명</label>
	      	<input type="text" class="form-control" id="itemName" name="itemName"
	       	required="required" value="${vo.itemName }" disabled="disabled">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">보고서 작성일</label>
	      	<input type="text" class="form-control" id="disabledInput" name="reportDate"
	       	required="required" value="<fmt:formatDate value='${vo.reportDate }' pattern='yyyy/MM/dd'/>" disabled="disabled">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">애널리스트명</label>
	      	<input type="text" class="form-control" id="analystName" name="analystName"
	       	required="required" value="${vo.analystName }" disabled="disabled">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">해당 분야</label>
	      	<input type="text" class="form-control" id="industryName" name="industryName"
	       	required="required" value="${vo.industryName }" disabled="disabled">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">투자의견</label>
	      	<input type="text" class="form-control" id="investOpinion" name="investOpinion"
	       	required="required" value="${vo.investOpinion }" disabled="disabled">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">주가 (보고서 작성일)</label>
	      	<input type="text" class="form-control" id="currentPrice" name="currentPrice"
	       	required="required" value="${vo.currentPrice }" disabled="disabled">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">주가 (1개월 경과)</label>
	      	<input type="text" class="form-control" id="after1MPrice" name="after1MPrice"
	       	value="${vo.after1MPrice }">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">주가 (3개월 경과)</label>
	      	<input type="text" class="form-control" id="after3MPrice" name="after3MPrice"
	       	value="${vo.after3MPrice }">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">주가 (6개월 경과)</label>
	      	<input type="text" class="form-control" id="after6MPrice" name="after6MPrice"
	       	value="${vo.after6MPrice }">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">주가 (1년 경과)</label>
	      	<input type="text" class="form-control" id="after1YPrice" name="after1YPrice"
	       	value="${vo.after1YPrice }">
	    </div>
		    <button type="submit" class="btn btn-primary" onclick="post_to_url('r_updateOk', {'p':'${p }','s':'${s }','b':'${b }'});">주가입력</button>
		    <button type="reset" class="btn btn-primary">다시쓰기</button>
		    <button type="button" class="btn btn-primary" onclick="post_to_url('r_list', {'p':'${p }','s':'${s }','b':'${b }'});">돌아가기</button>
	  	</fieldset>
		</form>
</div>
</body>
</html>