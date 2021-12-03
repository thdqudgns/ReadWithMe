<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>

<div class="container">

<h1>공지사항 상세보기</h1>

<div style="height: 45px;"></div>

<table class="table table-bordered">
<tr>
	<td >글번호</td><td>${viewNotice.board_no }</td>
	<td >조회수</td><td>${viewNotice.hit }</td>
<tr>
	<td >아이디</td><td>ReadWithMe</td>
	<td >작성일</td><td><fmt:formatDate value="${viewNotice.board_date }" pattern="yyyy.MM.dd HH:mm"/></td>
</tr>
<tr>
	<td >제목</td><td colspan="3">${viewNotice.board_title }</td>
</tr>
<tr>
	<td colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewNotice.board_content }</td>
</tr>
</table>

<a href="/admin/notice/download?file_no=${notice_file.file_no }">${notice_file.origin_name }</a>

<div class="text-center">
	<a href="/admin/notice" style="color:black;"><button class="btn" style="border-color: #D3D3D3; background: white; color: gray;">목록</button></a>
	<c:if test="${id eq viewBoard.writerId }">
		<a href="/admin/notice/update?board_no=${viewNotice.board_no }" style="color: black;"><button class="btn" style="border-color: #D3D3D3; background: white; color: gray;">수정</button></a>
		<a href="/admin/notice/delete?board_no=${viewNotice.board_no }" style="color: black;"><button class="btn" style="border-color: #D3D3D3; background: white; color: gray;">삭제</button></a>
	</c:if>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />





























