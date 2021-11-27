<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<link href="/resources/css/profile.css" rel="stylesheet">
<script src="/resources/js/profile_script.js"></script>

<h1>내 정보</h1>
<hr>
<form action="/profile" method="post" enctype="multipart/form-data">

<h3>프로필 변경</h3>

프로필 사진<br>
		
<div id="preview">
	<c:if test="${not empty file.url }">
	<img id="storedProfile" src="/upload/${file.stored_name }">
	</c:if>
</div>
<input type="file" name="file" id="upload" accept="image/gif, image/jpeg, image/png" /><br><br>	



<label>이름 <br> <input type="text" name="name" id="name" value="${user.name }"></label><br>
<div id="name_check"></div>
<label>닉네임 <br> <input type="text" name="nick" id="nick" value="${user.nick }"></label><br>
<div id="nick_check"></div>
<label>이메일 주소 <br> <input type="text" name="email" id="email" value="${user.email }"></label><br>
<div id="email_check"></div>
<hr>
<label>생년월일 <br> <input type="date" name="birth" value="<fmt:formatDate value="${user.birth }" pattern="yyyy-MM-dd"/>"></label><br>

<div class="input__title">성별</div>
<input type="hidden" id="userGender" value="${user.gender }">
<div class="input-horizontal__content gender">
	<div class="gender-pick" data-gender="M">남자</div>
	<div class="gender-pick" data-gender="F">여자</div>
	<div class="gender-pick" data-gender="A">선택안함</div>
	<input type="hidden" name="gender" id="gender"/>
</div>

<div>
<input type="hidden" id="userLocation" value="${user.location }">
<select name="location" id="locagtionSelectBox">
<option value="서울">서울</option>
<option value="경기">경기</option>
<option value="인천">인천</option>
<option value="세종">세종</option>
<option value="강원">강원</option>
<option value="대전" >대전</option>
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
<input type="hidden" id="userInterest" value="${interest.interest }">
<input type="hidden" id="userInterest2" value="${interest.interest2 }">
<input type="hidden" id="userInterest3" value="${interest.interest3 }">
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
					

<button id="reg_submit">변경 내용 저장</button>
<a href="/mypage/main"><button type="button">취소</button></a>
</form>




<c:import url="/WEB-INF/views/user/layout/footer.jsp" />