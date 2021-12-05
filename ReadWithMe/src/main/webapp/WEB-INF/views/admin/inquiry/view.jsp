<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/admin/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		
		$form = $("<form>").attr({
			action: "/admin/comment/insert",
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
	
	//	댓글확인 토글 버튼
	$(".toggleForComment").click(function(){
		console.log("입력");
		$("#toggle").toggle();
		
	});
	
	//	답변 완료 버튼
	$("#check_reply").click(function(){
		$.ajax({
			url : "/admin/inquiry/check_reply",
			data : {
				data_for_board_no : "${inquiry.board_no}"
			},
			method : 'post',
			dataType : "json",
			success : function(jdata) {
				if(jdata.result = 1) {
					alert("답변 완료");
				} else {
					alert("실패");
				}
			}
		})	
	});
	
	$("#btnMail").click(function(){	
				location.href = "/admin/inquiry/sendMail?user_no=" + ${inquiry.user_no};
	});
	
});

function deleteComment(comment_no) {
	$.ajax({
		type: "post"
		, url: "/admin/comment/delete"
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

// 댓글 수정
function updateComment(comment_no, content) {
	
	console.log("클릭");
	
	//	댓글 수정란
	var htmls = "";
	
	htmls += "<div>";
	htmls += "<input type='text' id='editContent' value=";
	htmls += content;
	htmls += ">";
	htmls += "<span>";
	htmls += "<span class='saveComment' onclick=" + "updateReply(" + comment_no + ");" + ">저장</span>";
	htmls += "<span class='cancelComment' onclick='cancelReply()'>취소</span>";
	htmls += "</span>";
	htmls += "</div>";
	
	$("#content" + comment_no).replaceWith(htmls);
	
}
	
	
function updateReply(comment_no) {
	
	var content = $("#editContent").val();
	
	console.log(content);
	
	//	댓글 번호, 댓글 내용 전달 
	$.ajax({
		type: "post",
		url : "/admin/comment/update",
		data : {
			comment_no : comment_no,
			content : content
		},
		success : function() {
			alert("성공");
		},
		error : function() {
			alert("에러");
		}
	});
	
	window.location.reload();
	
}
	function cancelReply(){
		window.location.reload();
	}

</script>

<style type="text/css">
.banner {
	height: 180px;
	background-image: url('/resources/img/book(1).jpg');
	color: white;
}

.toggleForComment {
	cursor: pointer;
}

#toggle {
	display: none;
}

#commentContent {
	width: 600px;
	height: 34px;
	margin-bottom: 30px;
	border: 1px solid #D3D3D3;
}

.deleteComment {
	cursor: pointer;
}

#editContent{
	border: 1px solid #D3D3D3;
}

.saveComment {
	color: gray;
	cursor: pointer;
	margin-right: 2px;
}

.cancelComment{
	color: gray;
	cursor: pointer;
}

</style>

</head>
<body>

	<div class="container" style="height: 1000px;">

		<div style="height: 30px;"></div>

		<h1>1:1 질문</h1>

		<div style="height: 45px;"></div>

		<table class="table table-bordered" style="border-collapse: collapse;">
			<tr>
				<td>글 번호</td>
				<td>${inquiry.board_no }</td>
				<td>답변여부</td>
				<td id="recommend">
				<c:if test="${inquiry.check_reply == 1 }">
				<span class="glyphicon glyphicon-envelope"></span>
				</c:if>
				<c:if test="${inquiry.check_reply == 0 }">
				</c:if>				
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>ReadWithMe</td>
				<td>작성일</td>
				<td><fmt:formatDate value="${inquiry.board_date }"
						pattern="yyyy.MM.dd HH:mm" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${inquiry.board_title }</td>
			</tr>
			<tr>
				<td colspan="4">본문</td>
			</tr>
			<tr>
				<td colspan="4">${inquiry.board_content }</td>
			</tr>
		</table>

		<a href="/admin/inquiry/download?file_no=${inquiry_file.file_no }">${inquiry_file.origin_name }</a>

		<%-- <a href="/admin/faq/download?file_no=${FAQfile.fileNo }">${FAQfile.originName }</a> --%>

		<div class="text-center">
			<a href="/admin/inquiry/list" style="color: black;"><button
					class="btn"
					style="border-color: #D3D3D3; background: white; color: gray;">목록</button></a>
