<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			$(location).attr("href", "/user/faq/write");
			// 		location.href = "/board/write";
		});

		var search = $("input[name='search']").val();

		//	검색 버튼 클릭
		$("#btnSearch").click(function() {
			$(location).attr("href", "/user/faq?search=" + search);
		});
		
		//카테고리 버튼(1) - 전체
		$("button[name='all']").click(function(){
			$(location).attr("href", "/user/faq/list");
		});
		
		//카테고리 버튼(2) - 모임
		$("button[name='type1']").click(function(){
			$(location).attr("href", "/user/faq/list?type=1");
		});
		
		//카테고리 버튼(3) - 계정
		$("button[name='type2']").click(function(){			
			$(location).attr("href", "/user/faq/list?type=2");
		});
		
		//카테고리 버튼(4) - 서비스
		$("button[name='type3']").click(function(){			
			$(location).attr("href", "/user/faq/list?type=3");
		});
		
		//카테고리 버튼(5) - 이벤트
		$("button[name='type4']").click(function(){
			$(location).attr("href", "/user/faq/list?type=4");
		});
	});	
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
	min-height: 400px;
}
</style>

</head>
<body>

	<div class="wrap">

		<div class="container">

			<div style="height: 50px;"></div>
			
			<h1>자주묻는질문</h1>
			
			<div style="height: 20px;"></div>

			<div>
				<button class="btn btn-bg" name="all" value="전체">#전체</button>
				<button class="btn btn-bg" name="type1" value="모임">#모임</button>
				<button class="btn btn-bg" name="type2" value="계정">#계정</button>
				<button class="btn btn-bg" name="type3" value="서비스">#서비스</button>
				<button class="btn btn-bg" name="type4" value="이벤트">#이벤트</button>
			</div>	
			
			<div style="height: 8px;"></div>
			
			<table class="table table-hover">
				<thead class="table-dark">
					<tr class="active">
						<th style="width: 8%;">글번호</th>
						<th style="width: 8%;">분류</th>
						<th>제목</th>
						<th style="width: 5%;">조회</th>
						<th style="width: 15%;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="faq">
						<tr>
							<td>${faq.board_no }</td>
							<td>
							<c:choose>
							<c:when test="${faq.type == 1 }">
							모임
							</c:when>
							<c:when test="${faq.type == 2 }">
							계정
							</c:when>
							<c:when test="${faq.type == 3 }">
							서비스
							</c:when>
							<c:when test="${faq.type == 4 }">
							이벤트
							</c:when>
							</c:choose>							
							</td>
							<td><a
								href="/user/faq/view?board_no=${faq.board_no }">${faq.board_title }</a></td>
							<td>0</td>
							<td><fmt:formatDate value="${faq.board_date }"
									pattern="yy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<span class="pull-left">총 게시글 : ${paging.totalCount }개</span>

			<div class="clearfix"></div>
			<div style="height: 10px;"></div>


			<div class="form-inline text-center">

				<form action="/user/faq/list" method="get">
					<input class="form-control" type="text" id="search" name="search" value="${paramData.search }"/>
					<button id="btnSearch" class="btn">검색</button>
				</form>
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
								href="/user/faq?curPage=1${searchParam }">처음</a></li>
						</c:if>

						<%-- 이전 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.startPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="/user/faq?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
							</c:when>
							<c:when test="${paging.startPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 이전 페이지로 가기 --%>
						<c:if test="${paging.curPage > 1 }">
							<li class="page-item"><a class="page-link"
								href="/user/faq?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
						</c:if>




						<%-- 페이징 리스트 --%>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="i">
							<c:if test="${paging.curPage eq i }">
								<li class="page-item active"><a class="page-link"
									href="/user/faq?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
							<c:if test="${paging.curPage ne i }">
								<li class="page-item"><a class="page-link"
									href="/user/faq?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
						</c:forEach>




						<%-- 다음 페이지로 가기 --%>
						<c:if test="${paging.curPage < paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/user/faq?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
						</c:if>

						<%-- 다음 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.endPage ne paging.totalPage }">
								<li class="page-item"><a class="page-link"
									href="/user/faq?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
							</c:when>
							<c:when test="${paging.endPage eq paging.totalPage }">
								<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 끝 페이지로 이동 --%>
						<c:if test="${paging.curPage ne paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/user/faq?curPage=${paging.totalPage }${searchParam }">끝</a></li>
						</c:if>

					</ul>
				</nav>
			</div>

		</div>
		<!-- .container -->

	</div>
	<!-- .wrap -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />