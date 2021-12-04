<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<script src="/resources/js/meetingList_script.js"></script>

<style type="text/css">
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
.search_area{ 
	border: 1px solid rgba(30,30,30,0.2);
	border-radius: 0.5rem;
	height: 100%;
	margin:0 auto;
}
ul.meeting-ul, li.meeting-li {
	display: inline-block;
	text-align: center;
	margin: 10px;
}
.searchresult {
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
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="searchresult" id="searchresult">
					<ul class="meeting-ul">
					<c:forEach items="${endlist }" var="meeting">
						<li class="meeting-li">
							<div class="meeting-thumbnail">
								<a href="/user/meeting/view?no=${meeting.meeting_no}"><img src="https://i.imgur.com/qxqjwv4.jpg"></a><br>
							</div>
							<div class="meeting-title">
								${meeting.meeting_title }<br>
							</div>
							<div class="meeting-info">	
								일시 <fmt:formatDate value="${meeting.meeting_start }" pattern="yyyy.MM.dd"/><br>
								장소 ${meeting.meeting_location }<br> <!-- 장소 이름으로 수정 -->
								인원 ${meeting.meeting_personnel }명<br>
								모집 <fmt:formatDate value="${meeting.meeting_rcr_end }" pattern="yyyy.MM.dd"/>까지
								
								<div class="meeting-btn">
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
									<fmt:formatDate value="${meeting.meeting_rcr_end}" pattern="yyyy-MM-dd" var="rcr" />
									<c:choose>
									<c:when test="${today <= rcr }">
										<button class="btn-end" disabled>모집 중</button>
									</c:when>
																	
									<c:when test="${today > rcr }">
										<button class="btn-end" disabled>모집 마감</button>							
									</c:when>
									<c:when test="${meeting_personnel == null }">
										<button class="btn-end" disabled>모집 마감</button>							
									</c:when>
									</c:choose>
								</div>
							</div> <!-- meeting-info end -->
						</li>
					</c:forEach>
					</ul>
				</div> <!-- searchresult end -->
			</div> <!-- end row -->

		<c:import url="/WEB-INF/views/user/layout/meetingpaging.jsp" />			
			
		</div> <!-- end container -->
	</div> <!-- end layout content -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />

</body>