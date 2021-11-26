$(document).ready(function() {
	
	var str = '<input type="checkbox" class="scheduleCheckbox" name="scheduleCheckbox" />';
	
	if(${empty user_no}) {
		window.alert("로그인이 필요합니다!")
		window.location.assign("<%= request.getContextPath() %>/")
	}
	
	function goWrite() {
		window.location.assign("<%= request.getContextPath() %>/schedule/write")
	}
	
	function goDelete() {
		document.getElementById("btnRight").style.display = "none";
		document.getElementById("btnRightHide").style.display = "block";
		
		var sections = document.querySelectorAll('.scheduleCheckbox');
		
		for(var i=0; i<sections.length; i++) {
			var item = sections.item(i);
			item.style.display = 'block';
		}
	}
	
	function deleteFrm() {
		document.getElementById('deleteFrm').submit();
	}
	
	$(function(){
		$("#<c:out value='<%=tenDay.get(0) %>'/>").css({
			"color": "orange",
			"font-weight": "bold"
		});
	});
	
	$(function(){
		$(".schedule a").css({
			"color": "inherit"
		});
	});
	
	$(function() {
		
		if(<%=m+1 %> == '1') {
			document.getElementById("<%=y %>0101").style.color = "red";
		}
		if(<%=m+1 %> == '2') {
		}
		if(<%=m+1 %> == '3') {
			document.getElementById("<%=y %>0301").style.color = "red";
		}
		if(<%=m+1 %> == '4') {
		}
		if(<%=m+1 %> == '5') {
			document.getElementById("<%=y %>0505").style.color = "red";
			document.getElementById("<%=y %>0519").style.color = "red";
		}
		if(<%=m+1 %> == '6') {
			document.getElementById("<%=y %>0606").style.color = "red";
		}
		if(<%=m+1 %> == '7') {
		}
		if(<%=m+1 %> == '8') {
			document.getElementById("<%=y %>0815").style.color = "red";
		}
		if(<%=m+1 %> == '9') {
		}
		if(<%=m+1 %> == '10') {
			document.getElementById("<%=y %>1003").style.color = "red";
			document.getElementById("<%=y %>1009").style.color = "red";
		}
		if(<%=m+1 %> == '11') {
		}
		if(<%=m+1 %> == '12') {
			document.getElementById("<%=y %>1225").style.color = "red";
		}
		
		
	})
	
    
});

    
    
	