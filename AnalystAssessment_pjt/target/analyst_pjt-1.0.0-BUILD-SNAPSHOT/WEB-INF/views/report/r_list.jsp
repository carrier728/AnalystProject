<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보고서 목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>
<style type="text/css">
table {width: 900px;margin: auto;padding: 5px;border: none;}
.title {font-size: 18pt;text-align: center;	border: none;padding: 5px;}
th {padding: 5px;background-color: silver;border: 1px solid gray;}
td {padding: 5px;border: 1px solid gray;}
</style>
</head>
<body>
		<table class="table table-hover">
		<tr>
			<td colspan="6" class="title" style="border: none;">보고서 목록</td>
		</tr>
		<tr>
			<td colspan="6" align="right" style="border: none;">
				${paging.pageInfo }
			</td>
		</tr>
		<tr align="center" class="table-primary">
			<th scope="row">번호</th>
			<th>보고서 번호</th>
			<th>종목명</th>
			<th>보고서 작성일</th>
			<th>애널리스트명</th>
			<th>해당 분야</th>
		</tr>
		<c:if test="${paging.totalCount==0 }">
			<tr>
				<td colspan="6" align="center">
					<strong>등록된 글이 없습니다.</strong>
				</td>
			</tr>
		</c:if>
		<c:if test="${paging.totalCount>0 }">
			<c:if test="${not empty paging.lists }">
				<c:set var="no" value="${paging.totalCount - (paging.currentPage-1) * paging.pageSize }"/>
				<c:forEach var="vo" items="${paging.lists }" varStatus="vs">
				<c:choose>
					<c:when test="${(no-vs.count+1)%2 == 0 }">
					<tr class="table-light">
						<td scope="row" align="center" style="border: 1px solid gray;">
							${no-vs.count+1 } <!-- 위의 forEach문 안에 varStatus를 넣어주고 vs.count로 글목록 번호 주기 -->
						</td>
						<td align="center" style="border: 1px solid gray;">
							<span style="cursor: pointer;" onclick="post_to_url('r_view', {'reportNo':'${vo.reportNo}','p':'${paging.currentPage}','s':'${paging.pageSize}','b':'${paging.blockSize}'});">
								Report_No_<c:out value="${vo.reportNo }"/>
							</span>
						</td>
						<td align="center" style="border: 1px solid gray;">${vo.itemName }</td>
						<td align="center" style="border: 1px solid gray;"> <fmt:formatDate value="${vo.reportDate }" pattern="yyyy/MM/dd"/>  </td>
						<td align="center" style="border: 1px solid gray;">${vo.analystName }</td>
						<td align="center" style="border: 1px solid gray;">${vo.industryName }</td>
					</tr>
					</c:when>
					<c:when test="${(no-vs.count+1)%2 != 0 }">
					<tr>
						<td align="center">
							${no-vs.count+1 } <!-- 위의 forEach문 안에 varStatus를 넣어주고 vs.count로 글목록 번호 주기 -->
						</td>
						<td align="center">
							<span style="cursor: pointer;" onclick="post_to_url('r_view', {'reportNo':'${vo.reportNo}','p':'${paging.currentPage}','s':'${paging.pageSize}','b':'${paging.blockSize}'});">
								Report_No_<c:out value="${vo.reportNo }"/>
							</span>
						</td>
						<td align="center">${vo.itemName }</td>
						<td align="center"> <fmt:formatDate value="${vo.reportDate }" pattern="yyyy/MM/dd"/>  </td>
						<td align="center">${vo.analystName }</td>
						<td align="center">${vo.industryName }</td>
					</tr>
					</c:when>
				</c:choose>					
				</c:forEach>
				<tr>
					<td colspan="6" align="center" style="border: none;">
						<%--이전 --%>
						<c:if test="${paging.startPage>1 }">
						[<span style="cursor:pointer;color:blue;"
						onclick="post_to_url('r_list', {'p':'${paging.startPage-1 }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">이전</span>]  
						</c:if>
						 <%-- 페이지 번호 목록 --%>
						 <c:if test="${paging.totalCount>0 }">
						 	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
						 		<c:if test="${i==paging.currentPage }">
						 		[<span style="cursor:pointer;color:black;">${i }</span>]  
						 		</c:if>
						 		<c:if test="${i!=paging.currentPage }">
									[<span style="cursor:pointer;color:blue;" 
						 				onclick="post_to_url('r_list', {'p':'${i }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">${i }</span>]  
						 		</c:if>
						 	</c:forEach>
						 </c:if>
						 <%-- 다음 --%>
						 <c:if test="${paging.endPage<paging.totalPage }">
						 	 [<span style="cursor:pointer;color:blue;" 
						 	onclick="post_to_url('r_list', {'p':'${paging.endPage+1 }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">다음</span>] 
						 </c:if>					 
					 </td>					
				</tr>
			</c:if>
		</c:if>
		<tr>
			<td colspan="6" align="right" style="border: none;">
				<input type="button" value="등록하기"  onclick="post_to_url('r_register', {'p':'${paging.currentPage }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">
				<input type="button" value="주가입력"  onclick="post_to_url('sp_list');">
			</td>
		</tr>		
	</table>


</body>
</html>