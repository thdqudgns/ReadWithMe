<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<link href="/resources/css/join.css" rel="stylesheet">
<script src="/resources/js/kakaoJoin_script.js"></script>

<script>
alert('Read With Me의 회원이 아닙니다. 간단한 회원가입 후 이용해주세요.');
</script>

<h1>추가정보 입력</h1>
<hr>
<form action="/join/kakao" method="post">

<input type="hidden" name="id" value="${user.id }"/>
<input type="hidden" name="type" value="${social }"/>
<c:if test="${not empty user.email }">
<input type="hidden" name="email" value="${user.email }" />
</c:if>




<label>이름(*) <br> <input type="text" name="name" id="name" placeholder="성함을 입력해주세요."></label><br>
<div id="name_check"></div>
<label>닉네임(*) <br> <input type="text" name="nick" id="nick" value="${user.nick }"></label><br>
<div id="nick_check"></div>
<c:if test="${empty user.email }">
<label>이메일 주소(*) <br> <input type="text" name="email" id="email" placeholder="사용하시는 이메일 주소를 입력해주세요."></label><br>
<div id="email_check"></div>
</c:if>
<label>생년월일 <br> <input type="date" name="birth"></label><br>

<div class="input__title">성별</div>
<div class="input-horizontal__content gender">
	<div class="gender-pick" data-gender="M">남자</div>
	<div class="gender-pick" data-gender="F">여자</div>
	<div class="gender-pick active" data-gender="A">선택안함</div>
	<input type="hidden" name="gender" id="gender"/>
</div>

<div>
<select name="location">
<option value="서울">서울</option>
<option value="경기">경기</option>
<option value="인천">인천</option>
<option value="세종">세종</option>
<option value="강원">강원</option>
<option value="대전">대전</option>
<option value="충청">충청</option>
<option value="부산">부산</option>
<option value="대구">대구</option>
<option value="울산">울산</option>
<option value="경상">경상</option>
<option value="광주">광주</option>
<option value="전라">전라</option>
<option value="제주">제주</option>
<option value="글로벌">글로벌</option>
</select>
</div>
<hr>


<div class="input__title">관심분야</div>
최대 3개까지 선택 가능합니다
<div>
	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="culture" id="culture" />
	<label for="culture">문화생활</label>

	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="selfImprovement" id="selfImprovement"/>
	<label for="selfImprovement">자기계발</label>

	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="music" id="music" />
	<label for="music">음악</label>

	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="it" id="it" />
	<label for="it">IT</label>

	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="sport" id="sport" />
	<label for="sport">스포츠</label>

	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="book" id="book" />
	<label for="book">책(독서)</label>

	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="language" id="language" />
	<label for="language">언어</label>

	<input onclick="CountChecked(this)" type="checkbox" name="interest" value="travel" id="travel" />
	<label for="travel">여행</label>

	
</div>
					
	

개인정보 처리 방침 동의<br>
서비스 이용약관 동의<br>

<a href="/join"><button type="button">취소</button></a>
<button id="reg_submit">가입</button>
</form>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />