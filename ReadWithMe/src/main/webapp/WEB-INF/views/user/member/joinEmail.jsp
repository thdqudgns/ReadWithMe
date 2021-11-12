<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<h1>이메일로 회원가입</h1>
<form action="/join" method="post">
<label>아이디(*) <br> <input type="text" name="id" placeholder="4~20자 사이의 영문, 숫자로 입력해주세요"></label><br>
<label>비밀번호(*) <br> <input type="password" name="password" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."></label><br>
<label>비밀번호 확인(*) <br> <input type="password" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."></label><br>
<label>이름(*) <br> <input type="text" name="name" placeholder="성함을 입력해주세요."></label><br>
<hr>
<label>닉네임 <br> <input type="text" name="nick" placeholder="자유롭게 사용하실 닉네임을 입력해주세요!"></label><br>
<label>이메일 주소 <br> <input type="text" name="email" placeholder="사용하시는 이메일 주소를 입력해주세요."></label><br>
<hr>
<label>생년월일 <br> <input type="date" name="nick"></label><br>
<div>성별</div>
<div>
	<div class="gender-pick" data-gender="M">남자</div>
	<div class="gender-pick" data-gender="F">여자</div>
	<div class="gender-pick active" data-gender="A">선택안함</div>
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
관심분야<br>
최대 3개까지 선택 가능합니다
<div>
	<div data-interest="M">문화생활</div>
	<div data-interest="F">자기계발</div>
	<div data-interest="A">음악</div>
	<div data-interest="A">IT</div>
	<div data-interest="A">스포츠</div>
	<div data-interest="A">책(독서)</div>
	<div data-interest="A">언어</div>
	<div data-interest="A">여행</div>
</div>

개인정보 처리 방침 동의<br>
서비스 이용약관 동의<br>

<a href="/join"><button type="button">취소</button></a>
<button>가입</button>
</form>




</body>
</html>