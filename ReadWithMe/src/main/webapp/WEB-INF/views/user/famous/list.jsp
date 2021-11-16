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
	
	//추천
	if(${isRecommend}) {
		$("#btnRecommend")
			.addClass("btn-warning")
			.html('추천 취소');
	} else {
		$("#btnRecommend")
			.addClass("btn-primary")
			.html('추천');
	}
	
	$("#btnRecommend").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/user/famous/recommend"
			, data: { "famous_no": '${famous.famous_no }' }
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");
	
				if( data.result ) { //추천 성공
					$("#btnRecommend")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$("#btnRecommend")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('추천');
				
				}
				
				//추천수 적용
				$("#recommend").html(data.cnt);
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#btnRecommend").click() end
	
	
	// 글 입력
	$("#btnInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/user/famous/insert",
			method: "post"
		}).append(
			$("<textarea>")
				.attr("name", "famous_content")
				.css("display", "none")
				.text($("#famous_content").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnInsert").click() end
})

//글 수정 도와주세용~!!
function updateFamous(famous_no) {
	$.ajax({
		type: "post"
		, url: "/user/famous/update"
		, dataType: "json"
		, data: {
			famous_no: famous_no
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-famous_no='"+famous_no+"']").remove(); // remove대신 뭘 써야 하나?
				
			} else {
				alert("댓글 수정 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

//글 삭제
function deleteFamous(famous_no) {
	$.ajax({
		type: "post"
		, url: "/user/famous/delete"
		, dataType: "json"
		, data: {
			famous_no: famous_no
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-famous_no='"+famous_no+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
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
table {margin: 0 auto;}
.famous-tb  {border-collapse:collapse;border-spacing:0;undefined;table-layout:fixed; width:700px;text-align: center;}
.famous-tb th{font-size:12px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb th.td-rec {text-align: right;}
.famous-tb td{font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
.famous-tb .td{border-color:inherit;text-align:center;vertical-align:middle;}
.famousHr {width:700px;margin: 0 auto;}
.td a {text-decoration: none;color:gray;font-size:12px;}
.td a:active {text-decoration: none;color:tomato;}
</style>

<div class="container">

<h1>명언 게시판</h1>
<hr>

<br>

	<!-- 비로그인상태 -->
	<c:if test="${not login }">
	<strong>글 작성을 위해선 로그인이 필요합니다</strong><br>
	<button onclick='location.href="/user/member/join";' class="btn-white">회원가입</button>
	<button onclick='location.href="/user/member/login";' class="btn-white">로그인</button>
	<br><br>
	<hr class="famousHr">
	</c:if>

	<!-- 로그인상태 -->
	<c:if test="${login }">
	<!-- 글 입력 -->
	<div class="center insert">
		<strong>글 작성</strong><br>
		<input type="text" size="15" class="form-control" id="famousWriter" style="margin-bottom:5px;" value="${nick }" readonly="readonly"/><br>
		<textarea rows="2" cols="86" class="form-control" id="famous_content"></textarea><br>
		<div style="display: inline-block;text-align: right;width:620px;"><button id="btnInsert" class="btn-brown">입력</button></div>
		<br><br>
	</div>	<!-- 글 입력 end -->
	</c:if>

<c:forEach items="${list }" var="famous">
	<table class="famous-tb">
		<colgroup>
		<col style="width: 45px">
		<col style="width: 450px">
		<col style="width: 60px">
		<col style="width: 40px">
		</colgroup>
		
		  <tr>
		    <th class="td"><img style="width:20px;height:20px;" alt="profile" src="https://i.imgur.com/G5gV56A.png"></th>
		<%-- <c:forEach items="${nick }" var="nick"> --%>
			<th class="td" style="text-align:left;">AAA <span style="color:gray;font-size:10px;">(<fmt:formatDate value="${famous.famous_date }" pattern="yyyy.MM.dd HH:mm"/>)</span></th>
		<%-- </c:forEach> --%>
		    <th class="td-rec" colspan="2"><button id="btnRecommend" style="border:none;background-color:#FFF;"><img alt="reco" src="https://i.imgur.com/5LmbVvS.png" width="16px;" height="16px;"></button> &Iota; ${famous.famous_rcmnd}</th>
		  </tr>
		  <tr>
		    <td class="td">${famous.famous_no }</td>
		    <td class="td" style="text-align:left;">${famous.famous_content}</td>
		    <td class="td">
		    	<c:if test="${sessionScope.user_no eq famous.user_no }">
				<button class="btn-gray" onclick="updateFamous(${famous.famous_no });">수정</button>
				<button class="btn-gray" onclick="deleteFamous(${famous.famous_no });">삭제</button>
				</c:if>
		    
		    </td>
		    <td class="td"><a href="#">신고</a></td>
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
	<input class="form-control" type="text" name="search" id="search" style="width:180px;border: 3px solid #9f8170;" value="${param.search }" />
	<button id="btnSearch" type="submit" style="width:26px;height:25px;border: 3px solid #9f8170;background-color:#9f8170; "><img style="margin-top:1px;object-fit:full;width:14px;height:12px;" alt="search" src="https://i.imgur.com/97QT6ay.png"></button>
</div>

<br>

<c:import url="/WEB-INF/views/user/layout/famousPaging.jsp" />

</div><!-- .container -->


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />