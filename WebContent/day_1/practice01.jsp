<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int i = 0;
int sum = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제 1</title>
<style type="text/css">
table { width:50%; border-collapse:collapse; border-bottom:2px solid #6bc2ae; }
th, td { padding:5px 0; text-align:center; }
thead th { width:25%; background:#6bc2ae; color:#fff; font-weight:bold; }
tbody tr:nth-child(even) { background:#f5f5f5; }
</style>
</head>
<body>

<table>
	<thead>
		<tr>
			<th>i</th>
			<th>sum</th>
			<th>i&lt;=100</th>
			<th>출력</th>
		</tr>
	</thead>
	<tbody>
		<%for(i=0; i<=100; i++){%>
			<tr>
				<td><%=i%></td>
				<td><%=sum += i %></td>
				<td><%=i<100%></td>
				<td><%if(i==100){ %>
				<%=sum %>
				<%} %>
				</td>
			</tr>
		<%} %>
	</tbody>
</table>
</body>
</html>