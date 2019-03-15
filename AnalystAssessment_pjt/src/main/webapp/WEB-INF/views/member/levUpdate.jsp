<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등급 변경</title>
</head>
<body>
	<div class="container" style="margin-top: 10%; width: 30%;">
		<form action="levUpdateOk" method="post" id="myForm">
			<fieldset>
		    	<legend>회원등급 변경</legend>
		    <div class="form-group row"></div>
		    <div class="form-group">
		      <label for="exampleInputEmail1">회원아이디</label>
		      <input type="email" class="form-control" required="required" value="${vo2.m_userId }" disabled="disabled">
		       <input type="hidden" id="m_userId" name="m_userId" value="${vo2.m_userId }">
		    </div>    
		    <div class="form-group">
		      	<label for="exampleSelect1">회원 등급</label>
	      		<select class="form-control" id="m_lev" name="m_lev">
	      				<c:if test="${vo2.m_lev == 99 }">
	 						<option value=99 selected="selected">관리자</option>
	 						<option value=0>미인증 회원</option>
	 						<option value=1>인증 회원</option>
	 						<option value=9>탈퇴 회원 </option>
	        			</c:if>
	      				<c:if test="${vo2.m_lev == 0 }">
	 						<option value=99>관리자</option>
	 						<option value=0 selected="selected">미인증 회원</option>
	 						<option value=1>인증 회원</option>
	 						<option value=9>탈퇴 회원 </option>
	        			</c:if>
	      				<c:if test="${vo2.m_lev == 1 }">
	 						<option value=99>관리자</option>
	 						<option value=0>미인증 회원</option>
	 						<option value=1 selected="selected">인증 회원</option>
	 						<option value=9>탈퇴 회원 </option>
	        			</c:if>
	      				<c:if test="${vo2.m_lev == 9 }">
	 						<option value=99>관리자</option>
	 						<option value=0>미인증 회원</option>
	 						<option value=1>인증 회원</option>
	 						<option value=9 selected="selected">탈퇴 회원</option>
	        			</c:if>
	      		</select>
	   		</div>		        
			    <button type="submit" class="btn btn-primary">변경</button>
		  </fieldset>
		</form>
	</div> 	
</body>
</html>