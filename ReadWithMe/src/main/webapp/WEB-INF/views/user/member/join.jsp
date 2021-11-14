<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>Read With Me 회원가입</h1>
Read With Me에서는 누구나 독서모임을 주최하고 참여하실 수 있습니다! 즐거운 독서를 시작해 보세요!

<form action="/join/idntf">
<button>이메일로 회원가입</button>
</form>

<form action="/join/social">
<button>Google로 회원가입</button>
<button>Naver로 회원가입</button>
<button>Kakao로 회원가입</button>
</form>

이미 계정이 있으세요? <a href="/login">로그인</a>
<hr>
 SNS로 회원 가입 및 로그인 시 Read With Me의  이용약관과 개인정보처리방침에 동의한 것으로 간주합니다.

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />