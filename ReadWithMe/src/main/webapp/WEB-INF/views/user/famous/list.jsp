<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function() {

// 	$(this).parents("table.famous-tb").find("div#recommend").html(data.cnt);
	
// 	if(${isRecommend}) {
// 		$("#btnRecommend")
// // 		$.parents("table.famous-tb").find("#btnRecommend")
// 			.addClass("btn-rec-warning")
// 			.html('추천 취소');
// 	} else {
// 		$("#btnRecommend")
// // 		$.parents("table.famous-tb").find("#btnRecommend")
// 			.addClass("btn-rec-origin")
// 			.html('추천');
// 	}

	//검색 버튼 클릭
	$("#btnfamousSearch").click(function() {
		location.href="/user/famous/list?search="+$("#famousSearch").val();
	});
	
	// 글 입력
	$("#btnInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/user/famous/insert",
			method: "get"
		}).append(
		$("<textarea>")
			.attr("name", "famous_content")
			.css("display", "none")
			.text($("#famous_content").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnInsert").click() end
	

});
	
//추천
function btnRecommend(famous_no, th) {
	

// 	console.log(th)
// 	console.log( $(th).parents("table.famous-tb") )
	
// 	var $tb = $(th).parents("table.famous-tb");
	var $tb = $(th).parents("table.famous-tb tr[data-famous_no='" + famous_no + "']");
	
		$.ajax({
			type: "get"
			, url: "/user/famous/recommend"
			, data: { famous_no: famous_no }
			, dataType: "json"
			, success: function( data ) {
					console.log("성공");
	
				if( data.success ) { //추천 성공
					$tb.find("button#btnRecommend")
					.removeClass("btn-rec-origin")
					.addClass("btn-rec-warning")
					.html('추천 취소');
				
				} else { //추천 취소 성공
					$tb.find("button#btnRecommend")
					.removeClass("btn-rec-warning")
					.addClass("btn-rec-origin")
					.html('추천');
				
				}
				
				//추천수 적용
				$tb.find("div#recommend").html(data.cnt);
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
} //$("#btnRecommend").click() end
	


//글 수정 입력 창 활성화
function updateInput(th) {
	console.log( $(th).parents("table.famous-tb") )
	
	var $tb = $(th).parents("table.famous-tb");
	
	console.log( $tb.find("td.famouse-content") )

	var beforeContent = $tb.find("td.famouse-content").html();
	
	$tb.find("td.famouse-content").html("")
	$("<input>").attr({
		type: "text"
		, name: "famous_content"
		, value: beforeContent
	}).appendTo( $tb.find("td.famouse-content") )

	$(th).next().show();
	$(th).remove();
	
}

//글 수정
function updateFamous(famous_no, th) {
	
	$.ajax({
		type: "post"
		, url: "/user/famous/update"
		, dataType: "json"
		, data: {
			famous_no: famous_no
			, famous_content: $(th).parent().prev().find("input[name='famous_content']").val()
		}
		, success: function(data){
			if(data.success) {
				
				location.href="/user/famous/list?curPage=${paging.curPage}";
				
			} else {
				alert("글 수정 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}

//글 삭제
function deleteFamous(famous_no, th) {
// 	console.log(th)
// 	console.log( $(th).parents("table.famous-tb") )
// 	console.log( $(th).parents("table.famous-tb").next("hr.famous-hr") )
	
	
	$.ajax({
		type: "post"
		, url: "/user/famous/delete"
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

//신고
function reportFamous(famous_no, th){
	console.log(th)
	console.log( $(th).parents("table.famous-tb") )
	
	$.ajax({
		type: "get"
		, url: "/user/famous/report"
		, dataType: "json"
		, data: {
			famous_no: famous_no
		}
		, success: function(data){
			if(data.success) {
				alert("신고합니다")
				
			} else {
				alert("신고 실패");
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
#search {text-align:center;vertical-align: middle;margin: 0 auto;}
</style>

<div class="container">

<h1>명언 게시판</h1>
<hr>

<br>

	<!-- 비로그인상태 -->
	<c:if test="${not login }">
	<strong>글 작성을 위해선 로그인이 필요합니다</strong><br>
	<button onclick='location.href="/join";' class="btn-white">회원가입</button>
	<button onclick='location.href="/login";' class="btn-white">로그인</button>
	<br><br>
	<hr class="famous-hr">
	</c:if>

	<!-- 로그인상태 -->
	<c:if test="${login }">
	<!-- 글 입력 -->
	<div class="center insert">
		<strong>글 작성</strong><br>
		<input type="text" size="15" class="form-control" id="famousWriter" style="margin-bottom:5px;" name="nick" value="${user_nick }" readonly="readonly"/><br>
		<textarea rows="2" cols="86" class="form-control" id="famous_content"></textarea><br>
		<div style="display: inline-block;text-align: right;width:620px;"><button id="btnInsert" type="submit" class="btn-brown">입력</button></div>
		<br><br>
	</div>	<!-- 글 입력 end -->
	</c:if>

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

		    <c:if test="${famousList.ISRECOMMEND == 0 }">
		    	<button onclick="btnRecommend(${famousList.FAMOUS_NO },this);" id="btnRecommend" class="btn-rec-origin" >추천</button> 
		    </c:if>
		    <c:if test="${famousList.ISRECOMMEND == 1}">
		    	<button onclick="btnRecommend(${famousList.FAMOUS_NO },this);" id="btnRecommend" class="btn-rec-warning" >추천 취소</button> 
		    </c:if>
		    
 			&Iota;
<%-- 		    <div id="recommend" style="display:inline-block">${cntRecommend}</div> --%>
		    <div id="recommend" style="display:inline-block">${famousList.CNTRECOMMEND}</div>
		    </th>
			</c:if>
		  </tr>
		  <tr>
		    <td class="td famous-no">${famousList.FAMOUS_NO }</td>
		    <td class="td famouse-content" style="text-align:left;">${famousList.FAMOUS_CONTENT}</td>
		    <td class="td" style="text-align: right;" colspan="2">
		    	<c:if test="${user_no eq famousList.USER_NO }">
				<button class="btn-gray" onclick="updateInput(this);">수정</button>
				<button class="btn-gray" style="display: none;" onclick="updateFamous(${famousList.FAMOUS_NO }, this);">적용</button>
				<button class="btn-gray" onclick="deleteFamous(${famousList.FAMOUS_NO }, this);">삭제</button>
				</c:if>
		    	<c:if test="${user_no ne famousList.USER_NO and login}">
		    	<button class="btn-report" onclick="reportFamous(${famousList.FAMOUS_NO }, this);">신고</button>
				</c:if>
		  </tr>
		  <tr>
		  	<td colspan="4"></td>
		  </tr>
	</table>
	<hr class="famous-hr">
</c:forEach> 


<div class="clearfix"></div>

<br>

<div class="text-center">
	<form id="famousSearch" action="/user/famous/list" method="get" style="width:250px;">
	<input class="form-control" type="text" name="search" style="width:180px;border: 3px solid #9f8170;"/>
	<button id="btnfamousSearch" type="submit" style="width:26px;height:25px;border: 3px solid #9f8170;background-color:#9f8170; ">
		<img style="margin-top:1px;object-fit:full;width:14px;height:12px;" alt="search" src="https://i.imgur.com/97QT6ay.png">
	</button>
	</form>
</div>

<br>

<c:import url="/WEB-INF/views/user/layout/famousPaging.jsp" />

</div><!-- .container -->


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />