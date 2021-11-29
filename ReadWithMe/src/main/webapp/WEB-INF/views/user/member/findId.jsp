<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<link href="/resources/css/findUser.css" rel="stylesheet">
<style type="text/css">
input[type="radio"] {
    display:none;
}

input[type="radio"] + label span {
	display:inline-block;
	width: 22px;height: 22px;
	margin: -2px 9px 0 4px;
	font-size: 0;
	vertical-align: middle;
    background:url('../resources/img/radio_brn.png')  no-repeat;
    cursor:pointer;
}
input[type="radio"]:checked + label span {
    background:url('../resources/img/radio_brn_slc.png') no-repeat;
}
</style>


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

<section>
<h1>아이디 찾기</h1>
가입하셨을 때 사용했던 이메일 주소 <br>
혹은 핸드폰 번호를 입력하세요 <br>

<div id="checkArea">
<input type="radio" name="findPw" value="email" checked="checked" id="emailArea">     
<label for="emailArea"><span></span>이메일주소 &nbsp&nbsp&nbsp</label>
<input type="radio" name="findPw" value="phone" id="phoneArea">
<label for="phoneArea"><span></span>핸드폰번호</label>
<br>
</div>

<div id="formArea">
<form action="/find/id" method="post">
	<div class="inputText" style="margin-bottom: 38px;">
		<input type="text" id="byEmail" name="email" placeholder="ex)aaaa@naver.com">
		<input type="text" id="byPhone" name="phone" placeholder="-를 제외한 핸드폰 번호를 입력하세요">
	</div>
	
<div id="checkBtns">
	<a href="/login"><button class="checkBtn" type="button">취소</button></a>
	<button class="checkBtn" style="background-color: #9f8170; color:#FFF;">확인</button>
</div>
</form>
</div>


</section>



<c:import url="/WEB-INF/views/user/layout/footer.jsp" />