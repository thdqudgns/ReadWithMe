<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#reg_submit").click(function() {
		submitContents($("#reg_submit"));
		
		$("form").submit();
	})
})

//function check(){
//	if (document.form.meetingtype_no.value == ""){
//		alert("모임 방식을 선택해주세요.");
//		document.form.meetingtype_no.value();
//		return false;
//	} else if (document.form.meeting_title.value == ""){
//		alert("모임 제목을 입력해 주세요.");
//		document.theform.meeting_title.focus();
//		return false;
//	} else {
//		return true;
//	}
//}

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "meeting_content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

<style type="text/css">

.container {
	margin: 0 auto;
	padding: 32px 10px 40px;
	background-color: #f5f5f5;
	max-width: 100%;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.box {
	margin: 0 auto;
	padding: 32px;
	width: 100%;
	max-width: 632px;
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 1px 4px 0 rgb(0 0 0 / 10%);
}

.page-title {
	font-size: 24px;
	line-height: 1.33;
	letter-spacing: -1px;
}

.form-group {
	margin-top: 32px;
}

.info-group {
	margin-top: 32px;
	padding-top: 32px;
	border-top: 1px solid rgba(0,0,0,.08);
}

.form-input {
	display: block;
	padding: 0 16px;
	width: 100%;
	height: 48px;
	border-radius: 4px;
	border: 1px solid rgba(0,0,0,.1);
	font-size: 14px;
}

.form-label {
	display: block;
	margin-bottom: 8px;
	font-size: 14px;
	color: rgba(0,0,0,.85);
}

.form-date-group {
	display: flex;
	align-items: center;
	margin-top: 8px;	
}

.form-input-date {
	margin-right: 12px;
	flex: 3;
}

.custom-select {
	position: relative;
	display: flex;
	align-items: center;
	padding: 0 48px 0 16px;
	width: 100%;
	height: 48px;
	border-radius: 4px;
	border: 1px solid rgba(0,0,0,.1);
	background-color: #fff;
}

input[type="date"] {
	display: block;
	padding: 0 16px;
	width: 100%;
	height: 48px;
	border-radius: 4px;
	border: 1px solid rgba(0,0,0,.1);
	font-size: 14px;
	margin-right: 12px;
    flex: 3;
}

input::placeholder {
	color: d3d3d3;
}

textarea::placeholder {
	color: d3d3d3;
}

.sub-label {
	flex-shrink: 0;
	padding-right: 12px;
	width: 60px;
	font-size: 14px;
	color: rgba(0,0,0,.4);
	text-align: center;
}

.checklist-area {
	font-size: 14px;
	line-height: 25px;
	letter-spacing: -.2px;
	color: rgba(0,0,0,.85);
	margin-left: 4px;
	margin-top: 32px;
	margin-bottom: 24px;
	padding: 16px;
	border-radius: 6px;
	background-color: #f5f5f5;
}

.btn-register, .btn-return {
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

.bt {
	text-align: center;
}

</style>

<div class="container">
<div class="box">
<p class="page-title">모임 등록</p>
<form action="/user/meeting/write" method="post" enctype="multipart/form-data">

<div class="form-group">
	<label class="form-label">모임 방식</label>
	<select class="custom-select" name="meetingtype_no" style="width: 284px;">
		<option value="0" disabled selected hidden>선택</option>
		<option value="1">자율 독서</option>
		<option value="2">공통서적 독서</option>
		<option value="3">북 스터디</option>
	</select>
</div>

<div class="form-group">
	<label class="form-label">모임 명 </label>
	<input type="text" class="form-input" name="meeting_title" id="meeting_title" placeholder="모임 명을 입력하세요.">
</div>

<div class="form-group">
	<label class="form-label">지역</label>
	<select class="custom-select" name="area_no" style="width: 284px;">
		<option value="0" disabled selected hidden>선택</option>	
		<option value="1">서울</option>
		<option value="2">인천</option>
		<option value="3">대전</option>
		<option value="4">세종</option>
		<option value="5">경기</option>
		<option value="6">충북</option>
		<option value="7">충남</option>
		<option value="8">강원</option>
		<option value="9">광주</option>
		<option value="10">부산</option>
		<option value="11">대구</option>
		<option value="12">울산</option>
		<option value="13">전북</option>
		<option value="14">전남</option>
		<option value="15">경북</option>
		<option value="16">경남</option>
		<option value="17">제주</option>
		<option value="18">기타</option>
	</select>
</div>

<div class="form-group">
	<label class="form-label">장소 명</label>
	<input type="text" class="form-input" name="meeting_location" id="meeting_location" placeholder="장소 명을 입력하세요.">
</div>

<div class="form-group">
	<label class="form-label">모집 기간</label>
	<div class="form-date-group">
		<span class="sub-label">시작</span>
		<input type="date" class="form-input-date" name="meeting_rcr_start" id="meeting_rcr_start">
		<select class="custom-select" name="meeting_rcr_start_time" style="width: 184px;">
			<option value="00:00">00:00</option>
			<option value="01:00">01:00</option>
			<option value="02:00">02:00</option>
			<option value="03:00">03:00</option>
			<option value="04:00">04:00</option>
			<option value="05:00">05:00</option>
			<option value="06:00">06:00</option>
			<option value="07:00">07:00</option>
			<option value="08:00">08:00</option>
			<option value="09:00">09:00</option>
			<option value="10:00">10:00</option>
			<option value="11:00">11:00</option>
			<option value="12:00">12:00</option>
			<option value="13:00">13:00</option>
			<option value="14:00">14:00</option>
			<option value="15:00">15:00</option>
			<option value="16:00">16:00</option>
			<option value="17:00">17:00</option>
			<option value="18:00">18:00</option>
			<option value="19:00">19:00</option>
			<option value="20:00">20:00</option>
			<option value="21:00">21:00</option>
			<option value="22:00">22:00</option>
			<option value="23:00">23:00</option>
			<option value="24:00">24:00</option>		
		</select>
	</div>
	<div class="form-date-group">
		<span class="sub-label">종료</span>
		<input type="date" class="form-input-date" name="meeting_rcr_end" id="meeting_rcr_end">
		<select class="custom-select" name="meeting_rcr_end_time" style="width: 184px;">
			<option value="00:00">00:00</option>
			<option value="01:00">01:00</option>
			<option value="02:00">02:00</option>
			<option value="03:00">03:00</option>
			<option value="04:00">04:00</option>
			<option value="05:00">05:00</option>
			<option value="06:00">06:00</option>
			<option value="07:00">07:00</option>
			<option value="08:00">08:00</option>
			<option value="09:00">09:00</option>
			<option value="10:00">10:00</option>
			<option value="11:00">11:00</option>
			<option value="12:00">12:00</option>
			<option value="13:00">13:00</option>
			<option value="14:00">14:00</option>
			<option value="15:00">15:00</option>
			<option value="16:00">16:00</option>
			<option value="17:00">17:00</option>
			<option value="18:00">18:00</option>
			<option value="19:00">19:00</option>
			<option value="20:00">20:00</option>
			<option value="21:00">21:00</option>
			<option value="22:00">22:00</option>
			<option value="23:00">23:00</option>
			<option value="24:00">24:00</option>		
		</select>
	</div>
</div>

<div class="form-group">
		<label class="form-label">진행 기간</label>
		<div class="form-date-group">
			<span class="sub-label">시작</span>
			<input type="date" class="form-input-date" name="meeting_start" id="meeting_start">
			<select class="custom-select" name="meeting_start_time" style="width: 184px;">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>		
			</select>
		</div>
		<div class="form-date-group">
			<span class="sub-label">종료</span>
			<input type="date" class="form-input-date" name="meeting_end" id="meeting_end">
			<select class="custom-select" name="meeting_end_time" style="width: 184px;">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>		
			</select>
		</div>
</div>

<div class="form-group">
	<label class="form-label">인원 수</label>
	<input type="number" class="form-input" name="meeting_personnel" id="meeting_personnel" min="3" max="100" placeholder="인원 수를 입력하세요.">
</div>

<div class="form-group">
	<label class="form-label">이미지 등록</label>
	<!-- 이미지 등록 -->
</div>

<div class="form-group">
	<label class="form-label">책 분야</label>
	<select class="custom-select" name="book_class_no" id="book_class_no" style="width: 284px;">
		<option value="0" disabled selected hidden>선택</option>
		<option value="1">소설</option>
		<option value="2">시,에세이</option>
		<option value="3">경제,경영</option>
		<option value="4">자기계발</option>
		<option value="5">인문</option>
		<option value="6">역사,문화</option>
		<option value="7">종교</option>
		<option value="8">정치,사회</option>
		<option value="9">예술,대중문화</option>
		<option value="10">과학</option>
		<option value="11">기술,공학</option>
		<option value="12">컴퓨터,IT</option>
		<option value="13">외국어</option>
		<option value="14">가정,육아</option>
		<option value="15">건강</option>
		<option value="16">여행</option>
		<option value="17">요리</option>
		<option value="18">취미,스포츠</option>
		<option value="19">기타</option>
	</select>
</div>

<div class="info-group">
	<label class="form-label">위치</label>
	<!-- 지도 api -->
</div>

<div class="info-group">
	<label class="form-label">모임 상세 정보</label>
	<textarea rows="14" name="meeting_content" id="meeting_content" style="width: 566px; height: 340px; padding: 12px 15px;" placeholder="내용을 입력하세요"></textarea>
</div>

<div class="info-group">
	<label class="form-label">주최자 이메일</label>
	<input type="email" class="form-input" name="email" id="email" placeholder="email@email.com">
</div>
 
<div class="checklist-area">
1. ReadWithMe는 누구나 참여할 수 있는 공개 행사입니다.<br>
2. ReadWithMe는 비영리 행사입니다.<br>
3. ReadWithMe는 개인이 읽고 싶은 책을 자유롭게 읽는 행사입니다.<br>
4. ReadWithMe는 최소 3명 이상, 최대 100명 미만 참여 가능합니다.<br>
5. 참가자 정보는 ReadWithMe 행사에서의 정보 공유 목적으로만 사용되어야 합니다.<br><br>
<input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다
</div>

<div class="bt">
<a href="/user/meeting/write"><button class="btn-return" type="button">취소</button></a>
<button class="btn-register" id="reg_submit" style="background-color: #9f8170">가입</button>
</div>

</form> <!-- end form -->
</div> <!-- end box -->
</div> <!-- end container -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />