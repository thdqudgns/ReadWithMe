<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />


<h1>비밀번호 재설정</h1>
임시 비밀번호를 발송했습니다!
개인정보 보호를 위해 로그인 후 꼭 비밀번호를 변경해주세요!

<a href="/login"><button>로그인</button></a>
<a href="/"><button>홈으로</button></a>



<c:import url="/WEB-INF/views/user/layout/footer.jsp" />