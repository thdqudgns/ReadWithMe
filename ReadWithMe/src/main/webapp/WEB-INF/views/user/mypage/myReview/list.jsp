<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">
<head>
    <%--head meta data--%>
	<c:import url="/WEB-INF/views/user/layout/header.jsp" />
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>



</head>

<section id="myReview">
	
	<h2>My Page</h2>
	<div id="line"></div>

	<div class="container">
	
		<h3>내가 작성한 후기</h3>
		<p>지금까지 작성한 후기를 살펴보세요!</p>
	
        <table>
            <thead>
	            <tr class="division">
<!-- 	                <th>썸네일</th> -->
	                <th>제목/본문</th>
	                <th>작성자</th>
	                <th>날짜</th>
	                <th>조회수</th>
	            </tr>
            </thead>
                  
            <tbody>

            <c:forEach items="${list }" var="myReviewList">
                <tr>
                    <td id='title'>
                        <a href="/user/mypage/myReview/view?review_no=${myReviewList.review_no }">${myReviewList.review_title }</a>
                    </td>
                    <td rowspan="2">${myReviewList.nick}</td>
					<td><fmt:formatDate value="${myReviewList.review_date }" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr>
                    <td id='content'>
                        <c:choose>
                            <c:when test="${fn:length(myReviewList.review_content) > 14}">
                                <c:out value="${fn:substring(myReviewList.review_content,0,13)}"/>....
                            </c:when>
                            <c:otherwise>
                                <c:out value="${myReviewList.review_content }"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>

            </tbody>

        </table>	

	<c:import url="/WEB-INF/views/user/layout/reviewPaging.jsp" />
	
	</div><!-- .container -->	
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />