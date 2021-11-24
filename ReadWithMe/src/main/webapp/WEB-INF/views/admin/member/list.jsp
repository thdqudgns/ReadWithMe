<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<script src="/resources/js/adminMember_script_script.js"></script>

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
</style>

<form id="adminMemberForm" method="get">
<select name="selectBox" id="selectBox">
<option value="email">이메일</option>
<option value="nick">닉네임</option>
</select>
<input type="text" name="search" id="search">
<button id="seachMember">검색</button>

<button id="prmsnAdmin">관리자 권한 부여</button>
<button id="banMember">제재</button>
<table>
	<tr>
		<th><input type="checkbox" name="memberCheck" id="chkAll"></th>
		<th>이메일</th>
		<th>닉네임</th>
		<th>가입일</th>
		<th>성별</th>
	</tr>
	<c:forEach items="${memberList }" var="list">
	<tr>
		<th><input type="checkbox" name="memberCheck"></th>
		<td>${list.EMAIL }</td>
		<td>${list.NICK }</td>
		<td><fmt:formatDate value="${list.CREATE_DATE }" pattern="yyyy.MM.dd HH:mm"/></td>
		<td>${list.GENDER }</td>
	</tr>
	</c:forEach>

</table>
</form>

<c:import url="/WEB-INF/views/admin/layout/paging.jsp" />

<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />