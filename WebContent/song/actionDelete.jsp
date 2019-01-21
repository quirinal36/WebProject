<%@page import="www.bacoder.kr.control.SongController"%>
<%@page import="www.bacoder.kr.model.Song"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	e.printStackTrace();
}
Song song = new Song(id);
SongController control = new SongController();
int result = control.delete(song);

JSONObject json = new JSONObject();
json.put("result", result);
json.put("message", control.getErrorMsg());

out.print(json.toString());
%>
<a href="./list.jsp">리스트보기</a>