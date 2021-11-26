<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>이메일 변경</h1>
고객님이 입력하신 이메일이 일치합니다. 해당 이메일로 재인증이 가능하니 다시 시도해주세요.

<a href="/find/pw"><button>비밀번호 찾기</button></a>
<a href="/login"><button>로그인</button></a>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />