<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<hr>
<c:if test="${empty sessionScope.vo }">
	<a href="${pageContext.request.contextPath }/logIn">로그인</a><br/>
	<a href="${pageContext.request.contextPath }/server">게시판</a><br/>
	<a href="${pageContext.request.contextPath }/a_list">애널리스트 목록</a><br/>
	<a href="${pageContext.request.contextPath }/r_list">보고서 목록</a><br/>
	<a href="${pageContext.request.contextPath }/alertPrice_list">주가 입력 알림</a><br/>
	<a href="${pageContext.request.contextPath }/assess_list">애널리스트 평가</a><br/>
	<a href="${pageContext.request.contextPath }/memberList">회원 조회</a><br/>
</c:if>
<c:if test="${vo.m_lev==0 }">
	이메일 인증 후에 서비스 이용이 가능합니다.<br>
	<a href="${pageContext.request.contextPath }/verifyEmail">이메일 인증하러 가기</a><br>
	<a href="${pageContext.request.contextPath }/withdrawalMember">회원탈퇴</a><br>
	<a href="${pageContext.request.contextPath }/logOut">로그아웃</a><br/>
</c:if>
<c:if test="${vo.m_lev==1 }">
	<a href="${pageContext.request.contextPath }/updateMember">회원정보 수정</a><br/>
	<a href="${pageContext.request.contextPath }/updatePw">비밀번호 변경</a><br/>
	<a href="${pageContext.request.contextPath }/logOut">로그아웃</a><br/>
	<a href="${pageContext.request.contextPath }/withdrawalMember">회원탈퇴</a><br>
	<a href="${pageContext.request.contextPath }/server">게시판</a><br/>
	<a href="${pageContext.request.contextPath }/a_list">애널리스트 목록</a><br/>
	<a href="${pageContext.request.contextPath }/r_list">보고서 목록</a><br/>
	<a href="${pageContext.request.contextPath }/alertPrice_list">주가 입력 알림</a><br/>
	<a href="${pageContext.request.contextPath }/assess_list">애널리스트 평가</a><br/>
</c:if>
<c:if test="${vo.m_lev==99 }">
	탈퇴한 회원입니다.<br>
	서비스 이용을 계속적으로 원하시면 아래의 번호로 연락시기 바랍니다.<br>
	고객 문의 전화 번호 : 02-000-0000
</c:if>
<c:out value="${vo }"></c:out>
<c:out value="${m_userId }"></c:out>
<%-- <input type="hidden" name="m_userId" id="m_userId" value="${vo.m_userId }"> --%>
<hr>
로그인을 해주세요!
${m}
</body>
</html>