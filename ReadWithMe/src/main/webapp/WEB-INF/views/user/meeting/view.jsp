<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<style type="text/css">

body {
	font-size: 14px;
    margin: 0;
    padding: 0;
}

.meeting-header {
	order: 1;
	padding: 40px 0;
	border-bottom: 1px solid rgba(0,0,0,.08);
	background-color: #fff;
}

.meeting-body {
	order: 3;
	padding-top: 40px;
	padding-bottom: 80px;
}

.inner {
	display: flex;
	justify-content: space-between;
	margin: 0 auto;
	padding: 0 10px;
	width: 100%;
	max-width: 980px;
}

table.meeting-info {
	flex-shrink: 0;
	margin-top: 0;
	margin-left: 32px;
	font-weight: normal;
	width: 328px;
	height: 416px;
}

th.host-info {
	margin-top: 32px;
	padding-top: 32px;
	border-top: 1px solid rgba(0,0,0,.08);
}

td.meeting-content {
	vertical-align: top;
	font-size: 14px;
	width: 600px;
	height: auto;
}

th.meeting-title {
	font-size: 32px;
	text-align: left;
}

th.meeting-info-list {
	font-weight: normal;
	line-height: 25px;
	height: auto;
	text-align: left;
	margin-top: 8px;	
}

th.meeting-location {
	font-weight: normal;
	text-align: left;	
}

th.meeting-ask {
	margin-top: 24px;
    padding-top: 24px;
    border-top: 1px solid rgba(0,0,0,.08);
	vertical-align: top;
	font-size: 14px;
	font-weight: normal;
	text-align: left;
}

.location {
	width: 328px;
	height: 273px;
}

.property {
	width: 46px;
    color: rgba(0,0,0,.4);
}

p.info-title {
	margin-bottom: 16px;
	font-size: 16px;
	color: rgba(0,0,0,.6);
	letter-spacing: -.2px;
}

p.addr {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.btn-apply {
	font-size: 16px;
	width: 200px;
	height: 48px;
	margin-top: 10px;
	justify-content: center;
	align-items: center;
	border-radius: 4px;
	letter-spacing: -.5px;
	border: 1px;
	box-shadow: none;
	color: #ffffff;
	background-color: #9f8170;
}

.btn-delete {
	font-size: 16px;
	width: 200px;
	height: 48px;
	margin-top: 10px;
	justify-content: center;
	align-items: center;
	border-radius: 4px;
	letter-spacing: -.5px;
	border: 1px;
	box-shadow: none;
}

</style>

<body>
<div class="container">	
	<div class="meeting-header">
		<div class="inner">
			<table>
			<thead>
				<tr>
					<td><img src="https://i.imgur.com/qxqjwv4.jpg" style="width: 572px; height: 416px;"></td>
					<td>
						<table class="meeting-info">
						<thead>
							<tr>
								<th class="meeting-title">${meeting.meeting_title }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="meeting-info-list"><br>
								<span class="property">일시</span> <fmt:formatDate value="${meeting.meeting_start }" pattern="yyyy-MM-dd KK시"/><br>
								<span class="property">장소</span> ${meeting.meeting_location }<br>
								<span class="property">인원</span> ${meeting.meeting_personnel }명<br>
								<span class="property">모집</span> <fmt:formatDate value="${meeting.meeting_rcr_end }" pattern="yyyy-MM-dd KK시"/> 까지</th>
							</tr>
							<tr>
								<th class="host-profile">
								<br>
								<div class="host-info">
								<!-- 프로필 사진 물어보기 --> ${user.nick }
								</div>
								
								<!-- 로그인상태 -->
								<c:if test="${login }">
									<c:choose>
									<c:when test="${user_no eq meeting.user_no }">
										<!-- 내가 주최한 모임 -->
										<a href="/user/meeting/delete?meeting_no=${meeting.meeting_no }"><button class="btn-delete">삭제</button></a>								
									</c:when>
									<c:otherwise>
										<!-- 로그인 상태 -->
										<button onclick='location.href="/user/meeting/apply?meeting_no=${meeting.meeting_no }";' class="btn-apply">신청하기</button>
									</c:otherwise>
									</c:choose>
								</c:if>
								
								<!-- 비로그인상태 -->
								<c:if test="${not login }">
									<button onclick='apply()' class="btn-apply">신청하기</button>
								</c:if>
								
								</th>
							</tr>
						</tbody>
						</table>
					</td>
				</tr>
			</thead>
			</table>
		</div> <!-- end inner -->
	</div> <!-- end meeting-header -->
	
	<div class="meeting-body">
		<div class="inner">
			<table>
			<thead>
				<tr>
					<td class="meeting-content">
					<p style="margin:3px"></p>
					<p class="info-title">모임 정보</p><br>
					${meeting.meeting_content }
					</td>
					<td>
						<table class="meeting-info">
						<thead>
							<tr>
								<th class="meeting-location"><p class="info-title">위치</p><br>
								<div class="location" id="map"></div>
								<p class="addr">${meeting.meeting_address }</p>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="meeting-ask">
								<p class="info-title">문의</p><br>
								${user.email }
							</tr>
						</tbody>
						</table>
					</td>
				</tr>
			</thead>
			</table>
		</div> <!-- end inner -->
	</div> <!-- end meeting-body -->
	
</div> <!-- end container -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3c54c8bae5dd8337194186463b00699&libraries=services"></script>
<script>
const address = '${meeting.meeting_address}'

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {

		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		// 결과값으로 받은 위치를 마커로 표시합니다
		var marker = new kakao.maps.Marker({
			map: map,
			position: coords
		});

		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
	} 
});

function apply() {
	const meeting_no = '${meeting.meeting_no}'
	location.href="/user/meeting/apply?meeting_no=" + meeting_no
}
</script>
</body>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />