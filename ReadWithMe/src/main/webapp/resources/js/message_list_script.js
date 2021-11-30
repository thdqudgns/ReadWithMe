$(document).ready(function() {
    	
	//쪽지 쓰기 버튼 누르면 이동
	$("#btnSend").click(function() {
		location.href="/mypage/message/write";
	})
    	
	//안 읽은 쪽지 버튼 누르면 이동 
	$("#btnUnread").click(function() {
		location.href="/mypage/message/unread";
	})
    	
	$("#btnKeep").click(function() {
		if( confirm("쪽지를 보관하시겠습니까?") ) {
		$("#messageList").submit();    			
//		$(location).attr("href", "/mypage/message/keep?no="+$(this).attr('value'));
		}
	})
    	
	$("#btnDelete").click(function() {
		if( confirm("쪽지를 삭제하시겠습니까?") ) {
		$("#messageList").submit();    			
//     	$(location).attr("href", "/user/mypage/message/delete?no="+$(this).attr('value'));
    	}
	})
    	
	//체크 박스
	$('.check-all').click(function(){
		$('.check').prop('checked', this.checked);
	})		
})