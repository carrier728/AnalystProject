<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
</head>
<style type="text/css">
	table {	width: 900px; margin: auto;padding: 5px; border: none; } 
    .title { font-size: 18pt; text-align: center; border: none;padding: 5px; }
    th { padding: 5px; background-color: silver; border: 1px solid gray;}
    td { padding: 5px; border: 1px solid gray;}
</style>
<body>
	<table>
		<tr>
			<td colspan="5" class="title">회원 리스트</td>
		</tr>
		<tr>
			<td colspan="5" align="right" style="border: none;">
				${paging.pageInfo }
			</td>
		</tr>			
		<tr>
			<th width="10%">번호</th>
			<th width="15%">회원명</th>
			<th width="35%">이메일</th>
			<th width="10%">회원등급</th>
			<th width="30%">가입일</th>
		</tr>
		<c:if test="${paging.totalCount==0}">
			<tr>
				<td colspan="5" align="center">
					<strong>등록된 회원이 없습니다.</strong>
				</td>
			</tr>
		</c:if>
		<c:if test="${paging.totalCount>0}">
			<c:if test="${not empty paging.lists }">
				<c:set var="no" value="${paging.totalCount - (paging.currentPage-1) * paging.pageSize }"/>
				<c:forEach var="vo" items="${paging.lists }" varStatus="vs">
					<tr onmouseover="this.style.backgroundColor='#CCCC00'" onmouseout="this.style.backgroundColor='white'">
						<td align="center">
							${no-vs.count+1 }
						</td>
						<td align="center">${vo.m_userId }</td>
						<td align="center">${vo.m_email }</td>
						<td align="center">${vo.m_lev }</td>
						<td align="center"><fmt:formatDate value="${vo.m_regDate }" pattern="YYYY-MM-dd"/></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center" style="border: none;">
					<c:if test="${paging.startPage>1 }">
					 	[<span style="cursor:pointer;color:blue;" 
					 	onclick="post_to_url('list', {'p':'${paging.startPage-1 }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">이전</span>]  				
					</c:if>
					 <%-- 페이지 번호 목록 --%>
					 <c:if test="${paging.totalCount>0 }">
					 	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
					 		<c:if test="${i==paging.currentPage }">
					 		[<span style="cursor:pointer;color:black;">${i }</span>]  
					 		</c:if>
					 		<c:if test="${i!=paging.currentPage }">
								[<span style="cursor:pointer;color:blue;" 
					 				onclick="post_to_url('list', {'p':'${i }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">${i }</span>]  
					 		</c:if>
					 	</c:forEach>
					 </c:if>
					 <%-- 다음 --%>
					 <c:if test="${paging.endPage<paging.totalPage }">
					 	 [<span style="cursor:pointer;color:blue;" 
					 	onclick="post_to_url('list', {'p':'${paging.endPage+1 }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">다음</span>] 
					 </c:if>
					</td>					
				</tr>
			</c:if>
		</c:if>
	</table>
</body>
</html>