<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="javascript:window_onload()"> <!-- body에 onload를 이용, 페이지 load 후 스크립트 함수를 호출-->
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
</body>
</html>