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
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>
	<div class="wrap">
		<header>
			<div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/sign/userList.jsp">유저 리스트</a></li>
					<li><a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a></li>
					<li><a href="#">메뉴2</a></li>
				</ul>
				<a href="<%=request.getContextPath()%>/sign/login.jsp">로그인</a>
			</div>
		</header>
		<div class="container">
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
		</div>
		<footer>
			<p>ⓒ 회사명.</p>
		</footer>
	</div>
	
</body>
</html>