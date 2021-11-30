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
	background-color: black;
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
								<span class="property">장소</span> ${meeting.meeting_location }<br> <!-- 장소 이름으로 수정 -->
								<span class="property">인원</span> ${meeting.meeting_personnel }명<br>
								<span class="property">모집</span> <fmt:formatDate value="${meeting.meeting_rcr_end }" pattern="yyyy-MM-dd KK시"/> 까지</th>
							</tr>
							<tr>
								<th class="host-info">
								<br>
								<!-- 주최자 정보 -->
								
								<!-- 로그인상태 -->
								<c:if test="${login }">
									<button onclick='location.href="/user/meeting/write";' class="btn-white">신청하기</button>
								</c:if>
								
								<!-- 비로그인상태 -->
								<c:if test="${not login }">
									<button onclick='location.href="/login";' class="btn-white">신청하기</button>
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
								<div class="location">지도<!-- 지도 --></div>
								<p class="addr">상세 주소</p>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="meeting-ask">
								<p class="info-title">문의</p><br>
								<!-- 주최자 메일 -->
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
</body>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />