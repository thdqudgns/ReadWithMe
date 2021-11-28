<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<script src="/resources/js/adminMember_script.js"></script>

<style type="text/css">
table {
	width: 80%;
	margin: 35px auto;
	border: 1px solid #000;
	border-collapse: collapse;
}

td, th {
	text-align: center;
	border: 1px solid #000;
	border-collapse: collapse;
}

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


<form id="adminMemberForm" method="get">
<input type="hidden" id="admin" value="${userLv }">

<select name="selectBox" id="selectBox">
<option value="email">이메일</option>
<option value="nick">닉네임</option>
</select>
<input type="text" name="search" id="search">
<button id="seachMember">검색</button>
</form>

<div id="checkArea">
<input type="radio" name="member" value="member" checked="checked" id="memberArea">     
<label for="memberArea"><span></span>회원관리 &nbsp&nbsp&nbsp</label>
<input type="radio" name="member" id="banMemberArea">
<label for="banMemberArea"><span></span>제재 회원관리</label>
<br>
</div>

<div id="memberTable">
<form method="get" id="banForm1">
<button id="banMemberBtn1">제재</button>
<button id="deleteBanMemberBtn1">제재 해제</button>

<table>
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
		<th><input type="checkbox" value="${list.USER_NO }" name="memberCheck"></th>
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
<button id="banMemberBtn">제재</button>
<button id="deleteBanMemberBtn">제재 해제</button>

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
		<th><input type="checkbox" value="${list.USER_NO }" name="banMemberCheck"></th>
		<td>${list.EMAIL }</td>
		<td>${list.NICK }</td>
		<td><fmt:formatDate value="${list.START_BAN }" pattern="yyyy.MM.dd HH:mm"/></td>
		<td><fmt:formatDate value="${list.END_BAN }" pattern="yyyy.MM.dd HH:mm"/></td>
	</tr>
	</c:forEach>

</table>
</form>
</div>

<c:import url="/WEB-INF/views/admin/layout/paging.jsp" />
<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />