<%@page import="org.json.JSONObject"%>
<%@page import="www.bacoder.kr.control.MovieController"%>
<%@page import="www.bacoder.kr.model.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
String title = request.getParameter("title");
String photoUrl = request.getParameter("photoUrl");
String runningTime = request.getParameter("runningTime");
String openDate = request.getParameter("openDate");
String director = request.getParameter("director");
String actor = request.getParameter("actor");
String national = request.getParameter("national");
String language = request.getParameter("language");
String strAge = request.getParameter("age");

int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	e.printStackTrace();
}
Movie movie = new Movie(id);
movie.setTitle(title);
movie.setPhotoUrl(photoUrl);
movie.setOpenDate(openDate);
movie.setDirector(director);
movie.setActor(actor);
movie.setNational(national);
movie.setLanguage(language);
try{
	movie.setRunningTime(Integer.parseInt(runningTime));
}catch(NumberFormatException e){
	
}
try{
	movie.setAge(Integer.parseInt(strAge));
}catch(NumberFormatException e){
	
}
MovieController control = new MovieController();
int result = control.update(movie);

JSONObject json = new JSONObject();
json.put("result", result);
json.put("message", control.getErrorMsg());

out.print(json.toString());
%>
<a href="./list.jsp">리스트보기</a>