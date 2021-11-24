$(document).ready(function() {

	
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
    
    $("#seachMember").click(function() {
    	console.log("seachMember clicked");
    	location.href="/admin/member?search="+$("#search").val()+"&select="+$("#selectBox option:selected").val();
    });
    
    $("#prmsnAdmin").click(function() {
    	console.log("prmsnAdmin clicked");
    	$("#adminMemberForm").attr("action", "/admin/prmsnadmin");
    	$("#adminMemberForm").submit();
    });
    
    $("#banMember").click(function() {
    	console.log("banMember clicked");
    	$("#adminMemberForm").attr("action", "/admin/ban");
    	$("#adminMemberForm").submit();
    });
});

    
    
	