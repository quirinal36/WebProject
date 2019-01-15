<%@page import="java.util.List"%>
<%@page import="www.bacoder.kr.control.MovieController"%>
<%@page import="www.bacoder.kr.model.Movie"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("");

String title = request.getParameter("title");
String photoUrl = request.getParameter("photoUrl");
String runningTime = request.getParameter("runningTime");
String openDate = request.getParameter("openDate");
String director = request.getParameter("director");
String actor = request.getParameter("actor");
String national = request.getParameter("national");
String language = request.getParameter("language");

Movie movie = new Movie();
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
MovieController control = new MovieController();
int result = control.insert(movie);

JSONObject json = new JSONObject();
json.put("result", result);
if(result == 0){
	json.put("message", control.getErrorMsg());
}
out.print(json.toString());
%>
<%if(json.getInt("result") == 1) {%>
	<br/>
	글 등록에 성공했습니다.<br/>
	메인화면으로 이동합니다.<br/>
	<a href="../index.jsp">이동</a>
<%}else{ %>
	<br/>
	글등록에 실패했습니다.<br/>
	작성중인 화면으로 되돌아갑니다.<br/>
	<a href="javascript:history.go(-1)">뒤로가기</a>
<%}%>