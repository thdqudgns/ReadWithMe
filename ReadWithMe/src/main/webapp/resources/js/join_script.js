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
	
	
	
	
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#id").blur(function() {
		const user_id = $('#id').val();
		
		$.ajax({
			type : 'get'
			, url : '/idCheck'
			, data: {'id': user_id}
			, dataType: 'json'
			, success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data >= 1) {
						console.log("중복!");
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "#9F8170");
						$("#reg_submit").attr("disabled", true);
					} else {
						console.log("중복 아님!" + user_id);
						if(user_id.length < 4){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("4글자 이상 입력하세요");
							$("#reg_submit").attr("disabled", true);
				
						} else if(!idJ.test(user_id)){
							$('#id_check').text('아이디는 소문자와 숫자 4~20자리만 가능합니다');
							$('#id_check').css('color', '#9F8170');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							$('#id_check').text("좋은 아이디에요! :)");
							$('#id_check').css('color', '#9F8170');
							$("#reg_submit").attr("disabled", false);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	$('#password').blur(function() {
		if (pwJ.test($('#password').val())) {
			console.log('true');
			$('#pw_check').text('안전한 비밀번호입니다!');
		} else {
			console.log('false');
			$('#pw_check').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
			$('#pw_check').css('color', '#9F8170');
		}
	});
	
	$('#password2').blur(function() {
		if ($('#password').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
			$('#pw2_check').css('color', '#9F8170');
		} else {
			console.log('true');
			$('#pw2_check').text('비밀번호가 일치합니다!');
		}
	});
	
	
	
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

	
	
	var inval_Arr = new Array(5).fill(false);
	$('#reg_submit').click(function(){
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#password').val() == ($('#password2').val()))
				&& pwJ.test($('#password').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
		}
		// 이메일 정규식
		if (mailJ.test($('#email').val())){
			console.log(phoneJ.test($('#email').val()));
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
		}
		
		// 이름 정규식
		if (nameJ.test($('#name').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
		}

		
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll){ // 유효성 모두 통과
			alert('이메일에서 인증 메일을 확인해주세요!');
			/* confirm_email(); */
			/* location.href("${pageContext.request.contextPath}"); */
			/* return false; */
		} else{
			alert('입력한 정보들을 다시 한번 확인해주세요 :)')
			return false;
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