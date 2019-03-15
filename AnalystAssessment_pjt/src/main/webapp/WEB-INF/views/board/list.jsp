<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
<style type="text/css">
	table {	width: 1200px; margin: auto;padding: 5px; border: none; } 
    .title { font-size: 18pt; text-align: center; border: none;padding: 5px; }
    th { padding: 5px; background-color: silver; border: 1px solid gray;}
    td { padding: 5px; border: 1px solid gray;}
    /*
    tr:hover {  background-color: #ffff99;  }
    */
</style>
</head>
<body>
<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 60%;">
	<table class="table table-hover">
		<tr>
			<td colspan="5" class="title" style="border: none;">자유게시판</td>
		</tr>
		<tr>
			<td colspan="5" align="right" style="border: none;">
				${paging.pageInfo }
			</td>
		</tr>
		<tr class="table-primary" align="center">
			<th scope="row">번호</th>
			<th width="65%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${paging.totalCount==0}">
			<tr>
				<td colspan="5" align="center">
					<strong>등록된 글이 없습니다.</strong>
				</td>
			</tr>
		</c:if>	
		<c:if test="${paging.totalCount>0}">
			<c:if test="${not empty paging.lists }">
				<c:set var="no" value="${paging.totalCount - (paging.currentPage-1) * paging.pageSize }"/>
				<c:forEach var="vo2" items="${paging.lists }" varStatus="vs">
					<tr>
						<td align="center">
							${no-vs.count+1 }
						</td>
						<td>
							<%-- GET방식으로 뷰로 이동
							<c:url var="url" value="view">
								<c:param name="p" value="${paging.currentPage }"/>
								<c:param name="s" value="${paging.pageSize }"/>
								<c:param name="b" value="${paging.blockSize }"/>
								<c:param name="idx" value="${vo.idx }"/>
								<c:param name="mode" value="1"/>
							</c:url>
							<a href="${url }"><c:out value="${vo.subject }"/></a>
							 --%>
							 <span style="cursor: pointer;" onclick="post_to_url('view', {'b_idx':'${vo2.b_idx }','p':'${paging.currentPage }','s':'${paging.pageSize }','b':'${paging.blockSize }','m':'1'});">
							 	<c:out value="${vo2.b_title }"/>
							 </span>
							<c:if test="${vo2.commentCount>0 }">
								- (${vo2.commentCount })
							</c:if>
						</td>
						<td align="center">${vo2.m_userId }</td>
						<td align="center"><fmt:formatDate value="${vo2.b_date }" pattern="MM-dd"/></td>
						<td align="center">${vo2.b_hit }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center" style="border: none;">
						<%--
						 ${paging.pageList }
						 --%>
						 <%-- 이전 --%>
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
		<tr>
			<td colspan="5" align="right" style="border: none;">
				<input type="button" value="글쓰기"  onclick="post_to_url('write', {'p':'${paging.currentPage }','s':'${paging.pageSize }','b':'${paging.blockSize }'});">
			</td>
		</tr>
	</table>	
</div>
</body>
</html>