<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<!-- 부트스트랩 3 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		// 공지사항 토글 버튼

		$("#notice_button0").click(function() {
			$("#notice_toggle0").toggle();
		});

		$("#notice_button1").click(function() {
			$("#notice_toggle1").toggle();
		});

		$("#notice_button2").click(function() {
			$("#notice_toggle2").toggle();
		});

		$("#notice_button3").click(function() {
			$("#notice_toggle3").toggle();
		});

		$("#notice_button4").click(function() {
			$("#notice_toggle4").toggle();
		});

		// 자주묻는질문 토글 버튼

		$("#faq_button0").click(function() {
			$("#faq_toggle0").toggle();
		});

		$("#faq_button1").click(function() {
			$("#faq_toggle1").toggle();
		});

		$("#faq_button2").click(function() {
			$("#faq_toggle2").toggle();
		});

		$("#faq_button3").click(function() {
			$("#faq_toggle3").toggle();
		});

		$("#faq_button4").click(function() {
			$("#faq_toggle4").toggle();
		});
		
		$("#faq_button5").click(function() {
			$("#faq_toggle5").toggle();
		});
		
		$("#faq_button6").click(function() {
			$("#faq_toggle6").toggle();
		});
		
		$("#faq_button7").click(function() {
			$("#faq_toggle7").toggle();
		});
		
		$("#faq_button8").click(function() {
			$("#faq_toggle8").toggle();
		});
		
		$("#faq_button9").click(function() {
			$("#faq_toggle9").toggle();
		});

		// 1:1질문 토글 버튼

		$("#inquiry_button0").click(function() {
			$("#inquiry_toggle0").toggle();
		});

		$("#inquiry_button1").click(function() {
			$("#inquiry_toggle1").toggle();
		});

		$("#inquiry_button2").click(function() {
			$("#inquiry_toggle2").toggle();
		});

		$("#inquiry_button3").click(function() {
			$("#inquiry_toggle3").toggle();
		});

		$("#inquiry_button4").click(function() {
			$("#inquiry_toggle4").toggle();
		});

	});
</script>

<style>

.body1 {
	margin: 0;
	padding: 0;
	height: auto;
}

table {
	margin-top: 20px;
	width: 400px;
	border-bottom: 1px solid #D3D3D3;
}

.wrap {
 	background: #f3f3f3; 
}

.board {
	width: 1000px;
	margin: 0 auto;
}

.notice_table {
	width: 700px;
	margin: 0 auto;
}

.wrap_notice {
	background: white;
	width: 800px;
	border: 1px solid #D3D3D3;
	margin: 0 auto;
}

.faq_table {
	width: 700px;
	margin: 0 auto;
}

.wrap_faq {
	background: white;
	width: 800px;
	border: 1px solid #D3D3D3;
	margin: 0 auto;
}

.inquiry_table {
	width: 700px;
	margin: 0 auto;
}

.wrap_inquiry {
	background: white;
	width: 800px;
	border: 1px solid #D3D3D3;
	margin: 0 auto;
}
</style>

</head>
<body class="body1">

	<div class="wrap">
		<div class="board">
			<!-- 공지사항 -->
			<div style="height: 40px;"></div>
			<div class="wrap_notice">
				<div class="notice_table">
					<table class="table" id="noticeTable">
						<h3>
							<a href='user/notice/list';">공지사항</a>
						</h3>
						<c:set var="i" value="0" />
						<c:forEach items="${noticeList }" var="notice">
							<tr id="notice_button${i }" style="cursor: pointer;">
								<td>${notice.board_title }<span
									style="color: gray; font-size: x-small; margin-left: 6px;">
										<fmt:formatDate value="${notice.board_date }"
											pattern="yyyy.MM.dd" />
								</span>
								</td>
							</tr>
							<tr id="notice_toggle${i }"
								style="background: #f8f8f8; display: none;">
								<td>${notice.board_content }</td>
							</tr>
							<c:set var="i" value="${i + 1 }" />
						</c:forEach>
					</table>
				</div>
			</div>

			<div style="height: 20px;"></div>

			<!-- 자주묻는질문 -->
			<div class="wrap_faq">
				<div class="faq_table">
					<table class="table" id="faqTable">
						<h3>
							<a href='/user/faq/list'>자주묻는질문 TOP 10</a>
						</h3>
						<c:set var="i" value="0" />
						<c:forEach items="${faqList }" var="faq">
							<tr id="faq_button${i }" style="cursor: pointer;">
								<td>${faq.board_title }<span
									style="color: gray; font-size: x-small; margin-left: 6px;">
										<fmt:formatDate value="${faq.board_date }"
											pattern="yyyy.MM.dd" />
								</span>
								</td>
							</tr>
							<tr id="faq_toggle${i }"
								style="background: #f8f8f8; display: none;">
								<td>${faq.board_content }</td>
							</tr>
							<c:set var="i" value="${i + 1 }" />
						</c:forEach>
					</table>
				</div>
			</div>

			<div style="height: 20px;"></div>

			<!-- 		1:1 질문 -->
			<div class="wrap_inquiry">
				<div class="inquiry_table">
					<h3>
						<a href='/user/inquiry/list'>1:1 문의내역</a>
					</h3>
					<table class="table" id="inquiryTable">

						<!-- 비로그인상태 -->
						<c:if test="${not login }">
							<div style="margin: 0 auto; text-align: center;">
								<h5>로그인 후 이용 가능합니다</h5>
								<button onclick='location.href="/login";' class="btn" style="margin-right: 2px; border-color: #D3D3D3; background: white; color: gray;">로그인</button>
							</div>
						</c:if>

						<!-- 로그인상태 -->
						<c:if test="${login }">
							<c:set var="i" value="0" />
							<c:forEach items="${inquiryList }" var="inquiry">
								<tr id="inquiry_button${i }" style="cursor: pointer;">
									<td>${inquiry.board_title }<span
										style="color: gray; font-size: x-small; margin-left: 6px;">
											<fmt:formatDate value="${inquiry.board_date }"
												pattern="yyyy.MM.dd" />
									</span>
									</td>
								</tr>
								<tr id="inquiry_toggle${i }"
									style="background: #f8f8f8; display: none;">
									<td>${inquiry.board_content }</td>
								</tr>
								<c:set var="i" value="${i + 1 }" />
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
			
			<div style="height: 40px;"></div>
			
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/user/layout/footer.jsp" />