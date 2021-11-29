<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

    <script type="text/javascript">
    $(document).ready(function() {
    	
    	//취소 버튼 누르면 뒤로가기
    	$("#btnCancel").click(function() {
    		location.href = "/user/mypage/message";
    	});
    	
        $('#msg_content').on('keyup', function() {
            $('#content_cnt').html($(this).val().length+" / 500자");
     
            if($(this).val().length > 500) {
                $(this).val($(this).val().substring(0, 500));
                $('#content_cnt').html("500 / 500자");
            }
        });   
        
        const rec_user = document.querySelector('#rec_user');
        const msg_content = document.querySelector('#msg_content');
        const msg_title = document.querySelector('#msg_title');
      const btnSend = document.querySelector('#btnSend');

      btnSend.addEventListener('click', () => $.ajax({
          type: 'POST',
          url: contextPath + '/user/mypage/message/write',
          data: { rec_user: rec_user.value, msg_content: msg_content.value, msg_title: msg_title.value },
          dataType: 'json',
          success: data => {if(data.result)showModal('성공', '쪽지를 발송했습니다.', () => location.href = '/user/mypage/message'); else showModal('실패', data.msg);},
          error: () => showModal('연결 오류', '서버와 정상적으로 통신하지 못했습니다.')
       })); 
    });
    </script>
    
	<style type="text/css">
    #container {
    	margin: auto;
    	text-align: center;
    }
    #msg_title {
    	width: 530px;
    	height: 30px;
    	margin: 10px;
    }
    #msg_content {
		width: 530px;
		height: 280px;
		resize: none;
	}
	#rec_user {
		text-align: right;
		width: 100px;
		height: 30px;
	}
	#content_cnt {
		margin: 0 auto;
		margin-left: 465px;
	}
    #square {
    	height: 500px;
    	width: 600px;
    	position: relative;
    	margin: auto;
    	border-radius: 15px;
    	padding-top: 5px;
    }
	h3 {
		text-align: left;
		color: #333333;
	}
	h2 {
		text-align: center;
	}  
	#write-form {
		margin-top: 40px;
	}
	#btnSend {
		width: 60px;
		height: 30px;
		border-radius: 3px;
		color: white;
		background-color: #616161;
		border: 1px solid #616161;
	}
	#btnCancel {
		width: 60px;
		height: 30px;
		border-radius: 3px;
		color: white;
		background-color: #7ba5c1;
		border: 1px solid #7ba5c1;
	}
    </style>

<br><br><br><br>
<h2>마이페이지</h2>
<hr>

<div id="container">
<form id="message-send" action="<%=request.getContextPath() %>/user/mypage/message/write" method="post">

<br>

<br><br>
	<div id="square" style="background-color: #ffffff;">
		<h3>쪽지 쓰기</h3>
	
		<div id="write-form">		
			<div><input type="text" id="msg_title" name="msg_title" placeholder="제목" maxlength="20" required/></div>	
			<div id="fromm">받는 사람&nbsp;&nbsp;ㅣ&nbsp;&nbsp;<input type="text" id="rec_user" name="rec_user" placeholder="받는 사람" required /></div><br>
			<div><textarea name="msg_content" id="msg_content" placeholder="내용" required></textarea></div>			
			<div id="content_cnt">0 / 500자</div>					
		</div>
		
		<div id="btnBox">
			<button type="button" id="btnSend">보내기</button>
			<button type="button" id="btnCancel">취소</button>
		</div>
	</div>
	
</form>
</div>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />