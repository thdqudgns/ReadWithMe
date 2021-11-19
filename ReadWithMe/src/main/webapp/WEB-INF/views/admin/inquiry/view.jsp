<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

</head>
<body>

<div class="container">

<h1>1:1 질문 상세보기</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${inquiry.board_no }</td>
	<td class="info">추천수</td><td id="recommend">${cntRecommend }</td>
</tr>
<tr>
	<td class="info">아이디</td><td>ReadWithMe</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${inquiry.board_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${inquiry.board_title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${inquiry.board_content }</td>
</tr>
</table>

<%-- <a href="/admin/faq/download?file_no=${FAQfile.fileNo }">${FAQfile.originName }</a> --%>

<div class="text-center">
	<a href="/admin/inquiry/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${id eq viewBoard.writerId }">
		<a href="/admin/inquiry/update?board_no=${inquiry.board_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/admin/inquiry/delete?board_no=${inquiry.board_no }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />