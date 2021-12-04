<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html lang="ko">
<head>
    <%--head meta data--%>
	<c:import url="/WEB-INF/views/user/layout/header.jsp" />

    <%--페이지별 css/ js--%>
	<link href="${path}/resources/css/message_write_style.css" rel="stylesheet" />
	<script src="${path}/resources/js/message_write_script.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btnSend").click(function(){
			$("form").submit();	
// 			window.location.href = "/user/mypage/message";
		});
		
	});
	
	</script>
	
	<style type="text/css">
	input[name="msg_title"] {
	    border: none;
	    outline: none;
	    border-bottom: 1px solid #ccc;
	    width: 150px;
	    padding-bottom: 3px;	
	}
	input[name="nick"] {
	    border: none;
	    outline: none;
	    border-bottom: 1px solid #ccc;
	    width: 150px;
	    padding-bottom: 3px;	
	}
	textarea[name="msg_content"] {
	    border-bottom: 1px solid #ccc;
	    width: 150px;
	    padding-bottom: 3px;		
	}
	</style>

</head>

<section id="message_write_form">

	<h2>My Page</h2>
	<div id="line"></div>
	
	<div id="message_write_container">
		<form id="message-send" action="<%=request.getContextPath() %>/user/mypage/message/write" method="post">

				<div id="message_write_form_title">
					<h3>쪽지 보내기</h3>
				</div>
				
				<div id="write-form">		
					<div id="msg_title_input">
						<input type="text" id="msg_title" name="msg_title" placeholder="제목을 입력하세요" maxlength="20" required/>
					</div>
					
					<div id="rec_user_input">
						<input type="text" id="nick" name="nick" placeholder="받는 사람" required />
					</div>
					
					<div id="msg_content_textarea">
						<textarea name="msg_content" id="msg_content" placeholder="내용을 입력하세요" required></textarea>
					</div>	
							
					<div id="content_cnt">0 / 500자</div>					
				</div>
				
				<div id="btnBox">
					<button type="button" id="btnSend">보내기</button>
					<button type="button" id="btnCancel">취소</button>
				</div>
		</form>
	</div>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />