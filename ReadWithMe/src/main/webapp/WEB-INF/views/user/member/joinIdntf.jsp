<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/0d232bdc2d.js" crossorigin="anonymous"></script>

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

.idntf {
	border: 1px solid #000;
    margin: 50px 0px;
    padding: 22px;
    padding-top: 29px;
    height: 120px;
}

.img {
	font-size: xxx-large;
    text-align: left;
    display: inline-block;
    width: 20%;
}

.idntfDiv {
	display: inline-block;
    width: 65%;
    text-align: left;
}

.idntfBtn {
	width: 78px;
    height: 40px;
    font-size: initial;
    background-color: #9f8170;
    color: #fff;
}

</style>


<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<section>
<h1>본인확인</h1>
고객님의 본인확인을 진행해주세요!
<hr>

본인확인시 진행된 휴대폰 번호와 이메일 주소는<br>
아이디/비밀번호 찾기에 사용됩니다

<div class="idntf">
	<i class="fas fa-mobile-alt img" style="font-size: xxx-large;"></i>
	<div class="idntfDiv">
	<p style="font-size: larger; font-weight: bold;">휴대폰 인증</p>
	고객님 명의의 휴대폰으로 인증<br>
	</div>
	<a href="/phone/register"><button class="idntfBtn">인증하기</button></a>
</div>

<div class="idntf">
	<i class="far fa-envelope img" style="font-size: xxx-large;"></i>
	<div class="idntfDiv">
	<p style="font-size: larger; font-weight: bold;">이메일 인증</p>
	고객님의 이메일로 인증
	</div>
	<a href="/email/register"><button class="idntfBtn">인증하기</button></a>
</div>

</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />