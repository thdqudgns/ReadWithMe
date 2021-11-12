<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 부트스트랩3 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<style type="text/css">
.gender-pick, .interest-pick {
    border-radius: 4px;
    width: 100px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    cursor: pointer;
    user-select: none;
    margin: 3px;
}

.gender-pick:hover, .interest-pick:hover {
    background-color: #F6F6F6;
}

.gender-pick.active, .interest-pick.active {
    background-color: #9F8170;
}

input[type="checkbox"] {
  display: none;
}

input[type="checkbox"] + label {
  display:inline-block; /* or block */
  line-height:normal;
  cursor:pointer;
  padding: 3px 14px;
  background-color: #EFEFEF;
  border-radius: 4px;
  border: 1px solid #D0D0D0;
  margin: 40px 100px 10px 40px; /* however you please */
}

input[type="checkbox"] + label:hover {
  background-color: #F6F6F6;
}

input[type="checkbox"]:checked + label {
  border-color: #000;
  background-color: #9F8170;
  color: #fff;
}

</style>

<script type="text/javascript">
$(document).ready(function(){

// 	성별선택
	const GENDER_MALE = 0;
	const GENDER_FEMALE = 1;
	const GENDER_NO_SELECTED = 2;
	
	const genderButtons = document.querySelectorAll('.gender-pick');
	let currentGender = GENDER_NO_SELECTED;
	
	for (let i = 0; i < genderButtons.length; i++) {
	    genderButtons[i].addEventListener('click', () => pickGender(i));
	}

	function pickGender(genderNum) {
	    if (currentGender === genderNum) return;

	    genderButtons[currentGender].classList.remove('active');
	    genderButtons[genderNum].classList.add('active');
	    currentGender = genderNum;
	    
	    $("#gender").val(genderButtons[currentGender].getAttribute('data-gender'));
	}
	
	
	const INTEREST_CULTURE = 0;
	const INTEREST_SELF_IMPROVEMENT = 1;
	const INTEREST_MUSIC = 2;
	const INTEREST_IT = 3;
	const INTEREST_SPORT = 4;
	const INTEREST_BOOK = 5;
	const INTEREST_LANGUAGE = 6;
	const INTEREST_TRAVEL = 7;
	
	const interestButtons = document.querySelectorAll('.interest-pick');
	let currentInterest = INTEREST_CULTURE;
	
	for (let i = 0; i < interestButtons.length; i++) {
		interestButtons[i].addEventListener('click', () => pickInterest(i));
	}
	
	function pickInterest(interestNum) {
	    if (currentInterest === interestNum) return;

	    genderButtons[currentInterest].classList.remove('active');
	    genderButtons[interestNum].classList.add('active');
	    currentInterest = interestNum;
	    
	    $("#gender").val(genderButtons[currentInterest].getAttribute('data-interest'));
	}
	
	
})
</script>

<script>

function CountChecked(obj) {
    var total = 0;
    var oColl = obj.form.elements;
    for (var i=0; i < oColl.length; i++) {
        if (oColl[i].checked==1) total ++;
        if (total >= 4){
            alert('최대 3개까지 선택 가능합니다');
            obj.checked = 0;
            break;
        }
    }
}

</script>

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
<button>가입</button>
</form>




</body>
</html>