<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주가 입력 알림</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
</script>
<style type="text/css">
table { width: 700px;	margin: auto; padding: 5px; border: none;}
.title {font-size: 18pt;	text-align: center; border: none; padding: 5px;}
th { padding: 5px; background-color: silver; border: 1px solid gray;}
td { padding: 5px;	border: 1px solid gray;}
</style>
</head>
<body>
<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 60%;">
	<table class="table table-hover">
		<tr>
			<td colspan="5" class="title" style="border: none;">주가 입력</td>
		</tr>
		<tr>
			<td colspan="5" align="right" style="border: none;">
				${paging.pageInfo }
			</td>
		</tr>
		<tr align="center" class="table-primary">
			<th scope="row">보고서 번호</th>
			<th>보고서 작성일</th>
			<th>경과일<br>(작성일 기준)</th>
			<th>누락 사항</th>
			<th>입력</th>
		</tr>
		<c:if test="${paging.totalCount==0 }">
			<tr>
				<td colspan="5" align="center">
					<strong>등록된 글이 없습니다.</strong>
				</td>
			</tr>
		</c:if>
		<c:if test="${paging.totalCount>0 }">
			<c:if test="${not empty paging.lists }">
				<c:set var="no" value="${paging.totalCount - (paging.currentPage-1) * paging.pageSize }"/>
				<c:forEach var="vo" items="${paging.lists }">
					<c:if test="${vo.dw > 30 && vo.after1MPrice==-1}">
						<tr>
						<td align="center">Report_No_${vo.reportNo }</td>
						<td align="center"><fmt:formatDate value="${vo.reportDate }" pattern="yyyy/MM/dd"/></td>
						<td align="center">${vo.dw}</td>
						<td align="center" style="color:red">주가(1개월 경과) 미입력</td>
						<td align="center"><input type="button" value="주가 수정"  onclick="post_to_url('sp_update', {'reportNo':'${vo.reportNo }','p':'${p }','s':'${s }','b':'${b }'});"></td>
					</c:if>
					<c:if test="${vo.dw > 90 && vo.after3MPrice==-1}">
						<tr>
						<td align="center">Report_No_${vo.reportNo }</td>
						<td align="center"><fmt:formatDate value="${vo.reportDate }" pattern="yyyy/MM/dd"/></td>
						<td align="center">${vo.dw}</td>
						<td align="center" style="color:red">주가(3개월 경과) 미입력</td>
						<td align="center"><input type="button" value="주가 수정"  onclick="post_to_url('sp_update', {'reportNo':'${vo.reportNo }','p':'${p }','s':'${s }','b':'${b }'});"></td>
					</c:if>
					<c:if test="${vo.dw > 180 && vo.after6MPrice==-1}">
						<tr>
						<td align="center">Report_No_${vo.reportNo }</td>
						<td align="center"><fmt:formatDate value="${vo.reportDate }" pattern="yyyy/MM/dd"/></td>
						<td align="center">${vo.dw}</td>
						<td align="center" style="color:red">주가(6개월 경과) 미입력</td>
						<td align="center"><input type="button" value="주가 수정"  onclick="post_to_url('sp_update', {'reportNo':'${vo.reportNo }','p':'${p }','s':'${s }','b':'${b }'});"></td>
					</c:if>
					<c:if test="${vo.dw > 365 && vo.after1YPrice==-1}">
						<tr>
						<td align="center">Report_No_${vo.reportNo }</td>
						<td align="center"><fmt:formatDate value="${vo.reportDate }" pattern="yyyy/MM/dd"/></td>
						<td align="center">${vo.dw}</td>
						<td align="center" style="color:red">주가(1년 경과) 미입력</td>
						<td align="center"><input type="button" value="주가 수정"  onclick="post_to_url('sp_update', {'reportNo':'${vo.reportNo }','p':'${p }','s':'${s }','b':'${b }'});"></td>
					</c:if>
				</c:forEach>
				<tr>
					<td colspan="5" align="center" style="border: none;">
						<%-- 이전 --%>
						<c:if test="${paging.startPage>1 }">
						[<span style="cursor:pointer;color:blue;"
						onclick="post_to_url('sp_list', {'p':'${paging.startPage-1 }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">이전</span>] 
						</c:if>
						<%-- 페이지 번호 목록 --%>
						 <c:if test="${paging.totalCount>0 }">
						 	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
						 		<c:if test="${i==paging.currentPage }">
						 		[<span style="cursor:pointer;color:black;">${i }</span>]  
						 		</c:if>
						 		<c:if test="${i!=paging.currentPage }">
									[<span style="cursor:pointer;color:blue;" 
						 				onclick="post_to_url('sp_list', {'p':'${i }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">${i }</span>]  
						 		</c:if>
						 	</c:forEach>
						 </c:if>
						 <%-- 다음 --%>
						 <c:if test="${paging.endPage<paging.totalPage }">
						 	 [<span style="cursor:pointer;color:blue;" 
						 	onclick="post_to_url('sp_list', {'p':'${paging.endPage+1 }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">다음</span>] 
						 </c:if>					 					
					</td>
				</tr>
			</c:if>
		</c:if>
		<tr>
			<td colspan="5" align="right" style="border: none;">
				<input type="button" value="돌아가기"  onclick="post_to_url('');">
			</td>
		</tr>			
	</table>
</div>
</body>
</html>