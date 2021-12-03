<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="https://i.imgur.com/KN7zwhf.png">
<title>ReadWithMe</title>

<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

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
.menu {display:table;width:100%;table-layout:fixed;border-top:1px solid #ccc;border-bottom:1px solid #ccc;}	
.menuMain {display:table-cell;width:180px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;}
.menuBar {display:table-cell;vertical-align:middle;width:80px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;}
.menuBar span {display: table-cell;}
.menuProfile {display:table-cell;vertical-align:middle;width:100px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;}

/* 가로 메뉴바 전체를 묶는 ul */
ul.menuList {position:relative;margin:0 auto;list-style-type: none;display:table;align-items:center;height:60px;}
/* ul.menuList > div > li {border: 1px solid black;text-align:center;position:relative;display:table-cell;background:aqua;padding:0;line-height:20px;} */

/* 로고 - 이미지와 사이트명 */
ul.menuList > div.menuMain {vertical-align:middle;}
ul.menuList > div.menuMain > a {vertical-align:middle;}
ul.menuList > div.menuMain > a > img {vertical-align:middle;width:200px; height:45px;margin-top:6px;}
/* ul.menuList > div.menuMain > a > div {color:#9f8170;text-decoration:none;font-size:20px;font-family:'notoBold';display:inline-block;} */

/* 전체메뉴 버튼 */
.menubarlogo {display:table-cell;width:80px;height:40px;table-layout:fixed;list-style-type:none;text-align:center;}
ul.menuList > div.menuBar > li.all {margin-top:5px;}
ul.menuList > div.menuBar > li.all > ul {z-index:9999;position: absolute;list-style-type: none;width:auto;line-height: 0;}
ul.menuList > div.menuBar > li.all > ul > li {background:#FFF;height:0;font-size:0;}		/* 기본값0: 안보임 -> hover 하면 보임 */
ul.menuList > div.menuBar > li:hover > ul > li {height:40px;font-size:13px;line-height:40px;text-align:center;transition: height 500ms;}
ul.menuList > div.menuBar > li.all > ul > li > a {background: #FFF;color:black; text-decoration:none; width:80px;display:inline-block;text-align:center;}
ul.menuList > div.menuBar > li.all > ul > li > a:hover {color:tomato;background: #FFF;width:100%;vertical-align: middle;text-align:center;}
/* #menubar { z-index:9999;} */

/* 기본 메뉴바 - 검색, 모임, 후기, 명언, 안내&문의 */
ul.menuList > div.menuBar {vertical-align: middle;text-decoration:none;}
ul.menuList > div.menuBar > a {text-decoration:none;margin-bottom:10px;}
ul.menuList > div.menuBar > a > span {color:#000;text-decoration:none;font-size:15px;}
ul.menuList > div.menuBar > a > span:hover {color:tomato;text-decoration:none;}


/* 프로필 */
ul.menuList > div.menuProfile {vertical-align: middle;text-decoration:none;}
ul.menuList > div.menuProfile > li {font-size:15px;}
ul.menuList > div.menuProfile > li > img {vertical-align: middle;}
ul.menuList > div.menuProfile > li > span {vertical-align: middle;}
ul.menuList > div.menuProfile > li > ul {z-index:9999;position: absolute;list-style-type: none;width:auto;line-height: 0;}
ul.menuList > div.menuProfile > li > ul > li {background:#FFF;height:0;font-size:0;}		/* 기본값0: 안보임 -> hover 하면 보임 */
ul.menuList > div.menuProfile > li:hover > ul > li {height:40px;font-size:13px;line-height:40px;text-align:center;transition: height 500ms;}
ul.menuList > div.menuProfile > li > ul > li > a {background: #FFF;color:black;text-decoration:none;width:100px;display:inline-block;text-align:center;}
ul.menuList > div.menuProfile > li > ul > li > a:hover {color:tomato;background: #FFF;width:100%;vertical-align: middle;text-align:center;}


/* TOP 버튼 */
.quickmenu {position:fixed;text-decoration:none;list-style-type:none;bottom:20px;right:10px;text-align:center;}
.quickmenu > ul > li {list-style-type: none;border-radius:5px;background-color:rgba(178, 190, 195, 0.5);}
.quickmenu > ul > li > a{font-size: 15px;color:black;font-weight:bold;text-decoration:none;}
.quickmenu > ul > li > a:hover {color: tomato;}

/* 메뉴 width 개별설정 - 이미지(2), 검색(3), 안내&문의(7), 로그인(9) */
.menuBar:nth-child(2) {width:40px;}
.menuBar:nth-child(3) {width:250px;}
.menuBar:nth-child(7) {width:120px;}
.menuBar:nth-child(9) {width:42px;}

/* 버튼 설정 */
.btn-white {border-radius: 3px; border:1px solid black; background-color: #FFF; color:black;box-shadow: 1px 1px 1px gray;}
.btn-white:hover {border-radius: 3px; border:1px solid black; background-color: #FFF; color:tomato;}
.btn-report {border:none;box-shadow: 1px 1px 1px gray;background-color: #FFF; color:gray;}
.btn-report:hover {border:none;color:tomato;}
.btn-gray {border-radius: 3px; border:0px solid gray; background-color: #FFF; color:gray;box-shadow: 1px 1px 1px gray;}
.btn-gray:hover {border-radius: 3px; border:0px solid gray; background-color: #FFF; color:tomato;}
.btn-none {border:0px solid gray;background-color: #FFF; color:black;}
.btn-none:hover {border:0px solid gray;background-color: #FFF; color:tomato;}
.btn-brown {border-radius: 3px; border:1px solid #9f8170; background-color: #9f8170; color:#FFF;box-shadow: 1px 1px 1px black;}
.btn-brown:hover {border-radius: 3px;border:1px solid #9f8170; background-color: #9f8170; color:tomato;}
.btn-black {border-radius: 3px; border:1px solid black; background-color: black; color:#FFF;box-shadow: 1px 1px 1px gray;}
.btn-black:active {border-radius: 3px; border:1px solid black; background-color: black; color:tomato;}


.center {text-align:center;vertical-align: middle;margin: 0 auto;}
.mainpagebar hr {margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee;}    
</style>

</head>
<body>

<!-- FAMOUS SENTENcE BAR -->


<!-- MENU BAR -->
<div id="menuBarFrame" class="menu">
	<ul class="menuList">
	
		<!-- 이미지, 이름 -->
		<div class="menuMain">
			<a href="/">
			<img alt="menuBarLogo" src="https://i.imgur.com/BH7NGuy.png">
<!-- 			<div>Read With Me</div> -->
			</a>
		</div>
	
		<!-- 전체메뉴 탭 -->
		<div class="menuBar menubarlogo">
			<li class="all">
				<img
					style="width: 18px; height: 18px;object-fit: cover;"
					alt="menu_icon" src="https://i.imgur.com/wG6Siyb.png">
				<ul>
					<li><a href="<%=request.getContextPath() %>/book">도서검색</a></li>
					<li><a href="<%=request.getContextPath() %>/user/meeting/list">모임</a></li>
					<li><a href="<%=request.getContextPath() %>/user/review/list">후기</a></li>
					<li><a href="<%=request.getContextPath() %>/user/famous/list">명언</a></li>
					<li><a href="<%=request.getContextPath() %>/user/notice/list">공지사항</a></li>
					<li><a href="<%=request.getContextPath() %>/user/inquiry/list">1:1문의</a></li>
				</ul>
			</li>
		</div>
		
		<!-- 검색 -->
		<div class="menuBar">
			<form id="search" action="#" method="get" style="width:250px;">
            	<input  type="text" name="search" style="width:180px;border: 3px solid #9f8170;"><button type="submit" style="width:26px;height:25px;border: 3px solid #9f8170;background-color:#9f8170; "><img style="margin-top:1px;object-fit:full;width:16px;height:14px;" alt="search" src="https://i.imgur.com/97QT6ay.png"></button>
            </form>
		</div>

		<!-- 메뉴명 -->
		<div class="menuBar">
			<a href="<%=request.getContextPath() %>/user/meeting/list"><span>모임</span></a>
		</div>

		<!-- 메뉴명 -->
		<div class="menuBar">
			<a href="<%=request.getContextPath() %>/user/review/list"><span>후기</span></a>
		</div>

		<!-- 메뉴명 -->
		<div class="menuBar">
			<a href="<%=request.getContextPath() %>/user/famous/list"><span>명언</span></a>
		</div>

		<!-- 메뉴명 -->
		<div class="menuBar">
			<a href="<%=request.getContextPath() %>"><span>안내&문의</span></a>
		</div>
		
		<c:if test="${empty login or not login }">
			<!-- 회원가입 -->
			<div class="menuBar">
				<a href="<%=request.getContextPath() %>/join"><button class="btn-white">회원가입</button></a> 
			</div>
		
			<!-- 로그인 -->
			<div class="menuBar">
				<a href="<%=request.getContextPath() %>/login"><button class="btn-white">로그인</button></a>
			</div>
		</c:if>
	
		<c:if test="${not empty login and login and user_lv lt 2 }">
		<!-- 프로필, 닉네임, 마이페이지, 로그아웃 -->
		<div class="menuProfile">
			<li>
				<img alt="profile" src="https://i.imgur.com/G5gV56A.png" width="20px" height="20px">
				<span>${user_nick }님</span>
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/meeting/write">모임 생성하기</a></li>
					<li><a href="<%=request.getContextPath() %>/mypage/main">마이페이지</a></li>
					<li><a href="<%=request.getContextPath() %>/logout">로그아웃</a></li>
				</ul>
			</li>
		</div>
		</c:if>

		<c:if test="${not empty login and login and user_lv ge 2 }">
		<!-- 프로필, 닉네임, 관리자페이지, 로그아웃 -->
		<div class="menuProfile">
			<li>
				<img alt="profile" src="https://i.imgur.com/t4UvTix.png" width="20px" height="20px">
				<span>${user_nick }님</span>
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/meeting/write">모임 생성하기</a></li>
					<li><a href="<%=request.getContextPath() %>/admin/member">관리자페이지</a></li>
					<li><a href="<%=request.getContextPath() %>/mypage/main">마이페이지</a></li>
					<li><a href="<%=request.getContextPath() %>/logout">로그아웃</a></li>
				</ul>
			</li>
		</div>
		</c:if>
	
	</ul>
</div><!-- MENU BAR END-->



	<div class="quickmenu">
		<ul>
			<li><a href="#"> &nbsp;&Delta;TOP&nbsp; </a></li>
		</ul>
	</div>