<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : : : RWM Admin : : : </title>

<!-- jquery-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- JavaScript -->
<script type="text/javascript">
</script>


<!-- CSS3 -->
<style type="text/css">
/* 글꼴 적용 설정 */
@font-face {
    font-family: 'notoBlack';
    src: url('/resources/font/NotoSansKR-Black.otf') format('truetype');
}
@font-face {
    font-family: 'notoBold';
    src: url('/resources/font/NotoSansKR-Bold.otf') format('truetype');
}
@font-face {
    font-family: 'notoLight';
    src: url('/resources/font/NotoSansKR-Light.otf') format('truetype');
}
@font-face {
    font-family: 'notoMedium';
    src: url('/resources/font/NotoSansKR-Medium.otf') format('truetype');
}
@font-face {
    font-family: 'notoRegular';
    src: url('/resources/font/NotoSansKR-Regular.otf') format('truetype');
}
@font-face {
    font-family: 'notoThin';
    src: url('/resources/font/NotoSansKR-Thin.otf') format('truetype');
}
@font-face {
    font-family: 'Ohsquare';
    src: url('/resources/font/Cafe24Ohsquare.ttf') format('truetype');
}
@font-face {
    font-family: 'Danjunghae';
    src: url('/resources/font/Cafe24Danjunghae.ttf') format('truetype');
}
@font-face {
    font-family: 'Dangdanghae';
    src: url('/resources/font/Cafe24Dangdanghae.ttf') format('truetype');
}
/* 전체 CSS 적용사항 */
* {margin: 0; padding: 0; box-sizing: border-box;    
	-webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    font-family: 'notoRegular';/* 글꼴 적용:NotoSans */}
    
/* ------------------------------------------------------- */

/* 기본 틀 - 전체, 로고, 메뉴 */
.menu {display:table;width:100%;table-layout:fixed;border-top:1px solid #ccc;border-bottom:1px solid #ccc; background-color: #754d17;}	
.menuMain {display:table-cell;width:200px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;}
.menuBar {display:table-cell;vertical-align:middle;width:100px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;}
.menuBar span {display: table-cell;}

/* 가로 메뉴바 전체를 묶는 ul */
ul.menuList {position:relative;margin:0 auto;list-style-type: none;display:table;align-items:center;height:60px;}
/* ul.menuList > div > li {border: 1px solid black;text-align:center;position:relative;display:table-cell;background:aqua;padding:0;line-height:20px;} */

/* 로고 - 이미지와 사이트명 */
ul.menuList > div.menuMain {vertical-align:middle;}
ul.menuList > div.menuMain > a {vertical-align:middle;}
ul.menuList > div.menuMain > a > img {vertical-align:middle;width:26px; height:26px;margin-bottom:7px;}
ul.menuList > div.menuMain > a > div {color:#FFF;text-decoration:none;margin-top:6px;font-size:20px;font-family:'notoBold';display:inline-block;}

/* 전체메뉴 버튼 */
ul.menuList > div.menuBar > li.all {align-items:center;text-align:center;}
ul.menuList > div.menuBar > li.all > div {color:#FFF;text-decoration:none;font-size:15px;text-align:center;}
ul.menuList > div.menuBar > li.all > ul {z-index:9999;position: absolute;list-style-type: none;width:auto;line-height: 0;}
ul.menuList > div.menuBar > li.all > ul > li {background:#754d17;height:0;font-size:0;}		/* 기본값0: 안보임 -> hover 하면 보임 */
ul.menuList > div.menuBar > li.all:hover > div {color:#11ee6f;}
ul.menuList > div.menuBar > li.all:hover > ul > li {width:100px;height:40px;font-size:13px;line-height:40px;text-align:center;transition: height 500ms;}
ul.menuList > div.menuBar > li.all > ul > li > a {background: #754d17;color:#FFF; text-decoration:none; width:100px;display:inline-block;text-align:center;}
ul.menuList > div.menuBar > li.all > ul > li > a:hover {color:#11ee6f;background: #754d17;width:100%;vertical-align: middle;text-align:center;}
/* #menubar { z-index:9999;} */

/* 기본 메뉴바 - 검색, 모임, 후기, 명언, 안내&문의 */
ul.menuList > div.menuBar > a {text-decoration:none;}
ul.menuList > div.menuBar > a > div {color:#FFF;text-decoration:none;font-size:15px;}
ul.menuList > div.menuBar > a > div:hover {color:#11ee6f;text-decoration:none;}


/* 프로필 */
ul.menuList > div.menuProfile > li > ul > li {background:#FFF;height:0;font-size:0;}		/* 기본값0: 안보임 -> hover 하면 보임 */
ul.menuList > div.menuProfile > li:visited > ul > li {height:40px;font-size:13px;line-height:40px;text-align:center;transition: height 500ms;}
ul.menuList > div.menuProfile > li > ul > li > a {background: #FFF;color:#fff;text-decoration:none;width:80px;display:inline-block;text-align:center;}
ul.menuList > div.menuProfile > li > ul > li > a:hover {color:#11ee6f;background: #FFF;width:100%;vertical-align: middle;text-align:center;}


/* 버튼 설정 */
.btn-white {border-radius: 3px; padding:2px;border:1px solid black; background-color: #FFF; color:black;box-shadow: 1px 1px 1px gray;}
.btn-white:active {border-radius: 3px; padding:2px;border:1px solid black; background-color: #FFF; color:tomato;}
.btn-brown {border-radius: 3px; padding:2px;border:1px solid #9f8170; background-color: #9f8170; color:#FFF;box-shadow: 1px 1px 1px gray;}
.btn-brown:active {border-radius: 3px; padding:2px;border:1px solid #9f8170; background-color: #9f8170; color:tomato;}
.btn-black {border-radius: 3px; padding:2px;border:1px solid black; background-color: black; color:#FFF;box-shadow: 1px 1px 1px gray;}
.btn-black:active {border-radius: 3px; padding:2px;border:1px solid black; background-color: black; color:tomato;}

.center {text-align:center;vertical-align: middle;}
hr {margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee;}    
</style>

</head>
<body>

<!-- FAMOUS SENTENSE BAR -->


<!-- MENU BAR -->

<div id="menuBarFrame" class="menu">
	<ul class="menuList">
	
		<!-- 이름 -->
		<div class="menuMain">
			<a href="<%=request.getContextPath() %>">
			<img alt="menuBarLogo" src="https://i.imgur.com/XzJbPF7.png">&nbsp;
			<div>RWM Admin</div>
			</a>
		</div>
	
		<!-- 메뉴명 -->
		<div class="menuBar">
			<a href="<%=request.getContextPath() %>"><div style="display: inline-block;">회원관리</div></a>
		</div>

		<!-- 게시판관리 탭 -->
		<div class="menuBar">
			<li class="all">
				<div style="display: inline-block;">게시판관리</div>
				<ul>
					<li><a href="<%=request.getContextPath() %>">모임</a></li>
					<li><a href="<%=request.getContextPath() %>">후기</a></li>
					<li><a href="<%=request.getContextPath() %>">명언</a></li>
				</ul>
			</li>
		</div>

		<!-- 안내관리 탭 -->
		<div class="menuBar">
			<li class="all">
				<div style="display: inline-block;">안내관리</div>
				<ul>
					<li><a href="<%=request.getContextPath() %>">공지사항</a></li>
					<li><a href="<%=request.getContextPath() %>">자주 묻는 질문</a></li>
					<li><a href="<%=request.getContextPath() %>">1:1문의</a></li>
				</ul>
			</li>
		</div>

		<!-- 게시판관리 탭 -->
		<div class="menuBar">
			<li class="all">
				<div style="display: inline-block;">신고내역</div>
				<ul>
					<li><a href="<%=request.getContextPath() %>">게시글</a></li>
					<li><a href="<%=request.getContextPath() %>">댓글</a></li>
				</ul>
			</li>
		</div>

		
		<c:if test="${not empty login and login and user_lv eq 9 }">
		<!-- 프로필, 닉네임, 관리자페이지, 로그아웃 -->
		<div class="menuProfile">
			<li>
				<img alt="" src="https://i.imgur.com/t4UvTix.png">
				<div style="display: inline-block;">닉네임</div>
				<ul>
					<li><a href="<%=request.getContextPath() %>/">메인페이지</a></li>
					<li><a href="<%=request.getContextPath() %>">로그아웃</a></li>
				</ul>
			</li>
		</div>
		</c:if>
	
	</ul>
</div>

