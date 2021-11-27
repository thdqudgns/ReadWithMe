<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />


<c:if test="${empty id }">
<h1>아이디 찾기</h1>
존재하는 아이디가 없습니다. 다시 한 번 맞게 입력했는지 확인해주시고 같은 오류가 계속 발생하면 고객센터로 문의 주세요!

<a href="/find/id"><button>아이디 찾기</button></a>
<a href="/login"><button>로그인</button></a>
</c:if>

<c:if test="${not empty id }">
<h1>아이디 찾기</h1>
성공적으로 아이디를 찾았습니다!

${id }

<a href="/find/pw"><button>비밀번호 찾기</button></a>
<a href="/login"><button>로그인</button></a>
</c:if>



<c:import url="/WEB-INF/views/user/layout/footer.jsp" />