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
	function update(reply,content){ 
	   if($('#'+reply).css('display') == "none")
	   {
	      $('#'+reply).show();   
	      $('#'+content).css('display','none');
	   }
	   else
	   {
	      $('#'+reply).hide();      
	      $('#'+content).css('display','');
	   }
	}	
	// 댓글 수정 버튼
/* 	function commentUpdate(c_idx,m_userId,divNo){
		$("#commentForm").prop('action','commentUpdateOk');
		$("#sendBtn").val("댓글 수정");
		$("#cancelBtn").css('visibility','visible');
		$("#c_idx").val(c_idx);
		$("#m_userId").val(m_userId);
		$("#c_content").val($("#c_content"+divNo).text().trim());
	} */
	// 댓글 삭제 버튼
	function commentDeleteCheck(c_idx){
		if(confirm('댓글을 삭제하시겠습니까?')){
			post_to_url('commentDeleteOk', {'c_idx':c_idx, 'p':'${p}', 'b':'${b}', 's':'${s}'})
			/* onclick="commentDelete(${comment.c_idx},'${comment.m_userId }',${vs.count });" */
		}
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
	// 글 삭제
	function deleteCheck(){
		if(confirm('삭제하시겠습니까?')){
			post_to_url('deleteOk', {'b_idx':'${vo2.b_idx }','m':'0','p':'${p }','s':'${s }','b':'${b }'});	
		}
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
<div class="container" style="margin-top: 10%; margin-bottom: 5%; width: 60%;">
	<table class="table table-hover">
		<tr>
			<td colspan="6" class="title" style="border: none; border-bottom: 1px solid gray;">자유 게시판 내용보기</td>
		</tr>
		<tr align="center">
			<th width="15%" class="table-primary">작성자</th>
			<td width="25%"> <c:out value="${vo2.m_userId }"/> </td>
			<th width="10%" class="table-primary">작성일</th>
			<td width="20%"><fmt:formatDate value="${vo2.b_date }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			<th width="10%" class="table-primary">조회수</th>
			<td width="20%">${vo2.b_hit }회 </td>			
		</tr>
		<tr>
			<th width="15%" class="table-primary" style="text-align: center;">제목</th>
			<td width="35%" colspan="5">
				<c:out value="${vo2.b_title }"/>
			</td>
		</tr>
		<tr>
			<th width="15%" align="center" valign="middle" class="table-primary" style="text-align: center;">내용</th>
			<td width="35%" colspan="5">
				<c:set var="c" value="${vo2.b_content }"/>				
				<c:set var="c" value='${fn:replace(c, "<", "&lt;") }'/>				
				<c:set var="c" value='${fn:replace(c, newLine, br) }'/>				
				${c }	
			</td>
		</tr>
		<tr>
			<td colspan="6" align="right" style="border: none;">
				<c:if test="${svo.m_userId == vo2.m_userId}">
				<input type="button" value="수정하기" onclick="post_to_url('update', {'b_idx':'${vo2.b_idx }','m':'0','p':'${p }','s':'${s }','b':'${b }'});">					
				<input type="button" value="삭제하기" onclick="deleteCheck()">
				</c:if>					
				<input type="button" value="돌아가기" onclick="post_to_url('list', {'p':'${p }','s':'${s }','b':'${b }'});">					
			</td>
		</tr>
	</table>
	<%-- 여기부터는 댓글을 처리한다. --%>
	<%-- 댓글 쓰기 --%>
	<form action="commentInsertOk" method="post" id="commentForm">
		<input type="hidden" name=c_idx value="0" id="c_idx">
		<input type="hidden" name="c_ref" value="${vo2.b_idx }">
		<input type="hidden" name="mode" value="0">
		<input type="hidden" name="p" value="${currentPage }">
		<input type="hidden" name="s" value="${pageSize }">
		<input type="hidden" name="b" value="${blockSize }">
		<input type="hidden" name="m_userId" value="${svo.m_userId }">
		<input type="hidden" name="m_userPw" value="${svo.m_userPw }">	
	    <div class="form-group">
	      <label for="exampleTextarea">댓글쓰기</label>
	      <textarea class="form-control"  rows="3" name="c_content" id="c_content" required="required"></textarea>
	    </div>
	    <div align="right">
	    	<button type="submit" class="btn btn-outline-success" >등록하기</button>
	    	<button type="reset" id="cancelBtn" class="btn btn-outline-danger">취소하기</button>
	    </div>
    </form>
    <br>
    <%-- 댓글 목록 --%>
		<c:if test="${empty vo2.commentList }">
			<div align="center">
				등록된 댓글이 없습니다.
			</div>
		</c:if>    
		<c:if test="${not empty vo2.commentList }">
			<c:forEach var="comment" items="${vo2.commentList }" varStatus="vs">		   
				<div class="card border-primary mb-3" style="max-width: 60rem;">
					<div class="card-header"><c:out value="${comment.m_userId }"/>
						<small>&nbsp; <fmt:formatDate value="${comment.c_date }" pattern="yyyy-MM-dd hh:mm"/></small>
						<c:if test="${svo.m_userId == comment.m_userId}">
					    	<%-- <button type="button" class="btn btn-link" onclick="commentUpdate(${comment.c_idx},'${comment.m_userId }',${vs.count });">수정</button> --%>
					    	<button type="button" id="cancelBtn" class="btn btn-link" onclick="update('commentUp${comment.c_idx}','commentContent${comment.c_idx}')">수정</button>
					    	<button type="button" id="cancelBtn" class="btn btn-link" onclick="commentDeleteCheck(${comment.c_idx})">삭제</button>					
						</c:if>
					</div>
					<div class="card-body">
						<p class="card-text" id="commentContent${comment.c_idx}">	
							<c:set var="cc" value="${comment.c_content }"/>
							<c:set var="cc" value="${fn:replace(cc,'<','&lt;') }"/>
							<c:set var="cc" value="${fn:replace(cc,newLine,br) }"/>
							${cc }
						</p>
						<div id="commentUp${comment.c_idx}" style="display: none;">
							<form action="commentUpdateOk" method="post" id="commentForm">
								<input type="hidden" name=c_idx value="${comment.c_idx }" id="c_idx">
								<input type="hidden" name="c_ref" value="${vo2.b_idx }">
								<input type="hidden" name="mode" value="0">
								<input type="hidden" name="p" value="${currentPage }">
								<input type="hidden" name="s" value="${pageSize }">
								<input type="hidden" name="b" value="${blockSize }">
								<input type="hidden" name="m_userId" value="${svo.m_userId }">
								<input type="hidden" name="m_userPw" value="${svo.m_userPw }">	
							    <div class="form-group">
							      <textarea class="form-control"  rows="3" name="c_content" id="c_content" required="required">${comment.c_content}</textarea>
							    </div>
							    <div align="right">
							    	<button type="submit" class="btn btn-outline-success" >수정하기</button>
							    	<button type="reset" id="cancelBtn" class="btn btn-outline-danger">취소하기</button>
							    </div>
						    </form>							
						</div>
					</div>
				</div>	
			</c:forEach>
		</c:if> 			
	</div>
</body>
</html>