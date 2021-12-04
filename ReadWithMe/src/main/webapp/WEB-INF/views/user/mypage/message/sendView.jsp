<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html lang="ko">
<head>
    <%--head meta data--%>
	<c:import url="/WEB-INF/views/user/layout/header.jsp" />

    <%--페이지별 css/ js--%>
	<link href="${path}/resources/css/message_view_style.css" rel="stylesheet" />
	<script src="${path}/resources/js/message_write_script.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btnList").click(function() {
			history.go(-1);
		})
		
		$("#btnSend").click(function() {
			location.href="/user/mypage/message/write";
		})		
	});
	
	</script>

</head>

<section id="message_write_form">

	<h2>My Page</h2>
	<div id="line"></div>
	
	<div id="message_write_container">

				<div id="message_write_form_title">
					<h3>쪽지</h3>
				</div>
				
				<div id="write-form">		
					<div id="msg_title_input">
						<input type="text" id="msg_title" name="msg_title" value="${viewMessage.MSG_TITLE}" maxlength="20" required readonly/>
					</div>
					
					<div id="rec_user_input">
						<input type="text" id="rec_user" name="rec_user" value="받는 사람 : ${viewMessage.NICK}" required readonly/>
					</div>
					
					<div id="msg_content_textarea">
						<textarea name="msg_content" id="msg_content" readonly>${viewMessage.MSG_CONTENT}</textarea>
					</div>					
				</div>
				
				<div id="btnBox">
					<button type="button" id="btnList">목록</button>
					<button type="button" id="btnSend">보내기</button>
				</div>
	</div>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />