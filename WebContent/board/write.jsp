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
	function insertBoard(){
		if(confirm("저장하시겠습니까?")){
			$("form").submit();
		}
	}
	</script>
</head>
<body>
	<form id="write" action="./insertBoard.jsp">
		<table>
			<thead>
				<tr>
					<th>
						<input name="title" placeholder="제목을 입력해 주세요."/>
					</th>
					<th>
						<input name="writer" placeholder="작성자">
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
						<textarea rows="20" cols="100" name="content" placeholder="내용입력"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="글작성" onclick="javascript:insertBoard();">
	</form>
</body>
</html>