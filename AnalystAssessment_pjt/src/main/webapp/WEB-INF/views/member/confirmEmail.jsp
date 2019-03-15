<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
</head>
<body>
        <script type="text/javascript">
                var userEmail = '${m_email}';
                alert(userEmail + '님 회원가입을 축하합니다. 이메일 인증이 완료되었습니다. 다시 로그인을 해주시기 바랍니다.');
                window.open('', '_self', ''); // 브라우저창 닫기
                /* window.close(); // 브라우저 창 닫기 */
                self.location = '/';
        </script>
<body>  

</html>