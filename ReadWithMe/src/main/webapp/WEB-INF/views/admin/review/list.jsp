<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">

$(document).ready(function() {

	//검색 버튼 클릭
	$("#btnreviewSearch").click(function() {
		location.href="/admin/review/list?search="+$("#reviewsearch").val();
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

td:nth-child(2) {
	text-align: left;
}
</style>

<div class="container">
<br>

<h1>후기 게시판 관리</h1>
<hr>

<div class="reviewToggle">
	<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 10%;">글번호</th>
			<th style="width: 45%;">제목</th>
			<th style="width: 20%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 15%;">작성일</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${reviewList }" var="reviewList">
		<tr>
			<td>${reviewList.review_no }</td>
			<td><a href="/admin/review/view?review_no=${reviewList.review_no }">${reviewList.review_title }</a></td>
			<td>${reviewList.nick}</td>
			<td>${reviewList.review_views }</td>
			<td><fmt:formatDate value="${reviewList.review_date }" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</div>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="reviewsearch" value="${param.search }" />
	<button id="btnreviewSearch" class="btn">검색</button>
</div>

<br><br>


<c:import url="/WEB-INF/views/admin/layout/adminReviewPaging.jsp" />

</div><!-- .container -->


<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />