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
	<dl>
		<dd>
			<img src="<%=user.getProfile() %>"/>
		</dd>
		<dt>번호</dt>
		<dd><%=user.getId() %></dd>
		
		<dt>아이디</dt>
		<dd><%=user.getLogin() %></dd>
		
		<dt>이름</dt>
		<dd><%=user.getName()%></dd>
		
		<dt>생년월일</dt>
		<dd><%=user.getBirth() %></dd>
		
		<dt>e-mail</dt>
		<dd><%=user.getEmail() %></dd>
		
		<dt>우편번호 </dt>
		<dd><%=user.getPostcode() %></dd>
		
		<dt>주소 </dt>
		<dd><%=user.getAddress() %></dd>
		
		<dt>직업 </dt>
		<dd><%=user.getJob() %></dd>
		
		<dt>성별 </dt>
		<dd><%=user.getGender() %></dd>
	</dl>
</div>

</body>
</html>