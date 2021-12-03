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

<script type="text/javascript">
$(window).load(function() {

	const url = $(location).attr('pathname');
	
	console.log(url);
	
	$("#message_option_select").val(url).prop("selected", true);

	})
</script>

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
				<select id="message_option_select" onchange="location.href=this.value">
					<option value="/user/mypage/message">받은 쪽지함</option>
					<option value="/user/mypage/message/send" >보낸 쪽지함</option>
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
					   
<!-- 					<thead> -->
<!-- 						<tr> -->
<!-- 							<td rowspan="2" style="padding: 10px;"><input type="checkbox" name="check-all" class="check-all" /></td> -->
<!-- 							<td>제목</td> -->
<!-- 							<td rowspan="2">보낸사람</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>내용</td> -->
<!-- 						</tr> -->
<!-- 					</thead> -->

						<c:forEach items="${list }" var="message">
						<tr>
							<td rowspan="2"><input type="checkbox" name="check-all" class="check-all" /></td>
							<td><a href="<%=request.getContextPath() %>/user/mypage/message/send/view?msg_no=${message.MSG_NO }">${message.MSG_TITLE}</a></td>
							<td rowspan="2">${message.NICK}</td>
						</tr>
						<tr>
							<td>${message.MSG_CONTENT}</td>
						</tr>
						</c:forEach>	
				</table>
			</form>
		</div>
	</div>
</section>	

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />