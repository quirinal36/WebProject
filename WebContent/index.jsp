<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="www.bacoder.kr.WebAppConfig"%>
<%
WebAppConfig webConfig = new WebAppConfig();
String content = "JSP를 배워보자";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=webConfig.getWEB_TITLE() %></title>
<style>
* { padding: 0; margin: 0; border: 0; list-style: none; color: #000; text-decoration: none; }
header {
	width: 100%;
	height: 80px;
	background: #05abe0;
	background: linear-gradient(to right, #05abe0 0%,#87e0fd 100%);
}
header > div { width: 1000px; margin: 0 auto; }
header ul { float: left; margin-top: 28px; }
header ul li { display: inline-block; margin-left: 40px; }
header ul li:first-child { margin-left: 0; }
header ul li a { font-size: 20px; color: #fff; }
header ul li a:hover { text-decoration: underline; }
header > div > a { float: right; display: block; margin-top: 23px; padding: 8px 30px; border: 1px solid #fff; border-radius: 100px; color: #fff; }
header > div > a:hover { background: #fff; color: #000; }
.container { width: 100%; min-width: 1000px; margin: 0 auto; min-height: 500px; padding: 100px 0; background: url(./img/bg.jpg); background-size: cover; }
footer { padding: 20px 0; background: #eee; text-align: center; }
</style>
</head>
<body>
	<div class="wrap">
		<header>
			<div>
				<ul>
					<li><a href="./sign/userList.jsp">리스트 보기</a></li>
					<li><a href="#">메뉴1</a></li>
					<li><a href="#">메뉴2</a></li>
				</ul>
				<a href="./sign/login.jsp">로그인</a>
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