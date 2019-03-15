<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>로 그 인</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="resources/theme/login/bootstrap/css/login.min.css">
        <link rel="stylesheet" href="resources/theme/login/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/theme/login/css/form-elements.css">
        <link rel="stylesheet" href="resources/theme/login/css/style.css">
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- 없어도 되지않나? -->
<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" /> 
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> -->
<script type="text/javascript">
	// 폼 유효성 검사하기
	function formCheck() {
		if ($("#m_userId").val().length == 0) {
			alert("아이디를 입력하지 않았습니다.");
			$("#m_userId").focus();
			return false;
		}
		if ($("#m_userPw").val().length == 0) {
			alert("비밀번호를 입력하지 않았습니다.");
			$("#m_userPw").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
							<div> </div>
                            <h1><strong>로그인</strong></h1>
                            <div class="description">
                            	<p>
	                            	<br>
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>아이디, 패스워드 입력</h3>
                            		<p>Please, access your account.</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="loginOk" method="post" class="login-form" onsubmit="return formCheck();">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">회원ID</label>
			                        	<input type="text" name="m_userId" id="m_userId" placeholder="아이디를 입력해주세요." value="<% if(session.getAttribute("uid") != null) out.println(session.getAttribute("uid")); %>" class="form-username form-control">
			                        	<input type="hidden" name="url" value="${prevUrl }">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">비밀번호</label>
			                        	<input type="password" name="m_userPw" id="m_userPw" placeholder="비밀번호를 입력해주세요." class="form-password form-control">
			                        </div>
			                        <button type="submit" class="btn">로그인</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3></h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-2" href="signIn">
	                        		<i></i> 회 원 가 입
	                        	</a>
	                        	<a class="btn btn-link-2" href="findId">
	                        		<i></i> 아이디 찾기
	                        	</a>
	                        	<a class="btn btn-link-2" href="findPw">
	                        		<i></i> 비밀번호 찾기
	                        	</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="resources/theme/login/js/jquery-1.11.1.min.js"></script>
        <script src="resources/theme/login/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/theme/login/js/jquery.backstretch.min.js"></script>
        <script src="resources/theme/login/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
</body>
</html>