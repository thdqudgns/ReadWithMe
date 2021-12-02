<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">

</script>

<style type="text/css">
.container {margin:20px auto; border: 1px solid gray; border-radius:10px;width:1100px; padding:10px 30px;}

/* 본문 */
.comment-tb  {border-collapse:collapse;border-spacing:0;margin:15px auto;}
.comment-tb td{border:none; font-size:14px; overflow:hidden;padding:10px 5px;word-break:normal;}
.comment-tb th{border:none; font-size:14px; font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
#comment-content {padding:30px;}
.comment-tb .comment-tb-center{border-color:inherit;text-align:center;vertical-align:top}
.comment-tb .comment-tb-left{border-color:inherit;text-align:left;vertical-align:top}
.comment-tb .comment-tb-right{border-color:inherit;text-align:right;vertical-align:top}
tbody.comment-board tr:nth-child(1) {border-bottom: 1px solid gray}
tbody.comment-board tr:nth-child(2) {border-bottom: 1px solid gray}

td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}

</style>

<div class="container">

<c:if test="${empty comment}">
<div><h1>삭제된 댓글입니다.</h1></div>

</c:if>

<c:if test="${not empty comment }">
<table class="comment-tb" style="undefined;table-layout: fixed; width: 1000px">
<colgroup>
<col style="width: 240px">
<col style="width: 450px">
<col style="width: 300px">
</colgroup>
<tbody class="comment-board">
  <tr>
    <td class="comment-tb-left" >댓글 번호: ${comment.comment_no }</td>
    <td class="comment-tb-right" colspan="2">
    작성자: ${comment.nick }<br>
    작성일: <fmt:formatDate value="${comment.comment_write_date }" pattern="yyyy. MM. dd HH:mm"/>
    </td>
  </tr>
  <tr>
    <td class="comment-tb-content" colspan="3"><div id="comment-content">${comment.comment_content }</div></td>
  </tr>
  <tr>
    <td class="comment-tb-left">
	</td>
    <td class="comment-tb-right" colspan="2">
		<a href="/admin/report/comment/penalty?user_no=${comment.user_no }"><button class="btn-black">작성자 제재</button></a>
		<a href="/admin/report/comment/delete?comment_no=${comment.comment_no }"><button class="btn-black">댓글 삭제</button></a>
    </td>
  </tr>
</tbody>
</table>
</c:if>

<br>
<br>

<div class="center">
	<a href="/admin/report/comment/list"><button class="btn-brown" style="width:50px">목록</button></a>
</div>


</div><!-- .container -->


<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />


