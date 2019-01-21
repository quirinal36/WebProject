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
						<input id="targetUpload" type="text" name="photoUrl" placeholder="이미지주소나 또는 파일을 업로드하세요"/>
						<input type="button" value="업로드" onclick="javascript:openUpload();"/>
					</td>
				</tr>
				<tr>
					<td>
						가수 / 작곡가
					</td>
					<td>
						<input type="text" name="singer" placeholder="가수 / 작곡가">
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
				<tr>
					<td>영상URL</td>
					<td>
						<input type="text" name="mvYoutubeUrl" placeholder=""/>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="글작성" onclick="javascript:insert();">
	</form>
</body>
</html>