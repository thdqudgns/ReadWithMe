<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
	document.getElementById("meeting_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
		//카카오 지도 발생
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				document.getElementById("meeting_address").value = data.address; // 주소 넣기
			}
		}).open();
	});
};
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('#check').click(function(){
		console.log("클릭되나");
	
		var type = document.getElementById("meetingtype_no");
		var title = document.getElementById("meeting_title");
		var area = document.getElementById("area_no");
		var location = document.getElementById("meeting_location");
		var rcrStart = document.getElementById("meeting_rcr_start");
		var rcrEnd = document.getElementById("meeting_rcr_end");
		var start = document.getElementById("meeting_start");
		var end = document.getElementById("meeting_end");
		var person = document.getElementById("meeting_personnel");
		var book = document.getElementById("book_class_no");
		var content = document.getElementById("meeting_content");
		var agree = document.getElementById("req");
	
		if(type.value == "0") {
			alert("모임 방식을 선택하세요.");
			return false;
		} else if (title.value == "") {
			alert("모임 제목을 입력하세요.");
			return false;
		} else if (area.value == "0") {
			alert("모임 지역을 선택하세요.");
			return false;
		} else if (location.value == "") {
			alert("모임 장소를 입력하세요.");
			return false;
		} else if (rcrStart.value == "") {
			alert("모집 기간을 선택하세요.");
			return false;
		} else if (rcrEnd.value == "") {
			alert("모집 기간을 선택하세요.");
			return false;
		} else if (start.value == "") {
			alert("진행 기간을 선택하세요.");
			return false;
		} else if (end.value == "") {
			alert("진행 기간을 선택하세요.");
			return false;
		} else if (person.value == "") {
			alert("인원 수를 입력하세요.");
			person.focus();
			return false;
		} else if (content.value == "") {
			alert("모임 정보를 입력하세요.");
			content.focus();
			return false;
		} else if ($('#agree').is(":checked") != true) {
			alert("약관 동의를 체크하세요.");
			return false;
		} else {
			$('form').submit();
			alert("모임 승인이 필요합니다.")
		}
	})
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "meeting_content",
		sSkinURI: "/resources/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	})
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

<body>
<div class="container">
<div class="box">
<p class="page-title">모임 등록</p>
<form action="/user/meeting/write" name="meeting_write" method="post" enctype="multipart/form-data">

<div class="form-group">
	<label class="form-label">모임 방식</label>
	<select class="custom-select" name="meetingtype_no" id="meetingtype_no" style="width: 284px;">
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
	<select class="custom-select" name="area_no" id="area_no" style="width: 284px;">
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
	</div>
	<div class="form-date-group">
		<span class="sub-label">종료</span>
		<input type="date" class="form-input-date" name="meeting_rcr_end" id="meeting_rcr_end">
	</div>
</div>

<div class="form-group">
		<label class="form-label">진행 기간</label>
		<div class="form-date-group">
			<span class="sub-label">시작</span>
			<input type="date" class="form-input-date" name="meeting_start" id="meeting_start">
		</div>
		<div class="form-date-group">
			<span class="sub-label">종료</span>
			<input type="date" class="form-input-date" name="meeting_end" id="meeting_end">
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
		<option value="0">선택</option>
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
	<input type="text" class="form-input" name="meeting_address" id="meeting_address">
</div>

<div class="info-group">
	<label class="form-label">모임 상세 정보</label>
	<textarea rows="14" name="meeting_content" id="meeting_content" style="width: 566px; height: 340px; padding: 12px 15px;" placeholder="내용을 입력하세요"></textarea>
</div>

<input type="hidden" name="meeting_approved" id="meeting_approved" value="0">

<div class="checklist-area">
1. ReadWithMe는 누구나 참여할 수 있는 공개 행사입니다.<br>
2. ReadWithMe는 비영리 행사입니다.<br>
3. ReadWithMe는 개인이 읽고 싶은 책을 자유롭게 읽는 행사입니다.<br>
4. ReadWithMe는 최소 3명 이상, 최대 100명 미만 참여 가능합니다.<br>
5. 참가자 정보는 ReadWithMe 행사에서의 정보 공유 목적으로만 사용되어야 합니다.<br><br>
<input type="checkbox" id="agree" name="agree"> 개인정보 수집 및 이용에 동의합니다.
</div>

<div class="bt">
<a href="/user/meeting/write"><button class="btn-return" type="button">취소</button></a>
<button class="btn-register" id="check" style="background-color: #9f8170;" type="button">생성</button>
</div>

</form> <!-- end form -->
</div> <!-- end box -->
</div> <!-- end container -->

</body>
<c:import url="/WEB-INF/views/user/layout/footer.jsp" />