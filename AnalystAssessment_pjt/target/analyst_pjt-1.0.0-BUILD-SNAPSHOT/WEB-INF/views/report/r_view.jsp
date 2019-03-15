<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보고서 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function(){
	});
	function deleteCheck(){
		if(confirm('삭제하시겠습니까?')){
			post_to_url('r_deleteOk', {'reportNo':'${vo.reportNo }','m':'0','p':'${p }','s':'${s }','b':'${b }'});
		}
	}
</script>
<!-- <style type="text/css">
	table { width: 1200px; margin: auto;padding: 5px; border: none; } 
    .title { font-size: 18pt; text-align: center; border: none;padding: 5px; }
    th { padding: 5px; background-color: silver; border: 1px solid gray;}
    td { padding: 5px; border: 1px solid gray;}
</style> -->
<style type="text/css">
table { min-width: 1400px;}
.container{
	min-width: 1400px;
	margin: auto;
	padding-left: 0px;
	padding-right: 0px;
}
.title {font-size: 18pt; text-align: center; border: none; padding: 5px;}
td { padding: 5px; border: 1px solid gray;}
</style>
</head>
<body>
		<table class="table table-hover" >
			<tr>
				<td colspan="12" class="title" style="border: none;">보고서 정보</td>
			</tr>
			<tr>
				<td colspan="12" align="right" style="border: none;">
					${paging.pageInfo }
				</td>
			</tr>
			<tr class="table-primary">
				<th scope="row">보고서 번호</th>
				<th>종목명</th>
				<th>보고서 작성일</th>
				<th>애널리스트명</th>
				<th>해당 분야</th>
				<th>투자 의견</th>
				<th>목표가</th>
				<th>주가(보고서 작성일 기준)</th>
				<th>주가(1개월 경과)</th>
				<th>주가(3개월 경과)</th>
				<th>주가(6개월 경과)</th>
				<th>주가(1년 경과)</th>
			</tr>
			<tr>
				<td align="center">Report_No_${vo.reportNo }</td>
				<td align="center">${vo.itemName}</td>
				<td align="center"><fmt:formatDate value="${vo.reportDate }" pattern="yyyy/MM/dd"/></td>
				<td align="center">${vo.analystName }</td>
				<td align="center">${vo.industryName }</td>
				<td align="center">${vo.investOpinion }</td>
				<td align="center">${vo.targetPrice }</td>
				<td align="center">${vo.currentPrice }</td>
				<td align="center">${vo.after1MPrice }</td>
				<td align="center">${vo.after3MPrice }</td>
				<td align="center">${vo.after6MPrice }</td>
				<td align="center">${vo.after1YPrice }</td>
			</tr>
			<tr>
				<td colspan="12" align="right" style="border: none;">
					<input type="button" value="수정하기" onclick="post_to_url('r_update', {'reportNo':'${vo.reportNo }','m':'0','p':'${p }','s':'${s }','b':'${b }'});">					
					<input type="button" value="삭제하기" onclick="deleteCheck()">					
					<input type="button" value="돌아가기" onclick="post_to_url('r_list', {'p':'${p }','s':'${s }','b':'${b }'});">					
				</td>
			</tr>
		</table>
	
</body>
</html>