<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/user/famous/list?search="+$("#search").val();
	});
})
</script>

<style type="text/css">
.container {margin: 0 auto;text-align: center;}
table {margin: 0 auto;}
.famous-tb  {border-collapse:collapse;border-spacing:0;}
.famous-tb th{font-size:10px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb td{font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb .td{border-color:inherit;text-align:center;vertical-align:middle;}
.famousHr {width:700px;margin: 0 auto;}
</style>

<div class="container">

<h1>명언 게시판</h1>
<hr>

<br>

	<c:forEach items="${list }" var="famous">
<table class="famous-tb" style="undefined;table-layout:fixed; width:700px;text-align: center;">
	<colgroup>
	<col style="width: 45px">
	<col style="width: 450px">
	<col style="width: 40px">
	<col style="width: 40px">
	</colgroup>
	
	  <tr>
	    <th class="td"><img style="width:20px;height:20px;" alt="profile" src="https://i.imgur.com/G5gV56A.png"></th>
	<%-- <c:forEach items="${nick }" var="nick"> --%>
		<th class="td" style="text-align:left;">AAA (<fmt:formatDate value="${famous.famous_date }" pattern="yy-MM-dd HH:mm"/>)</th>
	<%-- </c:forEach> --%>
	    <th class="td" colspan="2">(이미지) &Iota; (추천수)</th>
	  </tr>
	  <tr>
	    <td class="td">${famous.famous_no }</td>
	    <td class="td" style="text-align:left;">${famous.famous_content}</td>
	    <td class="td" colspan="2"><a>수정</a> &Iota; <a>삭제</a></td>
	  </tr>
	  <tr>
	  	<td colspan="4"></td>
	  </tr>
</table>
	  <hr class="famousHr">
	</c:forEach> 

<div class="clearfix"></div>

<br>

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" value="${param.search }" />
	<button id="btnSearch" class="btn-white">검색</button>
</div>

<c:import url="/WEB-INF/views/user/layout/famousPaging.jsp" />

</div><!-- .container -->


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />