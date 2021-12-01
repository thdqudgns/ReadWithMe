<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<link href="/resources/css/profile.css" rel="stylesheet">
<script src="/resources/js/profile_script.js"></script>

<section>
<h1>내 정보</h1>
<hr>
<form action="/mypage/profile" method="post" enctype="multipart/form-data">

<h3>프로필 변경</h3>


<div style="margin: 0 auto; width: 80%; text-align: left;">
<p style="text-align: left;">
프로필 사진
</p>
<div id="preview">
	<c:if test="${not empty file.url }">
	<img id="storedProfile" src="/upload/${file.stored_name }">
	</c:if>
</div>
<div id="fileDiv">
<input type="file" name="file" id="upload" accept="image/gif, image/jpeg, image/png" /><br><br>	
</div>
</div>

<div class="inputDiv">
<label>이름 <br> <input type="text" name="name" id="name" value="${user.name }"></label><br>
<div id="name_check"></div>
</div>

<div class="inputDiv">
<label>닉네임 <br> <input type="text" name="nick" id="nick" value="${user.nick }"></label><br>
<div id="nick_check"></div>
</div>

<div class="inputDiv">
<label>이메일 주소 <br> <input type="text" name="email" id="email" value="${user.email }"></label><br>
<div id="email_check"></div>
</div>

<hr>

<div id="birthDiv">
생년월일
	<div style="display: inline; margin: 100px;">
	<input type="date" id="birth" name="birth" value="<fmt:formatDate value="${user.birth }" pattern="yyyy-MM-dd"/>"><br>
	</div>
</div>

<div class="input__title">
성별(*)
	<input type="hidden" id="userGender" value="${user.gender }">
	<div class="input-horizontal__content gender">
		<div class="gender-pick" data-gender="M">남자</div>
		<div class="gender-pick" data-gender="F">여자</div>
		<div class="gender-pick" data-gender="A">선택안함</div>
		<input type="hidden" name="gender" id="gender"/>
	</div>
</div>



<div id="locationDiv">
<input type="hidden" id="userLocation" value="${user.location }">
지역
<div id="locationSelect">
<label for="selectBox">${user.location }</label>
<select id="selectBox" name="location">
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
</div>
<hr>


<div id="interestDiv">관심분야<br>
<input type="hidden" id="userInterest" value="${interest.interest }">
<input type="hidden" id="userInterest2" value="${interest.interest2 }">
<input type="hidden" id="userInterest3" value="${interest.interest3 }">
<p>최대 3개까지 선택 가능합니다</p>
<div>
	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="culture" id="culture" />
	<label for="culture">문화생활</label>

	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="book" id="book" />
	<label for="book">책(독서)</label>

	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="music" id="music" />
	<label for="music">음악</label>

	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="it" id="it" />
	<label for="it">IT</label>

	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="selfImprovement" id="selfImprovement"/>
	<label for="selfImprovement">자기계발</label>

	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="sport" id="sport" />
	<label for="sport">스포츠</label>

	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="language" id="language" />
	<label for="language">언어</label>

	<input onclick="CountChecked(this)" type="checkbox" class="interestCheckbox" name="interest" value="travel" id="travel" />
	<label for="travel">여행</label>

	
</div>
</div>	
					
<div id="checkBtns">
<button class="checkBtn" id="reg_submit">변경 내용 저장</button>
<a href="/mypage/main"><button class="checkBtn" type="button">취소</button></a>
</div>
</form>

</section>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />