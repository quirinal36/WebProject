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
String postcode = request.getParameter("postcode");
String address = request.getParameter("address");
String profile = request.getParameter("profile");

User user = new User();
user.setLogin(login);
user.setPwd(pwd);
user.setName(name);
user.setBirth(birth);
user.setEmail(email);
user.setJob(job);
user.setGender(gender);
user.setPostcode(postcode);
user.setAddress(address);
user.setProfile(profile);

UserController controller = new UserController();

JSONObject json = controller.addUser(user);

out.print(json.toString());
%>
<%if(json.getInt("result") == 1) {%>
	<br/>
	회원가입에 성공했습니다.<br/>
	메인화면으로 이동합니다.<br/>
	<a href="../index.jsp">이동</a>
<%}else{ %>
	<br/>
	회원가입에 실패했습니다.<br/>
	회원가입 화면으로 돌아갑니다.<br/>
	<a href="javascript:history.go(-1)">뒤로가기</a>
<%}%>