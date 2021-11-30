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
	width: 30%;
    margin: 0 auto;
    margin-top: 20px;	
    margin-bottom: 20px;	
}

section {
	width: 55%;
    margin: 0 auto;
    text-align: center;
	margin-top: 100px;
    margin-bottom: 40px;
}

label {
	font-size: larger;
}

#phone {
	width: 52%;
    height: 34px;
    margin: 14px;
}

#phoneBtn {
	font-size: initial;
    width: 104px;
    padding: 6px 2px;
    background-color: #9f8170;
    color: #fff;
}

input[name="phone"] {
    border: none;
    outline: none;
    border-bottom: 1px solid #ccc;
    width: 40%;
    padding-bottom: 3px;	
}


</style>

<section>
<h1>본인확인</h1>
고객님의 본인확인을 진행해주세요!
<hr>
본인확인시 진행된 휴대폰 번호와 이메일 주소는<br>
아이디/비밀번호 찾기에 사용됩니다



<div>
<form action="/phone/register" method="POST" style="margin: 60px;">
<div>
<label>핸드폰번호 <br> 
<input type="text" name="phone" id="phone" placeholder="인증번호를 받을 핸드폰번호를 입력해주세요"></label>
</div>

<button id="phoneBtn">인증번호 받기</button> 

</form>
</div>
<div id="resultLayout"></div>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />