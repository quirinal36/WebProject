<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");

int a = 9;
if(num != null && num.length() > 0){
	try{
		a = Integer.parseInt(num);
	}catch(NumberFormatException e){
		
	}
}
int i = a-1;
int j = 2;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제 1</title>
<style type="text/css">
table { width:50%; border-collapse:collapse; border-bottom:2px solid #6bc2ae; }
th, td { padding:5px 0; text-align:center; }
thead th { width:14%; background:#6bc2ae; color:#fff; font-weight:bold; }
tbody tr:nth-child(even) { background:#f5f5f5; }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
function reloadWithParam(){
	window.location.replace("./practice03.jsp?num="+$("#number").val());
}
</script>
</head>
<body>
<input type="number" id="number" placeholder="숫자를 입력하세요." value="<%=a%>"/>
<input type="button" value="판별" onclick="javascript:reloadWithParam();"/>
<table>
	<thead>
		<tr>
			<th>a</th>
			<th>i</th>
			<th>j</th>
			<th>j&lt;=i</th>
			<th>a % j</th>
			<th>a % j == 0</th>
			<th>출력</th>
		</tr>
	</thead>
	<tbody>
		<% while(j <= i){ %>
			<tr>
				<td><%=a %></td>
				<td><%=i %></td>
				<td><%=j %></td>
				<td><%=j <= i %></td>
				<td><%=a % j %></td>
				<td><%=a % j == 0 %></td>
				<td><%if(a % j == 0){ 
						out.print("소수가 아닙니다."); 
						break;
					}else if(j == i){
						out.print("소수");
						break;
					}%>
				</td>
			</tr>
		<%
		j++;
		} %>
	</tbody>
</table>
</body>
</html>