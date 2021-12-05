<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}

	$(document).ready(function() {
		$("#btnWrite").click(function() {
			submitContents($("#btnWrite"));

			$("form").submit();
		})

		$("#cancel").click(function() {
			history.go(-1);
		})
	})
</script>

<style type="text/css">
.banner {
	height: 180px;
	background-image: url('/resources/img/book(1).jpg');
	color: white;
}
</style>

</head>
<body>

	<div class="container">

			<div style="height: 50px;"></div>

			<div class="banner">
			<div style="height: 50px;"></div>
			<h1>1:1 질문</h1>
			</div>

		<div style="height: 20px;"></div>

		<h1>질문 등록하기</h1>
		
		<div style="height: 30px;"></div>

		<form action="/user/inquiry/write" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="write">작성자</label> <input type="text" id="write"
					value="ReadWithMe" class="form-control" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="board_title" class="form-control" />
			</div>
			<div class="form-group">
				<label for="type">분류</label><br> <select id="select_for_type"
					class="form-control" name="type" style="width: 8%;">
					<option value="1">모임</option>
					<option value="2">계정</option>
					<option value="3">서비스</option>
					<option value="4">이벤트</option>
				</select>
			</div>
			<div class="form-group">
				<label for="content">본문</label>
				<textarea rows="10" style="width: 100%;" id="content"
					name="board_content"></textarea>
			</div>

			<div class="form-group">
				<label for="file">첨부파일</label> <input type="file" id="file"
					name="file"  accept=".png, .jpg, .pdf, .hwp, .txt, .docs"/>
			</div>			

			<div class="text-center">
				<button class="btn btn-primary" id="btnWrite" style="border-color: #D3D3D3; background: white; color: gray;">작성</button>
				<input type="reset" id="cancel" class="btn btn-danger" value="취소"  style="border-color: #D3D3D3; background: white; color: gray;"/>
			</div>
		</form>

		<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('content',{
				filebrowserUploadUrl: '/fileupload'
			});
		});		
		</script>

	</div>
	<!-- .container end -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />