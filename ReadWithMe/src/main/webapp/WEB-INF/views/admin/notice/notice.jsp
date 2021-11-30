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
		
		//	검색 버튼 클릭
		$("#btnSearch").click(function() {

			console.log(search);
			
			$(location).attr("href", "/admin/notice?type=${notice.type}&search=" + $("#search1").val());
	});
		
		//카테고리 버튼(1) - 전체
		$('.categories>li:eq(8)').children('a').click(function(){
			$(location).attr("href", "/admin/notice");
		});
		
		//카테고리 버튼(2) - 모임
		$('.categories>li:eq(6)').children('a').click(function(){
			$(location).attr("href", "/admin/notice?type=1");
		});
		
		//카테고리 버튼(3) - 계정
		$('.categories>li:eq(4)').children('a').click(function(){			
			$(location).attr("href", "/admin/notice?type=2");
		});
		
		//카테고리 버튼(4) - 서비스
		$('.categories>li:eq(2)').children('a').click(function(){			
			$(location).attr("href", "/admin/notice?type=3");
		});
		
		//카테고리 버튼(5) - 이벤트
		$('.categories>li:eq(0)').children('a').click(function(){
			$(location).attr("href", "/admin/notice?type=4");
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
	
	
	//	선택삭제
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
						alert("삭제 완료");
						location.replace("/admin/notice");
					} else {
						alert("삭제 실패");
					}
				}
			})
		}
	}
	
	//선택 등록
	function registerValue() {
		var url = "/admin/notice/register";	//Controller로 보내고자 하는 URL
		var valueArr2 = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr2.push(list[i].value);
			}
		}
		
		if (valueArr2.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 등록하시겠습니까?");
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr2 : valueArr2
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("등록 완료");
						location.replace("/admin/notice");
					} else {
						alert("등록 실패");
					}
				}
			})
		}
	}
	
	//취소 버튼
	function cancelValue() {
		var url = "/admin/notice/cancel";
		var valueArr3 = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr3.push(list[i].value);
			}
		}
		
		if (valueArr3.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 취소하시겠습니까?");
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr3 : valueArr3
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("취소 완료");
						location.replace("/admin/notice");
					} else {
						alert("취소 실패");
					}
				}
			})
		}
	}
</script>

<style type="text/css">
table {
	margin-top: 20px;
	border-top: 1.5px solid #D3D3D3;
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
	text-decoration: none;
}

.categories > li > a:hover {
	color: green;
	text-decoration: underline;
}

</style>

</head>
<body>

	<div class="wrap">

		<div class="container">

			<div style="height: 50px;"></div>
			
			<h1>공지사항</h1>
			
			<div style="height: 10px;"></div>
			
			<div style="height: 10px;">
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
			
			<div style="height: 8px;"></div>
			
			<div>
			<table class="table table-hover" >
				<thead >
					<tr>
						<th><input id="allCheck" type="checkbox" name="allCheck" /></th>
						<th>글 번호</th>
						<th>분류</th>
						<th style="width: 30%;">제목</th>
						<th>작성일</th>
						<th>마지막 수정일</th>
						<th>조회수</th>
						<th>등록여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="notice">
						<tr>
							<td><input type="checkbox" name="RowCheck" value="${notice.board_no }" /></td>
							<td>${notice.board_no }</td>
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
								href="/admin/notice/view?board_no=${notice.board_no }">${notice.board_title }</a></td>
							<td><fmt:formatDate value="${notice.board_date }"
									pattern="yyyy.MM.dd" /></td>
							<td><fmt:formatDate value="${notice.updated_date }"
									pattern="yyyy.MM.dd  HH:mm" /></td>
							<td>${notice.hit }</td>
							<td>
							<c:choose>
							<c:when test="${notice.register == 1}">
							<span class="glyphicon glyphicon-ok"
								style="color: green;"></span>
							</c:when>
							<c:when test="${notice.register == 0}">
							<span class="glyphicon glyphicon-minus"
								style="color: red;"></span>
							</c:when>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			<span class="glyphicon glyphicon-repeat pull-left"
				style="width: 20px; height: 20px; margin-top: 2px; margin-left: 10px; color: gray; cursor: pointer;" 
				onclick="window.location.reload(); "></span>
			
			<span style="margin-left: 10px;">total : ${paging.totalCount }</span>
			
			
			<button id="btnCancel" class="btn pull-right"
				onclick="cancelValue();" style="margin-right: 2px; border-color: gray; background:white; color:gray;">취소</button>
			<button id="btnRegister2" class="btn pull-right"
				onclick="registerValue();" style="margin-right: 2px; border-color: gray; background:white; color:gray;">등록</button>
			<button id="btnDelete" class="btn pull-right"
				onclick="deleteValue();" style="margin-right: 2px; border-color: gray; background:white; color:gray;">삭제</button>
			<button id="btnWrite" class="btn pull-right"
				style="margin-right: 2px; border-color: gray; background:white; color:gray;">글쓰기</button>



			<div class="clearfix"></div>


			<div class="form-inline text-center">
					<input class="form-control" type="text" id="search1" name="search"  value="${paramData.search }"/>
					<button id="btnSearch" class="btn"" style="border-color: gray; background:white; color:gray;">검색</button>
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