<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

	<script type="text/javascript">
		alert('인증 완료되었습니다. 이제 회원가입이 가능 합니다.');

		self.location = '/join/origin?phone=${phoneAuth.phone }';
	</script>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />