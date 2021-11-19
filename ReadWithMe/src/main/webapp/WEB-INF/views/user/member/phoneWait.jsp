<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />


<div>
<form action="/phone/confirm" method="POST">
<input type="hidden" name="phone" value="${user.phone }">
<label>인증번호 <br> <input type="text" name="authKey" placeholder="인증번호를 입력해주세요"></label><br>
<button>인증번호 확인</button> <br>
</form>
</div>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />