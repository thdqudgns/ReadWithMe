<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

</head>
<body>

<div class="container">

<h1>공지사항 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${notice.board_no }</td>
	<td class="info">추천수</td><td>recommend</td>
<tr>
	<td class="info">아이디</td><td>ReadWithMe</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${notice.board_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${notice.board_title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${notice.board_content }</td>
</tr>
</table>

<a href="/user/notice/download?file_no=${notice_file.file_no }">${notice_file.origin_name }</a>

<div class="text-center">
	<a href="/user/notice/list"><button class="btn btn-default">목록</button></a>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />





























