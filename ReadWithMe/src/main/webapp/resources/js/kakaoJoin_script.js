$(document).ready(function() {


	//성별선택
	const GENDER_MALE = 0;
	const GENDER_FEMALE = 1;
	const GENDER_NO_SELECTED = 2;
	
	const genderButtons = document.querySelectorAll('.gender-pick');
	let currentGender = GENDER_NO_SELECTED;
	
	for (let i = 0; i < genderButtons.length; i++) {
	    genderButtons[i].addEventListener('click', () => pickGender(i));
	}

	function pickGender(genderNum) {
	    if (currentGender === genderNum) return;

	    genderButtons[currentGender].classList.remove('active');
	    genderButtons[genderNum].classList.add('active');
	    currentGender = genderNum;
	    
	}
	$("#gender").val(genderButtons[currentGender].getAttribute('data-gender'));
	
	//정규식
	
	//모든 공백 체크 정규식
	const empJ = /\s/g;
	//아이디 정규식
	const idJ = /^[a-z0-9]{4,20}$/;
	// 비밀번호 정규식
	const pwJ = /^(?=.*[a-zA-Z0-9$`~!@$!%*#^?&])(?!.*[^a-zA-Z0-9$`~!@$!%*#^?&]).{8,16}$/;
	// 이름 정규식
	const nameJ = /^[가-힣]{2,6}$/;
	// 닉네임 정규식
	const nickJ = /^[a-zA-Z0-9가-힣]{2,12}$/;
	// 이메일 검사 정규식
	const mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	
	$("#name").blur(function() {
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
		} else {
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', '#9F8170');
		}
	});
	
	
	
	$("#nick").blur(function() {
		const nick = $('#nick').val();
		$.ajax({
			type : 'get'
				, url : '/nickCheck'
				, data: {'nick': nick}
				, dataType: 'json'
				, success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data >= 1) {
					$("#nick_check").text("사용중인 닉네임입니다");
					$("#nick_check").css("color", "#9F8170");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if(nick.length < 2){
						// 0 : 아이디 길이 / 문자열 검사
						$("#nick_check").text("2글자 이상 입력하세요");
						$("#reg_submit").attr("disabled", true);
			
					} else if(!nickJ.test(nick)){
						$('#nick_check').text('닉네임은 2~12자리 가능합니다! 특수문자는 사용 불가해요 :(');
						$('#nick_check').css('color', '#9F8170');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						$('#nick_check').text("좋은 닉네임이에요! :)");
						$('#nick_check').css('color', '#9F8170');
						$("#reg_submit").attr("disabled", false);
					}
					
				}
			}, error : function() {
				console.log("실패");
			}
		});
	});

	
	

	$('#reg_submit').click(function(){

		var checkbox = $('#serviceAgree').is(":checked");
		console.log("과연" + checkbox);
		
		var date = $('#birth').val();
		console.log("생일" + date);
		console.log(date == "");

		if (nameJ.test($('#name').val())) {	
			
			if($('#birth').val() != "") {
				
				if($('#personalAgree').is(":checked") == true) {
					
					if($('#serviceAgree').is(":checked") == true ) {
						$('form').submit();								
					} else {
						alert('서비스 이용약관에 동의 해주세요!');
						return;	
					}
					
				} else {
					alert('개인정보 처리방침에 동의 해주세요!');
					return;	
				}
				
			} else {
				alert('생일을 입력 해주세요!');
				return;						
			}
			
		} else {
			alert('이름을 다시 확인해주세요!');
			return;
		}

	});
	 
	
	
})

	//관심분야 3개까지 선택
	function CountChecked(obj) {
	    var total = 0;
	    var oColl = obj.form.elements;
	    for (var i=0; i < oColl.length; i++) {
	        if (oColl[i].checked==1) total ++;
	        if (total >= 4){
	            alert('최대 3개까지 선택 가능합니다');
	            obj.checked = 0;
	            break;
	        }
	    }
	}