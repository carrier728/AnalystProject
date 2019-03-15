<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보고서 정보</title>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- <script type="text/javascript" src="resources/js/report.js"></script> -->
<script type="text/javascript">
	// 폼 체크
	$(function(){
		$( "#datepicker1" ).datepicker({
		    dateFormat: 'yy/mm/dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년',
		  });
	});
  // 폼의 내용을 지우고 커서를 이름 입력하는 곳으로 이동
	function formReset(){
		$("#reportDate").val("");
		$("#analystName").val("");
		$("#investOpinion").val("");
		$("#currentPrice").val("");
		$("#after1MPrice").val("");
		$("#after3MPrice").val("");
		$("#after6MPrice").val("");
		$("#after1YPrice").val("");
		$("#analystName").focus();	
	}
	function formCheck(){
		var date = $("#datepicker1").val();
		if(date==null || date.trim().length==0){
			alert('작성일을 반드시 입력해야 합니다.');
			$("#datepicker1").val("");
			$("#datepicker1").focus();
			return false;
		}
		var name = $("#analystName").val();
		if(name==null || name.trim().length==0){
			alert('애널리스트 이름을 반드시 입력해야 합니다.');
			$("#analystName").val("");
			$("#analystName").focus();
			return false;
		}
		var opnion = $("#investOpinion").val();
		if(opnion==null || opnion.trim().length==0){
			alert('투자 의견을 반드시 입력해야 합니다.');
			$("#investOpinion").val("");
			$("#investOpinion").focus();
			return false;
		}
		var  ame = $("#currentPrice").val();
		if(name==null || name.trim().length==0){
			alert('애널리스트 이름을 반드시 입력해야 합니다.');
			$("#analystName").val("");
			$("#analystName").focus();
			return false;
		}
		var targetPrice = $("#targetPrice").val();
		if(targetPrice.trim().length==0){
			$("#targetPrice").val(-1);
			return true;
		}
	}
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
		<form action="r_updateOk" method="post" onsubmit="return formCheck();">
		<input type="hidden" name="p" value="${p }">
		<input type="hidden" name="s" value="${s }">
		<input type="hidden" name="b" value="${b }">
		<input type="hidden" name="reportNo" value="${vo.reportNo }">		
		<fieldset>
	    	<legend>보고서 수정</legend>
	    	<div class="form-group row">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">종목명</label>
	      	<input type="text" class="form-control" id="itemName" name="itemName"
	       	required="required" value="${vo.itemName }">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">보고서 작성일</label>
	      	<input type="text" class="form-control" id="datepicker1" name="reportDate"
	       	required="required" value="<fmt:formatDate value='${vo.reportDate }' pattern='yyyy/MM/dd'/>">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">애널리스트명</label>
	      	<input type="text" class="form-control" id="analystName" name="analystName"
	       	required="required" value="${vo.analystName }">
	    </div>
	    <small id="anMsg" class="form-text text-muted"></small>
	    <div class="form-group">
	      	<label for="exampleSelect1">해당 분야</label>
      		<select class="form-control" id="exampleSelect1" name="industryName">
      			<c:forEach items="${industryList }" var="industryVO">
      				<c:if test="${vo.industryName == industryVO.industryName }">
 						<option value="${industryVO.industryName}" selected="selected">${industryVO.industryName} </option>
        			</c:if>
      				<c:if test="${vo.industryName != industryVO.industryName }">
 						<option value="${industryVO.industryName}">${industryVO.industryName} </option>
        			</c:if>
        		</c:forEach>
      		</select>
   		</div>
	    <div class="form-group">
	    	<label class="exampleInputEmail1">투자 의견</label>
	    	<div>
			<c:choose>
				<c:when test="${vo.investOpinion=='BUY' }">	    	
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="BUY" checked="checked">BUY
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="SELL">SELL
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="N/A">N/A
				</c:when>
				<c:when test="${vo.investOpinion=='SELL' }"> 	    	
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="BUY">BUY
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="SELL" checked="checked">SELL
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="N/A">N/A	
				</c:when>
				<c:when test="${vo.investOpinion=='N/A' }">
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="BUY">BUY
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="SELL">SELL
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="N/A" checked="checked">N/A					
				</c:when>
			</c:choose> 	
			</div>	
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">목표가</label>
	      	<input type="text" class="form-control" id="targetPrice" name="targetPrice"
	       	value="${vo.targetPrice }">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">주가 (작성일 기준)</label>
	      	<input type="text" class="form-control" id="currentPrice" name="currentPrice"
	       	required="required" value="${vo.currentPrice }">
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
		    <button type="submit" class="btn btn-primary" onclick="post_to_url('r_updateOk', {'p':'${p }','s':'${s }','b':'${b }'});">수정하기</button>
		    <button type="reset" class="btn btn-primary">다시쓰기</button>
		    <button type="button" class="btn btn-primary" onclick="post_to_url('r_list', {'p':'${p }','s':'${s }','b':'${b }'});">돌아가기</button>
	  	</fieldset>
		</form>
</div>
</body>
</html>