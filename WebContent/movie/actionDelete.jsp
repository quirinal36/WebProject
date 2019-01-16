<%@page import="org.json.JSONObject"%>
<%@page import="www.bacoder.kr.control.MovieController"%>
<%@page import="www.bacoder.kr.model.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	e.printStackTrace();
}
Movie movie = new Movie(id);
MovieController control = new MovieController();
int result = control.delete(movie);

JSONObject json = new JSONObject();
json.put("result", result);
json.put("message", control.getErrorMsg());

out.print(json.toString());
%>
<a href="./list.jsp">리스트보기</a>