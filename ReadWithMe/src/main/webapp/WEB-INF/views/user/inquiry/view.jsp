<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function(){
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"board_no",
				value:"${inquiry.board_no }"
			})
		).append(
			$("<textarea>")
				.attr("name", "content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	}); //$("#btnCommInsert").click() end
	
});

function deleteComment(comment_no) {
	$.ajax({
		type: "post"
		, url: "/comment/delete"
		, dataType: "json"
		, data: {
			comment_no: comment_no
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+comment_no+"']").remove();
				
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

</head>
<body>

<div style="height: 30px;"></div>

<div class="container">

<h1>1:1 질문</h1>

<div style="height: 30px;"></div>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${inquiry.board_no }</td>
	<td class="info">추천수</td><td id="recommend">${cntRecommend }</td>
</tr>
<tr>
	<td class="info">아이디</td><td>ReadWithMe</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${inquiry.board_date }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${inquiry.board_title }</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${inquiry.board_content }</td>
</tr>
</table>

<%-- <a href="/admin/faq/download?file_no=${FAQfile.fileNo }">${FAQfile.originName }</a> --%>

<div class="text-center">
	<a href="/user/inquiry/list"><button class="btn">목록</button></a>
	<c:if test="${id eq inquiry.user_no }">
		<a href="/user/faq/update?board_no=${inquiry.board_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/user/faq/delete?board_no=${inquiry.board_no }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>

<div style="height: 30px;"></div>

<h1>댓글</h1>
<div style="height: 30px;"></div>
<!-- 댓글 처리 -->
<div>

	<!-- 비로그인상태 -->
<%-- 	<c:if test="${not login }"> --%>
<!-- 	<strong>로그인이 필요합니다</strong><br> -->
<!-- 	<button onclick='location.href="/member/login";'>로그인</button> -->
<!-- 	<button onclick='location.href="/member/join";'>회원가입</button> -->
<%-- 	</c:if> --%>
	
	<!-- 로그인상태 -->
<%-- 	<c:if test="${login }"> --%>
	<!-- 댓글 입력 -->
	<div class="form-inline text-center pull-left" >
		<input type="text" size="10" class="form-control" id="commentWriter" value="${nick }" readonly="readonly"/>
		<textarea rows="1" cols="60" class="form-control" id="commentContent"></textarea>
		<button id="btnCommInsert" class="btn">입력</button>
	</div>	<!-- 댓글 입력 end -->
<%-- 	</c:if> --%>
	
	<div style="height: 80px;"></div>

	<!-- 댓글 리스트 -->
	<table class="table table-hover table-condensed" >
	<thead>
	<tr>
		<th style="width: 5%;">#</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 50%;">내용</th>
		<th style="width: 20%;">작성일</th>
		<th style="width: 5%;"></th>
	</tr>
	</thead>
	<tbody id="commentBody">
	<c:forEach items="${commentList }" var="comment">
	<tr data-commentno="${comment.comment_no }">
		<td style="width: 5%;">${comment.rnum }</td>
		<td style="width: 10%;">${comment.id }</td><!-- 닉네임으로 해도 좋음 -->
		<td style="width: 50%;">${comment.content }</td>
		<td style="width: 20%;"><fmt:formatDate value="${comment.write_date }" pattern="yy-MM-dd hh:mm:ss" /></td>
		<td style="width: 5%;">
			<c:if test="${sessionScope.id eq comment.id }">
			<button class="btn btn-xs"
				onclick="deleteComment(${comment.comment_no });" style="color: red;">x</button>
			</c:if>
		</td>
		
	</tr>
	</c:forEach>
	</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->

</div><!-- .container -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
