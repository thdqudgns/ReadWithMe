<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/user/layout/header.jsp" />



<h1>본인확인</h1>
고객님의 본인확인을 진행해주세요!
<hr>
본인확인시 진행된 휴대폰 번호와 이메일 주소는 아이디/비밀번호 찾기에 사용됩니다



<div>
<form action="/phone/register" method="POST">
<label>핸드폰번호 <br> <input type="text" name="phone" id="phone" placeholder="인증메일을 받을 핸드폰번호를 입력해주세요"></label><br>
<button>인증번호 받기</button> <br>
</form>
</div>
<div id="resultLayout"></div>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />