<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<link href="/resources/css/todolist.css" rel="stylesheet">
<script src="/resources/js/todolist_script.js"></script>

<section>
<h1>내 정보</h1>

<h3>To Do List</h3>
결심한 내용 지켜봐요!<br>

<div style="margin:30px 0px;">
<form action="/mypage/todolist" method="post" id="toDoListWriteForm">
<input type="hidden" name="bookthum" id="bookthum">
<input type="hidden" name="bookname" id="bookname">
<table id="seachTable">
	<tr>
		<td colspan="2"><input type="text" id="book" placeholder="읽은 책을 검색하세요!"></td>
		<td><button type="button" id="bookBtn">검색</button></td>
	</tr>
	<tr>
		<td><div id="bookThum"></div><div id="bookName"></div></td>
		<td style="border-left: 1px solid #000;"><textarea name="list_content" rows="10" style="width:100%;" id="list_content" placeholder="결심한 내용을 작성해 보세요!"></textarea></td>
		<td><button type="button" id="todolistInsert">입력</button></td>
	</tr>

</table>
</form>
</div>

<form method="get" id="toDoListForm">
<input type="hidden" name="user_no" value="${list.USER_NO }">

	<table id="todolistTable">
		<tr>
			<td colspan="2" style="text-align: right;"><button type="button" id="emailSend">이메일 발송</button> <button type="button" id="todolistDelete">삭제</button></td>
			<td>
			
			<input type="checkbox" class="todolistCheck" name="todolistCheck" id="todolistCheck"> 
			<label for="todolistCheck"><span></span></label><br>
			
			
			</td>
		</tr>
		<c:forEach items="${toDoList }" var="list">
			<tr style="border: none; height: 30px;">
				<td rowspan="2"><img src='${list.BOOKTHUM }'/></td>
				<td style="text-align: left;">${list.BOOKNAME } <span style="font-size: x-small; color: #ccc;"><fmt:formatDate value="${list.START_DATE }" pattern="yyyy.MM.dd HH:mm"/></span></td>
				<td rowspan="2"><input type="checkbox" class="todolistCheck" id="${list.LIST_NO }" value="${list.LIST_NO }" name="toDoListCheck">
				<label for="${list.LIST_NO }"><span></span></label></td>
			</tr>
			<tr>
				<td style="text-align: left;">${list.LIST_CONTENT }</td>
			</tr>
		</c:forEach>
	</table>

</form>

</section>

<c:import url="/WEB-INF/views/user/layout/paging.jsp" />

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />