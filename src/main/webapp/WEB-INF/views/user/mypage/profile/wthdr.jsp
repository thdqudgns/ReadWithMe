<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$("#btn_submit").click(function(){
		if ( $('#wthdrInfo').prop('checked') ) {			
			$('form').submit();
		} else {	
			alert('동의를 체크하셔야 회원탈퇴가 가능합니다');				
		}

	});		
	
	$('#wthdrInfo').click(function(){
		if ( $('#wthdrInfo').prop('checked') ) {
		$("#btn_submit").attr("disabled", false);
		} else {
	$("#btn_submit").attr("disabled", true);
		}
	});
		
	
});
</script>

<link href="/resources/css/profileOther.css" rel="stylesheet">

<section>
<h1>탈퇴 안내</h1>
<p style="text-align: center;">회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요 </p>

<form action="/mypage/wthdr" method="post">
<div id="wthdrGuide">
회원정보는 탈퇴 시 관련법령에 따라 보관 의무가 있는 경우를 제외하고는 즉시 삭제됩니다.<br>
탈퇴 이후에는 어떠한 방법으로도 삭제된 회원정보를 복원할 수 없습니다.
</div>


<div style="text-align: center;">
<input type="checkbox" name="wthdrInfo" class="wthdrInfo" id="wthdrInfo"> 
<label for="wthdrInfo"><span></span> 안내 사항을 모두 확인하였으며, 이에 동의합니다 </label><br>
</div>

<div id="checkBtns" style="text-align: center;">
<button id="btn_submit" type="button" class="checkBtn" style="width: 90px; text-align: center; background-color: #9f8170; color: #fff;">확인</button>
</div>
</form>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />