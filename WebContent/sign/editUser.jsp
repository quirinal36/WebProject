<%@page import="www.bacoder.kr.model.User"%>
<%@page import="www.bacoder.kr.control.UserController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userId = request.getParameter("id");
    int id = 0;
    try{
    	id = Integer.parseInt(userId);
    }catch(NumberFormatException e){
    	
    }
    UserController control = new UserController();
    User user = control.getUser(id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=user.getName() %>님의 정보 </title>
</head>
<body>

<div>
	<form action="./edit.jsp">
		<dl>
			<dd>
				<img src="<%=user.getProfile() %>" style="width:300px;"/>
			</dd>
			<dt>번호</dt>
			<dd><%=user.getId() %></dd>
			
			<dt>아이디</dt>
			<dd><%=user.getLogin() %></dd>
			
			<dt>이름</dt>
			<dd>
				<%if(user.getName() == null){ %>
					<input type="text" name="name" placeholder="이름을 입력하세요.">
				<%} else {%>
					<input type="text" name="name" value="<%=user.getName()%>">
				<%} %>
			</dd>
			
			<dt>생년월일</dt>
			<dd>
				<%if(user.getBirth() == null){ %>
					<input type="text" name="birth" placeholder="생년월일을 입력하세요.">
				<%} else {%>
					<input type="text" name="birth" value="<%=user.getBirth() %>">
				<%} %>
			</dd>
			
			<dt>e-mail</dt>
			<dd>
				<%if(user.getEmail() == null){ %>
					<input type="text" name="email" placeholder="이메일을 입력하세요.">
				<%} else {%>
					<input type="text" name="email" value="<%=user.getEmail() %>">
				<%} %>
			</dd>
			
			<dt>우편번호 </dt>
			<dd>
				<%if(user.getPostcode() == null){ %>
					<input type="text" name="postcode" placeholder="우편번호를 입력하세요.">
				<%} else {%>
					<input type="text" name="postcode" value="<%=user.getPostcode() %>">
				<%} %>
			</dd>
			
			<dt>주소 </dt>
			<dd>
				<%if(user.getAddress() == null){ %>
					<input type="text" name="address" placeholder="주소를 입력하세요.">
				<%} else {%>
					<input type="text" name="address" value="<%=user.getAddress() %>">
				<%} %>
			</dd>
			
		</dl>
		<input type="hidden" name="id" value="<%=user.getId() %>"/>
		<input type="submit" value="수정하기">
	</form>
</div>

</body>
</html>