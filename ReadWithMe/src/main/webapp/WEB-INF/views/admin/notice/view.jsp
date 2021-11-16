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
	<td class="info">글번호</td><td>${viewNotice.board_no }</td>
	<td class="info">추천수</td><td>recommend</td>
<tr>
	<td class="info">아이디</td><td>ReadWithMe</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewNotice.board_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewNotice.board_title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewNotice.board_content }</td>
</tr>
</table>

<a href="/admin/notice/download?file_no=${notice_file.file_no }">${notice_file.origin_name }</a>

<div class="text-center">
	<a href="/admin/notice"><button class="btn btn-default">목록</button></a>
	<c:if test="${id eq viewBoard.writerId }">
		<a href="/admin/notice/update?board_no=${viewNotice.board_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/admin/notice/delete?board_no=${viewNotice.board_no }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />





























