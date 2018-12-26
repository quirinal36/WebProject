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
<%=content %><br/>
</body>
</html>