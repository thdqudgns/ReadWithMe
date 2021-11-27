<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script src="/resources/js/todolist_script.js"></script>


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

<h1>To Do List</h1>
결심한 내용 지켜봐요!<br>

<form action="/todolist" method="post">
<div>
<input type="text" id="book" placeholder="읽은 책을 검색하세요!">
<button type="button" id="bookBtn">검색</button>
<div id="bookName"></div>
<div id="bookThum"></div>


<h3>To Do List 작성</h3>
<input type="hidden" name="bookname" id="bookname">
<input type="hidden" name="bookthum" id="bookthum">

<input type="text" name="list_content" placeholder="결심한 내용을 작성해 보세요!">
<button id="todolistInsert">입력</button>
</div>
</form>

<form method="get" id="toDoListForm">
<button type="button" id="emailSend">이메일 발송</button>
<button type="button" id="todolistDelete">삭제</button>
<input type="checkbox" name="todolistCheck" value=0 id="chkAll">
	<table>
		<c:forEach items="${toDoList }" var="list">
		<input type="hidden" name="user_no" value="${list.USER_NO }">
			<tr>
				<td rowspan="2"><img src='${list.BOOKTHUM }'/></td>
				<td>${list.BOOKNAME }</td>
				<td><fmt:formatDate value="${list.START_DATE }" pattern="yyyy.MM.dd HH:mm"/></td>
				<td rowspan="2"><input type="checkbox" value="${list.LIST_NO }" name="toDoListCheck"></td>
			</tr>
			<tr>
				<td colspan="2">${list.LIST_CONTENT }</td>
			</tr>
		</c:forEach>
	</table>

</form>

<c:import url="/WEB-INF/views/user/layout/paging.jsp" />

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />