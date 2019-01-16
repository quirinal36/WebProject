<%@page import="www.bacoder.kr.control.MovieController"%>
<%@page import="www.bacoder.kr.model.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	e.printStackTrace();
}
Movie movie = new Movie(id);
MovieController control = new MovieController();
Movie item = control.selectOne(movie);
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
						영화정보
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
						<img src="<%=item.getPhotoUrl()!=null?item.getPhotoUrl():""%>" />
					</td>
				</tr>
				<tr>
					<td>런닝타임</td>
					<td>	
						<input type="number" name="runningTime"
							value="<%=item.getRunningTime()>0?item.getRunningTime():0%>" readonly/>분
					</td>
				</tr>
				<tr>
					<td>개봉일</td>
					<td>
						<input type="text" name="openDate" placeholder="개봉일을 입력하세요"
							value="<%=item.getOpenDate()!=null?item.getOpenDate():""%>" readonly/>
					</td>
				</tr>
				<tr>
					<td>감독</td>
					<td>
						<input type="text" name="director" placeholder="감독을 입력하세요"
							value="<%=item.getDirector()!=null?item.getDirector():""%>" readonly/>
					</td>
				</tr>
				<tr>
					<td>배우</td>
					<td>
						<input type="text" name="actor" placeholder="배우를 입력하세요"
							value="<%=item.getActor()!=null?item.getActor():""%>" readonly/>
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
					<td>관람가능연령</td>
					<td>
						<input type="number" name="age" placeholder="15"
							value="<%=item.getAge()>0?item.getAge():0%>" readonly/>세
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>