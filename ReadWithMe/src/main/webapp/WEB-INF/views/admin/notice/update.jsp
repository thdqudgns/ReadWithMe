<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"));
		
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#delFile").click(function() {
		#("#originFile").toggleClass("through")
		$("#newFile").toggle();
	})
	
	if(${empty noticefile}) {
		$("#newFile").show();
	} else {
		$("#originFile").show();
	}
	
})
</script>

</head>
<body>

<div class="container">

<h1>글수정 페이지</h1>
<hr>

<form action="/admin/notice/update" method="post" enctype="multipart/form-data">
<input type="hidden" name="board_no" value="${view.board_no }" >
<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="ReadWithMe" class="form-control" readonly="readonly"/>
</div>
<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="board_title" class="form-control" value="${view.board_title }"/>
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="board_content">${view.board_content }</textarea>
</div>

<div id="fileBox">
<div id="originFile">
	<a href="/admin/notice/download?file_no=${noticefile.file_no }">${noticefile.origin_name }</a>
	<span id="delFile">X</sapn>
</div>
<br>

<div id="newFile">
	<label for="file">새로운 첨부파일</label>
	<input type="file" name="file" id="file" /><br>
	<small>**새로운 파일을 첨부하면 기존 파일이 삭제됩니다</small>
</div>
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
</div>

</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />













