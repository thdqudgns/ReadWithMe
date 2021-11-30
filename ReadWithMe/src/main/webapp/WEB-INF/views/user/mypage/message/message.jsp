<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html lang="ko">
<head>
    <%--head meta data--%>
	<c:import url="/WEB-INF/views/user/layout/header.jsp" />

    <%--페이지별 css/ js--%>
	<link href="${path}/resources/css/message_style.css" rel="stylesheet" />
<%-- 	<script src="${path}/resources/js/main_home_script.js"></script> --%>

</head>

<section id="message">
	
	<h2>My Page</h2>
	<div id="line"></div>

	<div id="message-list">
	
		<div id="message_page_title">
			<h3>쪽지함</h3>
		</div>
		
		<div id="message_otn_btn">
			<div id="message_buttons">
				<button onclick='location.href="/user/mypage/message/delete";' id="btnDelete">삭제</button>
				<button onclick='location.href="/user/mypage/message/keep";' id="btnKeep">보관</button>
				<button onclick='location.href="/user/mypage/message/write";' id="btnSend">쪽지 보내기</button>
				<button onclick='location.href="/user/mypage/message/unread";' id="btnUnread">안 읽은 쪽지</button>
			</div>
			
			<div id="message_option">
				<select onchange="if(this.value === '받은 쪽지함') location.href='/mypage/message'; else location.href = '/mypage/message/send'; else location.href = '/mypage/message/keep'">
					<option value="받은 쪽지함" selected>받은 쪽지함</option>
					<option value="보낸 쪽지함" >보낸 쪽지함</option>
					<option value="쪽지 보관함" >쪽지 보관함</option>
				</select>
			</div>
		</div>
		
		<div id="message_list_form">
			<form action="<%=request.getContextPath() %>/user/mypage/message/delete" method="post" id="messageList">
				<table id="message_list_table">
					<colgroup>
						<col style="width: 30px">
						<col style="width: 580px">
						<col style="width: 70px">
					</colgroup>
					   
					<thead>
						<tr>
							<td rowspan="2" style="padding: 10px;"><input type="checkbox" name="check-all" class="check-all" /></td>
							<td>제목</td>
							<td rowspan="2">보낸사람</td>
						</tr>
						<tr>
							<td>내용</td>
						</tr>
					</thead>
					
						<tr>
							<td rowspan="2"><input type="checkbox" name="check-all" class="check-all" /></td>
							<td>안녕하세요?! 저어는 조아연이에요</td>
							<td rowspan="2">aaa</td>
						</tr>
						<tr>
							<td>안녕하세요 무엇이 궁금해서 오셨는지 궁금합니다람지렁이가 꿈틀</td>
						</tr>
						<tr>
							<td rowspan="2"><input type="checkbox" name="check-all" class="check-all" /></td>
							<td>안녕하세요?! 저어는 조아연이에요</td>
							<td rowspan="2">aaa</td>
						</tr>
						<tr>
							<td>안녕하세요 무엇이 궁금해서 오셨는지 궁금합니다람지렁이가 꿈틀</td>
						</tr>
						<c:forEach items="${messageList }" var="message">
						<tr>
							<td rowspan="2"><input type="checkbox" name="check-all" class="check-all" /></td>
							<td>${message.msg_title}</td>
							<td rowspan="2">${message.send_user}</td>
						</tr>
						<tr>
							<td>${message.msg_content}</td>
						</tr>
						</c:forEach>	
				</table>
			</form>
		</div>
	</div>
</section>	

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />