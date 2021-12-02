<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {

	//검색 버튼 클릭
	$("#btnfamousSearch").click(function() {
		location.href="/admin/famous/list?search="+$("#famousSearch").val();
	});
	
});
	

//글 삭제
function deleteFamous(famous_no, th) {
// 	console.log(th)
// 	console.log( $(th).parents("table.famous-tb") )
// 	console.log( $(th).parents("table.famous-tb").next("hr.famous-hr") )
	
	
	$.ajax({
		type: "post"
		, url: "/admin/famous/delete"
		, dataType: "json"
		, data: {
			famous_no: famous_no
		}
		, success: function(data){
			if(data.success) {
				
				$(th).parents("table.famous-tb").next("hr.famous-hr").remove()
				$(th).parents("table.famous-tb").remove()
				
			} else {
				alert("글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

</script>

<style type="text/css">
.insert {text-align: left;margin-left:35px;}
.container {margin: 0 auto;text-align: center;align-content: center;align-items: center;width:700px;}
table{margin: 0 auto;/* border-bottom: 1px solid gray; */}
/* table, th, td{border: 1px solid gray;} */
.famous-tb  {border-collapse:collapse;border-spacing:0;undefined;table-layout:fixed; width:700px;text-align: center;}
.famous-tb th{font-size:12px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb th.td-rec {text-align: right;}
.famous-tb td{font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb .td{border-color:inherit;text-align:center;vertical-align:middle;}
.famous-hr {width:700px;margin: 0 auto;}
.btn-rec-origin {border:none;background-color:#FFF;color:black;font-size:12px;border-radius:20%;}
.btn-rec-primary {border:none;background-color:#9f8170;color:#FFF;font-size:12px; border-radius:20%;}
.btn-rec-warning {border:none;background-color:#FFF;color:red;font-size:12px;border-radius:20%;}
</style>

<div class="container">

<h1>명언 게시판 관리</h1>
<hr>

<br>


<c:forEach items="${famousList }" var="famousList">
	<table class="famous-tb">
		<colgroup>
		<col style="width: 45px">
		<col style="width: 450px">
		<col style="width: 30px">
		<col style="width: 70px">
		</colgroup>
		
		  <tr data-famous_no="${famousList.FAMOUS_NO }">
		    <th class="td"><img style="width:20px;height:20px;" alt="profile" src="https://i.imgur.com/G5gV56A.png"></th>
			<th class="td" style="text-align:left;">${famousList.NICK } <span style="color:gray;font-size:10px;">(<fmt:formatDate value="${famousList.FAMOUS_DATE }" pattern="yyyy.MM.dd HH:mm"/>)</span></th>
			<c:if test="${login }">
		    <th class="td-rec" colspan="2">
		    <div id="recommend" style="display:inline-block">${famousList.CNTRECOMMEND}</div>
		    </th>
			</c:if>
		  </tr>
		  <tr>
		    <td class="td famous-no">${famousList.FAMOUS_NO }</td>
		    <td class="td famouse-content" style="text-align:left;">${famousList.FAMOUS_CONTENT}</td>
		    <td class="td" style="text-align: right;" colspan="2">
				<button class="btn-black" onclick="deleteFamous(${famousList.FAMOUS_NO }, this);">삭제</button>
		  </tr>
		  <tr>
		  	<td colspan="4"></td>
		  </tr>
	</table>
	<hr class="famous-hr">
</c:forEach> 


<div class="clearfix"></div>

<br>

<div class="form-inline text-center">
	<input class="form-control" type="text" name="search" id="famousSearch"/>
	<button id="btnfamousSearch" type="submit" class="btn">검색</button>
</div>

<br>

<c:import url="/WEB-INF/views/admin/layout/adminFamousPaging.jsp" />

</div><!-- .container -->


<c:import url="/WEB-INF/views/admin/layout/footer.jsp" />