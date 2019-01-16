<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="www.bacoder.kr.model.Board"%>
<%@page import="www.bacoder.kr.control.BoardController"%>
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
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>form action</title>
	<link rel="stylesheet" type="text/css" href="http://www.bacoder.kr/webpr/css/style.css" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link href="http://www.bacoder.kr/webpr/css/table.css" rel="stylesheet" type="text/css" media="all">
	<script type="text/javascript">
	function saveInfo(){
		if(confirm("저장하시겠습니까?")){
			$("form").submit();
		}
	}
	</script>
</head>
<body>
	<form id="write" action="./updateBoard.jsp">
		<table>
			<thead>
				<tr>
					<th>제목: </th><th><input name="title" placeholder="제목을 입력해 주세요." value="<%=board.getTitle() %>"/></th>
				</tr>
				<tr>
					<th>글쓴이: </th><th><input name="writer" placeholder="작성자" value="<%=board.getWriter() %>"></th>
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="2">내용</td></tr>
				<tr>
					<td colspan="2">
						<textarea rows="20" cols="100" name="content" placeholder="내용입력"><%=board.getContent() %></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="id" value="<%=board.getId() %>">
		<input type="button" value="저장" onclick="javascript:saveInfo();">
	</form>
</body>
</html>