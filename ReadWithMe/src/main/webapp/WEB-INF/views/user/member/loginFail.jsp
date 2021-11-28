<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<link href="/resources/css/findUser.css" rel="stylesheet">


<section>
<h1>로그인 실패!</h1>
<div>로그인이 실패하였습니다. 지속적으로 오류가 발생되는 경우에는 고객센터로 문의해주세요.</div>

<div id="checkBtns" style="text-align: center;">
<a href="/join"><button class="checkBtn" style="background-color: #9f8170; color:#FFF;">회원가입</button></a>
<a href="/"><button class="checkBtn">홈으로 가기</button></a>
</div>
</section>



<c:import url="/WEB-INF/views/user/layout/footer.jsp" />