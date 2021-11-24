<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<link href="/resources/css/mypageMain.css" rel="stylesheet">

<%

Calendar weatherCal = Calendar.getInstance();
String pm = weatherCal.get(Calendar.HOUR_OF_DAY) < 6 || weatherCal.get(Calendar.HOUR_OF_DAY) >= 20 ? "moon" : "sun";

String yy = request.getParameter("year");
String mm = request.getParameter("month");

Calendar cal = Calendar.getInstance();

int y = cal.get(Calendar.YEAR);		//2021
int m = cal.get(Calendar.MONTH);	//9 (0~11)

if( yy!= null && mm != null && !yy.equals("") && !mm.equals("") ) {
	y = Integer.parseInt(yy);
	m = Integer.parseInt(mm)-1;
}
cal.set(y,m,1);

int dayOfweek = cal.get(Calendar.DAY_OF_WEEK); // (일:1 ~ 토:7)
int lastday = cal.getActualMaximum(Calendar.DATE);
int prevLastMth = new Date(y, m, 0).getDate();

// 이전 버튼을 위한 세팅
int b_y = y;
int b_m = m;

if(m == 0) {
	b_y = b_y - 1;
	b_m = 12;
}

// 다음 버튼을 위한 세팅
int n_y = y;
int n_m = m+2;

if(n_m == 13) {
	n_y = n_y + 1;
	n_m = 1;
}


%>


<section id="myPage">
	<h1>My Page</h1>

	<div id="myPage-info">
		<div id="message-div">
			<a href="<%=request.getContextPath() %>/user/mypage/message"><button id="message">쪽지함</button></a>
		</div>
	
		<div id="my-Info">	
			<div id="profile-pw">
				<div id="profile-change">
					<h3>프로필 변경</h3>
					고객님의 프로필 정보를 변경하실 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/profile"><button id="mypage">변&nbsp;&nbsp;경</button></a>
				</div>
				
				<div id="pw-change">
					<h3>비밀번호 변경</h3>
					고객님의 비밀번호를 변경하실 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/pwchange"><button id="mypage">변&nbsp;&nbsp;경</button></a>
				</div>
			</div>
			<br>
			
			<div id="review-todo">
				<div id="myReview">
					<h3>내가 작성한 리뷰</h3>
					고객님이 작성하신 리뷰를 볼 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/알아서/하삼"><button id="mypage">자세히 보기</button></a>
				</div>
				
				<div id="to-do-list">
					<h3>To Do List</h3>
					나의 To Do List 목록을 확인할 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/todolist"><button id="mypage">자세히 보기</button></a>
				</div>
			</div>
			
			
			
			
			
			
			
			

<table>
	<caption id="controllDay">
		<div style="width: 400px;">
			<form id="frm" method="get" action="<%=request.getContextPath() %>/schedule">
				<a href="<%=request.getContextPath() %>/schedule?year=<%=b_y %>&month=<%=b_m %>" class="fas fa-angle-left"></a>
				
					<input type="number" id="year" name="year" max="2100" min="2000" value="<%=y %>" />년 
					<input type="number" id="month" name="month" max="12" min="1" value="<%=m+1 %>" />월
					<input type="submit" style="display: none;" />
				
				<a href="<%=request.getContextPath() %>/schedule?year=<%=n_y %>&month=<%=n_m %>" class="fas fa-angle-right"></a>
			</form>
		</div>
	</caption>
	
<form id="deleteFrm" method="post" action="<%=request.getContextPath() %>/schedule/delete">
	
	<tr id="dayWeek">
		<th style="color: red;">일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th style="color: blue;">토</th>
	</tr>
	<%
	
	int d = 1;
	int s = 1;
	int nextMonthNo = 1;
	
	for(int i=0; i<6; i++) {
		
		out.print("<tr>");
		
		for(int j=0; j<7; j++) {
			
			String color="var(--color-black)";
			if(j == 6) {
				color = "blue";
			} else if(j == 0) {
				color = "red";
			}
			
			//저번달 숫자
			if(s < dayOfweek) {
				out.print("<td style='color: var(--color-light-grey)'>" + ((prevLastMth+s+1)-dayOfweek) + "</td>");
				
				s++;
				continue;
			}
			
			//이번달 숫자
			if(d <= lastday) {
				
				int count = 0;
				
				String zeroM = "0";
				String zeroD = "0";
				
				if(d >= 10) {
					zeroD = "";
				}
				
				if((m+1) >= 10) {
					zeroM = "";
				}
				
				String strDate = y + "" + zeroM + (m+1) + "" + zeroD + d;
				String sqlDate = y + "-" + zeroM + (m+1) + "-" + zeroD + d;
				
// 				//DB에서 가져온 일정과 일치하는 날짜 분별
// 				if(scheduleList != null) { 
// 					for(int k = 0; k < scheduleList.size(); k++) {
// 						Date schedule_day = scheduleList.get(k).getSchedule_date();
						
// 						String datePattern = "yyyyMMdd";
// 						SimpleDateFormat format = new SimpleDateFormat(datePattern);
						
// 						String schedule_Day_Str = format.format(schedule_day);
						
// 						if(strDate.equals(schedule_Day_Str)) {
// 							count++;
// 						}
						
// 					}
// 				}
				
				//이번달 td 생성
				if(count == 0) {
					out.print("<td style='color: " + color + "'; class='" + d + "' id='" + strDate + "'>"+ d + "</td>");
				} else if(count == 1) {
					out.print("<td style='color: " + color + "'; class='schedule' id='" + strDate + "'>" 
							+ "<input type='checkbox' class='scheduleCheckbox' name='scheduleCheckbox'" 
							+ " style='display: none;' value='" + sqlDate + "' />" 
							+ "<a href='" 
							+ request.getContextPath() 
							+ "/schedule/view?date="
							+ sqlDate 
							+"'>"+ d + "</a>" 
							+ "</td>");
					count--;
				}
				
			}
			
			//다음달 숫자
			if(d > lastday) {
				out.print("<td style='color: var(--color-light-grey)'>" + nextMonthNo +" </td>");
				
				nextMonthNo++;
			}
			
			d++;
			
		}
		out.print("</tr>");
	}
	
	%>
	
</form>
</table>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			<br>
			
			<div id="wthdr">
				Read With Me를 더이상 이용하지 않고 싶으시다면 <a href="/mypage/wthdr">회원탈퇴 바로가기</a>
			</div>
			
		</div>
	</div>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />