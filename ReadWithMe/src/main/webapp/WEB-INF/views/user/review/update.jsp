<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents( $("#btnUpdate") );
		
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
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();
	})
	
	if( ${empty reviewfile } ) {
		$("#newFile").show();
	} else {
		$("#originFile").show();
	}
});
</script>

<style type="text/css">
.through {	text-decoration: line-through;}
#delFile {	font-size: 1.5em;font-weight: bold;}
#newFile, #originFile {	display: none;}
.container {margin: 20px auto;width:1000px;}
.form-writer {}
.form-title {}
.form-content {}
.form-file {}
.text-btn {text-align: center;}

</style>

<div class="container">

<h1>후기 수정</h1>
<br>
<hr>

<form action="/user/review/update" method="post" enctype="multipart/form-data">
<input type="hidden" name="review_no" value="${view.review_no }">

	<div class="form-writer">
		<label for="writer">작성자</label>
		<input type="text" id="writer" value="${user_nick }" readonly="readonly" style="width:1000px; padding: 6px 12px; margin-bottom:5px;border:1px solid black; border-radius:3px; background-color:#ccc;"
			class="form-control" />
	</div>

	<div class="form-title">
		<label for="review_title">제목</label>
		<input type="text" id="review_title" name="review_title" class="form-control" style="width:1000px;padding: 6px 12px;" value="${view.review_title }" />
	</div>
	
	<div class="form-content">
		<label for="review_content">본문</label>
		<textarea rows="10" style="width: 100%" id="review_content" name="review_content">${view.review_content }</textarea>
	</div>

	<div id="fileBox">	
	<div id="originFile">
		<a href="/user/review/download?file_no=${reviewfile.file_no }">${reviewfile.origin_name }</a>
		<span id="delFile">X</span>
	</div>
	<br>
		
	<div id="newFile">
		<label for="file">새로운 첨부파일</label>
		<input type="file" name="file" id="file" accept=".png, .jpg, .pdf, .hwp, .txt, .docs"/><br>
		<small>** 새로운 파일을 첨부하면 기존파일이 삭제됩니다</small>
	</div>
	</div>
	
	<div class="text-btn">
		<button class="btn-brown" id="btnUpdate" style="padding: 10px 20px;">수정</button>
		<input type="reset" id="cancel" class="btn-white" style="padding: 10px 20px;" value="취소" />
	</div>
	
</form>

</div>

<!-- 스마트 에디터 적용하는 코드 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "review_content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["review_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />


