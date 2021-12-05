<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- ckeditor 라이브러리 로드 -->
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
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	//	업로드 파일 삭제 버튼
	
	if(${isInquiryfile}) {
	$('#delFile').click(function() {	
		$("#originFile").hide();
		$("#newFile").show();
	});	
	} else {		
		$('#delFile').hide();
		$("#newFile").show();	
	}
});	
</script>

<style>
#delFile {
	cursor: pointer;
}

#newFile {
	display: none;
}
</style>

</head>
<body>

	<div class="container">

		<div style="height: 20px;"></div>

		<h1>1:1문의 - 수정</h1>

		<div style="height: 30px;"></div>

		<form action="/user/inquiry/update" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="board_no" value="${inquiry.board_no }">
			<div class="form-group">
				<label for="write">작성자</label> <input type="text" id="write"
					value="ReadWithMe" class="form-control" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" id="title"
					name="board_title" class="form-control"
					value="${inquiry.board_title }" />
			</div>
			<div class="form-group">
				<label for="content">본문</label>
				<textarea rows="10" style="width: 100%;" id="content"
					name="board_content">${inquiry.board_content }</textarea>
			</div>

			<br>

			<div class="text-center">
				<button class="btn " id="btnUpdate"
					style="border-color: #D3D3D3; background: white; color: gray;">수정</button>
				<input type="reset" id="cancel" class="btn " value="취소"
					style="border-color: #D3D3D3; background: white; color: gray;" />
			</div>

			<div id="fileBox">
				<div id="originFile">
					<a href="/user/inquiry/download?file_no=${inquiryfile.file_no }">${inquiryfile.origin_name }</a>
					<span id="delFile" style="color: red;">X</span>

				</div>
				<!-- 				<input type="button" onclick="deleteFile()" value="X" /> -->

				<div id="newFile">
					<label for="file">새로운 첨부파일</label> <input type="file" name="file"
						id="file" accept=".png, .jpg, .pdf, .hwp, .txt, .docs" /><br>
					<small>**새로운 파일을 첨부하면 기존 파일이 삭제됩니다</small>
				</div>
			</div>

		</form>

		<script type="text/javascript">
			$(function() {
				CKEDITOR.replace('content', {
					filebrowserUploadUrl : '/fileupload'
				});
			});
		</script>

	</div>
	<!-- .container end -->

	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />