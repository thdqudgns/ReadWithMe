<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<style type="text/css">

.banner {
	height: 180px;
	background-image: url('/resources/img/book(1).jpg');
	color: white;
}

</style>

</head>
<body>

	<div class="container">

		<div style="height: 50px;"></div>

		<div class="banner">
			<div style="height: 50px;"></div>
			<h1>공지사항</h1>
		</div>

		<div style="height: 30px;"></div>

		<table class="table table-bordered">
			<tr>
				<td>글 번호</td>
				<td>${notice.board_no }</td>
				<td>조회수</td>
				<td>${notice.hit }</td>
			<tr>
				<td>ID</td>
				<td>ReadWithMe</td>
				<td>작성일</td>
				<td><fmt:formatDate value="${notice.board_date }"
						pattern="yyyy년 MM월 dd일" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${notice.board_title }</td>
			</tr>
			<tr>
				<td colspan="4">본문</td>
			</tr>
			<tr>
				<td colspan="4">${notice.board_content }</td>
			</tr>
		</table>

		<a href="/user/notice/download?file_no=${notice_file.file_no }">${notice_file.origin_name }</a>

		<div class="text-center">
			<a href="/user/notice/list"><button class="btn"
					style="border-color: #D3D3D3; background: white; color: gray;">목록</button></a>
		</div>

	</div>
	<!-- .container end -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />