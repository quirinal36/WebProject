<%@page import="www.bacoder.kr.control.MovieController"%>
<%@page import="java.util.List"%>
<%@page import="www.bacoder.kr.model.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String searchTitle = request.getParameter("title");

List<Movie> list;
MovieController control = new MovieController();
if(searchTitle!=null && searchTitle.length()>0){
	Movie searchMovie = new Movie();
	searchMovie.setTitle(searchTitle);
	list = control.select(searchMovie);
}else{
	list = control.select();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<link href="http://www.bacoder.kr/webpr/css/table.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" type="text/css" href="http://www.bacoder.kr/webpr/css/style.css" />
</head>
<body>
	<div class="wrap">
		<header>
			<div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/sign/userList.jsp">유저 리스트</a></li>
					<li><a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a></li>
					<li><a href="<%=request.getContextPath()%>/movie/list.jsp">소개하기</a></li>
				</ul>
				<a href="<%=request.getContextPath()%>/sign/login.jsp">로그인</a>
			</div>
		</header>
		<div class="container">
			<form action="./list.jsp">
				<input type="text" placeholder="제목검색" name="title" 
					<%if(searchTitle!=null && searchTitle.length()>0){ out.print("value='"+searchTitle+"'"); }%>/>
				<input type="submit" value="검색"/>
				<input type="button" value="새글작성" onclick="javascript:window.location.href='./insert.jsp'"/>
			</form>
			<table>
				<thead>
					<tr>
						<th>index</th>
						<th>제목</th>
						<th>개봉일</th>
						
						<th>러닝타임</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%for(Movie movie : list) {%>
					<tr>
						<td><%=movie.getId() %></td>
						<td><%=movie.getTitle() %></td>
						<td><%=movie.getOpenDate() %></td>
						<td><%=movie.getRunningTime() %>분</td>
						<td><a href="./detail.jsp?id=<%=movie.getId()%>">상세보기</a></td>
						<td><a href="./update.jsp?id=<%=movie.getId()%>">수정하기</a></td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
		<footer>
			<p>ⓒ 회사명.</p>
		</footer>
	</div>
	
</body>
</html>