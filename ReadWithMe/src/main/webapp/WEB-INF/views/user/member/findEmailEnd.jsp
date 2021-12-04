<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<link href="/resources/css/findUser.css" rel="stylesheet">

<section>
<c:if test="${res == 0 }">
<h1>이메일 초기화</h1>
고객님이 입력하신 이메일이 일치합니다. <br>해당 이메일로 재인증이 가능하니 다시 시도해주세요.

<div id="checkBtns" style="text-align: center;">
<a href="/find/pw"><button class="checkBtn" style="background-color: #9f8170; color:#FFF; width: 110px;">비밀번호 찾기</button></a>
<a href="/login"><button class="checkBtn" style="width: 110px;">로그인</button></a>
</div>
</c:if>

<c:if test="${res == 1 }">
<h1>이메일 초기화</h1>
고객님이 입력하신 이메일이 존재하지 않습니다. <br>해당 이메일로 인증이 가능하니 다시 시도해주세요.<br>
계속 오류가 발생하신다면 고객센터로 문의해주세요

<div id="checkBtns" style="text-align: center;">
<a href="/find/pw"><button class="checkBtn" style="background-color: #9f8170; color:#FFF; width: 110px;">비밀번호 찾기</button></a>
<a href="/login"><button class="checkBtn" style="width: 110px;">로그인</button></a>
</div>
</c:if>


</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />