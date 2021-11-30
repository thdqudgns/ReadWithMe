<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<script type="text/javascript">

//댓글 삭제
function deleteComment(comment_no) {
	$.ajax({
		type: "post"
		, url: "/admin/review/comment/delete"
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
.review-tb td{border:1px solid black; font-size:14px; overflow:hidden;padding:10px 5px;word-break:normal;}
.review-tb th{border:1px solid black; font-size:14px; font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
#review-title {padding:10px; font-size:20px; font-weight: bold;}
#review-content {padding:30px;}


.review-tb .review-tb-center{border-color:inherit;text-align:center;vertical-align:top}
.review-tb .review-tb-left{border-color:inherit;text-align:left;vertical-align:top}
.review-tb .review-tb-right{border-color:inherit;text-align:right;vertical-align:top}
#recommend {display: inline-block;}

/* 파일 */
.review-file {margin:0 auto;text-align:left;width:1000px;}
.review-file > a{text-decoration: none;}

/* 댓글 */
#comment-write {margin:15px auto;text-align: center;width:1000px;}
#comment-write > textarea, button {vertical-align: middle;}
#comment-tb {margin:0 auto; width:1000px;}

/* 버튼 */
.btn-rec-origin {border:none;background-color:#FFF;color:black;font-size:14px;border-radius:20%;}
.btn-rec-primary {border:none;background-color:#9f8170;color:#FFF;font-size:14px; border-radius:20%;}
.btn-rec-warning {border:none;background-color:#FFF;color:red;font-size:14px;border-radius:20%;}


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
<tbody>
  <tr>
    <td class="review-tb-left" ></td>
    <td class="review-tb-right" colspan="2">
    작성자: ${viewReview.nick } &Iota; 조회수:  ${viewReview.review_views }<br>
    작성일: <fmt:formatDate value="${viewReview.review_date }" pattern="yyyy. MM. dd HH:mm"/>
    </td>
  </tr>
  <tr>
    <td class="review-tb-content" colspan="3"><div id="review-content">${viewReview.review_content }</div></td>
  </tr>
  <tr>
    <td class="review-tb-left">
		<div id="recommend">${cntRecommend }</div>
	</td>
    <td class="review-tb-right" colspan="2">
		<a href="/admin/review/delete?review_no=${viewReview.review_no }"><button class="btn-black">삭제</button></a>
    </td>
  </tr>
</tbody>
</table>


<div class="review-file">
첨부파일: <a href="/admin/review/download?file_no=${reviewfile.file_no }">${reviewfile.origin_name }</a>
</div>

<br>
<hr>

<!-- 댓글 처리 -->

	<div id="commentContent">
		<!-- 댓글 리스트 -->
		<table id="comment-tb" class="comment">
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
				<button class="btn-gray" onclick="deleteComment(${comment.comment_no });">삭제</button>
			</td>
			
		</tr>
		</c:forEach>
		</tbody>
		</table> <!-- 댓글 리스트 end -->
	</div>	<!-- 댓글 처리 end -->

<br>
<hr>
<br>

<div class="center">
	<a href="/admin/review/list"><button class="btn-brown" style="width:50px">목록</button></a>
</div>


</div><!-- .container -->


<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />


