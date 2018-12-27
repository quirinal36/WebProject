<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int i = 0;
int j = 1;
int k = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제 2</title>

<link href="../css/table.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>

<table>
	<thead>
		<tr>
			<th>i</th>
			<th>j</th>
			<th>k</th>
			<th>i&lt;19</th>
			<th>출력</th>
		</tr>
	</thead>
	<tbody>
		<%for(i=0; i<20; i++){
			j = j + i;
			k = k + j;
		%>
			<tr>
				<td><%=i %></td>
				<td><%=j %></td>
				<td><%=k %></td>
				<td><%=i < 19%></td>
				<td><%if(i == 19){ out.print(k); } %></td>
			</tr>
		<%} %>
	</tbody>
</table>
</body>
</html>