<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>form action</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	function validate(){
		console.log($("#join").serializeArray());
	}
	</script>
</head>
<body>
<form id="join" action="./insertUser.jsp">
	<div class="title"><strong>회원가입</strong></div>
	<div class="left">
		<dl>
			<dt>login</dt>
			<dd>
				<input type="text" placeholder="login" name="login" required/>
			</dd>
		</dl>
		<dl>
			<dt>password</dt>
			<dd>
				<input type="password" placeholder="password" name="password"/>
			</dd>
		</dl>
		<dl>
			<dt>password confirm</dt>
			<dd>
				<input type="password" placeholder="비밀번호 확인" />
			</dd>
		</dl>
		<dl>
			<dt>job</dt>
			<dd>
				<select name="job">
					<option value="student">학생</option>
					<option value="office">회사원</option>
				</select>
			</dd>
		</dl>
	</div>
	<div class="right">
		<dl>
			<dt>name</dt>
			<dd>
				<input type="text" placeholder="name" name="name" required/>
			</dd>
		</dl>
		<dl>
			<dt>birth</dt>
			<dd>
				<input type="text" placeholder="birth" name="birth" required/>
			</dd>
		</dl>
		<dl>
			<dt>email</dt>
			<dd>
				<input type="email" placeholder="email" name="email" required/>
			</dd>
		</dl>
		<dl>
			<dt>gender</dt>
			<dd>
				<label><input id="gender_male" type="radio" value="male" name="gender" checked>남</label>
				
				<label><input id="gender_female" type="radio" value="female" name="gender">여</label>
			</dd>
		</dl>
	</div>
	<input type="submit" value="회원가입" />
	<input type="button" value="정보확인" onclick="javascript:validate();"/>
</form>
</body>
</html>
