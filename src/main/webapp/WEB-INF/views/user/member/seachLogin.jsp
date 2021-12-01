<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<style type="text/css">
h1 {
	font-size: xx-large;
	margin: 5px;
}

hr {
	width: 80%;
    margin: 0 auto;
}

section {
	width: 80%;	
	margin: 0 auto;
	text-align: center;
	margin-top: 100px;
    margin-bottom: 100px;
}

#radioBtns {
    text-align: left;
    width: 50%;
    margin: 0 auto;
    margin-top: 50px;
    margin-bottom: 50px;
    font-size: large;
}

.radioBtn {
    margin-top: 20px;
}

input[type="radio"] {
    display:none;
}
input[type="radio"] + label span {
	display:inline-block;
	width: 22px;height: 22px;
	margin: -2px 9px 0 4px;
	font-size: 0;
	vertical-align: middle;
    background:url('../resources/img/radio_brn.png')  no-repeat;cursor:pointer;
}
input[type="radio"]:checked + label span {
    background:url('../resources/img/radio_brn_slc.png') no-repeat;
}

#checkBtns {
	margin: 0 auto;
    width: 80%;
    text-align: right;
    margin-top: 30px;
}

.checkBtn {
	margin: 9px;
    width: 90px;
    height: 40px;
    font-size: initial;
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	$("#radioBtn").click(function() {
			
		const radioBtn = $('[name=seachLogin]:checked').val();

		location.href= radioBtn ;
		
	})
})

</script>


<section>
<h1>무엇을 도와드릴까요?</h1>

<div id="radioBtns">

<div class="radioBtn">
<input type="radio" name="seachLogin" value="/find/pw" id="findPw" checked="checked">
<label for="findPw"><span></span>비밀번호를 잃어버렸습니다</label>
</div>
<div class="radioBtn">
<input type="radio" name="seachLogin" value="/find/id" id="findId" class="radioBtn">
<label for="findId"><span></span>아이디를 잊어버렸어요</label>
</div>
<div class="radioBtn">
<input type="radio" name="seachLogin" value="/find/email" id="findEmail" class="radioBtn">
<label for="findEmail"><span></span>가입할 때 등록한 이메일을 잊어버렸어요</label>
</div>

</div>

<hr>

<div id="checkBtns">
<a href="/login"><button class="checkBtn" >취소</button></a>
<button id="radioBtn" class="checkBtn" style="background-color: #9f8170; color:#FFF;">확인</button>
</div>
</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />