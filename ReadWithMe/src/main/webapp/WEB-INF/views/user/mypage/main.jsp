<%@page import="web.user.dto.Meeting"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%

List<Meeting> meetingList = (List) request.getAttribute("meetingList");


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
<c:import url="/WEB-INF/views/user/layout/header.jsp" />
<script src="https://kit.fontawesome.com/0d232bdc2d.js" crossorigin="anonymous"></script>
<link href="/resources/css/mypageMain.css" rel="stylesheet">
    <script type="text/javascript">
    
    	var str = '<input type="checkbox" class="scheduleCheckbox" name="scheduleCheckbox" />';
		
		function goWrite() {
			window.location.assign("<%= request.getContextPath() %>/schedule/write")
		}
		
		function goDelete() {
			document.getElementById("btnRight").style.display = "none";
			document.getElementById("btnRightHide").style.display = "block";
			
			var sections = document.querySelectorAll('.scheduleCheckbox');
			
			for(var i=0; i<sections.length; i++) {
				var item = sections.item(i);
				item.style.display = 'block';
			}
		}
		
		function deleteFrm() {
			document.getElementById('deleteFrm').submit();
		}
		
		$(function(){
			$(".schedule a").css({
				"color": "inherit"
			});
		});
		
		$(function() {
			
			if(<%=m+1 %> == '1') {
				document.getElementById("<%=y %>0101").style.color = "red";
			}
			if(<%=m+1 %> == '2') {
			}
			if(<%=m+1 %> == '3') {
				document.getElementById("<%=y %>0301").style.color = "red";
			}
			if(<%=m+1 %> == '4') {
			}
			if(<%=m+1 %> == '5') {
				document.getElementById("<%=y %>0505").style.color = "red";
				document.getElementById("<%=y %>0519").style.color = "red";
			}
			if(<%=m+1 %> == '6') {
				document.getElementById("<%=y %>0606").style.color = "red";
			}
			if(<%=m+1 %> == '7') {
			}
			if(<%=m+1 %> == '8') {
				document.getElementById("<%=y %>0815").style.color = "red";
			}
			if(<%=m+1 %> == '9') {
			}
			if(<%=m+1 %> == '10') {
				document.getElementById("<%=y %>1003").style.color = "red";
				document.getElementById("<%=y %>1009").style.color = "red";
			}
			if(<%=m+1 %> == '11') {
			}
			if(<%=m+1 %> == '12') {
				document.getElementById("<%=y %>1225").style.color = "red";
			}
			
			
		})
		
    
    </script>

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
					<a href="<%=request.getContextPath() %>/mypage/profile"><button id="mypage">변&nbsp;&nbsp;경</button></a>
				</div>
				
				<div id="pw-change">
					<h3>비밀번호 변경</h3>
					고객님의 비밀번호를 변경하실 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/mypage/pwchange"><button id="mypage">변&nbsp;&nbsp;경</button></a>
				</div>
			</div>
			<br>
			
			<div id="review-todo">
				<div id="myReview">
					<h3>내가 작성한 리뷰</h3>
					고객님이 작성하신 리뷰를 볼 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/user/mypage/myReview/list"><button id="mypage">자세히 보기</button></a>
				</div>
				
				<div id="to-do-list">
					<h3>To Do List</h3>
					나의 To Do List 목록을 확인할 수 있습니다.<br><br>
					<a href="<%=request.getContextPath() %>/mypage/todolist"><button id="mypage">자세히 보기</button></a>
				</div>
			</div>
			
			
			
			
			
			
