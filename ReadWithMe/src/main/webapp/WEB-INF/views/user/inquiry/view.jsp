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

$(document).ready(function(){
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
// 		$form = $("<form>").attr({
// 			action: "/comment/insert",
// 			method: "post"
// 		}).append(
// 			$("<input>").attr({
// 				type:"hidden",
// 				name:"board_no",
// 				value:"${inquiry.board_no }"
// 			})
// 		).append(
// 			$("<textarea>")
// 				.attr("name", "content")
// 				.css("display", "none")
// 				.text($("#commentContent").val())
// 		);
// 		$(document.body).append($form);
// 		$form.submit();
		
		var board_no = "${inquiry.board_no}";
		var content = $("#commentContent").val();
		
		$.ajax({
			url: "/comment/insert",
			type: 'post',
			data: {
				board_no : board_no,
				content : content
			},
			success: function(){
				window.location.reload();
			},
			eror: function(){
				alert("에러");
			}		
		});
		
		
	}); //$("#btnCommInsert").click() end
	
	//	댓글확인 토글 버튼
	$(".toggleForComment").click(function(){
		console.log("입력");
		$("#toggle").toggle();
		
	});
	
});

function deleteComment(comment_no) {
	$.ajax({
		type: "post"
		, url: "/comment/delete"
		, dataType: "json"
		, data: {
			comment_no: comment_no
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+comment_no+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

//댓글 수정
function updateComment(comment_no, content) {
	
	console.log("클릭");
	
	//	댓글 수정란
	var htmls = "";
	
	htmls += "<div>";
	htmls += "<input type='text' id='editContent' value=";
	htmls += content;
	htmls += ">";
	htmls += "<span>";
	htmls += "<span class='saveComment' onclick=" + "updateReply(" + comment_no + ");" + ">저장</span>";
	htmls += "<span class='cancelComment' onclick='cancelReply()'>취소</span>";
	htmls += "</span>";
	htmls += "</div>";
	
	$("#content" + comment_no).replaceWith(htmls);
	
}
	
	
function updateReply(comment_no) {
	
	var content = $("#editContent").val();
	
	console.log(content);
	
	//	댓글 번호, 댓글 내용 전달 
	$.ajax({
		type: "post",
		url : "/admin/comment/update",
		data : {
			comment_no : comment_no,
			content : content
		},
		success : function() {
			alert("성공");
		},
		error : function() {
			alert("에러");
		}
	});
	
	window.location.reload();
	
}
	function cancelReply(){
		window.location.reload();
	}

</script>

<style type="text/css">

.banner {
	height: 180px;
	background-image: url('/resources/img/book(1).jpg');
	color: white;
}

.toggleForComment {
	cursor: pointer;
}

#toggle {
	display: none;
}

#commentContent {
	width: 600px;
	height: 34px;
	margin-bottom: 30px;
	border: 1px solid #D3D3D3;
}

.deleteComment {
	cursor: pointer;
}

#editContent{
	border: 1px solid #D3D3D3;
}

.saveComment {
	color: gray;
	cursor: pointer;
	margin-right: 2px;
}

.cancelComment{
	color: gray;
	cursor: pointer;
}

</style>

</head>
<body>

	<div class="container">

		<div style="height: 50px;"></div>

		<div class="banner">
			<div style="height: 50px;"></div>
			<h1>1:1질문</h1>
		</div>

		<div style="height: 30px;"></div>

		<table class="table table-bordered">
			<tr>
				<td>글번호</td>
				<td>${inquiry.board_no }</td>
				<td>추천수</td>
				<td id="recommend">${cntRecommend }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>ReadWithMe</td>
				<td>작성일</td>
				<td><fmt:formatDate value="${inquiry.board_date }"
						pattern="yyyy년 MM월 dd일" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${inquiry.board_title }</td>
			</tr>
			<tr>
				<td colspan="4">본문</td>
			</tr>
			<tr>
				<td colspan="4">${inquiry.board_content }</td>
			</tr>
		</table>

		<a href="/user/inquiry/download?file_no=${inquiry_file.file_no }">${inquiry_file.origin_name }</a>

		<%-- <a href="/admin/faq/download?file_no=${FAQfile.fileNo }">${FAQfile.originName }</a> --%>

		<div class="text-center">
						<a href="/user/inquiry/list"><button class="btn"
								style="border-color: #D3D3D3; background: white; color: gray;">목록</button></a>
<%-- 			<c:if test="${id eq inquiry.user_no }"> --%>
				<a href="/user/inquiry/update?board_no=${inquiry.board_no }"><button
						class="btn" style="border-color: #D3D3D3; background: white; color: gray;">수정</button></a>
				<a href="/user/inquiry/delete?board_no=${inquiry.board_no }"><button
						class="btn" style="border-color: #D3D3D3; background: white; color: gray;">삭제</button></a>
<%-- 			</c:if> --%>
		</div>

		<div style="height: 50px;"></div>
		
		<div class="toggleForComment" style="border: 1px solid #D3D3D3; width: 100px; height: 29px; text-align: center; color: gray;">답변</div> *댓글창을 활용하시면 관리자에게 더 자세히 물어보실 수 있습니다.
		
		<div style="height: 20px;"></div>
		
		<div id="toggle">
		
		<!-- 비로그인상태 -->
		<%-- 	<c:if test="${not login }"> --%>
		<!-- 	<strong>로그인이 필요합니다</strong><br> -->
		<!-- 	<button onclick='location.href="/member/login";'>로그인</button> -->
		<!-- 	<button onclick='location.href="/member/join";'>회원가입</button> -->
		<%-- 	</c:if> --%>

		<!-- 로그인상태 -->
		<%-- 	<c:if test="${login }"> --%>
		<!-- 댓글 입력 -->
		<div class="form-inline text-center pull-left">
			<input type="text" id="commentContent"/>
		</div>
		
		<div>
		<button id="btnCommInsert" class="btn"
				style="border-color: #D3D3D3; background: white; color: gray;">입력</button>
		</div>
		<!-- 댓글 입력 end -->
		<%-- 	</c:if> --%>
		
		<!-- 댓글 리스트 -->
		<table class="table table-condensed table-bordered">
			<tbody id="commentBody">
				<c:forEach items="${commentList }" var="comment">
					<tr data-commentno="${comment.comment_no }">
						<td style="width: 10%;">${comment.id }</td>
						<!-- 닉네임으로 해도 좋음 -->
						<td style="width: 50%;">
						<div id="content${comment.comment_no }"
								style="border-color: skyblue; border-radius: 3px;">${comment.content }</div>
						</td>
						<td style="width: 8%; color: gray;"><fmt:formatDate
								value="${comment.write_date }" pattern="yyyy.MM.dd hh:mm" /></td>
						<td style="width: 2.5%;">
						<span
							onclick="updateComment(${comment.comment_no}, '${comment.content }');"
							style="cursor: pointer; color: gray;">수정</span>
						</td>
						<td style="width:2.5%;">
						<c:if test="${sessionScope.id eq comment.id }">
						<span class="deleteComment" onclick="deleteComment(${comment.comment_no });" style="color: gray;">삭제</span>
						</c:if>
						</td>

					</tr>
				</c:forEach>
		</table>
		<!-- 댓글 리스트 end -->

	</div>
	<!-- 댓글 처리 end -->

	</div>

	</div>
	<!-- .container -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />