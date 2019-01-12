<%@page import="www.bacoder.kr.model.Board"%>
<%@page import="www.bacoder.kr.control.BoardController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	
}
Board search = new Board(id);

BoardController control = new BoardController();
Board board = control.selectOne(search);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><%=board.getTitle() %></title>
		<link href="../css/table.css" rel="stylesheet" type="text/css" media="all">
		<script type="text/javascript">
		function deleteBoard(id){
			if(confirm("삭제 하시겠습니까?")){
				window.location.replace("./deleteBoard.jsp?id="+id);
			}
		}
		function moveUpdatePage(id){
			if(confirm("수정페이지로 이동 하시겠습니까?")){
				window.location.replace("./update.jsp?id="+id);
			}
		}
		</script>
	</head>
	<body>
		<table>
			<thead>
				<tr>
					<th>제목: </th><th><%=board.getTitle() %></th>
				</tr>
				<tr>
					<th>글쓴이: </th><th><%=board.getWriter() %></th>
				</tr>
				<tr>
					<th>작성일: </th><th><%=board.getDate() %></th>
				</tr>
				
			</thead>
			<tbody>
				<tr><td colspan="2">내용</td></tr>
				<tr>
					<td colspan="2">
					<%=board.getContent() %>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="수정" onclick="javascript:moveUpdatePage('<%=board.getId()%>')">
		<input type="button" value="삭제" onclick="javascript:deleteBoard('<%=board.getId()%>')">
	</body>
</html>