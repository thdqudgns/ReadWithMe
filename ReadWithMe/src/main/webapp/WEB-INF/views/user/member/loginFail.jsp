<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>로그인 실패!</h1>
<div>로그인이 실패하였습니다. 지속적으로 오류가 발생되는 경우에는 고객센터로 문의해주세요.</div>

<a href="/login"><button>로그인</button></a>
<a href="/main"><button>홈으로 가기</button></a>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />