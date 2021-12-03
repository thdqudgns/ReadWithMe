<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<link href="/resources/css/adminMember.css" rel="stylesheet">
<script src="/resources/js/adminMember_script.js"></script>

<style type="text/css">
input[type="radio"] {
    display:none;
}

input[type="radio"] + label span {
	display:inline-block;
	width: 22px;height: 22px;
	margin: -2px 9px 0 4px;
	font-size: 0;
	vertical-align: middle;
    background:url('../resources/img/radio_brn.png')  no-repeat;
    cursor:pointer;
}
input[type="radio"]:checked + label span {
    background:url('../resources/img/radio_brn_slc.png') no-repeat;
}
</style>

<section>


<div id="memberTable">
<form method="get" id="banForm1">

<div class="banClass">
<button id="approvalBtn">승인</button>
<button id="deleteBtn">삭제</button>
</div>

<table class="table-hover" style="margin: 0 auto; margin-top: 10px;">
	<tr>
		<th><input type="checkbox" name="memberCheck" id="chkAll"></th>
		<th>모임</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>카테고리</th>
		<th>신청자 수</th>
		<th>승인여부</th>
	</tr>
	<c:forEach items="${memberList }" var="list">
	<tr>
		<td><input type="checkbox" value="${list.MEETING_NO }" name="memberCheck"></td>
		<td>${list.MEETING_TITLE }</td>
		<td>${list.NICK }</td>
		<td><fmt:formatDate value="${list.MEETING_RCR_START }" pattern="yyyy.MM.dd HH:mm"/></td>
		<td>${list.BOOK_CLASS_NAME }</td>
		<td>${list.CNT }</td>
		<td>
			<c:if test="${list.MEETING_APPROVED == '0'}">
			<p style="color:red;">미승인</p>
			</c:if>
			<c:if test="${list.MEETING_APPROVED != '0'}">
			승인
			</c:if>
		</td>
	</tr>
	</c:forEach>

</table>

</form>
</div>
<div id="seachMemberForm" style="text-align: center; margin-top: 30px;">
<form id="adminMemberForm" method="get">

<div id="clsfc">
<label for="selectBox">모임이름</label>
<select id="selectBox" name="selectBox">
<option value="email" selected="selected">모임이름</option>
<option value="nick">작성자</option>
</select>
</div>

<input type="text" name="search" id="search">
<button id="seachMember">검색</button>
</form>
</div>

</section>
<c:import url="/WEB-INF/views/admin/layout/paging.jsp" />

<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />