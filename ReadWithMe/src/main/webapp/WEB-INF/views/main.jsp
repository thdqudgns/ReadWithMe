<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
    <%--head meta data--%>
	<c:import url="/WEB-INF/views/user/layout/header.jsp" />

    <%--페이지별 css/ js--%>

	<script type="text/javascript">
	var slideIndex = 0; //slide index

	// HTML 로드가 끝난 후 동작
	window.onload=function(){
	  showSlides(slideIndex);

	  // Auto Move Slide
	  var sec = 5000;
	  setInterval(function(){
	    slideIndex++;
	    showSlides(slideIndex);

	  }, sec);
	}


	// Next/previous controls
	function moveSlides(n) {
	  slideIndex = slideIndex + n
	  showSlides(slideIndex);
	}

	// Thumbnail image controls
	function currentSlide(n) {
	  slideIndex = n;
	  showSlides(slideIndex);
	}

	function showSlides(n) {

	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  var size = slides.length;

	  if ((n+1) > size) {
	    slideIndex = 0; n = 0;
	  }else if (n < 0) {
	    slideIndex = (size-1);
	    n = (size-1);
	  }

	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }

	  slides[n].style.display = "block";
	  dots[n].className += " active";
	}
	
	</script>

	<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing:border-box;
}

/* Slideshow container */
.slideshow-container {
  max-width: 960px;
  max-height: 450px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  height: 450px;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {

/* 	color: rgba(0,0,0,0.8); */
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 20px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 2px;
  width: 30px;
  margin: 0 auto;
  background-color: #bbb;
  border-radius: none;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
	</style>

	<style type="text/css">
	
	#line {
		height: 1px;
		width: 975px; 
		clear: both; 
		background-color: #e0e0e0;
		margin: 0 auto; 
	}
	
	map {
		margin: 0 auto;
	}
	#main_posts {
		margin: 0 auto;
		width: 975px;
		height: 240px;
		clear: both;
	}
	#best_review {
		border: 1px solid #9f8170;
		width: 415px;
		height: 200px;
		float: left;
		margin-top: 20px;
		margin-bottom: 20px;
		margin-left: 50px;
		border-radius: 5px;
	}
	#new_notice {
		border: 1px solid #9f8170;
		width: 415px;
		height: 200px;
		float: right;
		margin: 20px;
		margin-bottom: 20px;
		margin-right: 50px;
		border-radius: 5px;
	}
	.left__title {
		text-align: center;
		margin: 10px;
	}
	.notice__title {
		text-align: center;
		margin: 10px;
	}
	.review_line {
		width: 350px;
		border: 1px solid #ccc;
		background-color: #ccc;
		margin: 0 auto;
	}
	.notice_line {
		width: 350px;
		border: 1px solid #ccc;
		background-color: #ccc;
		margin: 0 auto;	
	}
	#best_review_div {
		margin: 0 auto;
		width: 350px;
	}
	table {
		width: 350px;
		padding: 5px;
		margin-top: 5px;
	}
	td {
		height: 40px;
	}
	#new_notice_div {
		margin: 0 auto;
		width: 350px;		
	}
	.balloon_03 {
		position:relative;
		margin-top: 15px;
		margin-bottom: 10px;
		margin-left: 25px;
		width:170px;
		height:80px;
		background:#ccc;
		border: 1px solid #ccc;
		border-radius: 10px;
		padding: 5px;
		cursor: pointer;
	}
	.balloon_03:after {
		border: 1px solid #ccc;
		border-top:15px solid #ccc;
		border-left: 15px solid transparent;
		border-right: 0px solid transparent;
		border-bottom: 0px solid transparent;
		content:"";
		position:absolute;
		top:10px;
		left:-15px;
	}
	
	#new_meeting_slider {
		display: flex;
		flex-direction: column;
		
		margin: auto;
		width: 950px;
		position: relative;
	}
	
	.meeting-wrap {
		display: flex;
		width: 950px;
		overflow: hidden;
		
	}
	
	.meeting-wrap.action > .meeting-list{
		transform: translate(-100%);
	}
	
	.meeting-list {
		padding: 8px;
		display: flex;
		min-width: 950px;
		justify-content: space-between;
		transition: transform 2s ease-in-out;
	}
	
	.meeting-thumbnail img {

		width: 160px;	
		height: 114px;
		border-radius: 4px;
		background-color: rgba(0,0,0,.1);
		background-repeat: no-repeat;
		background-size: cover;
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
	.meeting {
		text-align: center;
		margin-top: 20px;
	}
	
	#meeting_top {
		width: 920px;
		margin: 0 auto;
	}
	#new_meeting_title {
		float: left;
	}
	#all_meeting_button {
		float: right;
	}
	</style>

	<style>
		.slider-btn{
			cursor: pointer;
			position: absolute;
			top : 120px;
			font-size: 35px;
			color: #9f8170;
		}
		
		.pre-btn {
			left: -30px;
		}
		
		.next-btn {
			right: -30px;
		}
	</style>
</head>
<body>
<!-- 메인 슬라이더 부분 -->
<section id="slidshow__main">
	<br>
    <div class="slideshow-container">

<!--       Full-width images with number and caption text -->
      <div class="mySlides fade">
        <div class="numbertext">모임</div>
        <a href="/user/meeting/list"><img src="https://i.imgur.com/Q2LZgoD.jpg" style="width:100%"></a>
        <div class="text">Read With Me</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">후기</div>
        <a href="/user/review/list"><img src="https://i.imgur.com/JlETEYh.jpg" style="width:100%"></a>
        <div class="text">Read With Me</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">공지사항</div>
        <a href="/user/notice/list"><img src="https://imgur.com/MzZjMrO.jpeg" style="width:100%"></a>
        <div class="text">Read With Me</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">Read with Me</div>
        <img src="https://i.imgur.com/w9cOg62.jpg" style="width:100%">
        <div class="text">Read With Me</div>
      </div>

      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides(1)">&#10095;</a>
    </div>

    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(0)"></span>
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
    </div>
</section>

<!-- 모임 불러오기 -->
<section id="new_meeting_slider">
	<div class="pre-btn slider-btn" onclick="prevMeetingList()">&#10094;</div>
	<div class="next-btn slider-btn" onclick="nextMeetingList()">&#10095;</div>

	<div id="meeting_top">
		<div id="new_meeting_title">
			<h3>최근 생성된 모임</h3>
		</div>
		<div id="all_meeting_button">
			<a href="<%=request.getContextPath() %>/user/meeting/list"><button style="border: none; background-color: white;"><h5>모임 전체 보기</h5></button></a>
		</div>
	</div>
	
	<div class="meeting-wrap">
		
		<div class="meeting-list">
		<c:forEach begin="0" end="4" var="i">
			<div class="metting">
				<div class="meeting-thumbnail">
					<a href=
					<c:if test="${not empty user_no}">"/user/meeting/view?no=${list.get(i).meeting_no}"</c:if>
					<c:if test="${empty user_no}">"/login"</c:if>
					><img src="https://i.imgur.com/qxqjwv4.jpg""></a><br>
				</div>
				<div class="meeting-title">
					${list.get(i).meeting_title }<br>
				</div>
				<div class="meeting-info">	
					일시 <fmt:formatDate value="${list.get(i).meeting_start }" pattern="yyyy.MM.dd"/><br>
					장소 ${list.get(i).meeting_location }<br> <!-- 장소 이름으로 수정 -->
					인원 ${list.get(i).meeting_personnel }명<br>
					모집 <fmt:formatDate value="${list.get(i).meeting_rcr_end }" pattern="yyyy.MM.dd"/>까지
				</div>						 
			</div>
		</c:forEach>
		</div>
		<div class="meeting-list">
		<c:forEach begin="5" end="9" var="i">
			<div class="metting">
				<div class="meeting-thumbnail">
					<a href=
					<c:if test="${not empty user_no}">"/user/meeting/view?no=${list.get(i).meeting_no}"</c:if>
					<c:if test="${empty user_no}">"/login"</c:if>
					><img src="https://i.imgur.com/qxqjwv4.jpg""></a><br>
				</div>
				<div class="meeting-title">
					${list.get(i).meeting_title }<br>
				</div>
				<div class="meeting-info">	
					일시 <fmt:formatDate value="${list.get(i).meeting_start }" pattern="yyyy.MM.dd"/><br>
					장소 ${list.get(i).meeting_location }<br> <!-- 장소 이름으로 수정 -->
					인원 ${list.get(i).meeting_personnel }명<br>
					모집 <fmt:formatDate value="${list.get(i).meeting_rcr_end }" pattern="yyyy.MM.dd"/>까지
				</div>						 
			</div>
		</c:forEach>
		</div>

	</div>