<table style="margin-top: 40px;">
	<caption id="controllDay" style="margin: 30px 0px;">
		<div style="width: 400px;">
			<form id="frm" method="get" action="<%=request.getContextPath() %>/schedule">
				<a href="<%=request.getContextPath() %>/mypage/main?year=<%=b_y %>&month=<%=b_m %>" class="fas fa-angle-left"></a>
				
					<input type="number" id="year" name="year" max="2100" min="2000" value="<%=y %>" />년 
					<input type="number" id="month" name="month" max="12" min="1" value="<%=m+1 %>" />월
					<input type="submit" style="display: none;" />
				
				<a href="<%=request.getContextPath() %>/mypage/main?year=<%=n_y %>&month=<%=n_m %>" class="fas fa-angle-right"></a>
			</form>
		</div>
	</caption>

	
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
			
			String color="#000";
			if(j == 6) {
				color = "blue";
			} else if(j == 0) {
				color = "red";
			}
			
			//저번달 숫자
			if(s < dayOfweek) {
				out.print("<td style='color: #ccc'>" + ((prevLastMth+s+1)-dayOfweek) + "</td>");
				
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
				
				String meetingTitle = null;
				int meetingNo = 0;
				//DB에서 가져온 일정과 일치하는 날짜 분별
				if(meetingList != null) { 
					for(int k = 0; k < meetingList.size(); k++) {
						Date schedule_start_day = meetingList.get(k).getMeeting_start();
						Date schedule_end_day = meetingList.get(k).getMeeting_end();
						
						String datePattern = "yyyyMMdd";
						SimpleDateFormat format = new SimpleDateFormat(datePattern);
						
						String schedule_Day_Str = format.format(schedule_start_day);
						String schedule_Day_End = format.format(schedule_end_day);
						
						
						if(strDate.equals(schedule_Day_Str)) {
							meetingTitle = meetingList.get(k).getMeeting_title();
							meetingNo = meetingList.get(k).getMeeting_no();
							count++;
						}
						
						
						if(strDate.equals(schedule_Day_End)) {
							meetingTitle = meetingList.get(k).getMeeting_title();
							meetingNo = meetingList.get(k).getMeeting_no();
							count++;
							count++;
						}
						
						
					}
				}
				
				//이번달 td 생성
				if(count == 0) {
					out.print("<td style='color: " + color + "'; class='" + d + "' id='" + strDate + "'>"+ d + "</td>");

				} else if(count == 1 ) {
					
					out.print("<td style='color: " + color + "'; class='schedule' id='" + strDate + "'>" 
							+ "<input type='checkbox' class='scheduleCheckbox' name='scheduleCheckbox'" 
							+ " style='display: none;' value='" + sqlDate + "' />" 
							+ "<a href='" 
							+ request.getContextPath() 
							+ "/user/meeting/view?no=" + meetingNo
							+"'>"+ d + "<div style='text-align: center; font-size: small; color: #000;'>" + meetingTitle + " 시작 </div>" + "</a>" 
							+ "</td>");
					count--;
					
				} else if(count == 2 ) {
					out.print("<td style='color: " + color + "'; class='schedule' id='" + strDate + "'>" 
							+ "<input type='checkbox' class='scheduleCheckbox' name='scheduleCheckbox'" 
							+ " style='display: none;' value='" + sqlDate + "' />" 
							+ "<a href='" 
							+ request.getContextPath() 
							+ "/user/meeting/view?no=" + meetingNo
							+"'>"+ d + "<p style='text-align: center; font-size: small; color: #000;'>" + meetingTitle + " 끝 </p>" + "</a>" 
							+ "</td>");
					count--;
					count--;
					
				} 
				
			}
			
			//다음달 숫자
			if(d > lastday) {
				out.print("<td style='color: #ccc'>" + nextMonthNo +" </td>");
				
				nextMonthNo++;
			}
			
			d++;
			
		}
		out.print("</tr>");
	}

	
	%>

</table>
			
			
	
			
			
			
			<br>
			
			<div id="wthdr">
				Read With Me를 더이상 이용하지 않고 싶으시다면 <a href="/mypage/wthdr">회원탈퇴 바로가기</a>
			</div>
			
		</div>
	</div>
</section>

<c:import url="/WEB-INF/views/user/layout/footer.jsp" />