<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>보고서 등록</title>
	<script type="text/javascript" src="resources/js/report.js"></script>
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
	</script>
	</head>
<body>
<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 40%;">
	<form action="r_registerOk" method="post" onsubmit="return formCheck();">
		<fieldset>
	    	<legend>보고서 등록</legend>
	    	<div class="form-group row">
	    </div>
		<input type="hidden" id="after1MPrice" name="after1MPrice" value="-1">
		<input type="hidden" id="after3MPrice" name="after3MPrice" value="-1">
		<input type="hidden" id="after6MPrice" name="after6MPrice" value="-1">
		<input type="hidden" id="after1YPrice" name="after1YPrice" value="-1">	    
	    <div class="form-group">
	    	<label for="exampleInputEmail1">종목명</label>
	      	<input type="text" class="form-control" id="itemName" name="itemName"
	       	required="required" placeholder="종목명을 입력해주세요.">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">보고서 작성일</label>
	      	<input type="text" class="form-control" id="datepicker1" name="reportDate"
	       	required="required" placeholder="보고서 작성일을 입력해주세요. 형식 : 1990/01/01">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">애널리스트명</label>
	      	<input type="text" class="form-control" id="analystName" name="analystName"
	       	required="required" placeholder="애널리스트명을 입력해주세요.">
	    </div>
	    <small id="anMsg" class="form-text text-muted"></small>
	    <div class="form-group">
	      	<label for="exampleSelect1">해당 분야</label>
      		<select class="form-control" id="exampleSelect1" name="industryName">
      			<c:forEach items="${industryList }" var="industryVO">
					<option value="${industryVO.industryName}">${industryVO.industryName}</option>		
        		</c:forEach>
      		</select>
   		</div>
	    <div class="form-group">
	    	<label class="exampleInputEmail1">투자 의견</label>
	    	<div>
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="BUY">BUY
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="SELL">SELL
				<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px; margin-left: 10px;" value="N/A">N/A
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">목표가</label>
	      	<input type="text" class="form-control" id="targetPrice" name="targetPrice"
	       	placeholder="목표가 없을 시, 공백">
	    </div>
	    <div class="form-group">
	    	<label for="exampleInputEmail1">주가 (보고서 작성일 기준)</label>
	      	<input type="text" class="form-control" id="currentPrice" name="currentPrice"
	       	required="required" placeholder="현재 주가를 입력해주세요.(보고서 작성일 기준)">
	    </div>
		    <button type="submit" class="btn btn-primary">등록하기</button>
		    <button type="reset" class="btn btn-primary">다시쓰기</button>
		    <button type="button" class="btn btn-primary" onclick="post_to_url('r_list', {'p':'${p }','s':'${s }','b':'${b }'});">돌아가기</button>
	  	</fieldset>
	</form>
</div>
</body>
</html>