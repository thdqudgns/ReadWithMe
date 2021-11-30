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
	
	var search = $('#search').val();
	
	//	글쓰기 버튼
	$("#btnWrite").click(function(){
		$(location).attr("href", "/admin/inquiry/write");
	});
	
	//	검색 버튼 
	$("#btnSearch").click(function(){
		location.href="/admin/inquiry/list?search=" + $('#search').val();
	});
	
});

</script>


<style type="text/css">

table {
	border-top : 1.5px solid #D3D3D3;
	border-bottom : 1px solid #D3D3D3;
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

.categories {
	list-style-type: none;
	margin-right: 20px;
}

.categories > li {
	float: right;
	margin-left: 10px;
	font-size: 15px;
}

.categories > li > a {
	cursor: pointer;
	color: black;
	text-decoration: none !important;
}

</style>

</head>
<body>

<div class="wrap">

<div class="container">

<div style="height: 50px;"></div>

<h1>1:1 질문</h1>

<div style="height: 10px;"></div>

			<div style="height: 20px;">
				<ul class="categories">
					<li><a>이벤트</a></li>
					<li><a>|</a></li>
					<li><a>서비스</a></li>
					<li><a>|</a></li>
					<li><a>계정</a></li>
					<li><a>|</a></li>
					<li><a>모임</a></li>
					<li><a>|</a></li>
					<li><a>전체</a></li>
				</ul>
			</div>	

<div style="height: 10px;"></div>

<table class="table table-hover">
<thead class="table-dark">
	<tr>
		<th>글 번호</th>
		<th>제목</th>
		<th>작성일</th>
		<th>답변여부</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${inquiry }" var="inquiry">
	<tr>
		<td>${inquiry.board_no }</td>
		<td><a href="/admin/inquiry/view?board_no=${inquiry.board_no }">${inquiry.board_title }</a></td>
		<td><fmt:formatDate value="${inquiry.board_date }" pattern="yyyy.MM.dd HH:mm" /></td>
		<td>
		<c:if test="${inquiry.check_reply == 0 }">
		</c:if>
		<c:if test="${inquiry.check_reply == 1 }">
		<span class="glyphicon glyphicon-envelope"></span>
		</c:if>
		</td>
	</tr>
</c:forEach>
</tbody>
</table>


<span class="pull-left">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${paramData.search }" />
	<button id="btnSearch" class="btn" style="border-color: gray; background:white; color:gray;">검색</button>
</div>

<c:if test="${not empty paramData.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>


<!-- 페이징 -->
<div class="text-center">
	<nav aria-label="Page navigation example">
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a class="page-link" href="/admin/inquiry/list?curPage=1${searchParam }">처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item"><a class="page-link" href="/admin/inquiry/list?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link" >&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li class="page-item"><a class="page-link" href="/admin/inquiry/list?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active"><a class="page-link" href="/admin/inquiry/list?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a class="page-link" href="/admin/inquiry/list?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/inquiry/list?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/inquiry/list?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/admin/inquiry/list?curPage=${paging.totalPage }${searchParam }">끝</a></li>	
	</c:if>
	
	</ul>
	</nav>
</div>

</div><!-- .container end -->

</div><!-- .wrap end -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
















