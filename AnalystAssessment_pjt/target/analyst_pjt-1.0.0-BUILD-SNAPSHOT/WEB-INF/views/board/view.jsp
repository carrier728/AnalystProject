<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	function deleteCheck(){
		if(confirm('삭제하시겠습니까?')){
			post_to_url('deleteOk', {'b_idx':'${vo.b_idx }','m':'0','p':'${p }','s':'${s }','b':'${b }'});		
		}
	}	
	function commentDeleteCheck(){
		if(confirm('삭제하시겠습니까?')){
			post_to_url('commentDeleteOk', {'b_idx':'${vo.b_idx }','m':'0','p':'${p }','s':'${s }','b':'${b }'});		
		}
	}	
	
	// 댓글 수정 버튼
	function commentUpdate(c_idx,m_userId,divNo){
		$("#commentForm").prop('action','commentUpdateOk');
		$("#sendBtn").val("댓글 수정");
		$("#cancelBtn").css('visibility','visible');
		$("#c_idx").val(c_idx);
		$("#m_userId").val(m_userId);
		$("#c_content").val($("#content"+divNo).text().trim());
	}
	// 댓글 삭제 버튼
	function commentDelete(c_idx,m_userId,divNo){
		$("#commentForm").prop('action','commentDeleteOk');
		$("#sendBtn").val("댓글 삭제");
		$("#cancelBtn").css('visibility','visible');
		$("#c_idx").val(c_idx);
		$("#m_userId").val(m_userId);
		$("#c_content").val($("#content"+divNo).text().trim());
	}
	// 취소 버튼
	function resetForm(){
		$("#commentForm").prop('action','commentInsertOk');
		$("#sendBtn").val("댓글 저장");
		$("#cancelBtn").css('visibility','hidden');
		$("#c_idx").val(0);
		$("#m_userId").val("");
		$("#c_content").val(""); 
	}
</script>
<style type="text/css">
	table {	width: 900px; margin: auto;padding: 5px; border: none; } 
    .title { font-size: 18pt; text-align: center; border: none;padding: 5px; }
    th { padding: 5px; background-color: silver; border: 1px solid gray;}
    td { padding: 5px; border: 1px solid gray;}
    /*
    tr:hover {  background-color: #ffff99;  }
    */
</style>
</head>
<body>
		<table>
			<tr>
				<td colspan="4" class="title">자유 게시판 내용보기</td>
			</tr>
			<tr>
				<th width="15%">이름</th>
				<td width="35%"> <c:out value="${vo.m_userId }"/> </td>
				<th width="15%">작성일</th>
				<td width="35%"><fmt:formatDate value="${vo.b_date }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			</tr>
			<tr>
				<th width="15%">공백</th>
				<td width="35%"> 공백 </td>
				<th width="15%">조회수</th>
				<td width="35%">${vo.b_hit }회 </td>
			</tr>
			<tr>
				<th width="15%">제목</th>
				<td width="35%" colspan="3">
					<c:out value="${vo.b_title }"/>
				</td>
			</tr>
			<tr>
				<th width="15%" valign="top">내용</th>
				<td width="35%" colspan="3">
					<c:set var="c" value="${vo.b_content }"/>				
					<c:set var="c" value='${fn:replace(c, "<", "&lt;") }'/>				
					<c:set var="c" value='${fn:replace(c, newLine, br) }'/>				
					${c }	
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right" style="border: none;">
					<input type="button" value="수정하기" onclick="post_to_url('update', {'b_idx':'${vo.b_idx }','m':'0','p':'${p }','s':'${s }','b':'${b }'});">					
					<input type="button" value="삭제하기" onclick="deleteCheck()">
					<input type="button" value="돌아가기" onclick="post_to_url('list', {'p':'${p }','s':'${s }','b':'${b }'});">					
				</td>
			</tr>
			<%-- 여기부터는 댓글을 처리한다. --%>
			<tr>
				<td colspan="4" style="border: none;">
					<form action="commentInsertOk" method="post" id="commentForm">
						<input type="hidden" name="c_idx" value="0" id="c_idx">  
						<input type="hidden" name="c_ref" value="${vo.b_idx }">
						<input type="hidden" name="mode" value="0">
						<input type="hidden" name="p" value="${currentPage }">
						<input type="hidden" name="s" value="${pageSize }">
						<input type="hidden" name="b" value="${blockSize }">
						<input type="text" name="m_userId" id="m_userId" placeholder="이름입력" required="required" style="width: 280px;">
						<input type="password" name="m_userPw" id="m_userPw" placeholder="암호입력" required="required" style="width: 280px;">
						<br>
						<textarea rows="3" cols="80" name="c_content" id="c_content" required="required"></textarea>
						<input type="submit" value="댓글 저장" id="sendBtn" style="height: 40px;">
						<input type="button" value="취    소" id="cancelBtn" style="height: 40px;visibility: hidden;" onclick="resetForm()">
					</form>
				</td>
			</tr>	
			<%-- 댓글 목록 --%>
			<c:if test="${empty vo.commentList }">
			<tr>
				<td colspan="4" align="center">
					등록된 댓글이 없습니다.
				</td>
			</tr>
			</c:if>
			<c:if test="${not empty vo.commentList }">
			<c:forEach var="comment" items="${vo.commentList }" varStatus="vs">
			<tr>
				<td colspan="4">
					<div style="background-color: silver;padding: 5px;">
						<c:out value="${comment.m_userId }"/> 님이
						<fmt:formatDate value="${comment.c_date }" pattern="yyyy-MM-dd hh:mm"/>에 남긴 댓글
						<input type="button" onclick="commentUpdate(${comment.c_idx},'${comment.m_userId}',${vs.count });" value="수정">
						<input type="button" onclick="commentDeleteCheck(${comment.c_idx},'${comment.m_userId }',${vs.count });" value="삭제">
					</div>
					<div style="padding: 5px;" id="content${vs.count }">
						<c:set var="cc" value="${comment.c_content }"/>
						<c:set var="cc" value="${fn:replace(cc,'<','&lt;') }"/>
						<c:set var="cc" value="${fn:replace(cc,newLine,br) }"/>
						${cc }
					</div>
				</td>
			</tr>
			</c:forEach>
		</c:if>
		</table>
</body>
</html>