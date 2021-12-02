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
.famous-tb  {border-collapse:collapse;border-spacing:0;margin:15px auto;}
.famous-tb td{border:none; font-size:14px; overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb th{border:none; font-size:14px; font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb .famous-tb-center{border-color:inherit;text-align:center;vertical-align:top}
.famous-tb .famous-tb-left{border-color:inherit;text-align:left;vertical-align:top}
.famous-tb .famous-tb-right{border-color:inherit;text-align:right;vertical-align:top}
tbody.famous-board tr:nth-child(1) {border-bottom: 1px solid gray}
tbody.famous-board tr:nth-child(2) {border-bottom: 1px solid gray}

/* 본문 */
.review-tb  {border-collapse:collapse;border-spacing:0;margin:15px auto;}
.review-tb td{border:none; font-size:14px; overflow:hidden;padding:10px 5px;word-break:normal;}
.review-tb th{border:none; font-size:14px; font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
#review-title {padding:10px; font-size:20px; font-weight: bold;}
#review-content {padding:30px;}
.review-tb .review-tb-center{border-color:inherit;text-align:center;vertical-align:top}
.review-tb .review-tb-left{border-color:inherit;text-align:left;vertical-align:top}
.review-tb .review-tb-right{border-color:inherit;text-align:right;vertical-align:top}
tbody.review-board tr:nth-child(1) {border-bottom: 1px solid gray}
tbody.review-board tr:nth-child(2) {border-bottom: 1px solid gray}


td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}

</style>

<div class="container">

<c:if test="${empty famous and empty review}">
<div><h1>삭제된 글입니다.</h1></div>

</c:if>

<c:if test="${not empty famous }">
<table class="famous-tb" style="undefined;table-layout: fixed; width: 1000px">
<colgroup>
<col style="width: 240px">
<col style="width: 450px">
<col style="width: 300px">
</colgroup>
<tbody class="famous-board">
  <tr>
    <td class="famous-tb-left" >글 번호: ${famous.famous_no }</td>
    <td class="famous-tb-right" colspan="2">
    작성자: ${famous.nick }<br>
    작성일: <fmt:formatDate value="${famous.famous_date }" pattern="yyyy. MM. dd HH:mm"/>
    </td>
  </tr>
  <tr>
    <td class="famous-tb-content" colspan="3"><div id="review-content">${famous.famous_content }</div></td>
  </tr>
  <tr>
    <td class="famous-tb-left">
	</td>
    <td class="famous-tb-right" colspan="2">
		<a href="/admin/report/penalty?user_no=${famous.user_no }"><button class="btn-black">작성자 제재</button></a>
		<a href="/admin/report/famous/delete?famous_no=${famous.famous_no }"><button class="btn-black">글 삭제</button></a>
    </td>
  </tr>
</tbody>
</table>
</c:if>

<c:if test="${not empty review }">
<table class="review-tb" style="undefined;table-layout: fixed; width: 1000px">
<colgroup>
<col style="width: 240px">
<col style="width: 450px">
<col style="width: 300px">
</colgroup>
<thead>
  <tr>
    <th class="review-tb-center" colspan="3"><div id="review-title">${review.review_title }</div></th>
  </tr>
</thead>
<tbody class="review-board">
  <tr>
    <td class="review-tb-left" ></td>
    <td class="review-tb-right" colspan="2">
    작성자: ${review.nick } &Iota; 조회수:  ${review.review_views }<br>
    작성일: <fmt:formatDate value="${review.review_date }" pattern="yyyy. MM. dd HH:mm"/>
    </td>
  </tr>
  <tr>
    <td class="review-tb-content" colspan="3"><div id="review-content">${review.review_content }</div></td>
  </tr>
  <tr>
    <td class="review-tb-left">
	</td>
    <td class="review-tb-right" colspan="2">
		<a href="/admin/report/penalty?user_no=${review.user_no }"><button class="btn-black">작성자 제재</button></a>
		<a href="/admin/report/review/delete?review_no=${review.review_no }"><button class="btn-black">글 삭제</button></a>
    </td>
  </tr>
</tbody>
</table>
</c:if>


<br>
<br>

<div class="center">
	<a href="/admin/report/list"><button class="btn-brown" style="width:50px">목록</button></a>
</div>


</div><!-- .container -->


<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />


