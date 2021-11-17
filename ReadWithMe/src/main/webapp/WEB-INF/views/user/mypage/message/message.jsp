<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/user/layout/header.jsp" />

<h1>마이페이지</h1>

<hr>

<%-- 받은 쪽지함 --%>
<div id="message">

	<form action="<%=request.getContextPath() %>/message" method="post" id="message">
		<div>
			<br>
			<select onchange="if(this.value === '받은 쪽지함') location.href='<%=request.getContextPath() %>/message'; else location.href = '<%=request.getContextPath() %>/messagesend'">
				<option value="받은 쪽지함" selected>받은 쪽지함</option>
				<option value="보낸 쪽지함" >보낸 쪽지함</option>
			</select>
		</div>		
				
		<br>
		<div class="clearbox"></div>
		<hr size="5" noshade>
		<h2>받은 쪽지함</h2>
		<br>
	</form>
	
	<form action="<%=request.getContextPath() %>/message/delete" method="post" id="messageList">
		<table>
			<% int i =0; %> 
			<c:forEach items="${messageList }" var="message">
			<tr>
				<td><input type="checkbox" name="delno<%=i %>" value="${message.message_no }" class="check"/></td>		
				<td><%=i+1 %></td>
				<td>
					<a href="<%=request.getContextPath() %>/message/view?message_no=${message.message_no }">
					${message.title }
					</a>
				</td>
				<td>${message.fromNick }</td>
				<td>${message.post_date }</td>
			</tr>
			<% i++; %>
			</c:forEach>
		</table>
	</form>
		<div id="btnBox">
		<button type="button" id="btnDelete">삭제</button>&nbsp;&nbsp;<button type="button" id="btnSend">쪽지 쓰기</button>
		</div>
</div>


<c:import url="/WEB-INF/views/user/layout/footer.jsp" />