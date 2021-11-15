<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<input type="radio" name="remember" value="1"/>로그인 상태 유지<br>
<a href="/seach/login">비밀번호 또는 아이디 찾기</a>
</div>
<button>로그인</button>
</form>
	
<div>
	<button>구글 로그인</button>
	<button>네이버 로그인</button>
	<button>카카오 로그인</button>
</div>
	

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />