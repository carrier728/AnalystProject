/*	//폼 체크
	$(function(){
		$( "#datepicker1" ).datepicker({
		    dateFormat: 'yy/mm/dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년',
		  });
	});*/
	// 폼의 내용의 유효성을 검사하는 함수
	function formCheck(){
		var date = $("#datepicker1").val();
		if(date==null || date.trim().length==0){
			alert('작성일을 반드시 입력해야 합니다.');
			$("#datepicker1").val("");
			$("#datepicker1").focus();
			return false;
		}
		var aName = $("#analystName").val();
		if(aName==null || aName.trim().length==0){
			alert('애널리스트명을 반드시 입력해야 합니다.');
			$("#analystName").val("");
			$("#analystName").focus();
			return false;
		}
		var iName = $("#exampleSelect1").val();
		if(iName==null || iName.trim().length==0){
			alert('해당 분야를 반드시 입력해야 합니다.');
			$("#exampleSelect1").val("");
			$("#exampleSelect1").focus();
			return false;
		}
		var opinion = $("#investOpinion").val();
		if(opinion==null || opinion.trim().length==0){
			alert('투자 의견을 반드시 입력해야 합니다.');
			$("#investOpinion").val("");
			$("#investOpinion").focus();
			return false;
		}
/*		var opinion = $(':input[name=investOpinion]:radio:checked').val();
        if(investOpinion){
            alert(investOpinion+"을 선택했습니다");
            return true;
        }else{
            alert("투자 의견을 선택하세요");
            return false;
        }*/
		var price = $("#currentPrice").val();
		if(price==null || price.trim().length==0){
			alert('현재가를 반드시 입력해야 합니다.');
			$("#currentPrice").val("");
			$("#currentPrice").focus();
			return false;
		}
		var targetPrice = $("#targetPrice").val();
		if(targetPrice.trim().length==0){
			$("#targetPrice").val(-1);
			return true;
		}
	};
	
	// 애널리스트 이름 정규식 표현
	var analystnamevar = /^[가-힣]+$/;
	
	// analystName이 db에 있는 지 확인
	function analystNameCheck(){
		var value = $('#analystName').val();
		if(analystnamevar.test(value)){
			if(value.trim().length>=2){
				$.ajax({
					url : "analystNameCount",
					data : "analystName="+value,
					success : function(data){
						if(data!='0'||data!=0){
							$('#anMsg').html('등록된 애널리스트입니다!').css('color','blue');
						}else{
							$('#anMsg').html('등록되지 않은 애널리스트입니다. 다시 한 번 확인해주세요').css('color','red');
						}
					} // success
				}); // ajax
			} else{
				$('#anMsg').html('ㅇㅇ');
			}
		}else{
			$('#anMsg').html('애널리스트 이름을 다시 확인해주세요').css('color','red');
			return false;
		}
	};