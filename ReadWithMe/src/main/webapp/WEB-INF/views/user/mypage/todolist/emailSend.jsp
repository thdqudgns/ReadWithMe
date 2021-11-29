<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

	<script type="text/javascript">
		
		alert('이메일을 성공적으로 발송했습니다!');

		self.location = '/todolist';
	</script>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />