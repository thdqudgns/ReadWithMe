<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>이메일 발송 실패!</h1>
<div>이메일 발송에 실패하였습니다.
회원가입 하실 때 등록하셨던 이메일인지, 혹은 사용 가능한 이메일인지 확인해주시고, 지속적으로 오류가 발생되는 경우에는 고객센터로 문의해주세요.</div>

<a href="/join"><button>회원가입</button></a>
<a href="/main"><button>홈으로 가기</button></a>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />