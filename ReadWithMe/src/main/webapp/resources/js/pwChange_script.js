$(document).ready(function() {

	// 비밀번호 정규식
	const pwJ = /^(?=.*[a-zA-Z0-9$`~!@$!%*#^?&])(?!.*[^a-zA-Z0-9$`~!@$!%*#^?&]).{8,16}$/;
	$("#reg_submit").attr("disabled", true);				
	
	
	$("#prsntPw").blur(function() {
		const prsntPw = $('#prsntPw').val();
		
		$.ajax({
			type : 'get'
			, url : '/pwCheck'
			, data: {'prsntPw': prsntPw}
			, dataType: 'json'
			, success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);						
				
				if (data >= 1) {
						$("#reg_submit").attr("disabled", false);
						$('#pw1_check').text('');
					} else {
						$('#pw1_check').text('비밀번호가 일치하지 않습니다 :(');
						$("#reg_submit").attr("disabled", true);				
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
	$('#password2').blur(function() {
	
		const password = $('#password').val();
		
		$.ajax({
			type : 'get'
			, url : '/pwCheck1'
			, data: {'password': password}
			, dataType: 'json'
			, success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);			
				
				if (data >= 1) {
						$("#pw2_check").text("기존과 같은 비밀번호 입니다.");
						$("#pw2_check").css("color", "#9F8170");
						$("#reg_submit").attr("disabled", true);
					} else {
						if (pwJ.test($('#password').val())) {
							console.log('true');
								if ($('#password').val() != $('#password2').val()) {
									$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
									$('#pw2_check').css('color', '#9F8170');
									$("#reg_submit").attr("disabled", true);
								} else {
									console.log('true');
									$('#pw2_check').text('비밀번호가 일치합니다!');
									$("#reg_submit").attr("disabled", false);
								}
						} else {
							console.log('false');
							$('#pw2_check').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
							$('#pw2_check').css('color', '#9F8170');
							$("#reg_submit").attr("disabled", true);
						}					
					}
				}
			, error : function() {
					console.log("실패");
				}
			});
			
		});
	
	$('#reg_submit').click(function(){


		if (($('#password').val() == ($('#password2').val()))
				&& pwJ.test($('#password').val())) {
			$('form').submit();				
		} else {
			console.log("바부");
			alert('비밀번호가 일치하지 않거나 형식에 맞지 않습니다.');
			return;
		}
		

	});
		
		
});

