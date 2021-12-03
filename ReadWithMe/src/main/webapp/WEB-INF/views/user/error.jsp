<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	setTimeout(function() {
		alert('확인을 누르시면 메인 페이지로 이동합니다')
		location.href = "/"
	}, 3100)
	
	var i = 3;
	setInterval(function() {
		$("#time").text(--i);
	}, 1000)
})
</script>

<div class="container">

<h1 style="color:red;">비관리자 접근 불가</h1>
<hr>

관리자가 아닌 사람은 접근할 수 없습니다.<br>

<span id="time">3</span>초후 메인화면으로 이동합니다...

</div><!-- .container -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
