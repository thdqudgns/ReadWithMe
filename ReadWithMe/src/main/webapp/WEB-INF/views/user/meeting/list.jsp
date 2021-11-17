<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<style>
body {
	font-size: 14px;
}

.container {
	display: flex;
	flex-direction: column;
	margin: 0 auto;
	padding: 32px 10px 40px;
	max-width: 980px;
	width: 100%;
}
.page-title {
	font-size: 24px;
	margin-bottom: 24px;
}
td {
	margin: auto;
	text-align: center;
	width: 100px;
}
ul, li {
	display: inline-block;
	text-align: center;
	margin: 10px;
}
.meeting-list {
    display: flex;
    flex-wrap: wrap;
    magin: auto;
}
.meeting-thumbnail img {
	position: relative;
	width: 200px;	
	height: 114px;
	border-radius: 4px;
	background-color: rgba(0,0,0,.1);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 50%;
	overflow: hidden;
}
.meeting-title {
	font-size: 16px;
	text-align: left;
}
.meeting-info {
	padding: 10px 0;
	font-size: 13px;
	text-align: left;
	color: rgba(0,0,0,.4);
}
</style>
<body>
<div class="container">

<div class="searchBox">
<!-- 검색박스 기능구현 -->
</div>

<div class="page-title">
진행 중 모임
</div>

<table class="area">
<thead>
  <tr>
    <td>전체</td>
    <td>서울</td>
    <td>인천</td>
    <td>대전</td>
    <td>세종</td>
    <td>경기</td>
    <td>충북</td>
    <td>충남</td>
    <td>강원</td>
    <td>광주</td>
    <td>부산</td>
    <td>대구</td>
    <td>울산</td>
    <td>전북</td>
    <td>전남</td>
    <td>경북</td>
    <td>경남</td>
    <td>제주</td>
    <td>글로벌</td>
    <td>기타</td>
  </tr>
</thead>
</table><br>

<div class="meeting-list">
	<ul>
		<c:forEach items="${list }" var="meeting">
		<li>
			<div class="meeting-thumbnail">
				<a href="/user/meeting/view?no=${meeting.meeting_no }"><img src="https://i.imgur.com/qxqjwv4.jpg"></a><br>
			</div>
			<div class="meeting-title">
				${meeting.meeting_title }<br>
			</div>	
			<div class="meeting-info">	
				일시 <fmt:formatDate value="${meeting.meeting_rcr_end }" pattern="yyyy.MM.dd"/><br>
				장소 ${meeting.area_no }<br> <!-- 장소 이름으로 수정 -->
				인원 ${meeting.meeting_personnel }명<br>
				모집 <fmt:formatDate value="${meeting.meeting_rcr_end }" pattern="yyyy.MM.dd"/>까지
			</div>
		</li>
		</c:forEach>
	</ul>
</div>

<hr>

<br>

<div class="page-title">
종료된 모임
</div>

</div><!-- .container -->
<c:import url="/WEB-INF/views/user/layout/footer.jsp" />