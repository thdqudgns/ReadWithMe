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
	    
	    $("#gender").val(genderButtons[currentGender].getAttribute('data-gender'));
	}
	
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

	//정규식
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,20}$/;
	// 비밀번호 정규식
	var pwJ = /^(?=.*[a-zA-Z0-9$`~!@$!%*#^?&])(?!.*[^a-zA-Z0-9$`~!@$!%*#^?&]).{8,16}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 닉네임 정규식
	var nickJ = /^[a-zA-Z0-9가-힣]{2,12}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	
	
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		var user_id = $('#id').val();
		$.ajax({
			url : '/idCheck?id='+id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "#9F8170");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', '#9F8170');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', '#9F8170');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	
	
	
	
	

})