<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="www.bacoder.kr.WebAppConfig"%>
<%
WebAppConfig webConfig = new WebAppConfig();
String content = "JSP를 배워보자";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<meta charset="UTF-8">
<title><%=webConfig.getWEB_TITLE() %></title>
</head>
<body>
	<div class="wrap">
		<header>
			<div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/sign/userList.jsp">유저 리스트</a></li>
					<li><a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a></li>
					<li><a href="<%=request.getContextPath()%>/movie/list.jsp">메뉴2</a></li>
				</ul>
				<a href="<%=request.getContextPath()%>/sign/login.jsp">로그인</a>
			</div>
		</header>
		<div class="container">
			
		</div>
		<footer>
			<p>ⓒ 회사명.</p>
		</footer>
	</div>
</body>
</html>