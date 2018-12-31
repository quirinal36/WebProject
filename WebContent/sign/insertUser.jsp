<%@page import="org.json.JSONObject"%>
<%@page import="www.bacoder.kr.control.UserController"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="www.bacoder.kr.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("");

String login = request.getParameter("login");
String pwd = request.getParameter("password");
String name = request.getParameter("name");
String job = request.getParameter("job");
String birth = request.getParameter("birth");
String email = request.getParameter("email");
String gender = request.getParameter("gender");

User user = new User();
user.setLogin(login);
user.setPwd(pwd);
user.setName(name);
user.setBirth(birth);
user.setEmail(email);
user.setJob(job);
user.setGender(gender);

UserController controller = new UserController();
int result = controller.addUser(user);

JSONObject json = new JSONObject();
json.put("result", result);

out.print(json.toString());
%>