<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title><sitemesh:write property='title'/></title>
	
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
    
    <sitemesh:write property='head'/>

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
              <a class="nav-link js-scroll-trigger" href="#services">회원관리</a>
            </li>
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
    <sitemesh:write property='body'/>
    
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