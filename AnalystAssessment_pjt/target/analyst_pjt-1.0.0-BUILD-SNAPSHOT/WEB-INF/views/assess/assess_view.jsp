<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애널리스트 평가</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function() {
	});
</script>
<style type="text/css">
.title {
	font-size: 18pt;
	text-align: center;
	border: none;
	padding: 5px;
}

th {
	padding: 5px;
	background-color: silver;
	border: 1px solid gray;
}

td {
	padding: 5px;
	border: 1px solid gray;
}
</style>
</head>
<body>
	<table  class="table"  style="width: 1000px; margin: auto; padding: 5px; border: none;">
		<tr>
			<td colspan="5" class="title">애널리스트 평가</td>
		</tr>
		<tr>
			<td colspan="5" align="right" style="border: none;">
				${paging.pageInfo }</td>
		</tr>
		<tr>
			<th>애널리스트명</th>
			<th>소속 증권사</th>
			<th>담당 분야</th>
			<th>보고서 수</th>
		</tr>
		<tr>
			<td align="center">${vo.analystName }</td>
			<td align="center">${vo.firmName }</td>
			<td align="center">${vo.industryName }</td>
			<td align="center">${reportCount }</td>
		</tr>
		<tr>
			<td colspan="4" align="right" style="border: none;"><input
				type="button" value="돌아가기"
				onclick="post_to_url('assess_list', {'p':'${p }','s':'${s }','b':'${b }'});">
			</td>
		</tr>
	</table>
	<div style="width:1000px;margin: auto;">	
		<div style="float: left; width:50%;">
			
			<table id="tbl1" style="width:90%;margin: auto;">
			<tr>
				<td colspan="5" style="border: none;font-size: 18px;" align="center">투자의견 적중률</td>
			</tr>
			<tr align="center">
				<th style="width:25%">투자의견</th>
				<th>1개월</th>
				<th>3개월</th>
				<th>6개월</th>
				<th>1년</th>
			</tr>
			<tr align="center">
				<td style="width:25%">BUY</td>
				<td>
				<c:choose>
					<c:when test="${buyResult1M==-1 }">N/A</c:when>
					<c:when test="${buyResult1M>=0 }">${buyResult1M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${buyResult3M==-1 }">N/A</c:when>
					<c:when test="${buyResult3M>=0 }">${buyResult3M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${buyResult6M==-1 }">N/A</c:when>
					<c:when test="${buyResult6M>=0 }">${buyResult6M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${buyResult1Y==-1 }">N/A</c:when>
					<c:when test="${buyResult1Y>=0 }">${buyResult1Y}%</c:when>
				</c:choose>	
				</td>
			</tr>
			<tr align="center">
				<td style="width:25%">SELL</td>
				<td>
				<c:choose>
					<c:when test="${sellResult1M==-1 }">N/A</c:when>
					<c:when test="${sellResult1M>=0 }">${sellResult1M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${sellResult3M==-1 }">N/A</c:when>
					<c:when test="${sellResult3M>=0 }">${sellResult3M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${sellResult6M==-1 }">N/A</c:when>
					<c:when test="${sellResult6M>=0 }">${sellResult6M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${sellResult1Y==-1 }">N/A</c:when>
					<c:when test="${sellResult1Y>=0 }">${sellResult1Y}%</c:when>
				</c:choose>	
				</td>
			</tr>
			<tr align="center">
				<td style="width:25%">전체</td>
				<td>
				<c:choose>
					<c:when test="${totalResult1M==-1 }">N/A</c:when>
					<c:when test="${totalResult1M>=0 }">${totalResult1M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${totalResult3M==-1 }">N/A</c:when>
					<c:when test="${totalResult3M>=0 }">${totalResult3M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${totalResult6M==-1 }">N/A</c:when>
					<c:when test="${totalResult6M>=0 }">${totalResult6M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${totalResult1Y==-1 }">N/A</c:when>
					<c:when test="${totalResult1Y>=0 }">${totalResult1Y}%</c:when>
				</c:choose>	
				</td>
			</tr>
			</table>
		</div>
		<div style="float: right; width:50%;">
			<table id="tbl2" style="width:90%;margin: auto;">
			<tr>
				<td colspan="5" style="border: none;font-size: 18px;" align="center">평균 주가 상승률 및 하락률</td>
			</tr>
			<tr align="center">
				<th style="width:25%">투자의견</th>
				<th>1개월</th>
				<th>3개월</th>
				<th>6개월</th>
				<th>1년</th>
			</tr>
			<tr align="center">
				<td style="width:25%">BUY</td>
				<td>
				<c:choose>
					<c:when test="${changeRate1M==-1 }">N/A</c:when>
					<c:when test="${changeRate1M!=-1 }">${changeRate1M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${changeRate3M==-1 }">N/A</c:when>
					<c:when test="${changeRate3M!=-1 }">${changeRate3M}%</c:when>
				</c:choose>	
				</td>
				<td>
				<c:choose>
					<c:when test="${changeRate6M==-1 }">N/A</c:when>
					<c:when test="${changeRate6M!=-1 }">${changeRate6M}%</c:when>
				</c:choose>					
				</td>
				<td>
 				<c:choose>
					<c:when test="${changeRate1Y==-1 }">N/A</c:when>
					<c:when test="${changeRate1Y!=-1 }">${changeRate1Y}%</c:when>
				</c:choose>		
				</td>
			</tr>
			<tr align="center" style="width:20%">
				<td>SELL</td>
				<td>
				<c:choose>
					<c:when test="${sellRate1M==-1 }">N/A</c:when>
					<c:when test="${sellRate1M!=-1 }">${sellRate1M}%</c:when>
				</c:choose>					
				</td>
				<td>
				<c:choose>
					<c:when test="${sellRate3M==-1 }">N/A</c:when>
					<c:when test="${sellRate3M!=-1 }">${sellRate3M}%</c:when>
				</c:choose>					
				</td>
				<td>
				<c:choose>
					<c:when test="${sellRate6M==-1 }">N/A</c:when>
					<c:when test="${sellRate6M!=-1 }">${sellRate6M}%</c:when>
				</c:choose>					
				</td>
				<td>
				<c:choose>
					<c:when test="${sellRate1Y==-1 }">N/A</c:when>
					<c:when test="${sellRate1Y!=-1 }">${sellRate1Y}%</c:when>
				</c:choose>					
				</td>
			</tr>
			</table>
		</div>	
	</div>

	<span style="color:white">==========================================================================================</span>
	<span style="color:white">==========================================================================================</span>
	<div style="width:1000px;margin: auto;">	
		<div style="float: left; width:50%;">
			
			<table id="tbl1" style="width:90%;margin: auto;">
			<tr>
				<td colspan="5" style="border: none;font-size: 18px;" align="center">목표주가 달성률</td>
			</tr>
			<tr align="center">
				<th style="width:25%">투자의견</th>
				<th>1개월</th>
				<th>3개월</th>
				<th>6개월</th>
				<th>1년</th>
			</tr>
			<tr align="center">
				<td style="width:25%">BUY</td>
				<td>
				<c:choose>
					<c:when test="${targetBuy1M==-1 }">N/A</c:when>
					<c:when test="${targetBuy1M!=-1 }">${targetBuy1M}%</c:when>
				</c:choose>					
				</td>
				<td>
				<c:choose>
					<c:when test="${targetBuy3M==-1 }">N/A</c:when>
					<c:when test="${targetBuy3M!=-1 }">${targetBuy3M}%</c:when>
				</c:choose>								
				</td>
				<td>
				<c:choose>
					<c:when test="${targetBuy6M==-1 }">N/A</c:when>
					<c:when test="${targetBuy6M!=-1 }">${targetBuy6M}%</c:when>
				</c:choose>								
				</td>
				<td>
				<c:choose>
					<c:when test="${targetBuy1Y==-1 }">N/A</c:when>
					<c:when test="${targetBuy1Y!=-1 }">${targetBuy1Y}%</c:when>
				</c:choose>								
				</td>
			</tr>
			</table>
		</div>
		<div style="float: right; width:50%;">
			<table id="tbl2" style="width:90%;margin: auto;">
			<tr>
				<td colspan="5" style="border: none;font-size: 18px;" align="center">최근 보고서 (5개)</td>
			</tr>
			<tr>
				<th style="width: 30%;">보고서 번호</th>
				<th style="width: 20%;">종목명</th>
				<th style="width: 30%;">보고서 작성일</th>
				<th style="width: 20%;">투자의견</th>
			</tr>
			<c:forEach items="${recentReport}" var="dto" begin="0" end="4">
			<tr align="center">
				<td>
					<span style="cursor: pointer;" onclick="post_to_url('r_view', {'reportNo':'${dto.reportNo}'});">
						Report_No_<c:out value="${dto.reportNo }"/>
					</span>
				</td>
				<td>${dto.itemName }</td>
				<td><fmt:formatDate value="${dto.reportDate }" pattern="yyyy/MM/dd"/></td>
				<td>${dto.investOpinion }</td>
			</tr>
			</c:forEach>
			</table>
		</div>	
	</div>
</body>
</html>