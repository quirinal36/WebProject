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
	</head>
	<body>
		<table>
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">
						음악정보
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>제목</td>
					<td>
						<%=item.getTitle()%>
					</td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td>
						<img src="<%=item.getPhotoUrl()!=null?item.getPhotoUrl():""%>" width="500px;"/>
					</td>
				</tr>
				<tr>
					<td>가수/작곡가</td>
					<td>
						<input type="text" name="singer" placeholder="가수/작곡가를 입력하세요"
							value="<%=item.getSinger()!=null?item.getSinger():""%>" readonly/>
					</td>
				</tr>
				<tr>
					<td>국가</td>
					<td>
						<input type="text" name="national" placeholder="국가명을 입력하세요"
							value="<%=item.getNational()!=null?item.getNational():""%>" readonly/>
					</td>
				</tr>
				<tr>
					<td>언어</td>
					<td>
						<input type="text" name="language" placeholder="언어를 입력하세요"
							value="<%=item.getLanguage()!=null?item.getLanguage():""%>" readonly/>
					</td>
				</tr>
				<tr>
					<td>뮤직비디오</td>
					<td>
						<iframe width="420" height="315"
							src="<%=item.getMvYoutubeUrl()!=null?item.getMvYoutubeUrl():""%>">
						</iframe>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>