<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#radioBtn").click(function() {
			
		const radioBtn = $('[name=seachLogin]:checked').val();

		location.href= radioBtn ;
		
	})
})

</script>

<h1>무엇을 도와드릴까요?</h1>


<input type="radio" name="seachLogin" value="/find/pw" checked="checked">비밀번호를 잃어버렸습니다 <br>
<input type="radio" name="seachLogin" value="/find/id">아이디를 잊어버렸어요<br>
<input type="radio" name="seachLogin" value="/find/email">가입할 때 등록한 이메일을 잊어버렸습니다 <br>
<hr>
<a href="/login"><button>취소</button></a>
<button id="radioBtn">확인</button>



<c:import url="/WEB-INF/views/user/layout/footer.jsp" />