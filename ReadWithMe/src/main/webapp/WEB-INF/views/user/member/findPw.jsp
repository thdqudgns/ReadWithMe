<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
		$('#byPhone').hide();
		
	$('input[type="radio"]').click(function(){
		console.log("radio clicked");
		
		if($(this).val() == 'email'){
			email();
		}
		else{
			phone();
		}
	});
	
	function email(){
		$('#byEmail').show();
		$('#byPhone').hide();
	}
		
	function phone(){
		$('#byPhone').show();
		$('#byEmail').hide();
	}
		
});
</script>


<h1>비밀번호 재설정</h1>
임시 비밀번호를 수신할 이메일 주소 혹은 핸드폰번호와 아이디를 입력하세요 <br>
<input type="radio" name="findPw" value="email" checked="checked">이메일주소
<input type="radio" name="findPw" value="phone">핸드폰번호
<br>

<form action="/find/pw" method="post">
<input type="text" id="byEmail" name="email" placeholder="ex)aaaa@naver.com">
<input type="text" id="byPhone" name="phone" placeholder="-를 제외한 핸드폰 번호를 입력하세요">
<input type="text" name="id" placeholder="아이디를 입력하세요">

<a href="/login"><button type="button">취소</button></a>
<button>발송</button>
</form>




<c:import url="/WEB-INF/views/user/layout/footer.jsp" />