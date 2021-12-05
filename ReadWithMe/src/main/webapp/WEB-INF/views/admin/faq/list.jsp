<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		//	글쓰기 버튼
		$("#btnWrite").click(function() {
			$(location).attr("href", "/admin/faq/write");
		});

		//	검색 버튼 클릭
		$("#btnSearch").click(function() {
			
			$(location).attr("href", "/admin/faq/list?type=${FAQ.type}&search=" + $("#search1").val());
	});

		//카테고리 버튼(1) - 전체
		$('.categories>li:eq(8)').children('a').click(function(){
			$(location).attr("href", "/admin/faq/list");
		});
		
		//카테고리 버튼(2) - 모임
		$('.categories>li:eq(6)').children('a').click(function(){
			$(location).attr("href", "/admin/faq/list?type=1");
		});
		
		//카테고리 버튼(3) - 계정
		$('.categories>li:eq(4)').children('a').click(function(){			
			$(location).attr("href", "/admin/faq/list?type=2");
		});
		
		//카테고리 버튼(4) - 서비스
		$('.categories>li:eq(2)').children('a').click(function(){			
			$(location).attr("href", "/admin/faq/list?type=3");
		});
		
		//카테고리 버튼(5) - 이벤트
		$('.categories>li:eq(0)').children('a').click(function(){
			$(location).attr("href", "/admin/faq/list?type=4");
		});

	})

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
		var url = "/admin/faq/delete"; // Controller로 보내고자 하는 URL
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
						location.replace("/admin/faq/list");
					} else {
						alert("삭제 실패");
					}
				}
			})
		}
	}
	
	//선택 등록
	function registerValue() {
		var url = "/admin/faq/register";	//Controller로 보내고자 하는 URL
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
				dataType: 'json',
				success : function(jdata) {
					if (jdata.result = 1) {
						alert("등록 완료");
						location.replace("/admin/faq/list");
					} else {
						alert("등록 실패");
					}
				}
			})
		}
	}
	
	//취소 버튼
	function cancelValue() {
		var url = "/admin/faq/cancel";
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
				dataType : 'json',
				success : function(jdata) {
					if (jdata = 1) {
						alert("취소 완료");
						location.replace("/admin/faq/list");
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

			<h1>자주묻는질문</h1>
			
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

			<table class="table table-hover">
				<thead class="table-dark">
					<tr>
						<th><input id="allCheck" type="checkbox" name="allCheck"/></th>
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
					<c:forEach items="${FAQList }" var="FAQ">
						<tr>
							<td><input type="checkbox" name="RowCheck" value="${FAQ.board_no }" /></td>
							<td>${FAQ.board_no }</td>
							<td>
							<c:choose>
							<c:when test="${FAQ.type == 1 }">
							모임
							</c:when>
							<c:when test="${FAQ.type == 2 }">
							계정
							</c:when>
							<c:when test="${FAQ.type == 3 }">
							서비스
							</c:when>
							<c:when test="${FAQ.type == 4 }">
							이벤트
							</c:when>
							</c:choose>
							</td>
							<td><a href="/admin/faq/view?board_no=${FAQ.board_no }">${FAQ.board_title }</a></td>
							<td><fmt:formatDate value="${FAQ.board_date }"
									pattern="yyyy.MM.dd" /></td>
							<td><fmt:formatDate value="${FAQ.updated_date }"
									pattern="yyyy.MM.dd  HH:mm" /></td>
							<td>${FAQ.hit }</td>
							<td>
							<c:choose>
							<c:when test="${FAQ.register == 1}">
							<span class="glyphicon glyphicon-ok"
								style="color: green;"></span>
							</c:when>
							<c:when test="${FAQ.register == 0}">
							<span class="glyphicon glyphicon-minus"
								style="color: red;"></span>
							</c:when>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<span style="margin-left: 10px;">total : ${paging.totalCount }</span>

			<button id="btnCancel" class="btn pull-right"
				onclick="cancelValue();" style="border-color: gray; background:white; color:gray;">취소</button>
			<button id="btnRegister2" class="btn pull-right"
				onclick="registerValue();" style="margin-right: 2px; border-color: gray; background:white; color:gray;">등록</button>
			<button id="btnDelete" class="btn pull-right"
				onclick="deleteValue();" style="margin-right: 2px; border-color: gray; background:white; color:gray;">삭제</button>
			<button id="btnWrite" class="btn pull-right"
				style="margin-right: 2px; border-color: gray; background:white; color:gray;">글쓰기</button>
				
				

			<div class="clearfix"></div>

			<div class="form-inline text-center">
				<input class="form-control" type="text" id="search1"
					value="${paramData.search }" />
				<button id="btnSearch" class="btn" style="border-color: gray; background:white; color:gray;">검색</button>
			</div>

			<c:if test="${not empty param.search }">
				<c:set var="searchParam" value="&search=${paramData.search }" />
			</c:if>

			<c:import url="/WEB-INF/views/admin/layout/faqPaging.jsp" />

		</div>
		<!-- .container end -->

	</div>
	<!-- .wrap end -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />