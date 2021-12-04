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
<div id="seachMemberForm" style="text-align: center; margin-top: 30px;">
<form id="adminMemberForm" method="get">
<input type="hidden" id="admin" value="${userLv }">

<div id="clsfc">
<label for="selectBox">이메일</label>
<select name="selectBox" id="selectBox">
<option value="email" selected="selected">이메일</option>
<option value="nick">닉네임</option>
</select>
</div>


<div id="clsfc">
<label for="selectBox">이메일</label>
<select id="selectBox" name="selectBox">
<option value="email" selected="selected">이메일</option>
<option value="nick">닉네임</option>
</select>
</div>


<input type="text" name="search" id="search">
<button id="seachMember">검색</button>
</form>
</div>
<div id="checkArea">
<input type="radio" name="member" value="member" checked="checked" id="memberArea">     
<label for="memberArea"><span></span>회원관리 &nbsp&nbsp&nbsp</label>
<input type="radio" name="member" id="banMemberArea">
<label for="banMemberArea"><span></span>제재 회원관리</label>
<br>
</div>

<div id="memberTable">
<form method="get" id="banForm1">

<div class="banClass">
<button id="banMemberBtn1">제재</button>
<button id="deleteBanMemberBtn1">제재 해제</button>
</div>

<table class="table-hover" style="margin: 0 auto; margin-top: 10px;">
	<tr>
		<th><input type="checkbox" name="memberCheck" id="chkAll"></th>
		<th>이메일</th>
		<th>닉네임</th>
		<th>가입일</th>
		<th>성별</th>
		<th>제재 여부</th>
		<th>관리자 권한 부여</th>
	</tr>
	<c:forEach items="${memberList }" var="list">
	<tr>
		<td><input type="checkbox" value="${list.USER_NO }" name="memberCheck"></td>
		<td>${list.EMAIL }</td>
		<td>${list.NICK }</td>
		<td><fmt:formatDate value="${list.CREATE_DATE }" pattern="yyyy.MM.dd HH:mm"/></td>
		<td>${list.GENDER }</td>
		<td>
		<c:if test="${list.USER_LV == '0'}">
		O
		</c:if>
		<c:if test="${list.USER_LV != '0'}">
		X
		</c:if>
		</td>
	<c:choose>
		<c:when test="${list.USER_LV <= '1'}">
		<form action="/admin/set" id="setAdmin" method="get">
			<td><button class="btn btn-default setAdminBtn" type="button">관리자 권한지정</button></td>
			<input type="hidden" name="user_no" value="${list.USER_NO }">
			<input type="hidden" name="val" value="set">
		</form>
		</c:when>
		<c:when test="${list.USER_LV > '1'}">
		<form action="/admin/set" id="delAdmin" method="get">
			<td><button class="delAdminBtn btn btn-danger" type="button">관리자 권한삭제</button></td>
			<input type="hidden" name="user_no" value="${list.USER_NO }">
			<input type="hidden" name="val" value="del">
		</form>
		</c:when>
	</c:choose>
	</tr>
	</c:forEach>

</table>

</form>
</div>


<div id="banMemberTable">
<form method="get" id="banForm" >
<div class="banClass">
<button id="banMemberBtn">제재</button>
<button id="deleteBanMemberBtn">제재 해제</button>
</div>

<table >
	<tr>
		<th><input type="checkbox" name="banMemberCheck" id="banChkAll"></th>
		<th>이메일</th>
		<th>닉네임</th>
		<th>제재일</th>
		<th>만료일</th>
	</tr>
	<c:forEach items="${banMemberList }" var="list">
	<tr>
		<td><input type="checkbox" value="${list.USER_NO }" name="banMemberCheck"></td>
		<td>${list.EMAIL }</td>
		<td>${list.NICK }</td>
		<td><fmt:formatDate value="${list.START_BAN }" pattern="yyyy.MM.dd HH:mm"/></td>
		<td><fmt:formatDate value="${list.END_BAN }" pattern="yyyy.MM.dd HH:mm"/></td>
	</tr>
	</c:forEach>

</table>
</form>
</div>

</section>
<c:import url="/WEB-INF/views/admin/layout/memberPaging.jsp" />

<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />