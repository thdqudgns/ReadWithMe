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


<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$(location).attr("href", "/admin/notice/write");
// 		location.href = "/board/write";
	})
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/admin/notice?search="+$("#search").val();
	});
})
</script>

<style type="text/css">

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

.wrap {
	margin: 0 auto;
	width: 1100px;
}

.container {
	min-height: 400px;
}
	
</style>

</head>
<body>

<div class="wrap">

<div class="container">

<h1>공지사항</h1>
<hr>

<table class="table table-hover">
<thead class="table-dark">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.board_no }</td>
		<td><a href="/admin/notice/view?board_no=${notice.board_no }">${notice.board_title }</a></td>
		<td><fmt:formatDate value="${notice.board_date }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
</c:forEach>
</tbody>
</table>


<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${param.search }" />
	<button id="btnSearch" class="btn">검색</button>
</div>



<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>

<div class="text-center">
	<nav aria-label="Page navigation example">
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a class="page-link" href="/admin/notice?curPage=1${searchParam }">처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item"><a class="page-link" href="/admin/notice?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link" >&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li class="page-item"><a class="page-link" href="/admin/notice?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active"><a class="page-link" href="/admin/notice?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a class="page-link" href="/admin/notice?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/notice?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/notice?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/notice?curPage=${paging.totalPage }${searchParam }">끝</a></li>	
	</c:if>
	
	</ul>
	</nav>
</div>

</div><!-- .container -->

</div><!-- .wrap -->

</body>
</html>