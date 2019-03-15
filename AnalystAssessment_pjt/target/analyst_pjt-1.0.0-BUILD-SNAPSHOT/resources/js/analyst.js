
//폼 체크
	$(function(){
		$("#analystName").focus();
	});
	// 폼의 내용을 지우고 커서를 이름입력하는 곳으로 이동
	function formReset(){
		$("#analystName").val("");
		$("#firmName").val("");
		$("#industryName").val("");
		$("#analystName").focus();	
	}
	// 폼의 내용의 유효성을 검사하는 함수
	function formCheck(){
		var name = $("#analystName").val();
		if(name==null || name.trim().length==0){
			alert('애널리스트 이름을 반드시 입력해야 합니다.');
			$("#analystName").val("");
			$("#analystName").focus();
			return false;
		}
		var namevar = /^[가-힣]+$/;
		var name = $('#analystName').val();
		if(namevar.test(name)){
		} else{
			alert('애널리스트 이름을 한글로 작성해주시기 바랍니다.')
			return false;
		}
		
		if(password==null || password.trim().length==0){
			alert('소속 증권사를 반드시 입력해야 합니다.');
			$("#firmName").val("");
			$("#firmName").focus();
			return false;
		}
		var subject = $("#industryName").val();
		if(subject==null || subject.trim().length==0){
			alert('담당 분야를 반드시 입력해야 합니다.');
			$("#industryName").val("");
			$("#industryName").focus();
			return false;
		}
	}
	
	
	

	
	