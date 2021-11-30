$(document).ready(function() {
    	
    //취소 버튼 누르면 뒤로가기
    $("#btnCancel").click(function() {
    	history.go(-1);
    });
    	
	$('#msg_content').on('keyup', function() {
		$('#content_cnt').html($(this).val().length+" / 500자");
     
		if($(this).val().length > 500) {
			$(this).val($(this).val().substring(0, 500));
			$('#content_cnt').html("500 / 500자");
		}
	});   
});