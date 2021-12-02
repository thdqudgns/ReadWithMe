<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
</script>

<style type="text/css">
table#report {table-layout: fixed;}
table#report > thead > tr > th {text-align: center;}
table#report > tbody > tr > td {text-align: center;}

</style>

<div class="container">
<br>

<h1>신고내역</h1>
<hr>

	<table id="report" class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 15%;">신고번호</th>
			<th style="width: 45%;">게시글 이동</th>
			<th style="width: 25%;">신고일</th>
			<th style="width: 15%;">삭제</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${rptCmtList }" var="rptCmtList">
		<tr>
			<td>${rptCmtList.report_no }</td>
			<td>
				<a href="/admin/report/comment/view?report_no=${rptCmtList.report_no }">
					<c:if test="${rptCmtList.comment_no ne 0}">
					후기 게시판 ${rptCmtList.comment_no }번 댓글
					</c:if>
				</a>
			</td>
			<td><fmt:formatDate value="${rptCmtList.report_date }" pattern="yyyy-MM-dd"/></td>
			<td>
				<c:if test="${rptCmtList.dele  eq 0}">
				<span style="color:black;">안 함</span>
				</c:if>
				<c:if test="${rptCmtList.dele  eq 1}">
				<span style="color:tomato;">완료</span>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<br><br>

<c:import url="/WEB-INF/views/admin/layout/adminReportCommentPaging.jsp" />

</div><!-- .container -->


<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />