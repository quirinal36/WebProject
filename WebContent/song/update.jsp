<%@page import="www.bacoder.kr.control.SongController"%>
<%@page import="www.bacoder.kr.model.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	e.printStackTrace();
}
Song song = new Song(id);
SongController control = new SongController();
Song item = control.selectOne(song);
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>form action</title>
	
	<link rel="stylesheet" type="text/css" href="http://www.bacoder.kr/webpr/css/style.css" />
	<link rel="stylesheet" type="text/css" media="all" href="http://www.bacoder.kr/webpr/css/table.css">
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	function update(){
		if(confirm("수정하시겠습니까?")){
			$("form").submit();
		}
	}
	function openUpload(){
		window.open("http://www.bacoder.kr/image/photo_uploader/popup/photo_uploader.jsp",
				"mywindow","menubar=1,resizable=1,width=350,height=250");
	}
	function openDelete(){
		if(confirm("삭제 하시겠습니까?")){
			location.href="./actionDelete.jsp?id=<%=item.getId()%>";
		}
	}
	</script>
</head>
<body>
	<form action="./actionUpdate.jsp">
		<table>
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">
						영화정보
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>제목</td>
					<td>
						<%=item.getTitle()%>
						<input type="hidden" name="title" value="<%=item.getTitle()%>"/>
					</td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td>
						<input id="targetUpload" type="text" name="photoUrl" placeholder="이미지주소나 또는 파일을 업로드하세요"
							value="<%=item.getPhotoUrl()!=null?item.getPhotoUrl():""%>"/>
						<input type="button" value="업로드" onclick="javascript:openUpload();"/>
					</td>
				</tr>
				<tr>
					<td>가수 / 작곡가</td>
					<td>
						<input type="text" name="singer" placeholder="가수/작곡가 입력하세요"
							value="<%=item.getSinger()!=null?item.getSinger():""%>"/>
					</td>
				</tr>
				<tr>
					<td>국가</td>
					<td>
						<input type="text" name="national" placeholder="국가명을 입력하세요"
							value="<%=item.getNational()!=null?item.getNational():""%>"/>
					</td>
				</tr>
				<tr>
					<td>언어</td>
					<td>
						<input type="text" name="language" placeholder="언어를 입력하세요"
							value="<%=item.getLanguage()!=null?item.getLanguage():""%>"/>
					</td>
				</tr>
				<tr>
					<td>영상</td>
					<td>
						<input type="text" name="mvYoutubeUrl" placeholder="15"
							value="<%=item.getMvYoutubeUrl()!=null?item.getMvYoutubeUrl():""%>"/>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="id" value="<%=item.getId() %>"/>
		<input type="submit" onclick="javascript:update();">
		<input type="button" onclick="javascript:openDelete();" value="삭제">
	</form>
</body>
</html>