<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	if(${isRecommend }){
		$("#btnRecommend")
			.addClass("btn-warning")
			.html('추천 취소');
	} else{
		$("#btnRecommend")
			.addClass("btn-primary")
			.html('추천');
	}
	
	$("#btnRecommend").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/user/review/recommend"
			, data: { "review_no": '${viewReview.review_no }' }
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#btnRecommend")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#btnRecommend")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('추천');
				
				}
				
				//추천수 적용
				$("#recommend").html(data.cnt);
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnRecommend").click() end
	
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/user/review/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"review_no",
				value:"${viewReview.review_no }"
			})
		).append(
			$("<textarea>")
				.attr("name", "comment_content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end

});

//댓글 수정 입력 창 활성화
function updateInput(th) {
// 	console.log( $(th).parents("table.comment") )
// 	console.log( $tb.find("td.review-comment-content") )

	var $tb = $(th).parents("table.comment");
	var beforeContent = $tb.find("td.review-comment-content").html();
	
	$tb.find("td.review-comment-content").html("")
	$("<input>").attr({
		type: "text"
		, name: "comment_content"
		, value: beforeContent
	}).appendTo( $tb.find("td.review-comment-content") )

	$(th).next().show();
	$(th).remove();
	
}

//댓글 수정
function updateComment(comment_no, th) {
	
	$.ajax({
		type: "post"
		, url: "/user/review/comment/update"
		, dataType: "json"
		, data: {
			comment_no: comment_no
			, comment_content: $(th).parent().prev().find("input[name='comment_content']").val()
		}
		, success: function(data){
			if(data.success) {
				
				location.href="/user/review/list?curPage=${paging.curPage}";
				
			} else {
				alert("글 수정 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}


//댓글 삭제
function deleteComment(comment_no) {
	$.ajax({
		type: "post"
		, url: "/user/review/comment/delete"
		, dataType: "json"
		, data: {
			comment_no: comment_no
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-comment_no='"+comment_no+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
</script>

<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>

<div class="container">

<h1>게시글 상세보기</h1>
<c:if test="${login }">
<button id="btnRecommend" class="btn pull-right">추천</button>
</c:if>
<div class="clearfix"></div>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${viewReview.review_no }</td>
	<td class="info">추천수</td><td id="recommend">${cntRecommend }</td>
</tr>
<tr>
	<td class="info">닉네임</td><td>${viewReview.nick }</td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewReview.review_views }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewReview.review_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewReview.review_title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewReview.review_content }</td>
</tr>
</table>

<a href="/user/review/download?file_no=${reviewfile.file_no }">${reviewfile.origin_name }</a>

<div class="text-center">
	<a href="/user/review/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${user_no eq viewReview.user_no }">
		<a href="/user/review/update?review_no=${viewReview.review_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/user/review/delete?review_no=${viewReview.review_no }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>

<!-- 댓글 처리 -->
<hr>
<div>

	<!-- 비로그인상태 -->
	<c:if test="${not login }">
	<strong>로그인이 필요합니다</strong><br>
	<button onclick='location.href="/login";'>로그인</button>
	<button onclick='location.href="/join";'>회원가입</button>
	</c:if>
	
	<!-- 로그인상태 -->
	<c:if test="${login }">
	<!-- 댓글 입력 -->
	<div class="form-inline text-center">
		<input type="text" size="10" class="form-control" id="commentWriter" value="${user_nick }" readonly="readonly"/>
		<textarea rows="2" cols="60" class="form-control" id="commentContent"></textarea>
		<button id="btnCommInsert" class="btn">입력</button>
	</div>	<!-- 댓글 입력 end -->
	</c:if>
	
	<!-- 댓글 리스트 -->
	<table class="comment table table-striped table-hover table-condensed">
	<thead>
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 40%;">댓글</th>
		<th style="width: 20%;">작성일</th>
		<th style="width: 15%;"></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="comment">
	<tr data-comment_no="${comment.comment_no }">
		<td style="width: 5%;">${comment.rnum }</td>
		<td style="width: 10%;">${comment.nick }</td>
		<td class="review-comment-content" style="width: 50%;">${comment.comment_content }</td>
		<td style="width: 20%;"><fmt:formatDate value="${comment.comment_write_date }" pattern="yy.MM.dd hh:mm:ss" /></td>
		<td style="width: 5%;">
			<c:if test="${sessionScope.user_no eq comment.user_no }">
			<button class="btn-gray" onclick="updateInput(this);">수정</button>
			<button class="btn-gray" style="display: none;" onclick="updateComment(${comment.comment_no }, this);">적용</button>
			<button class="btn-gray" onclick="deleteComment(${comment.comment_no });">삭제</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->

</div><!-- .container -->


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />


