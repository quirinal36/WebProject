<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
System.out.println("num: " + num);

int a=0; 
if(num != null && num.length() > 0){
	try{
		a = Integer.parseInt(num);
	}catch(NumberFormatException e){
		a = 0;
	}
}
int i = a-1;
int j = 2;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소수구하기</title>

<link href="../css/table.css" rel="stylesheet" type="text/css" media="all">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
function reloadWithParam(){
	var number = document.getElementById("number").value;
	console.log("number : " + number);
	
	window.location.replace("./practice06.jsp?num="+$("#number").val());
}
</script>

</head>
<body>

<input type="number" id="number" placeholder="숫자를 입력하세요." value="<%=a%>"/>
<input type="button" value="이동" onclick="javascript:reloadWithParam();"/>

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
				<td><%out.print(a);%></td>
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