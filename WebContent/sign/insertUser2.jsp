<%@page import="www.bacoder.kr.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String login = request.getParameter("login");
String pwd = request.getParameter("password");

User user = new User();
user.setLogin(login);
user.setPwd(pwd);

System.out.println(user.toString());
%>