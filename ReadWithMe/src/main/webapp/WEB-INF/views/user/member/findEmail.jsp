<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>이메일 변경</h1>
가입하셨을 때 등록하셨던 이메일을 입력해주세요

<form action="/find/email" method="post">
<input type="text" id="byEmail" name="email" placeholder="ex)aaaa@naver.com">
<a href="/login"><button type="button">취소</button></a>
<button>확인</button>
</form>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />