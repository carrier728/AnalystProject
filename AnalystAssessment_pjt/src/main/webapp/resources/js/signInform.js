var pwvar = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; // 비밀번호가 적합지 검사할 정규
var idvar = /^[0-9a-z]+$/; // 아이디가 적합한지 검사할 정규식
var emailvar = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/; // 이메일이 적합한지 검사할 정규식
var namevar = /^[가-힣a-zA-Z]+$/;
var nicknamevar = /[0-9]|[a-z]|[A-Z]|[가-힣]/;

$(function(){
        $('#m_userPw').keyup(function(){
                if(!pwvar.test($('#m_userPw').val())){
                        $('#pwMsg').html("8~16자 영문,숫자 혼합하여 사용가능 합니다.").css('color','red');
                }else{
                        $('#pwMsg').html("사용가능한 비밀번호 입니다.").css('color','green');
                }
        });
        
        $('#m_userPw2').keyup(function(){
                if($('#m_userPw').val()!=$('#m_userPw2').val()){
                        $('#pwChMsg').html("비밀번호를 확인해주세요.").css('color','red');
                }else{
                        $('#pwChMsg').html("비밀번호가 일치합니다.").css('color','green');
                }
        }); //#chpass.keyup
        
        $('#m_userName').keyup(function(){
                if(!namevar.test($('#m_userName').val())){
                        $('#nameMsg').html('한글 영문만 입력 가능합니다.').css('color','red');
                }else{
                        $('#nameMsg').html('');
                }
        });
 });
        
function userIdCheck(){
        var value = $('#m_userId').val();
        if(idvar.test(value)){
                if(value.length>=5){
                        $.ajax({
                                        url : "userIdCount",
                                        data : "m_userId="+value,
                                        success : function(data){
                                                if(data=='0' || data==0){
                                                        $('#idMsg').html('멋진 아이디네요!').css('color','green');
                                                }else{
                                                        $('#idMsg').html('이미 사용중이거나 탈퇴한 아이디입니다.').css('color','red');
                                                }
                                        } //success
                                }); // ajax
                }else{
                        $('#idMsg').html('');
                }
        }else{
                $('#idMsg').html('영문과 숫자만 사용할 수 있습니다.').css('color','red');
        }
};
        
function userEmailCheck(){
        var email = $('#m_email').val();
        if(emailvar.test(email)){
                if(email.length>=10){
                        $.ajax({
                                        url : "emailCount",
                                        data : "m_email="+email,
                                        success : function(data){
                                                if(data=='0' || data==0){
                                                        $('#emailMsg').html('사용가능한 이메일 입니다.').css('color','green');
                                                }else{
                                                        $('#emailMsg').html('이미 가입한 이메일 입니다.').css('color','red');
                                                }
                                        } //success
                                }); // ajax
                }else{
                        $('#emailMsg').html('');    
                }
        }else{
                $('#emailMsg').html('이메일 주소를 다시 확인해주세요').css('color','red');
        }
};


function formCheck(){
    if(!idvar.test($('#m_userId').val())){
        alert('아이디를 확인해주세요.');
        $('#m_userId').val('');
        $('#m_userId').focus();
        return false;
    }
    if(!pwvar.test($('#m_userPw').val())){
        alert('비밀번호를 확인해주세요.');
        $('#m_userPw').val('');
        $('#m_userPw').focus();
        return false;
    }
    if($('#m_userPw').val()!=$('#m_userPw2').val()){
        alert('비밀번호가 다릅니다.');
        $('#m_userPw2').val('');
        $('#m_userPw2').focus();
        return false;
    }
    if(!namevar.test($('#m_userName').val())){
        alert('이름을 확인해주세요.');
        $('#m_userName').val('');
        $('#m_userName').focus();
        return false;
    }
    if(!emailvar.test($('#m_email').val())){
        alert('이메일을 확인해주세요.');
        $('#m_email').focus();
        return false;
    }
	if($("#idMsg").text()==="이미 사용중이거나 탈퇴한 아이디입니다."){
		alert("이미 사용중이거나 탈퇴한 아이디입니다.");
		return false;
	}
	if($("#emailMsg").text()==="이미 가입한 이메일 입니다."){
		alert("이미 가입한 이메일 입니다.");
		return false;
	}
    return true;
}
function formCheck2(){
	if(!pwvar.test($('#m_userPw').val())){
		alert('새로운 비밀번호를 확인해주세요.');
		$('#m_userPw').val('');
		$('#m_userPw').focus();
		return false;
	}else if($('#m_userPw').val()!=$('#m_userPw2').val()){
		alert('새로운 비밀번호가 일치하지 않습니다..');
		$('#m_userPw2').val('');
		$('#m_userPw2').focus();
		return false;
	}else if($("#currentPw").val()!==$("#pw").val()){
		alert("이전 비밀번호를 확인해주세요.");
		$("#currentPw").val("");
		$("#currentPw").focus();
		return false;
	}
	return true;
}

function passwordCheck(){
	if(!pwvar.test($('#m_userPw').val())){
		alert('비밀번호를 확인해주세요.');
		$('#m_userPw').val('');
		$('#m_userPw').focus();
		return false;
	}else if($('#m_userPw').val()!=$('#m_userPw2').val()){
		alert('비밀번호가 다릅니다.');
		$('#m_userPw2').val('');
		$('#m_userPw2').focus();
		return false;
	}
	return true;
}
