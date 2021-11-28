<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<style type="text/css">

h1 {
	font-size: xx-large;
	margin: 5px;
}

hr {
	width: 30%;
    margin: 0 auto;
    margin-top: 20px;	
    margin-bottom: 20px;	
}

section {
	width: 55%;
    margin: 0 auto;
    text-align: center;
	margin-top: 100px;
    margin-bottom: 40px;
}

#checkBtns {
	margin: 0 auto;
    width: 80%;
    text-align: right;
    margin-top: 30px;
}

.checkBtn {
	margin: 9px;
    width: 90px;
    height: 40px;
    font-size: initial;
}

</style>


<section>
<h1>로그인 불가</h1>

회원님의 아이디는 현재 정지된 상태입니다<br>

<fmt:formatDate value="${ban.start_ban }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ban.end_ban }" pattern="yyyy.MM.dd"/>

<div id="checkBtns" style="text-align: center;">
<a href="/"><button class="checkBtn">홈으로 가기</button></a>
</div>


</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />