

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>


<%-- <c:import url="/WEB-INF/views/layout/header.jsp" /> --%>



<%-- <c:import url="/WEB-INF/views/layout/footer.jsp" /> --%><%-- <c:import url="/WEB-INF/views/layout/footer.jsp" /> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!doctype html>
<html lang="ko">
<head>
    <%--head meta data--%>
	<c:import url="/WEB-INF/views/user/layout/header.jsp" />

    <%--페이지별 css/ js--%>
	<link href="${path}/resources/css/main_home.css" rel="stylesheet" />
	<script src="${path}/resources/js/main_home_script.js"></script>


</head>


<script type="text/javascript">
$(document).ready(function() {
	var $slider_list = $("#slider li")
	console.log($slider_list)


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />


	$slider_list.css("left", $("#sliderbox").css("width"))
	$slider_list.eq(0).css("left", 0)

	var sliderClick = function() {
		$("#sliderbox").click()	
	}
	
	var tid = setInterval( sliderClick, 5000 );
	var curSlide = 0;
	
	$("#sliderbox").click(function() {

		clearInterval( tid )
		tid = setInterval( sliderClick, 5000 );

		var nextSlide = curSlide + 1;
		nextSlide %= $slider_list.length;	
		
		console.log(curSlide, ":", nextSlide)

		//현재 슬라이드 숨기기 - curSlide
		$slider_list.eq(curSlide).animate({"left": "-=" + $("#sliderbox").css("width") })

		//다음 슬라이드 준비하기
		$slider_list.eq(nextSlide).css("left", $("#sliderbox").css("width"))
		
		//다음 슬라이드 보여주기 - nextSlide
		$slider_list.eq(nextSlide).animate({"left": "-=" + $("#sliderbox").css("width") })

		//증가식 (순환구조 만들기)
		curSlide++;
		curSlide %= $slider_list.length;
	})
})
</script>

<style type="text/css">
/* 이미지 슬라이더 박스 */
#sliderbox {
	width: 600px;
	height: 400px;
	border: 1px solid #ccc;
	
	/* 외부 여백 */
	margin: 0 auto;
	
	/* div영역을 벗어난 부분을 안보이게 처리 */
/* 	overflow: visible; */
 	overflow: hidden;
}

#slider {
	/* ul태그의 기본 스타일 제거 */
	padding: 0;
	margin: 0;
	list-style-type: none;
	
	/* 자식요소 absolute박스의 기준점으로 설정하기 */
	position: relative;
}

#slider li {
	position: absolute;
}

#slider li img {
	width: 600px;
	height: 400px;
}

</style>


<br>
<div id="sliderbox">
	<ul id="slider">
		<li><a href="<%=request.getContextPath() %>/모임" id="slider_review"> <img src="https://i.imgur.com/tisbV2F.jpeg" /> </a> </li>
		<li><a href="<%=request.getContextPath() %>/공지사항"><img src="https://i.imgur.com/biRRCvx.jpeg" /></a></li>
		<li><a href="<%=request.getContextPath() %>/user/famous/list"><img src="https://i.imgur.com/AD3MbBi.jpeg" /></a></li>
		<li><a href="<%=request.getContextPath() %>/user/review/list"><img src="https://i.imgur.com/0LINzxs.jpeg"/></a></li>
	</ul>
</div>	
<br>

<h3>최근 생성된 모임</h3>
<a href="<%=request.getContextPath() %>/모임"><button><h5>모임 전체 보기</h5></button></a>

<hr>

<section id="best-posts">
    <div class="left">
        <h4 class="left__title">후기</h4>

        <c:forEach items="${requestScope.bestReviews}" var="post">
            <a href="${pageContext.request.contextPath}/board/detail?postno=${review.review_no}" class="post">
                <div class="review__title">${review.review_title}
                    <c:if test="${review.commentsNum ne 0}">
                        <span>(${review.commentsNum})</span>
                    </c:if>
                </div>
                <div class="review__like-num">${review.review_views}</div>
            </a>
        </c:forEach>
    </div>
    
    <div class="right">
        <div class="notice">
            <h4 class="notice__title">공지사항</h4>

            <fmt:formatDate value="<%=new Date()%>" pattern="yyyyMMdd" var="now"/>
            <c:forEach items="${requestScope.notices}" var="notice">
                <fmt:formatDate value="${notice.board_date}" pattern="yyyyMMdd" var="noticeDate"/>
                <a href="${pageContext.request.contextPath}/board/detail?postno=${notice.board_no}" class="notice-post">
                    <c:if test="${now eq noticeDate}">
                        <div class="new-icon">N</div>
                        <div class="notice-post__description">
                            <fmt:formatDate value="${notice.board_date}" pattern="HH:mm" var="dateNotice"/>
                                ${dateNotice} | ${notice.board_title}</div>
                    </c:if>
                    <c:if test="${now ne noticeDate}">
                        <div class="notice-post__description">
                            <fmt:formatDate value="${notice.board_date}" pattern="MM/dd" var="dateNotice"/>
                                ${dateNotice} | ${notice.board_title}</div>
                    </c:if>
                </a>
            </c:forEach>
        </div>       
	</div>
</section>

<hr>

	<div id="map" style="width:900px;height:500px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a505904fc93655560fe82083bfde5b6"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);
	</script>
	
<c:import url="/WEB-INF/views/user/layout/footer.jsp" />



