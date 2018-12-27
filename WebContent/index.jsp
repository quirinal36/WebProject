<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="www.bacoder.kr.WebAppConfig"%>
<%
WebAppConfig webConfig = new WebAppConfig();
String content = "JSP를 배워보자";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=webConfig.getWEB_TITLE() %></title>
</head>
<body>

	<a href="./day_1/practice01.jsp">1~100 까지의 합계</a><br/>
	<a href="./day_1/practice02.jsp">일정한 간격으로 벌어지는 숫자</a><br/>
	<a href="./day_1/practice03.jsp">소수구하기</a><br/>
</body>
</html>