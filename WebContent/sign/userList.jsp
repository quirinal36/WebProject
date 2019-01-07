<%@page import="www.bacoder.kr.model.User"%>
<%@page import="java.util.List"%>
<%@page import="www.bacoder.kr.control.UserController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
UserController controller = new UserController();
List<User> list = controller.getUserList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<link href="../css/table.css" rel="stylesheet" type="text/css" media="all">

</head>
<body>
<table>
	<thead>
		<tr>
			<th>index</th>
			<th>login</th>
			<th>name</th>
			
			<th>상세화면</th>
			<th>수정하기</th>
		</tr>
	</thead>
	<tbody>
		<%for(User user : list) {%>
		<tr>
			<td><%=user.getId() %></td>
			<td><%=user.getLogin() %></td>
			<td><%=user.getName() %></td>
			
			<td><a href="./userDetail.jsp?id=<%=user.getId()%>">상세보기</a></td>
			<td><a href="./editUser.jsp?id=<%=user.getId()%>">수정하기</a></td>
		</tr>
		<%} %>
	</tbody>
</table>
</body>
</html>