<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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

<div class="text-center">
	<a href="/admin/notice"><button class="btn btn-default">목록</button></a>
	<c:if test="${id eq viewBoard.writerId }">
		<a href="/board/update?boardNo=${viewBoard.boardNo }"><button class="btn btn-primary">수정</button></a>
		<a href="/board/delete?boardNo=${viewBoard.boardNo }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>

</div><!-- .container end -->


</body>
</html>





























