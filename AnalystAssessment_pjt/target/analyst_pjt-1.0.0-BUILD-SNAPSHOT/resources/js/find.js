// 이메일 체크하기
function formCheck() {
	if ($("#m_email").val().length == 0) {
		alert("이메일을 입력하지 않았습니다.");
		$("#m_email").focus();
		return false;
	}
	return true;
}

//아이디가 적합한지 검사할 정규식
var idvar = /^[0-9a-z]+$/; 
// 이메일이 적합한지 검사할 정규식
var emailvar = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

// 아이디가 db에 있는 지 확인
function userIdCheck(){
	var value = $('#m_userId').val();
	if(idvar.test(value)){
		if(value.length>=5){
			$.ajax({
				url : "userIdCount",
				data : "m_userId="+value,
				success : function(data){
					if(data!='0'||data!=0){
						$('#idMsg').html('확인 가능한 회원 아이디입니다.').css('color','blue');
					}else{
						$('#idMsg').html('해당 아이디로 가입한 회원정보가 없습니다.').css('color','red');
					}
				} // success
			}); // ajax
		} else{
			$('#idMsg').html('');
		}
	}else{
		$('#idMsg').html('회원 아이디를 다시 확인해주세요').css('color','red');
		return false;
	}
};
// 이메일이 db에 있는 지 확인
function emailCheck(){
	var email = $('#m_email').val();
	if(emailvar.test(email)){
		if(email.length>=10){
			$.ajax({
				url : "emailCount",
				data : "m_email="+email,
				success : function(data){
					if(data!='0'||data!=0){
						$('#emailMsg').html('확인 가능한 회원 아이디가 있습니다.').css('color','blue');
					}else{
						$('#emailMsg').html('해당 이메일로 가입한 회원정보가 없습니다.').css('color','red');
					}
				} // success
			}); // ajax
		} else{
			$('#emailMsg').html('');
		}
	}else{
		$('#emailMsg').html('이메일 주소를 다시 확인해주세요').css('color','red');
		return false;
	}
};