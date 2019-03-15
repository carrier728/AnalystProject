<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>아이디 찾기</title>
	
	<!-- Bootstrap core CSS -->
    <link href="resources/theme/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- 폰트 -->
    <link href="resources/theme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- 템플릿 스타일 -->
    <link href="resources/theme/css/agency.css" rel="stylesheet">  
    
    <!-- flatly 테마 -->
	<link rel="stylesheet" href="resources/theme/signin/css/bootstrap.css">
	
	<!-- 주로 쓰는 스크립트들 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resources/js/comm.js"></script>
</head>
<body>
	<!-- 네비게이션 -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: #383f45;">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/">
        Analyst Assessment Project</a>
        <c:if test="${not empty sessionScope.svo }">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          메뉴
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="dropdown">
              <a class="nav-link js-scroll-trigger" href="#services" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false">내 정보 변경<span	class="caret"></span></a>
				<ul class="dropdown-menu">
					<li style="color: black "><a href="${pageContext.request.contextPath }/updateMember">회원정보 수정</a></li>
					<li><a href="${pageContext.request.contextPath }/updatePw">비밀번호 변경</a></li>
					<li><a href="${pageContext.request.contextPath }/memberOut">회원탈퇴</a></li>
				</ul>            
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/a_list">애널리스트 관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/r_list">보고서 관리</a>
            </li>
            <li class="nav-item">ㅌ
              <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/server">자유게시판</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/alertPrice_list">주가입력 알림</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/assess_list">애널리스트 평가</a>
            </li>
          </ul>
        </div>
        </c:if>
    </nav>
	<div class="container" style="margin-top: 10%; width: 20%;">
		<span style="width: 100%;">
		회원님의 아이디는 "${member.m_userId}" 입니다. 
		</span>
		<div style="margin-top: 15px;width: 100%;">
		<button type="button" style="max-width:100px;width: 50%;" class="btn btn-primary" onclick="location.href='logIn'">로그인<br>하러가기</button>
		<button type="button" style="max-width:100px;width: 50%;" class="btn btn-primary" onclick="location.href='findPw'">비밀번호<br>찾기</button>
		</div>
	</div>
    <script src="resources/theme/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/theme/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="resources/theme/js/jqBootstrapValidation.js"></script>
    <script src="resources/theme/js/contact_me.js"></script>

</body>
</html>