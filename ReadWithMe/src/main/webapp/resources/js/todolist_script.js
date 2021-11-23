$(document).ready(function() {

	//책검색
	$("#bookBtn").click(function() {
		const book = $('#book').val();
		
		console.log("book:" + book);
		
		$.ajax({
			type : 'get'
			, url : 'https://dapi.kakao.com/v3/search/book?target=title'
			, data: { query : book }
			, headers : { Authorization: "KakaoAK 340845721c27a182bf54bae03bc43340" }
			, dataType: 'json'
			, success : function(res) {
				$("#bookname").val(res.documents[0].title);
				$("#bookthum").val(res.documents[0].thumbnail);
				$("#bookName").append(res.documents[0].title);
				$("#bookThum").append("<img src='"+res.documents[0].thumbnail +"'/>");
			}
			, error : function() {
				console.log("ajax 책 불러오기 오류");
			}
		});
	
	 });
	
	//전체선택
    $(":checkbox:first").click(function(){
        if( $(this).is(":checked") ){
            $(":checkbox").prop("checked", true);
        }
        else{
            $(":checkbox").prop("checked", false);
        }
            
        $(":checkbox").trigger("change");
    });
     
    $(":checkbox:not(:first)").click(function(){
        var allCnt = $(":checkbox:not(:first)").length;
        var checkedCnt = $(":checkbox:not(:first)").filter(":checked").length;
        
         
        if( allCnt==checkedCnt ){
            $("#chkAll").prop("checked", true);
        }
        else{
            $("#chkAll").prop("checked", false);
        }
    })
    
    
    
    //이메일 전송
    
    $("#emailsend").click(function() {
    	
    	const checkArr = new Array();
    	
    	$("input[name=todolistCheck]:checked").each(function() {
    		checkArr.push($(this).val()); 
    	});
    	
    	console.log("체크되어있는거 확인" + checkArr);
    	console.log("데이터 타입 확인" + jQuery.type(checkArr));
    	
    	
    	$.ajax({
			type : 'post'
			, url : '/todolist/send'
			, data: JSON.stringify(checkArr)
			, contentType: 'application/json'
//			, dataType: 'json'
			, success : function(data) {
				console.log("성공");							
				
			}, error : function() {
				console.log("실패");
			}
		});
    	
    	
    	
    });
    
});

    
    
	