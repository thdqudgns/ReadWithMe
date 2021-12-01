$(document).ready(function() {

	
	
	//회원관리 전체선택
    $("input[name='memberCheck']:first").click(function(){
        if( $(this).is(":checked") ){
            $("input[name='memberCheck']").prop("checked", true);
        }
        else{
            $("input[name='memberCheck']").prop("checked", false);
        }
            
        $("input[name='memberCheck']").trigger("change");
    });
     
    $("input[name='memberCheck']:not(:first)").click(function(){
        var allCnt = $("input[name='memberCheck']:not(:first)").length;
        var checkedCnt = $("input[name='memberCheck']:not(:first)").filter(":checked").length;
        
         
        if( allCnt==checkedCnt ){
            $("#chkAll").prop("checked", true);
        }
        else{
            $("#chkAll").prop("checked", false);
        }
    });
    
    //제재회원관리 전체선택
    $("input[name='banMemberCheck']:first").click(function(){
    	if( $(this).is(":checked") ){
    		$("input[name='banMemberCheck']").prop("checked", true);
    	}
    	else{
    		$("input[name='banMemberCheck']").prop("checked", false);
    	}
    	
    	$("input[name='banMemberCheck']").trigger("change");
    });
    
    $("input[name='banMemberCheck']:not(:first)").click(function(){
    	var allCnt = $("input[name='banMemberCheck']:not(:first)").length;
    	var checkedCnt = $("input[name='banMemberCheck']:not(:first)").filter(":checked").length;
    	
    	
    	if( allCnt==checkedCnt ){
    		$("#banChkAll").prop("checked", true);
    	}
    	else{
    		$("#banChkAll").prop("checked", false);
    	}
    });
    
    //----------------------------------------
    
    
    $("#seachMember").click(function() {
    	console.log("seachMember clicked");
    	location.href="/admin/member?search="+$("#search").val()+"&select="+$("#selectBox option:selected").val();
    });
    
    
    
    
	$(".setAdminBtn").click(function(){
		console.log("setAdminBtn clicked");
		var Admin = $("#admin").val();

		if( Admin == 2 ){
			alert("권한이 없습니다");
			return
		} else{
			$(this).parent().prev('form').submit();
		}
	});

	
	$(".delAdminBtn").click(function(){
		console.log("delAdminBtn clicked");
		var Admin = $("#admin").val();
		if( Admin == 2 ){
			alert("권한이 없습니다");
			return
		} else{
			$(this).parent().prev('form').submit();
		}
	});
	
	$("#banMemberBtn").click(function() {
		console.log("banMember clicked");
		
			var chk_arr =[];
			
			$("input[name='banMemberCheck']:checked").each(function(){
				var chk=$(this).val();
				chk_arr.push(chk);
			});
			
		console.log("과연" + chk_arr);
		
    	$("#banForm").attr("action", "/admin/ban");
    	$("#banForm").submit();
					
	});
	
	
	$("#deleteBanMemberBtn").click(function() {
		console.log("deleteBanMemberBtn clicked");
		
		var chk_arr =[];
		
		$("input[name='banMemberCheck']:checked").each(function(){
			var chk=$(this).val();
			chk_arr.push(chk);
		});
		
		console.log("과연" + chk_arr);
		
		$("#banForm").attr("action", "/admin/banDelete");
		$("#banForm").submit();
	});
	
	$("#banMemberBtn1").click(function() {
		console.log("banMember1 clicked");
		
		var chk_arr =[];
		
		$("input[name='memberCheck']:checked").each(function(){
			var chk=$(this).val();
			chk_arr.push(chk);
		});
		
		console.log("과연" + chk_arr);
		
		$("#banForm1").attr("action", "/admin/ban");
		$("#banForm1").submit();
		
	});
	
	
	$("#deleteBanMemberBtn1").click(function() {
		console.log("deleteBanMemberBtn1 clicked");
		
		var chk_arr =[];
		
		$("input[name='memberCheck']:checked").each(function(){
			var chk=$(this).val();
			chk_arr.push(chk);
		});
		
		console.log("과연" + chk_arr);
		
		$("#banForm1").attr("action", "/admin/banDelete");
		$("#banForm1").submit();
	});
		
	
	
	
	$(document).ready(function(){
		$('#banMemberTable').hide();
			
		$('input[type="radio"]').click(function(){
			console.log("radio clicked");
			
			if($(this).val() == 'member'){
				member();
			}
			else{
				banMember();
			}
		});
		
		function member(){
			$('#memberTable').show();
			$('#banMemberTable').hide();
		}
			
		function banMember(){
			$('#banMemberTable').show();
			$('#memberTable').hide();
		}
			
	});
	
	
	
	$("#approvalBtn").click(function() {
		console.log("deleteBanMemberBtn1 clicked");
		
		var chk_arr =[];
		
		$("input[name='memberCheck']:checked").each(function(){
			var chk=$(this).val();
			chk_arr.push(chk);
		});
		
		console.log("과연" + chk_arr);
		
		$("#banForm1").attr("action", "/admin/meetingApproval");
		$("#banForm1").submit();
	});
		
	$("#deleteBtn").click(function() {
		console.log("deleteBanMemberBtn1 clicked");
		
		var chk_arr =[];
		
		$("input[name='memberCheck']:checked").each(function(){
			var chk=$(this).val();
			chk_arr.push(chk);
		});
		
		console.log("과연" + chk_arr);
		
		$("#banForm1").attr("action", "/admin/meetingDelete");
		$("#banForm1").submit();
	});
		

	
});

    
    
	