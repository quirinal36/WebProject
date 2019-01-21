<%@page import="www.bacoder.kr.control.SongController"%>
<%@page import="www.bacoder.kr.model.Song"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Logger logger = Logger.getLogger("");

String title = request.getParameter("title");
String photoUrl = request.getParameter("photoUrl");
String singer = request.getParameter("singer");
String national = request.getParameter("national");
String language = request.getParameter("language");
String mvYoutubeUrl = request.getParameter("mvYoutubeUrl");

Song song = new Song();
song.setTitle(title);
song.setPhotoUrl(photoUrl);
song.setSinger(singer);
song.setNational(national);
song.setLanguage(language);
song.setMvYoutubeUrl(mvYoutubeUrl);

SongController control = new SongController();
int result = control.insert(song);

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