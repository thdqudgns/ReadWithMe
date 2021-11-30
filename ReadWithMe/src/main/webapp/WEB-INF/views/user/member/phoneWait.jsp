<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<style type="text/css">
h1 {
	font-size: x-large;
	margin: 5px;
}

hr {
	width: 30%;
    margin: 0 auto;
    margin-top: 20px;	
    margin-bottom: 20px;	
}

section {
	width: 80%;	
	margin: 0 auto;
	text-align: center;
	margin-top: 100px;
    margin-bottom: 100px;
}

#phoneKey {
	margin-top: 50px;
}

#phoneKey label {
    font-size: xx-large;
}

#phoneKey input {
	border: none;
    outline: none;
    border-bottom: 1px solid #ccc;
    width: 40%;
    padding-bottom: 10px;	
}

#phoneBtn {
	font-size: initial;
    width: 104px;
    padding: 6px 2px;
    background-color: #9f8170;
    color: #fff;
}
</style>

<section>

<h1>본인확인</h1>
고객님의 본인확인을 진행해주세요!



<div>
<form action="/phone/confirm" method="POST">
<div id="phoneKey">
<input type="hidden" name="phone" value="${user.phone }">
<label>핸드폰 인증번호 <br> <input type="text" name="authKey" placeholder="인증번호를 입력해주세요"></label><br>
</div>

<div style="margin-top: 20px;">
<button id="phoneBtn">인증번호 확인</button> <br>
</div>
</form>
</div>
</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />