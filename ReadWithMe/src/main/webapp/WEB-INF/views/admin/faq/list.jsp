<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function(){
	
	//	글쓰기 버튼
	$("#btnWrite").click(function(){
		$(location).attr("href", "/admin/faq/write");
	})
	
	//	검색 버튼 
	$("#btnSearch").click(function(){
		location.href="/admin/faq/list?search="+$("#search").val();
	})
	
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
	width: 1200px;
}

.container {
	min-height: 520px;
}

</style>

</head>
<body>

<div class="wrap">

<div class="container">

<h1>자주묻는질문</h1>
<hr>

<table class="table table-hover">
<thead class="table-dark">
	<tr>
		<th>글 번호</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${FAQList }" var="FAQ">
	<tr>
		<td>${FAQ.board_no }</td>
		<td><a href="/admin/faq/view?board_no=${FAQ.board_no }">${FAQ.board_title }</a></td>
		<td><fmt:formatDate value="${FAQ.board_date }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="btn-group">
  <button type="button" class="btn">분류</button>
  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu" role="menu">
    <li><a href="#">조회수</a></li>
    <li><a href="#">최신</a></li>
    <li><a href="#">Something else here</a></li>
    <li class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${paramData.search }" />
	<button id="btnSearch" class="btn">검색</button>
</div>

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${paramData.search }" />
</c:if>


<!-- 페이징 -->
<div class="text-center">
	<nav aria-label="Page navigation example">
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a class="page-link" href="/admin/faq/list?curPage=1${searchParam }">처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item"><a class="page-link" href="/admin/faq/list?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link" >&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li class="page-item"><a class="page-link" href="/admin/faq/list?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active"><a class="page-link" href="/admin/faq/list?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a class="page-link" href="/admin/faq/list?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/faq/list?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/faq/list?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/faq/list?curPage=${paging.totalPage }${searchParam }">끝</a></li>	
	</c:if>
	
	</ul>
	</nav>
</div>

</div><!-- .container end -->

</div><!-- .wrap end -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
















