<%@page import="org.json.JSONObject"%>
<%@page import="www.bacoder.kr.control.UserController"%>
<%@page import="www.bacoder.kr.model.User"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("");

String id = request.getParameter("id");
//String login = request.getParameter("login");
//String pwd = request.getParameter("password");
String name = request.getParameter("name");
//String job = request.getParameter("job");
String birth = request.getParameter("birth");
String email = request.getParameter("email");
//String gender = request.getParameter("gender");
String postcode = request.getParameter("postcode");
String address = request.getParameter("address");
//String profile = request.getParameter("profile");
logger.info("id:" +id);

User user = new User();
user.setId(Integer.parseInt(id));
//user.setLogin(login);
user.setName(name);
user.setBirth(birth);
user.setEmail(email);
user.setPostcode(postcode);
user.setAddress(address);

UserController controll = new UserController();
//int result = controll.updateUser(user);

JSONObject object = controll.updateUser(user);

out.print(object.toString());
%>