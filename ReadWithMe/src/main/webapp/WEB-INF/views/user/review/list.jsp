<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- 부트스트랩 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<script type="text/javascript">

$(document).ready(function() {

	$("#btnWrite").click(function() {
		$(location).attr("href", "/user/review/write");
// 		location.href = "/board/write";
	})
	
	//검색 버튼 클릭
	$("#btnreviewSearch").click(function() {
		location.href="/user/review/list?search="+$("#reviewsearch").val();
	});
})

</script>

<style type="text/css">
.container {margin:20px auto; /* border: 1px solid gray; */ border-radius:10px;width:1200px;text-align: center;}
.container > table.review-list {margin: 0 auto;}
table.review-list {	table-layout: fixed; border:none; width:1140px; border-collapse: collapse;}
table.review-list > thead > tr > th {border-bottom: 2px solid black;}
table.review-list, th, td {	text-align: center; border:none; padding: 5px 0px;}
table.review-list td {border-bottom:none;}
table.review-list > tbody > tr:nth-child(odd) {background-color: #ede7e4;}
table.review-list > tbody > tr:hover {background-color: #eee;color:tomato;}
table.review-list > tbody > tr > td:nth-child(2) > a {text-decoration: none;color:black;}
table.review-list > tbody > tr > td:nth-child(2) > a:hover {color:tomato;}
table.review-list > tfoot > tr > td:nth-child(1) {text-align: left;}
table.review-list > tfoot > tr > td:nth-child(2) {text-align: right;}
#btnWrite {text-align: left;}
</style>

<div class="container">
<br>

<img alt="bookimage" src="https://i.imgur.com/JlETEYh.jpg" width="1140px;" style="border-radius:8px;">

<h1 style="text-align: left;margin-left: 30px;">후기 게시판</h1>
<hr style="margin: 0 auto; width:1140px;">
<br>

	<table class="review-list">
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
				<td><a href="/user/review/view?review_no=${reviewList.review_no }">${reviewList.review_title }</a></td>
				<td>${reviewList.nick}</td>
				<td>${reviewList.review_views }</td>
				<td><fmt:formatDate value="${reviewList.review_date }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="3">
					<c:if test="${login}">
					<button id="btnWrite" class="btn-brown" style="width:50px;height:30px;text-align:center;">글쓰기</button>
					</c:if>
				</td>
				<td colspan="2">
					<span class="pull-right">total : ${paging.totalCount }</span>
				</td>
			</tr>
		</tfoot>
	</table>
<br>

<div class="clearfix"></div>
<br>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="reviewsearch" value="${param.search }" style="width:180px;border: 3px solid #9f8170;" placeholder="검색어를 입력해주세요"/>
	<button id="btnreviewSearch" class="btn" style="width:26px;height:25px;border: 3px solid #9f8170;background-color:#9f8170; ">
		<img style="margin-top:1px;object-fit:full;width:14px;height:12px;" alt="search" src="https://i.imgur.com/97QT6ay.png">
	</button>
</div>

<br>


<c:import url="/WEB-INF/views/user/layout/reviewPaging.jsp" />
<br>

</div><!-- .container -->


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />