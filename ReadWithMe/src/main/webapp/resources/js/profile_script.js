$(document).ready(function() {

	$("#upload").change(function( e ) {
		
		var files = e.target.files;
		
		//이미지만 처리할 수 있도록 적용
		if( !files[0].type.includes("image") ) {
			alert("이미지가 아닙니다")
			
			e.target.value = null;
						
			return false;
		}
		
		var reader = new FileReader();
		
		reader.onload = function( e ) {
			console.log( e )
			console.log( e.target.result )
			
			$("#preview").html(
					$("<img>").attr({
						"src": e.target.result
						, "width" : 200
						, "height" : 200
						, "style" : "border-radius: 50%"
						}))			
		};
		reader.readAsDataURL( files[0] )		
	});
	
	

	const GENDER_MALE = 0;
	const GENDER_FEMALE = 1;
	const GENDER_NO_SELECTED = 2;
	
	const GENDER_A = 'A';
	const GENDER_F = 'F';
	const GENDER_M = 'M';
	
	const SELECTED_USER_GENDER = $('#userGender').val();
	
	const genderButtons = document.querySelectorAll('.gender-pick');
	var currentGender = GENDER_NO_SELECTED;
	
	if(SELECTED_USER_GENDER == GENDER_A) {
		currentGender = GENDER_NO_SELECTED;
	} else if (SELECTED_USER_GENDER == GENDER_F) {
		currentGender = GENDER_FEMALE;		
	} else if (SELECTED_USER_GENDER == GENDER_M) {
		currentGender = GENDER_MALE;		
	}
	
	genderButtons[currentGender].classList.add('active');
	console.log("gender이에용" + genderButtons[currentGender].getAttribute('data-gender'));
	
	for (let i = 0; i < genderButtons.length; i++) {
	    genderButtons[i].addEventListener('click', () => pickGender(i));
	}
	$("#gender").val(genderButtons[currentGender].getAttribute('data-gender'));

	function pickGender(genderNum) {
	    if (currentGender === genderNum) return;

	    genderButtons[currentGender].classList.remove('active');
	    genderButtons[genderNum].classList.add('active');
	    currentGender = genderNum;
	    
	    console.log("gender에용" + genderButtons[currentGender].getAttribute('data-gender'));
	    $("#gender").val(genderButtons[currentGender].getAttribute('data-gender'));
	}
	
	
	//지역 선택
	
	const USER_SELETED_LOCATION = $('#userLocation').val();
	console.log("USER_SELETED_LOCATION" + USER_SELETED_LOCATION);
	
	$("#locagtionSelectBox option").filter(function() {
		return this.text == USER_SELETED_LOCATION;}).prop('selected', 'selected');
	
	//관심분야 선택

	const SELECTED_USER_INTEREST = 
		"input:checkbox[id=\"" + $('#userInterest').val() + "\"]";
	const SELECTED_USER_INTEREST2 = 
		"input:checkbox[id=\"" + $('#userInterest2').val() + "\"]";
	const SELECTED_USER_INTEREST3 = 
		"input:checkbox[id=\"" + $('#userInterest3').val() + "\"]";
		
	$(SELECTED_USER_INTEREST).prop("checked" , true);
	$(SELECTED_USER_INTEREST2).prop("checked" , true);
	$(SELECTED_USER_INTEREST3).prop("checked" , true);
	
	
	//정규식
	
	//모든 공백 체크 정규식
	const empJ = /\s/g;
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

	$("#email").blur(function() {
		const email = $('#email').val();
		$.ajax({
			type : 'get'
				, url : '/emailCheck'
					, data: {'email': email}
		, dataType: 'json'
			, success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data >= 1) {
					$("#email_check").text("사용중인 이메일입니다");
					$("#email_check").css("color", "#9F8170");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if(!mailJ.test(email)){
						$('#email_check').text('이메일 형식에 맞게 작성 해주세요! ex)aaaa@gmail.com');
						$('#email_check').css('color', '#9F8170');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						$('#email_check').text("사용할 수 있는 이메일 입니다!");
						$('#email_check').css('color', '#9F8170');
						$("#reg_submit").attr("disabled", false);
					}
					
				}
			}, error : function() {
				console.log("실패");
			}
		});
		
	});
	
	$('#reg_submit').click(function(){
		alert("프로필을 변경하시겠습니까?");
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