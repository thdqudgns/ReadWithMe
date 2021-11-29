<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/admin/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"board_no",
				value:"${inquiry.board_no }"
			})
		).append(
			$("<textarea>")
				.attr("name", "content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end
	
	//	답변 완료 버튼
	$("#check_reply").click(function(){
		$.ajax({
			url : "/admin/inquiry/check_reply",
			data : {
				data_for_board_no : "${inquiry.board_no}"
			},
			method : 'post',
			success : function() {
				alert("답변 완료");
			},
			error : function() {
				alert("실패");
			}
		})
	});
	
});

function deleteComment(comment_no) {
	$.ajax({
		type: "post"
		, url: "/admin/comment/delete"
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

// 댓글 수정
function updateComment(comment_no, content) {
	
	//	댓글 수정란
	var htmls = "";
	
	htmls += "<div>";
	htmls += "<span>";
	htmls += "<button onclick=" + "updateReply(" + comment_no + ");" + ">저장</button>";
	htmls += "<button onclick='cancelReply()'>취소</button>";
	htmls += "</span>";
	htmls += "<textarea class='form-control' id='editContent'>";
	htmls += content;
	htmls += "</textarea>";
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

</head>
<body>

<div class="container">

<h1>1:1 질문</h1>

<div style="height: 30px;"></div>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${inquiry.board_no }</td>
	<td class="info">추천수</td><td id="recommend">${cntRecommend }</td>
</tr>
<tr>
	<td class="info">아이디</td><td>ReadWithMe</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${inquiry.board_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${inquiry.board_title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${inquiry.board_content }</td>
</tr>
</table>

<%-- <a href="/admin/faq/download?file_no=${FAQfile.fileNo }">${FAQfile.originName }</a> --%>

<div class="text-center">
	<a href="/admin/inquiry/list"><button class="btn btn-default">목록</button></a>
	<button id="check_reply" class="btn btn-default">답변 완료</button>
	<c:if test="${id eq viewBoard.writerId }">
<%-- 		<a href="/admin/inquiry/update?board_no=${inquiry.board_no }"><button class="btn btn-primary">수정</button></a> --%>
<%-- 		<a href="/admin/inquiry/delete?board_no=${inquiry.board_no }"><button class="btn btn-danger">삭제</button></a> --%>
	</c:if>
</div>

<div style="height: 30px;"></div>

<h1>댓글</h1>
<div style="height: 30px;"></div>
<!-- 댓글 처리 -->
<div>

	<!-- 비로그인상태 -->
<%-- 	<c:if test="${not login }"> --%>
<!-- 	<strong>로그인이 필요합니다</strong><br> -->
<!-- 	<button onclick='location.href="/member/login";'>로그인</button> -->
<!-- 	<button onclick='location.href="/member/join";'>회원가입</button> -->
<%-- 	</c:if> --%>
	
	<!-- 로그인상태 -->
<%-- 	<c:if test="${login }"> --%>
	<!-- 댓글 입력 -->
	<div class="form-inline text-center pull-left" >
		<input type="text" size="10" class="form-control" id="commentWriter" value="${nick }" readonly="readonly"/>
		<textarea rows="1" cols="60" class="form-control" id="commentContent"></textarea>
		<button id="btnCommInsert" class="btn">입력</button>
	</div>	<!-- 댓글 입력 end -->
<%-- 	</c:if> --%>
	
	<div style="height: 80px;"></div>

	<!-- 댓글 리스트 -->
	<table class="table table-hover table-condensed" >
	<thead>
	<tr>
		<th style="width: 5%;">#</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 50%;">내용</th>
		<th style="width: 20%;">작성일</th>
		<th style="width: 10%;"></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="comment">
	<tr data-commentno="${comment.comment_no }">
		<td style="width: 5%;">${comment.rnum }</td>
		<td style="width: 10%;">${comment.id }</td><!-- 닉네임으로 해도 좋음 -->
		<td style="width: 50%;">
		<span id="content${comment.comment_no }" >
		${comment.content }
		</span>
		</td>
		<td style="width: 20%;"><fmt:formatDate value="${comment.write_date }" pattern="yy-MM-dd hh:mm:ss" /></td>
		<td style="width: 5%;">
			<button class="btn btn-xs" onclick="updateComment(${comment.comment_no}, ${comment.content });">수정</button>
			<c:if test="${sessionScope.id eq comment.id }">
			<button class="btn btn-xs"
				onclick="deleteComment(${comment.comment_no });" style="color: red;">x</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->

</div><!-- .container -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />