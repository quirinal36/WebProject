<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="www.bacoder.kr.model.Board"%>
<%@page import="www.bacoder.kr.control.BoardController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String searchWriter = request.getParameter("writer");

Board board = new Board();
board.setWriter(searchWriter);

List<Board> list;
BoardController control = new BoardController();
if(searchWriter!=null && searchWriter.length()>0){
	list = control.select(board);
}else{
	list = control.select();
}
Iterator<Board> iter = list.iterator();
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
				<input type="text" placeholder="작성자검색" name="writer" 
					<%if(searchWriter!=null && searchWriter.length()>0){ out.print("value='"+searchWriter+"'"); }%>/>
				<input type="submit" value="검색"/>
				<input type="button" value="새글작성" onclick="javascript:window.location.href='./write.jsp'"/>
			</form>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
				<%while(iter.hasNext()){
					Board item = iter.next();
				%>
					<tr>
						<td><%=item.getId() %></td>
						<td>
							<a href="./detail.jsp?id=<%=item.getId() %>">
								<%=item.getTitle() %>
							</a>
						</td>
						<td><%=item.getWriter() %></td>
						<td><%=item.getDate() %></td>
					</tr>
				<%}%>
				</tbody>
			</table>
			</div>
			<footer>
				<p>ⓒ 회사명.</p>
			</footer>
		</div>
		
	</body>
</html>