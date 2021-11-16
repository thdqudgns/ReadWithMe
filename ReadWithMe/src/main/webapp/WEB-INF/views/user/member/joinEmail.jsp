<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<link href="/resources/css/join.css" rel="stylesheet">
<script src="/resources/js/join_script.js"></script>

<h1>이메일로 회원가입</h1>
<form action="/join" method="post">
<input type="hidden" name="type" value="email"/>

<label>아이디(*) <br> <input type="text" name="id" id="id" placeholder="4~20자 사이의 영문, 숫자로 입력해주세요"></label><br>
<div id="id_check"></div>
<label>비밀번호(*) <br> <input type="password" name="password" id="password" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."></label><br>
<div id="pw_check"></div>
<label>비밀번호 확인(*) <br> <input type="password" id="password2" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."></label><br>
<div id="pw2_check"></div>
<label>이름(*) <br> <input type="text" name="name" id="name" placeholder="성함을 입력해주세요."></label><br>
<div id="name_check"></div>
<hr>
<label>닉네임(*) <br> <input type="text" name="nick" id="nick" placeholder="자유롭게 사용하실 닉네임을 입력해주세요!"></label><br>
<div id="nick_check"></div>
<label>이메일 주소(*) <br> <input type="text" name="email" id="email" value="${param.email }" placeholder="사용하시는 이메일 주소를 입력해주세요."></label><br>
<div id="email_check"></div>
<hr>
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
<!-- 	<input type="hidden" name="interest" id="interest"/> -->
<!-- 	<input type="hidden" name="interest2" id="interest2"/> -->
<!-- 	<input type="hidden" name="interest3" id="interest3"/> -->
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