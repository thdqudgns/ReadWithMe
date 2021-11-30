<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<link href="/resources/css/profileOther.css" rel="stylesheet">
<script src="/resources/js/pwChange_script.js"></script>



<section>
<h1>내 정보</h1>

<div id="pwInfo">
<h3>비밀번호 변경</h3>
안전한 비밀번호로 고객님의 정보를 보호하세요!
</div>

<form action="/mypage/pwchange" method="post">
<div class="pwDiv">
<input type="password" id="prsntPw" placeholder="현재 비밀번호">
<div id="pw1_check"></div>
</div>

<div class="pwDiv">
<input type="password" id="password" name="password" placeholder="새 비밀번호"><br>
<input type="password" id="password2" placeholder="새 비밀번호 확인">

<div id="pw2_check"></div>
</div>

<div id="checkBtns">
<button class="checkBtn" id="reg_submit" style="background-color: #9f8170; color: #fff;">확인</button>
<a href="mypage/main"><button class="checkBtn" type="button">취소</button></a>
</div>
</form>

</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />