<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>본인확인</h1>
고객님의 본인확인을 진행해주세요!
<hr>
본인확인시 진행된 휴대폰 번호와 이메일 주소는 아이디/비밀번호 찾기에 사용됩니다

<div>
	휴대폰 인증<br>
	고객님 명의의 휴대폰으로 인증<br>
	<a href="/join/email"><button>인증하기</button></a>
</div>

<div>
	이메일 인증 <br>
	고객님의 이메일로 인증
	<a href="/register"><button>인증하기</button></a>
</div>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />