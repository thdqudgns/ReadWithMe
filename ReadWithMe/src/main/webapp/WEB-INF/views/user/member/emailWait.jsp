<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<link href="/resources/css/findUser.css" rel="stylesheet">
<style type="text/css">
hr {
	width: 30%;
    margin: 0 auto;
    margin-top: 20px;	
    margin-bottom: 20px;	
}
</style>
<section>
<h1>본인확인</h1>
고객님의 본인확인을 진행해주세요!
<hr>
본인확인시 진행된 휴대폰 번호와 이메일 주소는<br> 아이디/비밀번호 찾기에 사용됩니다

<div id="emailEnd">
이메일 발송이 완료되었습니다! 이메일을 확인해주세요!
</div>

</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />