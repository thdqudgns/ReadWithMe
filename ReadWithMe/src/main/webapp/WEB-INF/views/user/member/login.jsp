<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>

<link href="/resources/css/login.css" rel="stylesheet">
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<section>
<div id="loginTitle">
<h1>Read With Me 로그인</h1>
<div>계정이 없으신가요?  <a href="/join">새 계정 만들기 ></a></div>
</div>


<div id="emailLogin">

<form action="/login" method="post">
<div class="emailLoginForm">
<label>아이디 <br> <input type="text" name="id" class="idpwInput"></label><br>
</div>
<div class="emailLoginForm">
<label>비밀번호<br> <input type="password" name="password" class="idpwInput"></label>
</div>

<div style="margin-bottom: 25px;">
<label><input type="checkbox" name="remember" value="1" style="display: inline-block;"/>로그인 상태 유지</label>
<a href="/seach/login" style="margin-left: 35px; display: inline-block;">비밀번호 또는 아이디 찾기</a>
</div>
<button id="loginBtn">로그인</button>
</form>

</div>

<div id="heightLine"></div>

	
<div id="socialLogin">
	<div class="socialLoginBtn">
	<a href="https://accounts.google.com/o/oauth2/v2/auth/oauthchooseaccount?
	client_id=604366855673-sn0moenehgundmgh9hf20dksulomr1en.apps.googleusercontent.com
	&redirect_uri=http://localhost:8888/login/google
	&response_type=code
	&scope=email%20profile%20openid
	&access_type=offline
	&flowName=GeneralOAuthFlow">
	<img src="/resources/img/google_login_btn.png">
	</a>
	</div>
	<div class="socialLoginBtn">
	<a href="/login/naver">
	<img src="/resources/img/naver_login_btn.png">
	</a>
	</div>
	<div class="socialLoginBtn">
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=340845721c27a182bf54bae03bc43340&redirect_uri=http://localhost:8888/login/kakao&response_type=code">
	<img src="/resources/img/kakao_login_medium_wide.png">
	</a>
	</div>
</div>


</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />