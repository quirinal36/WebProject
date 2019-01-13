<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>form action</title>
	
	<link rel="stylesheet" type="text/css" href="../css/style.css" />
	<link href="../css/table.css" rel="stylesheet" type="text/css" media="all">
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	function openUpload(){
		window.open("http://www.bacoder.kr/image/photo_uploader/popup/photo_uploader.jsp",
				"mywindow","menubar=1,resizable=1,width=350,height=250");
	}
	function insertEvent(){
		if(confirm("저장하시겠습니까?")){
			$("form").submit();
		}
	}
	</script>
</head>
<body>
	<form id="write" action="./insertEvent.jsp">
		<table>
			<thead>
				<tr>
					<th>
						<input name="title" placeholder="제목을 입력해 주세요."/>
					</th>
					<th>
						<input name="startDate" placeholder="이벤트 시작"/>
					</th>
					
				</tr>
				<tr>
					<th>
						<input name="writer" placeholder="작성자">
					</th>
					<th>
						<input name="finishDate" placeholder="이벤트 종료">
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<img src="../img/no_image.png" style="width:100px; height:100px;" id="targetImgPreview">
						<input type="hidden" id="targetUpload" name="profile"/>
						<input type="button" value="이미지" onclick="javascript:openUpload();"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="20" cols="100" name="content" placeholder="내용입력"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="글작성" onclick="javascript:insertEvent();">
	</form>
</body>
</html>