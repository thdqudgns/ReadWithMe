<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<link href="/resources/css/findUser.css" rel="stylesheet">

<section>
<h1>이메일 변경</h1>
가입하셨을 때 등록하셨던 이메일을 입력해주세요

<div id="formArea">
<form action="/find/email" method="post">
	<div class="inputText">
	<input type="text" id="byEmail" name="email" placeholder="ex)aaaa@naver.com">
	</div>
	<div id="checkBtns">
	<a href="/login"><button type="button" class="checkBtn">취소</button></a>
	<button class="checkBtn" style="background-color: #9f8170; color:#FFF;">확인</button>
	</div>
</form>
</div>

</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />