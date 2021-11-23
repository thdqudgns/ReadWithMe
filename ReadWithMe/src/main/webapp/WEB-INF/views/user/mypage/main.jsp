<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>마이페이지 메인</h1>

<a href="/message/main"><button>쪽지함</button></a>

<a href="/profile"><button>프로필 변경</button></a>

<a href="/pwchange"><button>비밀번호 변경</button></a>

<a href="/알아서/하삼"><button>내가 작성한 후기</button></a>

<a href="/알아서/하삼"><button>To Do List</button></a>

ReadWithMe를 더이상 이용하지 않는다면 <a href="/mypage/wthdr">회원탈퇴 바로가기</a>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />
