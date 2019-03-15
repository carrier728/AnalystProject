<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주가 입력</title>
<script type="text/javascript" src="resources/js/comm.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
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
		<legend>주가 입력</legend>
		<form action="sp_updateOk" method="post">
		<input type="hidden" name="p" value="${p }">
		<input type="hidden" name="s" value="${s }">
		<input type="hidden" name="b" value="${b }">
		<input type="hidden" name="reportNo" value="${vo.reportNo}">
		<input type="hidden" name="vo" value="${vo}">
		
		<table>
			<tr>
				<th align="right" width="20%">보고서 번호</th>
				<td style="border: none;">
				<input type="text" name="reportNo" id="reportNo" style="width:280px;" value="Report_No_${vo.reportNo }" disabled="disabled"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가 (보고서 작성일)</th>
				<td style="border: none;">
				<input type="text" name="currentPrice" id="currentPrice" style="width:280px;" value="${vo.currentPrice }" disabled="disabled"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가 (1개월 경과)</th>
				<td style="border: none;">
				<input type="text" name="after1MPrice" id="after1MPrice" style="width:280px;" value="${vo.after1MPrice }"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가 (3개월 경과)</th>
				<td style="border: none;">
				<input type="text" name="after3MPrice" id="after3MPrice" style="width:280px;" value="${vo.after3MPrice }"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가 (6개월 경과)</th>
				<td style="border: none;">
				<input type="text" name="after6MPrice" id="after6MPrice" style="width:280px;" value="${vo.after6MPrice }"></td>
			</tr>
			<tr>
				<th align="right" width="20%">주가 (1년 경과)</th>
				<td style="border: none;">
				<input type="text" name="after1YPrice" id="after1YPrice" style="width:280px;" value="${vo.after1YPrice }"></td>
			</tr>
			<tr>
				<td style="border: none;" colspan="4" align="left">
					<input type="submit"	value="수정하기" onclick="post_to_url('sp_updateOk', {'p':'${p }','s':'${s }','b':'${b }'});"> 
					<input type="reset" value="다시쓰기">
					<input type="button" value="돌아가기" onclick="post_to_url('sp_list', {'p':'${p }','s':'${s }','b':'${b }'});">
				</td>
			</tr>
		</table>	
		</form>
	</fieldset>
</body>
</html>