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
	<link href="${path}/resources/css/main_home.css" rel="stylesheet" />
	<script src="${path}/resources/js/main_home_script.js"></script>

</head>

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