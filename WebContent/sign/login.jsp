<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>무제 문서</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
	</head>
	<body>
		<form id="login" action="actionLogin.jsp">
			<strong>로그인</strong>
			<input type="text" placeholder="아이디" name="login" />
			<input type="password" placeholder="비밀번호" name="password"/>
			<input type="submit" value="로그인" />
			<a href="./join.jsp">회원가입</a>
		</form>
	</body>
</html>
