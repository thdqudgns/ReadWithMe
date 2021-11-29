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
				$("#bookName").html(res.documents[0].title);
				$("#bookThum").html("<img src='"+res.documents[0].thumbnail +"'/>");
			}
			, error : function() {
				console.log("ajax 책 불러오기 오류");
			}
		});
	
	 });
	
	$('#book').keydown(function (key) {
        if (key.keyCode == 13) {
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
    				$("#bookName").html(res.documents[0].title);
    				$("#bookThum").html("<img src='"+res.documents[0].thumbnail +"'/>");
    			}
    			, error : function() {
    				console.log("ajax 책 불러오기 오류");
    			}
    		});
        };
	});
	
	$("#todolistInsert").click(function() {		
		$("#toDoListWriteForm").submit();
	});
	
	$('#list_content').keydown(function (key) {
		if (key.keyCode == 13) {
			$("#toDoListWriteForm").submit();	
		};
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
    });
    
    $("#emailSend").click(function() {
    	console.log("emailSend clicked");
    	$("#toDoListForm").attr("action", "/todolist/send");
    	$("#toDoListForm").submit();
    });
    
    $("#todolistDelete").click(function() {
    	console.log("todolistDelete clicked");
    	$("#toDoListForm").attr("action", "/todolist/delete");
    	$("#toDoListForm").submit();
    });
    
});

    
    
	