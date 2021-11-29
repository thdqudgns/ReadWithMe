<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

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
		});

		$("#cancel").click(function() {
			history.go(-1);
		});
	})
</script>

</head>
<body>

	<div class="container">

		<h1>글쓰기 페이지</h1>
		<hr>

		<form action="/admin/notice/write" method="post"
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
				<label for="type">분류</label><br> 
				<select id="select_for_type" class="form-control" name="type" style="width: 8%;">
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
					name="file" />
			</div>

			<div class="text-center">
				<button class="btn btn-primary" id="btnWrite">작성</button>
				<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
			</div>
		</form>

		<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('content',{
				filebrowserUploadUrl: '/admin/notice/fileupload'
			});
		});		
		
		</script>


	</div>
	<!-- .container end -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />