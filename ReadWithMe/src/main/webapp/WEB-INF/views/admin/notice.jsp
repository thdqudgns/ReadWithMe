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

<!-- 부트스트랩 ver5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$(location).attr("href", "/board/write");
// 		location.href = "/board/write";
	})
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/board/list?search="+$("#search").val();
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
		<th>내용</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.board_no }</td>
		<td>${notice.board_title }</td>
		<td>${notice.board_content }</td>
		<td><fmt:formatDate value="${notice.board_date }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
</c:forEach>
</tbody>
</table>


<button id="btnWrite" class="btn btn-primary btn-sm">글쓰기</button>
<span>total : ${paging.totalCount }</span>
<div class="clearfix"></div>

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