</section>

<style>

</style>


<div id="line"></div>

<!-- 베스트 리뷰 및 공지사항 -->
<section id="main_posts">

    <div id="best_review">
        <h3 class="left__title">Best Review</h3>
        	<div class="review_line"></div>
				<div id="best_review_div">
					<table id="best_review_table">
					<c:forEach items="${reviewList}" var="review">
						<tr>
							<td style="width: 80%; text-align: left;"><a href="/user/review/view?review_no=${review.review_no }">${review.review_title}</a></td>
							
							<td style="width: 20%; text-align: center;">${review.nick}</td>
						</tr>
					</c:forEach>
					</table>
				</div>		
    </div>
    
    <div id="new_notice">
            <h3 class="notice__title">공지사항</h3>
				<div class="notice_line"></div>
            		<div id="new_notice_div">
					<table id="new_notice_table">
					<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td style="width: 65%; text-align: left;"><a href="/user/notice/view?board_no=${notice.board_no }">${notice.board_title}</a></td>
							<td style="width: 35%; text-align: center;"><fmt:formatDate value="${notice.board_date }" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
					</table>
				</div>	      
	</div>
</section>

<div id="line"></div>

<br>
	
<!-- 모임 위치 표시된 지도 -->	
<section id="meeting_map" style="width: 925px; height: 400px; clear: both; margin: 0 auto;">
	
	<div id="map" style="width:680px; height:400px; float: left;"></div>
			
		<div style="width: 230px; height: 400px; float: right; overflow-y:scroll;">
		<c:forEach items="${list }" var="meeting">
			<div class="balloon_03">${meeting.meeting_title }
				<div style="font-size: 15px;">일시 <fmt:formatDate value="${meeting.meeting_start }" pattern="yyyy.MM.dd"/><br>
				장소 ${meeting.meeting_location }
				</div>
			</div>
		</c:forEach>
		</div>
</section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a505904fc93655560fe82083bfde5b6&libraries=services"></script>
<script>
	var balloons = document.querySelectorAll('.balloon_03');
	var balloonsIndex = 0;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	var isFirst = true;

	<c:forEach items="${list }" var="meeting">
	geocoder.addressSearch('${meeting.meeting_address}', function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			// 마커를 생성합니다
		    const marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: coords // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    const infowindow = new kakao.maps.InfoWindow({
		        content: '<div>${meeting.meeting_title}</div>' // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    
		    if(isFirst) {
		    	map.setCenter(coords);
		    	isFirst = false;
		    }
		    
		    balloons[balloonsIndex++].addEventListener('click', () => map.setCenter(coords));
		} else {balloonsIndex++;}
	});
	</c:forEach>

	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	//모임 슬라이더
	function nextMeetingList() {
		const slider = document.querySelector('.meeting-wrap');
		if(!slider.classList.contains('action')) {
			slider.classList.add('action');
		}
	}
	
	function prevMeetingList() {
		const slider = document.querySelector('.meeting-wrap');
		if(slider.classList.contains('action')) {
			slider.classList.remove('action');
		}
	}
	
	/* 아래와 같이도 할 수 있습니다 */
	/*
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    (function(marker, infowindow) {
	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	            infowindow.open(map, marker);
	        });
	
	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	            infowindow.close();
	        });
	    })(marker, infowindow);
	}
	*/
</script>
</body>
	
<c:import url="/WEB-INF/views/user/layout/footer.jsp" />