<%-- 			<c:if test="${id eq viewBoard.writerId }"> --%>
						<a href="/admin/inquiry/delete?board_no=${inquiry.board_no }"><button class="btn" style="border-color: #D3D3D3; background: white; color: gray;">삭제</button></a>
<%-- 			</c:if> --%>
			<button id="check_reply" class="btn"
				style="border-color: #D3D3D3; background: white; color: gray;">답변 완료</button>
			<button id="btnMail" class="btn"
				style="border-color: #D3D3D3; background: white; color: gray;">url 링크 메일 보내기</button>
		</div>

			<div style="height: 50px;"></div>

			<div class="toggleForComment"
				style="border: 1px solid #D3D3D3; width: 100px; height: 29px; text-align: center; color: gray;">답변</div> 

			<div style="height: 20px;"></div>

			<div id="toggle">

				<!-- 비로그인상태 -->
				<%-- 	<c:if test="${not login }"> --%>
				<!-- 	<strong>로그인이 필요합니다</strong><br> -->
				<!-- 	<button onclick='location.href="/member/login";'>로그인</button> -->
				<!-- 	<button onclick='location.href="/member/join";'>회원가입</button> -->
				<%-- 	</c:if> --%>

				<!-- 로그인상태 -->
				<%-- 	<c:if test="${login }"> --%>
				<!-- 댓글 입력 -->
				<div class="form-inline text-center pull-left">
					 <input type="text"  id="commentContent"/>
				</div>
				
				<div>
				<button id="btnCommInsert" class="btn"
						style="border-color: #D3D3D3; background: white; color: gray;">입력</button>
				</div>
				<!-- 댓글 입력 end -->
				<%-- 	</c:if> --%>

				<!-- 댓글 리스트 -->
				<table class=" table table-condensed table-bordered">
					<!-- 	<thead> -->
					<!-- 	<tr> -->
					<!-- 		<th style="width: 5%;">#</th> -->
					<!-- 		<th style="width: 10%;">작성자</th> -->
					<!-- 		<th style="width: 50%;">내용</th> -->
					<!-- 		<th style="width: 20%;">작성일</th> -->
					<!-- 		<th style="width: 10%;"></th> -->
					<!-- 	</tr> -->
					<!-- 	</thead> -->
					<tbody id="commentBody">
						<c:forEach items="${commentList }" var="comment">
							<tr data-commentno="${comment.comment_no }">
								<td style="width: 10%;">${comment.id }</td>
								<!-- 닉네임으로 해도 좋음 -->
								<td style="width: 50%;">
									<div id="content${comment.comment_no }"
										style="border-color: skyblue; border-radius: 3px; text-align: center;">
										${comment.content }</div>
								</td>
								<td style="width: 8%;"><fmt:formatDate
										value="${comment.write_date }" pattern="yyyy.MM.dd hh:mm" /></td>
								<td style="width: 2.5%;">
								<span onclick="updateComment(${comment.comment_no}, '${comment.content }');" style="cursor: pointer; color: gray;">수정</span>
								</td>
								<td style="width: 2.5%;">
									<c:if
										test="${sessionScope.id eq comment.id }">
										<span class="deleteComment"
											onclick="deleteComment(${comment.comment_no });"
											style="color: gray;">삭제</span>
									</c:if></td>

							</tr>
						</c:forEach>
				</table>
				<!-- 댓글 리스트 end -->

			</div>
			<!-- 댓글 처리 end -->

		</div>

		</div>
		<!-- .container -->

		<c:import url="/WEB-INF/views/user/layout/footer.jsp" />