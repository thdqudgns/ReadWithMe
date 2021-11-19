<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			$(location).attr("href", "/admin/notice/write");
			// 		location.href = "/board/write";
		});

		//검색 버튼 클릭
		$("#btnSearch").click(function() {
			location.href = "/admin/notice?search=" + $("#search").val();
			alert($("#search").val());
		});
	});

	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCkeck']")[0].checked = false;
			}
		});
	});
	function deleteValue() {
		var url = "/admin/notice/delete"; // Controller로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr.push(list[i].value);
			}
		}

		if (valueArr.legnth == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("/admin/notice");
					} else {
						alert("삭제 실패");
					}
				}
			})
		}
	}
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
			<h1>공지사항</h1>
			<div style="height: 20px;"></div>

			<table class="table table-hover table-bordered">
				<thead class="table-dark">
					<tr class="active">
						<th style="width: 5%;"><input id="allCheck" type="checkbox"
							name="allCheck" /></th>
						<th style="width: 5%;">#</th>
						<th>제목</th>
						<th style="width: 15%;">작성일</th>
						<th style="width: 5%;">조회수</th>
						<th style="width: 8%;">등록여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="notice">
						<tr>
							<td><input type="checkbox" name="RowCheck"
								value="${notice.board_no }" /></td>
							<td>${notice.board_no }</td>
							<td><a
								href="/admin/notice/view?board_no=${notice.board_no }">${notice.board_title }</a></td>
							<td><fmt:formatDate value="${notice.board_date }"
									pattern="yy-MM-dd HH:mm:ss" /></td>
							<td>0</td>
							<td>미등록</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<span class="pull-left">총 게시글 : ${paging.totalCount }개</span>

			<button id="btnCancel" class="btn pull-right">취소</button>
			<button id="btnRegister2" class="btn pull-right"
				style="margin-right: 2px;">등록</button>
			<button id="btnDelete" class="btn pull-right"
				onclick="deleteValue();" style="margin-right: 2px;">삭제</button>
			<button id="btnWrite" class="btn pull-right"
				style="margin-right: 2px;">글쓰기</button>



			<div class="clearfix"></div>
			<div style="height: 10px;"></div>


			<div class="form-inline text-center">
				<div class="btn-group">
					<button type="button" class="btn">분류</button>
					<button type="button" class="btn dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false">
						<span class="caret"></span> <span class="sr-only">Toggle
							Dropdown</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/admin/notice">전체</a></li>
						<li class="divider"></li>
						<li><a href="#">조회수</a></li>
						<li><a href="#">최신</a></li>
					</ul>
				</div>
				<input class="form-control" type="text" id="search"
					value="${paramData.search }" />
				<button id="btnSearch" class="btn">검색</button>
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
								href="/admin/notice?curPage=1${searchParam }">처음</a></li>
						</c:if>

						<%-- 이전 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.startPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="/admin/notice?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
							</c:when>
							<c:when test="${paging.startPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 이전 페이지로 가기 --%>
						<c:if test="${paging.curPage > 1 }">
							<li class="page-item"><a class="page-link"
								href="/admin/notice?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
						</c:if>




						<%-- 페이징 리스트 --%>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="i">
							<c:if test="${paging.curPage eq i }">
								<li class="page-item active"><a class="page-link"
									href="/admin/notice?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
							<c:if test="${paging.curPage ne i }">
								<li class="page-item"><a class="page-link"
									href="/admin/notice?curPage=${i }${searchParam }">${i }</a></li>
							</c:if>
						</c:forEach>




						<%-- 다음 페이지로 가기 --%>
						<c:if test="${paging.curPage < paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/admin/notice?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
						</c:if>

						<%-- 다음 페이징 리스트로 이동 --%>
						<c:choose>
							<c:when test="${paging.endPage ne paging.totalPage }">
								<li class="page-item"><a class="page-link"
									href="/admin/notice?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
							</c:when>
							<c:when test="${paging.endPage eq paging.totalPage }">
								<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 끝 페이지로 이동 --%>
						<c:if test="${paging.curPage ne paging.totalPage }">
							<li class="page-item"><a class="page-link"
								href="/admin/notice?curPage=${paging.totalPage }${searchParam }">끝</a></li>
						</c:if>

					</ul>
				</nav>
			</div>

		</div>
		<!-- .container -->

	</div>
	<!-- .wrap -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />