<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
/* ul.pagination { */
/* 	list-style:none; */
/* /* 	float:left; */ */
/* 	display:table-cell; */
/* } */
/* ul.pagination li { */
/* /* 	float:left; */ */
/* 	display:table-cell; */
/* } */
/* ul.pagination li a { */
/* /* 	float:left; */ */
/* 	padding:8px; */
/* 	margin-right:3px; */
/* 	width:20px; */
/* 	color:#000; */
/* 	font:bold 12px tahoma; */
/* 	border:1px solid #eee; */
/* 	border-radius:30%; */
/* 	text-align:center; */
/* 	text-decoration:none; */
/* } */
/* ul.pagination li a:hover, ul.pagination li a:focus { */
/* 	color:#fff; */
/* 	border:1px solid #9f8170; */
/* 	background-color:#9f8170; */
/* } */
</style>

<c:if test="${not empty param.search }">
	<c:set var="searchParam" value="&search=${param.search }" />
</c:if>

<div class="text-center" style="text-align: center;display:table;margin: 0 auto;">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/admin/report/comment/list?curPage=1${searchParam }">&larr;</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/admin/report/comment/list?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/admin/report/comment/list?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/admin/report/comment/list?curPage=${i }${searchParam }"> ${i } </a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/admin/report/comment/list?curPage=${i }${searchParam }"> ${i } </a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/admin/report/comment/list?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/admin/report/comment/list?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/admin/report/comment/list?curPage=${paging.totalPage }${searchParam }">&rarr;</a></li>	
	</c:if>
	
	</ul>
</div>
