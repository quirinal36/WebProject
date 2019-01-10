<%@page import="www.bacoder.kr.control.UserController"%>
<%@page import="www.bacoder.kr.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String login = request.getParameter("login");
String password = request.getParameter("password");

User user = new User();
user.setLogin(login);
user.setPwd(password);

System.out.print(user.toString());

UserController control = new UserController();
user = control.getUser(user);

System.out.print(user.toString());
%>
