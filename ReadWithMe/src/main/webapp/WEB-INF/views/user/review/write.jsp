<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["review_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
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
.container {margin: 20px auto;width:1000px;}
.form-writer {}
.form-title {}
.form-content {}
.form-file {}
.text-btn {text-align: center;}

</style>

<div class="container">

	<h1>후기 작성</h1>
	<br>
	<hr>
	
	<form action="/user/review/write" method="post" enctype="multipart/form-data">
		<br>
		
		<div class="form-writer">
			<label for="write">작성자</label><br>
			<input type="text" id="write" value="${user_nick }" class="form-control" readonly="readonly" style="width:1000px; padding: 6px 12px; margin-bottom:5px;border:1px solid black; border-radius:3px; background-color:#ccc;"/>
		</div>
		
		<div class="form-title">
			<label for="review_title">제목</label><br>
			<input type="text" id="review_title" name="review_title" class="form-control" style="width:1000px;padding: 6px 12px;" placeholder="제목을 작성해주세요"/>
		</div>
		
		<br>
		<div class="form-content">
			<label for="review_content">본문</label>
			<textarea rows="10" style="width: 100%;" id="review_content" name="review_content"></textarea>
		</div>
		
		<br>
		<div class="form-file">
			<label for="file">첨부파일</label>
			<input type="file" id="file" name="file"/>
		</div>
		
		<br>
		<div class="text-btn">
			<button class="btn-brown" id="btnWrite" style="padding: 10px 20px;">작성</button>
			<input type="reset" id="cancel" class="btn-white" style="padding: 10px 20px;" value="취소"/>
		</div>
	</form>
	
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "review_content",
		sSkinURI: "/resources/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	</script>

</div><!-- .container -->


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />





