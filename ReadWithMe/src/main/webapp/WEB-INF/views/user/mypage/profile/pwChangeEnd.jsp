<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<link href="/resources/css/profileOther.css" rel="stylesheet">

<section>
<h1>내 정보</h1>

<h3>비밀번호 변경</h3>
비밀번호가 안전하게 변경되었습니다!

<div id="checkBtns" style="text-align: center;">
<a href="/">
	<button class="checkBtn" style="width: 238px; text-align: center; background-color: #9f8170; color: #fff;">
	Read With Me 홈 바로가기
	</button>
</a>
</div>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />