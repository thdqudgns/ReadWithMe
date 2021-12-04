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

	<style type="text/css">
section {
	width: 700px;
	margin: 0 auto;
}
h2 {
	margin-top: 60px;
	margin-bottom: 30px;
	text-align: center;
	color: #333333;
}
#line {
	height: 2px;
	width: 700px;
	background-color: #e0e0e0;
	margin: 0 auto;
}
#myReview_title {
	margin: 20px;
}
table {
	margin: 30px;
    width: 650px;
    border-top: 1px solid #ccc;
    border-collapse: collapse;
    text-align: center;
}
th {
    border-bottom: 1px solid #ccc;
    padding: 10px;
    width: 70px;
  }
	</style>

</head>

<section id="myReview">
	
	<h2>My Page</h2>
	<div id="line"></div>

	<div class="container">
	
		<div id="myReview_title">
			<h3>내가 작성한 후기</h3>
			<p>지금까지 작성한 후기를 살펴보세요!</p>
		</div>
	
        <table>
            <thead>
	            <tr class="division">
	                <th style="width: 50px;">제목</th>
	                <th style="width: 20px;">작성자</th>
	                <th style="width: 20px;">날짜</th>
	                <th style="width: 10px;">조회수</th>
	            </tr>
            </thead>
                  
            <tbody>

            <c:forEach items="${reviewList }" var="reviewList">
                <tr>
                    <td style="border-bottom: 1px solid #ccc;" id='title'>
                        <a style="text-decoration: none;" href="/user/mypage/myReview/view?review_no=${reviewList.review_no }">${reviewList.review_title }</a>
                    </td>
                    <td style="border-bottom: 1px solid #ccc;">${reviewList.nick}</td>
					<td style="border-bottom: 1px solid #ccc;"><fmt:formatDate value="${reviewList.review_date }" pattern="yyyy-MM-dd"/></td>
                    <td style="border-bottom: 1px solid #ccc;">${reviewList.review_views }</td>					
                </tr>
            </c:forEach>

            </tbody>

        </table>	

	<c:import url="/WEB-INF/views/user/layout/myReviewPaging.jsp" />
	
	</div><!-- .container -->	
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />