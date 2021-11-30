<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<script type="text/javascript">
$(document).ready(function() {
	if(${isRecommend }){
		$("#btnRecommend")
			.addClass("btn-rec-warning")
			.html('추천 취소');
	} else{
		$("#btnRecommend")
			.addClass("btn-rec-origin")
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
					.removeClass("btn-rec-origin")
					.addClass("btn-rec-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#btnRecommend")
					.removeClass("btn-rec-warning")
					.addClass("btn-rec-origin")
					.html('추천');
				
				}
				
				//추천수 적용
				$("#recommend").html("추천 수: " + data.cnt);
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
				.text($("#comment-content").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end
	
// 	$("#commentTb").on("click", ".commentUpdate", function(){
// 		alert("댓글 수정버튼 클릭");
// 	});

});


//댓글 수정 입력 창 활성화
function updateInput(comment_no, th) {
// 	console.log( $(th).parents("table#commentTb [data-comment_no='"+ comment_no +"']") )
// 	console.log( $(th).parents("table#commentTb [data-comment_no='"+ comment_no +"']").find("td.review-comment-content").html() )

	var $tb = $(th).parents("table#comment-tb [data-comment_no='"+ comment_no +"']");
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
			, comment_content: $(th).parents("table#comment-tb [data-comment_no='"+ comment_no +"']").find("input[name='comment_content']").val()
		}
		, success: function(data){
			if(data.success) {
				
				location.href="/user/review/view?review_no=${viewReview.review_no}";
				
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
.container {margin:20px auto; border: 1px solid gray; border-radius:10px;width:1100px; padding:10px 30px;}

/* 본문 */
.review-tb  {border-collapse:collapse;border-spacing:0;margin:15px auto;}
.review-tb td{border:none; font-size:14px; overflow:hidden;padding:10px 5px;word-break:normal;}
.review-tb th{border:none; font-size:14px; font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
#review-title {padding:10px; font-size:24px; font-weight: bold;}
#review-content {padding:50px;}
tbody.review-board tr:nth-child(1) {border-bottom: 1px solid gray}
tbody.review-board tr:nth-child(2) {border-bottom: 1px solid gray}

.review-tb .review-tb-center{border-color:inherit;text-align:center;vertical-align:top;}
.review-tb .review-tb-left{border-color:inherit;text-align:left;vertical-align:middle;}
.review-tb .review-tb-right{border-color:inherit;text-align:right;vertical-align:top;}
#recommend {display: inline-block;}

/* 파일 */
.review-file {margin:0 auto;text-align:left;width:1000px;font-size:14px;}
.review-file > a{text-decoration: none;}

/* 댓글 */
#comment-write {margin:15px auto;text-align: left;width:1000px;}
#comment-write > input {margin-bottom: 5px;}
#comment-write > textarea, button {vertical-align: middle;}
#comment-tb {margin:0 auto; width:1000px;}

.comment  {border-collapse:collapse;border-spacing:0;}
.comment td{border-color:1px solid black;font-size:14px; overflow:hidden;padding:2px 0px;word-break:normal;}
.comment .comment-nick{border-color:inherit;text-align:left;vertical-align:middle;}
.comment .comment-nick > img {text-align:center;vertical-align:middle;}
.comment .comment-content{border-color:inherit;text-align:left;vertical-align:middle;}
.comment .comment-date{border-color:inherit;text-align:right;vertical-align:middle;font-size: 12px; color:gray;}
.comment .comment-btn{border-color:inherit;text-align:right;vertical-align:middle;}

/* 버튼 */
.btn-rec-origin {border:none;box-shadow: 1px 1px 1px gray;border-radius:3px;background-color:#FFF;color:black;font-size:12px;}
.btn-rec-primary {border:none;box-shadow: 1px 1px 1px gray;border-radius:3px;background-color:#9f8170;color:#FFF;font-size:12px;}
.btn-rec-warning {border:none;box-shadow: 1px 1px 1px gray;border-radius:3px;background-color:#FFF;color:red;font-size:12px;}


td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}

</style>

<div class="container">


<table class="review-tb" style="undefined;table-layout: fixed; width: 1000px">
<colgroup>
<col style="width: 240px">
<col style="width: 450px">
<col style="width: 300px">
</colgroup>
<thead>
  <tr>
    <th class="review-tb-center" colspan="3"><div id="review-title">${viewReview.review_title }</div></th>
  </tr>
</thead>
<tbody class="review-board">
  <tr>
    <td class="review-tb-left" >
	    <c:if test="${login }">
		<button id="btnRecommend" class="btn-rec-origin">추천</button>
		</c:if>
    </td>
    <td class="review-tb-right" colspan="2">
    작성자: ${viewReview.nick } &Iota; 조회수:  ${viewReview.review_views }<br>
    <div style="display:inline-block; color:gray; font-size:12px;"><fmt:formatDate value="${viewReview.review_date }" pattern="yyyy. MM. dd HH:mm"/></div>
    </td>
  </tr>
  <tr>
    <td class="review-tb-content" colspan="3"><div id="review-content">${viewReview.review_content }</div></td>
  </tr>
  <tr>
    <td class="review-tb-left" style="vertical-align: middle;">
		<div id="recommend">추천 수: ${cntRecommend }</div>
	</td>
    <td class="review-tb-right" colspan="2">
    	<c:if test="${user_no eq viewReview.user_no }">
		<a href="/user/review/update?review_no=${viewReview.review_no }"><button class="btn-none">수정</button></a> | 
		<a href="/user/review/delete?review_no=${viewReview.review_no }"><button class="btn-none">삭제</button></a>
		</c:if>
    </td>
  </tr>
</tbody>
</table>




<%-- <h1>후기 게시글 ${viewReview.review_no }</h1> --%>
<%-- <c:if test="${login }"> --%>
<!-- <button id="btnRecommend" class="btn pull-right">추천</button> -->
<%-- </c:if> --%>
<!-- <div class="clearfix"></div> -->
<!-- <hr> -->

<!-- <table class="table table-bordered"> -->
<!-- <tr> -->
<%-- 	<td class="info">글번호</td><td>${viewReview.review_no }</td> --%>
<%-- 	<td class="info">추천수</td><td id="recommend">${cntRecommend }</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td class="info">닉네임</td><td>${viewReview.nick }</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td class="info">조회수</td><td>${viewReview.review_views }</td> --%>
<%-- 	<td class="info">작성일</td><td><fmt:formatDate value="${viewReview.review_date }" pattern="yy-MM-dd HH:mm:ss"/></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td class="info">제목</td><td colspan="3">${viewReview.review_title }</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<td class="info" colspan="4">본문</td> -->
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td colspan="4">${viewReview.review_content }</td> --%>
<!-- </tr> -->
<!-- </table> -->

<%-- <a href="/user/review/download?file_no=${reviewfile.file_no }">${reviewfile.origin_name }</a> --%>

<!-- <div class="text-center"> -->
<!-- 	<a href="/user/review/list"><button class="btn btn-default">목록</button></a> -->
<%-- 	<c:if test="${user_no eq viewReview.user_no }"> --%>
<%-- 		<a href="/user/review/update?review_no=${viewReview.review_no }"><button class="btn btn-primary">수정</button></a> --%>
<%-- 		<a href="/user/review/delete?review_no=${viewReview.review_no }"><button class="btn btn-danger">삭제</button></a> --%>
<%-- 	</c:if> --%>
<!-- </div> -->

<div class="review-file">
첨부파일: <a href="/user/review/download?file_no=${reviewfile.file_no }">${reviewfile.origin_name }</a>
</div>

<br>
<hr>

<!-- 댓글 처리 -->

	<div id="comment-write">
			<!-- 비로그인상태 -->
<%-- 			<c:if test="${not login }"> --%>
<!-- 			<strong>로그인이 필요합니다</strong><br> -->
<!-- 			<button onclick='location.href="/login";' class="btn-white">로그인</button> -->
<!-- 			<button onclick='location.href="/join";' class="btn-white">회원가입</button> -->
<%-- 			</c:if> --%>
			
			<!-- 로그인상태 -->
			<c:if test="${login }">
			<!-- 댓글 입력 -->
				<input type="text" size="10" class="form-control" id="commentWriter" value="${user_nick }" readonly="readonly" style="border:1px solid black; border-radius:3px; background-color:#ccc;"/>
				<br><textarea rows="2" cols="130" class="form-control" id="comment-content"></textarea>
				<button id="btnCommInsert" class="btn-brown" style="width:40px; height:40px;">작성</button>
			<!-- 댓글 입력 end -->
			</c:if>
	</div>

	<div id="commentContent">

		<!-- 댓글 리스트 -->
<!-- 		<table id="comment-tb" class="comment"> -->
<!-- 		<thead> -->
<!-- 		<tr> -->
<!-- 			<th style="width: 5%;">번호</th> -->
<!-- 			<th style="width: 10%;">작성자</th> -->
<!-- 			<th style="width: 40%;">댓글</th> -->
<!-- 			<th style="width: 20%;">작성일</th> -->
<!-- 			<th style="width: 15%;"></th> -->
<!-- 		</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody id="commentBody"> -->
<%-- 		<c:forEach items="${commentList }" var="comment"> --%>
<%-- 		<tr data-comment_no="${comment.comment_no }"> --%>
<%-- 			<td style="width: 5%;">${comment.rnum }</td> --%>
<%-- 			<td style="width: 10%;">${comment.nick }</td> --%>
<%-- 			<td class="review-comment-content" style="width: 50%;">${comment.comment_content }</td> --%>
<%-- 			<td style="width: 20%;"><fmt:formatDate value="${comment.comment_write_date }" pattern="yy.MM.dd hh:mm:ss" /></td> --%>
<!-- 			<td style="width: 5%;"> -->
<%-- 				<c:if test="${sessionScope.user_no eq comment.user_no }"> --%>
<%-- 				<button class="commentUpdate btn-gray" onclick="updateInput(${comment.comment_no }, this);">수정</button> --%>
<%-- 				<button class="btn-gray" style="display:none;" onclick="updateComment(${comment.comment_no }, this);">적용</button> --%>
<%-- 				<button class="btn-gray" onclick="deleteComment(${comment.comment_no });">삭제</button> --%>
<%-- 				</c:if> --%>
<!-- 			</td> -->
			
<!-- 		</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		</tbody> -->
<!-- 		</table> 댓글 리스트 end -->
		<table id="comment-tb" class="comment" style="undefined;table-layout: fixed; width: 1000px">
			
			<colgroup>
				<col style="width: 800px">
				<col style="width: 200px">
			</colgroup>
			
			<tbody id="commentBody">
				<c:forEach items="${commentList }" var="comment">
				 
				  <tr data-comment_no="${comment.comment_no }">
				    <td class="comment-nick"><img alt="profile" src="https://i.imgur.com/G5gV56A.png" width="14px" height="14px"> ${comment.nick }</td>
				    <td class="comment-date"><fmt:formatDate value="${comment.comment_write_date }" pattern="yy.MM.dd hh:mm:ss" /></td>
				  </tr>
				 
				  <tr data-comment_no="${comment.comment_no }">
				    <td class="review-comment-content comment-content">${comment.comment_content }</td>
				    <td class="comment-btn">
						<c:if test="${sessionScope.user_no eq comment.user_no }">
						<button class="commentUpdate btn-none" onclick="updateInput(${comment.comment_no }, this);">수정</button>
						<button class="btn-none" style="display:none;" onclick="updateComment(${comment.comment_no }, this);">적용</button>
						<button class="btn-none" onclick="deleteComment(${comment.comment_no });">삭제</button>
						</c:if>
				    </td>
				   </tr>
				</c:forEach>
			</tbody>
			
		</table>

	</div>	<!-- 댓글 처리 end -->

<br>
<br>

<div class="center">
	<a href="/user/review/list"><button class="btn-brown" style="width:50px">목록</button></a>
</div>


</div><!-- .container -->


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />


