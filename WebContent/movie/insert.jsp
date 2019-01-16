<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>글작성</title>
	
	<link rel="stylesheet" type="text/css" href="http://www.bacoder.kr/webpr/css/style.css" />
	<link href="http://www.bacoder.kr/webpr/css/table.css" rel="stylesheet" type="text/css" media="all">
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	function insert(){
		if(confirm("저장하시겠습니까?")){
			$("form").submit();
		}
	}
	</script>
</head>
<body>
	<form id="write" action="./actionInsert.jsp">
		<table>
			<colgroup>
				<col width="30%" />
				<col width="70%" />
			</colgroup>
			<thead>
				<tr>
					<th>
						분류
					</th>
					<th>
						내용
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						제목
					</td>
					<td>
						<input type="text" name="title" placeholder="title">
					</td>
				</tr>
				<tr>
					<td>
						대표사진
					</td>
					<td>
						<input type="text" name="photoUrl" placeholder="http://www.bacoder.kr/img/img.jpg">
					</td>
				</tr>
				<tr>
					<td>
						러닝타임(분)
					</td>
					<td>
						<input type="number" name="runningTime" placeholder="120">분
					</td>
				</tr>
				<tr>
					<td>
						개봉(공개)일
					</td>
					<td>
						<input type="text" name="openDate" placeholder="2019-01-15">
					</td>
				</tr>
				<tr>
					<td>
						감독
					</td>
					<td>
						<input type="text" name="director" placeholder="김감독">
					</td>
				</tr>
				<tr>
					<td>
						주연배우
					</td>
					<td>
						<input type="text" name="actor" placeholder="박배우">
					</td>
				</tr>
				<tr>
					<td>
						국가
					</td>
					<td>
						<input type="text" name="national" placeholder="대한민국">
					</td>
				</tr>
				<tr>
					<td>
						언어
					</td>
					<td>
						<input type="text" name="language" placeholder="한국어">
					</td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="글작성" onclick="javascript:insert();">
	</form>
</body>
</html>