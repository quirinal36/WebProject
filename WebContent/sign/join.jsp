<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>form action</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	function openUpload(){
		window.open("http://www.bacoder.kr/image/photo_uploader/popup/photo_uploader.jsp",
				"mywindow","menubar=1,resizable=1,width=350,height=250");
	}
	function formClick(){
		var name = $("input[name='login']").val();
		var password = $("input[name='password']").val();
		if(name.length == 0){
			alert("이름을 입력하세요.");
			return false;
		}
		if(password.length == 0){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(confirm("회원가입 하시겠습니까?")){
			// form 의 submit 동작이 작동된다.
			$("#join").submit();
		}else{
			// 아무런 동작도 하지 않게 
			alert("취소되었습니다.");
		}
	}
	</script>
</head>
<body>
<form id="join" action="./insertUser.jsp">
	<div class="title">회원가입</div>
	<div class="title">
		<img src="../img/no_image.png" style="width:100px; height:100px;" id="targetImgPreview">
		<input type="button" value="이미지" onclick="javascript:openUpload();"/>
	</div>
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
			<dt>address</dt>
			<dd>
				<input type="text" name="address" placeholder="주소" />
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
			<dt>postcode</dt>
			<dd>
				<input type="text" name="postcode" placeholder="우편번호" />
			</dd>
		</dl>
		<dl>
			<dt>gender</dt>
			<dd>
				<label>남<input id="gender_male" type="radio" value="male" name="gender" checked></label>
				<label>여<input id="gender_female" type="radio" value="female" name="gender"></label>
			</dd>
		</dl>
	</div>
	<input type="hidden" id="targetUpload" name="profile"/>
	<input type="submit" value="회원가입" onclick="javascript:formClick();"/>
</form>
</body>
</html>
