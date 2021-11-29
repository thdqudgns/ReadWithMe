<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>


<c:import url="/WEB-INF/views/user/layout/header.jsp" />


<div>
<h1>로그인</h1>
<div>계정이 없으신가요?  <a href="/join">새 계정 만들기 ></a></div>
</div>

<form action="/login" method="post">
<div>
<label>아이디 <br> <input type="text" name="id"></label><br>
<label>비밀번호<br> <input type="password" name="password"></label>
</div>

<div>
<input type="checkbox" name="remember-me"/>로그인 상태 유지<br>
<a href="/seach/login">비밀번호 또는 아이디 찾기</a>
</div>
<button>로그인</button>
</form>
	
<div>
	<a href="https://accounts.google.com/o/oauth2/v2/auth/oauthchooseaccount?
	client_id=604366855673-sn0moenehgundmgh9hf20dksulomr1en.apps.googleusercontent.com
	&redirect_uri=http://localhost:8888/login/google
	&response_type=code
	&scope=email%20profile%20openid
	&access_type=offline
	&flowName=GeneralOAuthFlow">
		<button>구글 로그인</button>
	</a>
	<a href="/login/naver">
	<img src="/resources/img/naver_login_btn.png">
	</a>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=340845721c27a182bf54bae03bc43340&redirect_uri=http://localhost:8888/login/kakao&response_type=code">
	<img src="/resources/img/kakao_login_medium_wide.png">
	</a>
</div>
	

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />