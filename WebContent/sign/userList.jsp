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
			<th>birth</th>
			<th>email</th>
			<th>job</th>
			<th>gender</th>
		</tr>
	</thead>
	<tbody>
		<%for(User user : list) {%>
		<tr>
			<td><%=user.getId() %></td>
			<td><%=user.getLogin() %></td>
			<td><%=user.getName() %></td>
			<td><%=user.getBirth() %></td>
			<td><%=user.getEmail() %></td>
			<td><%=user.getJob() %></td>
			<td><%=user.getGender() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
</body>
</html>