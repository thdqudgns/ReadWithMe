<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h2>마이페이지</h2>
<hr>

<h3>쪽지함</h3>

<a href="<%=request.getContextPath() %>/user/mypage/message/delete"><button>삭제</button></a>
<a href="<%=request.getContextPath() %>/user/mypage/message/keep"><button>보관</button></a>
<a href="<%=request.getContextPath() %>/user/mypage/message/unread">안 읽은 쪽지</a>
<a href="<%=request.getContextPath() %>/user/mypage/message/write"><button>쪽지 쓰기</button></a>


<select onchange="if(this.value === '받은 쪽지함') location.href='<%=request.getContextPath() %>/message'; else location.href = '<%=request.getContextPath() %>/message/send'; else location.href = '<%=request.getContextPath() %>/message/keep'">
	<option value="받은 쪽지함" selected>받은 쪽지함</option>
	<option value="보낸 쪽지함" >보낸 쪽지함</option>
	<option value="쪽지 보관함" >쪽지 보관함</option>
</select>

<form action="<%=request.getContextPath() %>/message/delete" method="post" id="messageList">
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" name="check-all" class="check-all" /></th>
				<th>번호</th>
				<th>제목</th>
				<th>보낸 사람</th>
				<th>날짜</th>
			</tr>
		</thead>

		<% int i =0; %> 
		<c:forEach items="${messageList }" var="message">
		<tr>
			<td><input type="checkbox" name="delno<%=i %>" value="${message.msg_no }" class="check"/></td>		
			<td><%=i+1 %></td>
			<td>
			<a href="<%=request.getContextPath() %>/message/view?message_no=${message.msg_no }">
				${message.msg_title }
			</a>
			</td>
			<td>${message.fromNick }</td>
			<td>${message.send_date }</td>
		</tr>
		<% i++; %>
		</c:forEach>
	</table>
</form>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />