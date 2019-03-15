<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>이메일 인증</title>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<body onload="javascript:window_onload()"> <!-- body에 onload를 이용, 페이지 load 후 스크립트 함수를 호출-->
	<!-- 네비게이션 -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: #383f45;">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/">
        Analyst Assessment Project</a>
    </nav>
    
<div class="container" style="margin-top: 10%; width: 40%;">
	회원님의 이메일을 확인해주세요! <br>
    <script type="text/javascript">
	    function window_onload(){
	        setTimeout('go_url()',5000)  // 5초후 go_url() 함수를 호출한다.
	     }
	     function go_url(){
	        location.href="${pageContext.request.contextPath }/logOut"  // 페이지 이동...
	     }	
	</script>
	5초 뒤, 로그아웃됩니다.<br>
	이메일 인증 이후에 다시 로그인 해주시기 바랍니다.
</div>
</body>
</html>