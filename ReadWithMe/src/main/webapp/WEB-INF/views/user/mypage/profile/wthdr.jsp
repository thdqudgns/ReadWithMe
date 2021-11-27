<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$("#btn_submit").attr("disabled", true);
				
	$('#wthdrInfo').click(function(){
		if ( $(this).prop('checked') ) {
		$("#btn_submit").attr("disabled", false);
		} else {
	$("#btn_submit").attr("disabled", true);
		}
	});
		
	
});
</script>

<h1>탈퇴 안내</h1>
회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요 <br>

<form action="/mypage/wthdr" method="post">
회원정보는 탈퇴 시 관련법령에 따라 보관 의무가 있는 경우를 제외하고는 즉시 삭제됩니다.<br>
탈퇴 이후에는 어떠한 방법으로도 삭제된 회원정보를 복원할 수 없습니다.


<input type="checkbox" name="wthdrInfo" id="wthdrInfo">안내 사항을 모두 확인하였으며, 이에 동의합니다

<button id="btn_submit">확인</button>
</form>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />