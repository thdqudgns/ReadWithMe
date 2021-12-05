<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			$(location).attr("href", "/user/notice/write");
			// 		location.href = "/board/write";
		});

		//	검색 버튼 클릭
		$("#btnSearch").click(function() {

			console.log(search);
			
			$(location).attr("href", "/user/notice/list?type=${notice.type}&search=" + $("#search1").val());
	});
		
		//카테고리 버튼(1) - 전체
		$('.categories>li:eq(8)').children('a').click(function(){
			$(location).attr("href", "/user/notice/list");
		});
		
		//카테고리 버튼(2) - 모임
		$('.categories>li:eq(6)').children('a').click(function(){
			$(location).attr("href", "/user/notice/list?type=1");
		});
		
		//카테고리 버튼(3) - 계정
		$('.categories>li:eq(4)').children('a').click(function(){			
			$(location).attr("href", "/user/notice/list?type=2");
		});
		
		//카테고리 버튼(4) - 서비스
		$('.categories>li:eq(2)').children('a').click(function(){			
			$(location).attr("href", "/user/notice/list?type=3");
		});
		
		//카테고리 버튼(5) - 이벤트
		$('.categories>li:eq(0)').children('a').click(function(){
			$(location).attr("href", "/user/notice/list?type=4");
		});
	});	
</script>

<style type="text/css">
table {
	margin-top: 20px;
	border-top: 1px solid #D3D3D3;
	border-bottom: 1px solid #D3D3D3;
}

table, th {
	text-align: center;
}

.wrap {
	margin: 0 auto;
	width: 1200px;
}

.container {
	min-height: 400px;
}

.banner {
	height: 300px;
	background-image: url('/resources/img/book(1).jpg');
	color: white;
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

.categories > li > a:hover {
	color: #0067A3;
	text-decoration: underline;
}

</style>

</head>
<body>

	<div class="wrap">

		<div class="container">

			<div style="height: 50px;"></div>
			
			<div class="banner">
			<div style="height: 100px;"></div>
			<p style="font-size: 50px; width: 300px; margin-left: 10px;">공지사항</p>
			</div>
			</div>

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
						<th style="width: 8%;">No.</th>
						<th style="width: 8%;">#</th>
						<th>Title</th>
						<th style="width: 5%;">Hit</th>
						<th style="width: 15%;">Date</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="num" value="${paging.totalCount - ((paging.curPage - 1) * 10)}"/>
					<c:forEach items="${list }" var="notice">
						<tr>
							<td>${num }</td>
							<td>
							<c:choose>
							<c:when test="${notice.type == 1 }">
							모임
							</c:when>
							<c:when test="${notice.type == 2 }">
							계정
							</c:when>
							<c:when test="${notice.type == 3 }">
							서비스
							</c:when>
							<c:when test="${notice.type == 4 }">
							이벤트
							</c:when>
							</c:choose>							
							</td>
							<td><a
								href="/user/notice/view?board_no=${notice.board_no }">${notice.board_title }</a></td>
							<td>${notice.hit }</td>
							<td style="font-size: 14px;"><fmt:formatDate value="${notice.board_date }"
									pattern="yyyy년 MM월 dd일" /></td>
						</tr>
					<c:set var="num" value="${num-1 }"/>
					</c:forEach>
				</tbody>
			</table>


			<span class="pull-left">총 게시글 : ${paging.totalCount }개</span>

			<div class="clearfix"></div>
			<div style="height: 10px;"></div>


			<div class="form-inline text-center">
					<input class="form-control" type="text" id="search1" name="search" value="${paramData.search }"/>
					<button id="btnSearch" class="btn"  style="border-color: #D3D3D3; background: white; color: gray;">검색</button>
			</div>



			<c:if test="${not empty paramData.search }">
				<c:set var="searchParam" value="&search=${paramData.search }" />
			</c:if>

			<div class="text-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">

						<%-- 첫 페이지로 이동 --%>
						<c:if test="${paging.curPage ne 1 }">
							<li class="page-item"><a class="page-link"
								href="/user/notice/list?curPage=1${searchParam }">처음</a></li>
						</c:if>

						<%-- 이전 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.startPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="/user/notice/list?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
							</c:when>
							<c:when test="${paging.startPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 이전 페이지로 가기 --%>
						<c:if test="${paging.curPage > 1 }">
							<li class="page-item"><a class="page-link"
								href="/user/notice/list?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
						</c:if>




						<%-- 페이징 리스트 --%>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="i">
							<c:if test="${paging.curPage eq i }">
								<li class="page-item active"><a class="page-link"
									href="/user/notice/list?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
							<c:if test="${paging.curPage ne i }">
								<li class="page-item"><a class="page-link"
									href="/user/notice/list?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
						</c:forEach>




						<%-- 다음 페이지로 가기 --%>
						<c:if test="${paging.curPage < paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/user/notice/list?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
						</c:if>

						<%-- 다음 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.endPage ne paging.totalPage }">
								<li class="page-item"><a class="page-link"
									href="/user/notice/list?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
							</c:when>
							<c:when test="${paging.endPage eq paging.totalPage }">
								<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 끝 페이지로 이동 --%>
						<c:if test="${paging.curPage ne paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/user/notice/list?curPage=${paging.totalPage }${searchParam }">끝</a></li>
						</c:if>

					</ul>
				</nav>
			</div>

		</div>
		<!-- .container -->

	</div>
	<!-- .wrap -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />