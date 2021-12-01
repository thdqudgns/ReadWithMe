<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<link href="/resources/css/findUser.css" rel="stylesheet">


<section>

<h1>비밀번호 재설정</h1>
임시 비밀번호를 발송했습니다!<br>
개인정보 보호를 위해 로그인 후 꼭 비밀번호를 변경해주세요!

<div id="checkBtns" style="text-align: center;">
<a href="/login"><button class="checkBtn" style="background-color: #9f8170; color:#FFF;">로그인</button></a>
<a href="/"><button class="checkBtn">홈으로</button></a>
</div>
</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />