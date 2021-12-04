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
				<div class="search_area">
					<form action="/user/meeting/list" method="get" id="searchForm">
						<div class="search_box" style="margin-top:20px">
							<select name="searchType" id="selectBox">
								<option>선택</option>
								<option value="meeting_title" selected="selected">제목</option>
								<option value="user_no">작성자</option>
							</select> <input type="text" class="searchbox" id="search" name="searchWord" />
						</div>
						
						<hr />

						<div class="search_div1">
							<p><strong>지역</strong></p>
							<label>
								<input type="checkbox" name="area_no" value="1" />서울
							</label>
							<label>
								<input type="checkbox" name="area_no" value="2" />인천
							</label>
							<label>
								<input type="checkbox" name="area_no" value="3" />대전
							</label>
							<label>
								<input type="checkbox" name="area_no" value="4" />세종
							</label>
							<label>
								<input type="checkbox" name="area_no" value="5" />경기
							</label>
							<label>
								<input type="checkbox" name="area_no" value="6" />충북
							</label>
							<label>
								<input type="checkbox" name="area_no" value="7" />충남
							</label>
							<label>
								<input type="checkbox" name="area_no" value="8" />강원
							</label>
							<label>
								<input type="checkbox" name="area_no" value="9" />광주
							</label>
							<br />
							<label>
								<input type="checkbox" name="area_no" value="10" />부산
							</label>
							<label>
								<input type="checkbox" name="area_no" value="11" />대구
							</label>
							<label>
								<input type="checkbox" name="area_no" value="12" />울산
							</label>
							<label>
								<input type="checkbox" name="area_no" value="13" />전북
							</label>
							<label>
								<input type="checkbox" name="area_no" value="14" />전남
							</label>
							<label>
								<input type="checkbox" name="area_no" value="15" />경북
							</label>
							<label>
								<input type="checkbox" name="area_no" value="16" />경남
							</label>
							<label>
								<input type="checkbox" name="area_no" value="17" />제주
							</label>
							<label>
								<input type="checkbox" name="area_no" value="18" />기타
							</label>
						</div>

						<br />

						<div class="search_div2">
							<p><strong>모임 방식</strong></p>
							<label>
								<input type="checkbox" name="meetingtype_no" value="1" />자율 독서
							</label>
							<label>
								<input type="checkbox" name="meetingtype_no" value="2"/>공통서적 독서
							</label>
							<label>
								<input type="checkbox" name="meetingtype_no" value="3" />북 스터디
							</label>
						</div>

						<br />

						<div class="search_div3">
							<p><strong>책 분야</strong></p>
							<label>
								<input type="checkbox" name="book_class_no" value="1" />소설
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="2" />시,에세이
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="3" />경제,경영
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="4" />자기계발
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="5" />인문
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="6" />역사,문화
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="7" />종교
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="8" />정치,사회
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="9" />예술,대중문화
							</label>
			
							<br />
							
							<label>
								<input type="checkbox" name="book_class_no" value="10" />과학
							</label>			
							<label>
								<input type="checkbox" name="book_class_no" value="11" />기술,공학
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="12" />컴퓨터,IT
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="13" />외국어
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="14" />가정,육아
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="15" />건강
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="16" />여행
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="17" />요리
							</label>
							<label>
								<input type="checkbox" name="book_class_no" value="18" />취미,스포츠
							</label>
						</div>

						<button class="btn">검색</button>						
					</form>
				</div>

				<div class="searchresult" id="searchresult">
					<ul class="meeting-ul">
					<c:forEach items="${list }" var="meeting">
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

		<div class="mp" style="margin: 0 auto;">
		<c:import url="/WEB-INF/views/user/layout/meetingpaging.jsp" />			
		</div>	
			
		</div> <!-- end container -->
	</div> <!-- end layout content -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />

</body>