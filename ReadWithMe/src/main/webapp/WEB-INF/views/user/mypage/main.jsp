<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<style>
h1 {
	color: #231709;
	text-align: center;
	margin-top: 60px;
	margin-bottom: 40px;
}
#myPage-info {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}
#profile-change, #pw-change, #myReview, #to-do-list {
	color: #231709;
	width: 350px;
	height: 140px;
	border: 1px solid #000;
	margin: 10px;
	padding: 10px;
}
#mypage, #message {
	font-size: 13px;
	width: 80px;
	height: 30px;
	border: 2px solid #fff;
	background: #ffffff;
	color: #231709;
	border-radius:8px;
	float: right;
	margin: 10px;
	border: 1px solid #231709;
}
#message:hover {
	background: rgba(173, 140, 122, 1);
	border: 1px solid rgba(173, 140, 122, 1);
	color: white;
}
#mypage:hover {
	background: rgba(173, 140, 122, 1);
	border: 1px solid rgba(173, 140, 122, 1);
	color: white;
}
p {
	font-size: 12px;
	text-align: right;
}
#wthdr {
	font-size: 10px;
	margin: 10px;
	text-align: right;
}
section {
	margin-bottom: 450px;
}
</style>

<section id="myPage">

	<h1>My Page</h1>

	<div id="myPage-info">
		<div id="message-div">
			<a href="<%=request.getContextPath() %>/user/mypage/message"><button id="message">쪽지함</button></a>
		</div>
	
		<div id="my-Info">	
			<div id="profile-pw" style="float: left;">
				<div id="profile-change" style="float: left;">
					<h3>프로필 변경</h3>
					고객님의 프로필 정보를 변경하실 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/profile"><button id="mypage">변&nbsp;&nbsp;경</button></a>
				</div>
				
				<div id="pw-change" style="float: left;">
					<h3>비밀번호 변경</h3>
					고객님의 비밀번호를 변경하실 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/pwchange"><button id="mypage">변&nbsp;&nbsp;경</button></a>
				</div>
			</div>
			<br>
			
			<div id="review-todo" style="clear: both;">
				<div id="myReview" style="float: left;">
					<h3>내가 작성한 리뷰</h3>
					고객님이 작성하신 리뷰를 볼 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/알아서/하삼"><button id="mypage">자세히 보기</button></a>
				</div>
				
				<div id="to-do-list" style="float: left;">
					<h3>To Do List</h3>
					나의 To Do List 목록을 확인할 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/todolist"><button id="mypage">자세히 보기</button></a>
				</div>
			</div>
			
			<br>
			
			<div id="wthdr">
				Read With Me를 더이상 이용하지 않는다면 <a href="/mypage/wthdr">회원탈퇴 바로가기</a>
			</div>
			
		</div>
	</div>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
