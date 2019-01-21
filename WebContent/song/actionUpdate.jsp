<%@page import="www.bacoder.kr.control.SongController"%>
<%@page import="www.bacoder.kr.model.Song"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
String title = request.getParameter("title");
String photoUrl = request.getParameter("photoUrl");
String singer = request.getParameter("singer");
String national = request.getParameter("national");
String language = request.getParameter("language");
String mvYoutubeUrl = request.getParameter("mvYoutubeUrl");

int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	e.printStackTrace();
}
Song song = new Song(id);
song.setTitle(title);
song.setSinger(singer);
song.setPhotoUrl(photoUrl);
song.setNational(national);
song.setLanguage(language);
song.setMvYoutubeUrl(mvYoutubeUrl);

SongController control = new SongController();
int result = control.update(song);

JSONObject json = new JSONObject();
json.put("result", result);
json.put("message", control.getErrorMsg());

out.print(json.toString());
%>
<a href="./list.jsp">리스트보기</a>