<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<style type="text/css">

h1 {
	font-size: xx-large;
}

hr {
	width: 85%;
	margin: 0 auto;
}

#joinMain {
	width: 35%;
	margin: 0 auto;
	margin-top: 100px;
    margin-bottom: 40px;
}

#joinTitle {
	margin: 20px;
    margin-bottom: 50px;
    text-align: center;
}

#joinBtns {
	text-align: center;
}

.joinBtn {
	margin-top: 20px; 
	margin-bottom: 20px; 
}

#loginBtnFromJoin {
	width: 300px;
	margin: 0 auto;
	margin-bottom: 30px;
}
#snsAgree {
	margin: 40px;
    font-size: small;
}

</style>


<section id="joinMain">
<div id="joinTitle">
<h1>Read With Me 회원가입</h1>
Read With Me에서는 누구나 독서모임을 주최하고 참여하실 수 있습니다! 즐거운 독서를 시작해 보세요!
</div>



<div id="joinBtns">
	<div class="joinBtn">
	<a href="/join/idntf">
	<img src="/resources/img/email_join_btn.png" style="border: 1px #000">
	</a>
	</div>
	<div class="joinBtn">
	<a href="/login/google">
	<img src="/resources/img/google_join_btn.png" style="border: 1px #000">
	</a>
	</div>
	<div class="joinBtn">
	<a href="/login/naver">
	<img src="/resources/img/naver_join_btn.png">
	</a>
	</div>
	<div class="joinBtn">
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=340845721c27a182bf54bae03bc43340&redirect_uri=http://localhost:8888/login/kakao&response_type=code">
	<img src="/resources/img/kakao_join_medium_wide.png">
	</a>
	</div>
</div>

<div id="loginBtnFromJoin">
<p style="display: inline-block;">이미 계정이 있으세요?</p>
<p style="margin-left: 100px; display: inline-block;"><a href="/login">로그인</a></p>
</div>
<hr>
<div id="snsAgree">
 SNS로 회원 가입 및 로그인 시 Read With Me의  이용약관과 개인정보처리방침에 동의한 것으로 간주합니다.
 </div>
</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />