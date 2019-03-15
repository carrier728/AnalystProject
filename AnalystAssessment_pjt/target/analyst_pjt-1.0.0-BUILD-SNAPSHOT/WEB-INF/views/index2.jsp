<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Analyst Assessment Project</title>
	
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
  
</head>
<body id="page-top">
	<!-- 네비게이션 -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: #383f45;">
      <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/">
        Analyst Assessment Project</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          메뉴
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">내 정보 변경</a>
            </li>
<!-- 			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false">강의<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">C언어</a></li>
					<li><a href="#">JAVA</a></li>
					<li><a href="#">안드로이드</a></li>
				</ul>
			</li>    -->         
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#portfolio">애널리스트 관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">보고서 관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#team">자유게시판</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">기타 등등</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>  
    
    <!-- Header -->
    <header class="masthead">
      <div class="container">
      <c:if test="${empty sessionScope.vo }">
        <div class="intro-text">
          <div class="intro-lead-in">Welcome!</div>
          <div class="intro-heading text-uppercase">Analyst Assessment Project</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="${pageContext.request.contextPath }/logIn">로그인 하러가기</a>
        </div>
      </c:if>
      <c:if test="${not empty sessionScope.vo }">
        <div class="intro-text">
          <div class="intro-lead-in">Hello,</div>
          <div class="intro-heading text-uppercase">${vo.m_userName }님 환영합니다!</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="${pageContext.request.contextPath }/logOut">로그아웃</a>
        </div>
      </c:if>
      </div>
    </header>
        	
<h1>
	전병
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

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; Your Website 2018</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>  
    
  <!-- Bootstrap core JavaScript -->
    <script src="resources/theme/vendor/jquery/jquery.min.js"></script>
    <script src="resources/theme/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/theme/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="resources/theme/js/jqBootstrapValidation.js"></script>
    <script src="resources/theme/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/theme/js/agency.min.js"></script>    
</body>
</html>