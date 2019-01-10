<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<link rel="stylesheet" type="text/css" href="../css/style.css" />

</head>
<body>

<form id="join" action="./insertUser.jsp">
	<div class="title">회원가입</div>
	<div class="left">
		<dl>
			<dt>로그인</dt>
			<dd><input type="text" name="login"/></dd>
			
			<dt>비밀번호</dt>
			<dd><input type="password" name="password"/></dd>
		</dl>
	</div>
	<div class="right">
		<dl>
			<dt>이름</dt>
			<dd><input type="text" name="name"/></dd>
		</dl>
	</div>
</form>

</body>
</html>