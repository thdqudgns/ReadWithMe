<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/css/findUser.css" rel="stylesheet">
<c:import url="/WEB-INF/views/user/layout/header.jsp" />


<section>
<c:if test="${empty id }">
<h1>아이디 찾기</h1>
존재하는 아이디가 없습니다.<br>
다시 한 번 맞게 입력했는지 확인해주시고 같은 오류가 계속 발생하면 고객센터로 문의 주세요!

<div id="checkBtns" style="text-align: center;">
<a href="/find/id"><button class="checkBtn" style="background-color: #9f8170; color:#FFF;">아이디 찾기</button></a>
<a href="/login"><button class="checkBtn">로그인</button></a>
</div>
</c:if>

<c:if test="${not empty id }">
<h1>아이디 찾기</h1>
성공적으로 아이디를 찾았습니다!

<div id="findIdArea">
${id }
</div>

<div id="checkBtns" style="text-align: center;">
<a href="/find/pw"><button class="checkBtn" style="background-color: #9f8170; color:#FFF; width: 105px;">비밀번호 찾기</button></a>
<a href="/login"><button class="checkBtn" style="width: 105px;">로그인</button></a>
</div>
</c:if>
</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />