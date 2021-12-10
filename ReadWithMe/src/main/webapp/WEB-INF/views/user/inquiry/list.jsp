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
		
		//글쓰기 버튼
		$("#btnWrite").click(function() {
			$(location).attr("href", "/user/inquiry/write");
			// 		location.href = "/board/write";
		});
		
		//글삭제 버튼
		$("#btnDelete").click(function(){
			//$(location).attr("href", "/user/inquiry/delete");
		});
 
		//	검색 버튼 클릭
		$("#btnSearch").click(function() {
			$(location).attr("href", "/user/inquiry/list?type=${inquiry.type }&search=" + $("#search1").val());
		});
		
		//카테고리 버튼(1) - 전체
		$('.categories>li:eq(8)').children('a').click(function(){
			$(location).attr("href", "/user/inquiry/list");
		});
		
		//카테고리 버튼(2) - 모임
		$('.categories>li:eq(6)').children('a').click(function(){
			$(location).attr("href", "/user/inquiry/list?type=1");
		});
		
		//카테고리 버튼(3) - 계정
		$('.categories>li:eq(4)').children('a').click(function(){			
			$(location).attr("href", "/user/inquiry/list?type=2");
		});
		
		//카테고리 버튼(4) - 서비스
		$('.categories>li:eq(2)').children('a').click(function(){			
			$(location).attr("href", "/user/inquiry/list?type=3");
		});
		
		//카테고리 버튼(5) - 이벤트
		$('.categories>li:eq(0)').children('a').click(function(){
			$(location).attr("href", "/user/inquiry/list?type=4");
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
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});	
	
	//	선택삭제
	function deleteValue() {
		var valueArr = new Array();
		
		//체크된 상태의 checkbox input 셀렉터
// 		var list = $("input[name='RowCheck']:checked");
// 		console.log(list)
		
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
			
			if( chk ) {
				$.ajax({
					url : "/user/inquiry/delete", 
					type : 'POST',
					traditional : true,
					data : {	valueArr : valueArr},
					dataType : "json",
					success : function(jdata) {
						if (jdata.result = 1) {
							alert("삭제 완료");
							location.reload();
						} else {
							alert("삭제 실패");
	// 						location.replace("/user/inquiry/list");
						}
					}
				})
			}
		}
	}	

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

.banner {
	height: 300px;
	background-image: url('/resources/img/book(1).jpg');
	color: white;
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
			<p style="font-size: 50px; width: 300px; margin-left: 10px;">1:1 문의</p>
			</div>
			
			<div style="height: 20px;"></div>
			
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
			
			<div style="height: 8px;"></div>
			
			
			<c:if test="${login }">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 5%;"><input id="allCheck" type="checkbox" name="allCheck" /></th>
						<th style="width: 8%;">No.</th>
						<th style="width: 8%;">#</th>
						<th>Title</th>
						<th style="width: 15%;">Date</th>
						<th style="width: 8%;">Reply</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="num" value="${paging.totalCount - ((paging.curPage - 1) * 10) }"/>
					<c:forEach items="${list }" var="inquiry">
						<tr>
							<td><input type="checkbox" name="RowCheck" value="${inquiry.board_no }" /></td>
							<td>${num }</td>
							<td>
							<c:choose>
							<c:when test="${inquiry.type == 1 }">
							모임
							</c:when>
							<c:when test="${inquiry.type == 2 }">
							계정
							</c:when>
							<c:when test="${inquiry.type == 3 }">
							서비스
							</c:when>
							<c:when test="${inquiry.type == 4 }">
							이벤트
							</c:when>
							</c:choose>
							</td>
							<td><a
								href="/user/inquiry/view?board_no=${inquiry.board_no }">${inquiry.board_title }</a></td>
							<td style="font-size: 14px;"><fmt:formatDate value="${inquiry.board_date }"
									pattern="yyyy년 MM월 dd일" /></td>
							<td>
							<c:if test="${inquiry.check_reply == 1 }">
							<span class="glyphicon glyphicon-envelope"></span>
							</c:if>
							<c:if test="${inquiry.check_reply == 0 }">
							</c:if>
							</td>
						</tr>
					<c:set var="num" value="${num - 1 }"/>
					</c:forEach>
				</tbody>
			</table>


			<span class="pull-left">총 게시글 : ${paging.totalCount }개</span>

			
			<div style="height: 10px;"></div>
			
			<button id="btnDelete" class="btn pull-right" style="margin-right: 2px; border-color: #D3D3D3; background: white; color: gray;" onclick="deleteValue()">삭제</button>
			<button id="btnWrite" class="btn pull-right" style="margin-right: 2px; border-color: #D3D3D3; background: white; color: gray;">글쓰기</button>

			<div class="clearfix"></div>

			<div class="form-inline text-center">
					<input class="form-control" type="text" id="search1" name="search" value="${paramData.search }"/>
					<button id="btnSearch" class="btn" style="border-color: #D3D3D3; background: white; color: gray;">검색</button>
			</div>

			

			<c:if test="${not empty paramData.search }">
				<c:set var="searchParam" value="&search=${paramData.search }" />
			</c:if>
		
		</c:if>
		
		<c:import url="/WEB-INF/views/user/layout/inquiryPaging.jsp" />

		</div>
		<!-- .container -->

	</div>
	<!-- .wrap -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />