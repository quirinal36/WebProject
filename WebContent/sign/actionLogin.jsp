<%@page import="www.bacoder.kr.control.UserController"%>
<%@page import="www.bacoder.kr.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String login = request.getParameter("login");
String password = request.getParameter("password");

User user = new User();
user.setLogin(login);
user.setPwd(password);

UserController control = new UserController();
user = control.getUser(user);
%>

<%if(user.getId() > 0){ %>
	로그인에 성공했습니다. <br/>
	메인화면으로 이동합니다. <br/>
	<a href="../index.jsp">확인</a>
<%}else{%>
	로그인에 실패했습니다. <br/>
	로그인 화면으로 이동합니다. <br/>
	<a href="javascript:history.go(-1);">뒤로가기</a>
<%}%>