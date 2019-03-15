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
		var date = $("#reportDate").val();
		if(date==null || date.trim().length==0){
			alert('작성일을 반드시 입력해야 합니다.');
			$("#reportDate").val("");
			$("#reportDate").focus();
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
		var name = $("#currentPrice").val();
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
	<fieldset>
		<legend>보고서 수정</legend>
		<form action="r_updateOk" method="post" onsubmit="return formCheck();" id="myForm">
		<input type="hidden" name="p" value="${p }">
		<input type="hidden" name="s" value="${s }">
		<input type="hidden" name="b" value="${b }">
		<input type="hidden" name="reportNo" value="${vo.reportNo }">
		<table>
			<tr>
				<th align="right" width="20%">종목명</th>
				<td style="border: none;">
				<input type="text" name="itemName"	id="itemName" style="width: 280px;" value="${vo.itemName }" required="required"></td>
			</tr>
			<tr>
				<th align="right" width="20%">보고서 작성일</th>
				<td style="border: none;">
				<input type="text" name="reportDate" id="datepicker1" style="width:280px;" value="<fmt:formatDate value='${vo.reportDate }' pattern='yyyy/MM/dd'/>" required="required">
				</td>
			</tr>
			<tr>
				<th align="right" width="20%">애널리스트명</th>
				<td style="border: none;">
				<input type="text" name="analystName"	id="analystName" style="width: 280px;" 
				onkeyup="analystNameCheck()" value="${vo.analystName }" required="required">
				<span id="anMsg"></span>
				</td>
			</tr>
			<tr> 
				<th align="right" width="20%">해당 분야</th>
				<td style="border: none;">
					<select name="industryName" id="industryName">
						<c:forEach items="${industryList }" var="industryVO">
							<option value="${industryVO.industryName}">${industryVO.industryName}</option>				
						</c:forEach>
					</select>						
				</td>
			</tr>
			<tr>
				<th align="right" width="20%">투자 의견</th>
					<td style="border: none;">
					<c:choose>
						<c:when test="${vo.investOpinion=='BUY' }"> 
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="BUY" checked="checked">BUY
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="SELL">SELL
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="N/A">N/A
						</c:when>
						<c:when test="${vo.investOpinion=='SELL' }"> 
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="BUY">BUY
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="SELL" checked="checked">SELL
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="N/A">N/A
						</c:when>
						<c:when test="${vo.investOpinion=='N/A' }"> 
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="BUY">BUY
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="SELL">SELL
							<input type="radio" name="investOpinion" id="investOpinion" style="wdith: 280px;" value="N/A" checked="checked">N/A
						</c:when>
					</c:choose>
					</td>		
			</tr>
			<tr>
				<th align="right" width="20%">목표가</th>
				<td style="border: none;">
				<input type="text"	name="targetPrice" id="targetPrice" style="width: 280px;" value="${vo.targetPrice }"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가<br>(보고서 작성일 기준)</th>
				<td style="border: none;">
				<input type="text"	name="currentPrice" id="currentPrice" style="width: 280px;" value="${vo.currentPrice }"	required="required"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가<br>(1개월 경과)</th>
				<td style="border: none;">
				<input type="text"	name="after1MPrice" id="after1MPrice" style="width: 280px;" value="${vo.after1MPrice }" required="required"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가<br>(3개월 경과)</th>
				<td style="border: none;">
				<input type="text"	name="after3MPrice" id="after3MPrice" style="width: 280px;" value="${vo.after3MPrice }" required="required"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가<br>(6개월 경과)</th>
				<td style="border: none;">
				<input type="text"	name="after6MPrice" id="after6MPrice" style="width: 280px;" value="${vo.after6MPrice }" required="required"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가<br>(1년 경과)</th>
				<td style="border: none;">
				<input type="text"	name="after1YPrice" id="after1YPrice" style="width: 280px;" value="${vo.after1YPrice }" required="required"></td>
			</tr>			
			<tr>
				<td style="border: none;" colspan="4" align="left">
					<input type="submit"	value="수정하기" onclick="post_to_url('r_updateOk', {'p':'${p }','s':'${s }','b':'${b }'});"> 
					<input type="button" value="다시쓰기" onclick="formReset();">
					<input type="button" value="돌아가기" onclick="post_to_url('r_list', {'p':'${p }','s':'${s }','b':'${b }'});">
				</td>
			</tr>
		</table>
		</form>
	</fieldset>
</body>
</html>