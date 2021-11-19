<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script>
self.location = '${url}'; // https://nid.naver.com/oauth2.0/authorize
</script>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />