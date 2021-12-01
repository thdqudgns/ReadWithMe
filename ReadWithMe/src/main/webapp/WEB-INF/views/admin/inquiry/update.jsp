<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- 스마트 에디터 2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnUpdate").click(function(){
		submitContents($("#btnUpdate"));
		
		$("form").submit();
	})
	
	$("#cancel").click(function(){
		history.go(-1);
	})
	
})
</script>

</head>
<body>

<div class="container">

<div style="height: 20px;"></div>

<h1>자주묻는질문 - 수정</h1>

<div style="height: 30px;"></div>

<form action="/admin/inquiry/update" method="post" enctype="multipart/form-data">
<input type="hidden" name="board_no" value="${inquiry.board_no }" >
<div class="form-group">
	<label for="write">작성자</label>
	<input type="text" id="write" value="ReadWithMe" class="form-control" readonly="readonly"/>
</div>
<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="board_title" class="form-control" value="${inquiry.board_title }"/>
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="board_content">${inquiry.board_content }</textarea>
</div>

<br>

<div class="text-center">
	<button class="btn " id="btnUpdate" style="border-color: #D3D3D3; background: white; color: gray;">수정</button>
	<input type="reset" id="cancel" class="btn " value="취소" style="border-color: #D3D3D3; background: white; color: gray;"/>
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