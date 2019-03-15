<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애널리스트 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script type="text/javascript">
	$(function(){
	});
	function deleteCheck(){
		if(confirm('삭제하시겠습니까?')){
			post_to_url('a_deleteOk', {'analystCode':'${vo.analystCode }','m':'0','p':'${p }','s':'${s }','b':'${b }'});
		}
	}
</script>
<style type="text/css">
	table { width: 700px; margin: auto;padding: 5px; border: none; } 
    .title { font-size: 18pt; text-align: center; border: none;padding: 5px; }
    th { padding: 5px; background-color: silver; border: 1px solid gray;}
    td { padding: 5px; border: 1px solid gray;}
</style>
</head>
<body>
		<table class="table table-hover">
			<tr>
				<td colspan="5" class="title" style="border: none;">애널리스트 정보</td>
			</tr>
			<tr>
				<td colspan="5" align="right" style="border: none;">
					${paging.pageInfo }
				</td>
			</tr>
			<tr align="center" class="table-primary">
				<th>애널리스트명</th>
				<th>소속 증권사</th>
				<th>담당 분야</th>
			</tr>
			<tr>
				<td align="center">${vo.analystName }</td>
				<td align="center">${vo.firmName }</td>
				<td align="center">${vo.industryName }</td>
			</tr>
			<tr>
				<td colspan="4" align="right" style="border: none;">
					<input type="button" value="수정하기" onclick="post_to_url('a_update', {'analystCode':'${vo.analystCode }','m':'0','p':'${p }','s':'${s }','b':'${b }'});">					
					<input type="button" value="삭제하기" onclick="deleteCheck()">					
					<input type="button" value="돌아가기" onclick="post_to_url('a_list', {'p':'${p }','s':'${s }','b':'${b }'});">					
				</td>
			</tr>
		</table>
	
</body>
</html>