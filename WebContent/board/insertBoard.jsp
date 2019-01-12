<%@page import="org.json.JSONObject"%>
<%@page import="www.bacoder.kr.control.BoardController"%>
<%@page import="www.bacoder.kr.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");

Board board = new Board();
board.setTitle(title);
board.setContent(content);
board.setWriter(writer);

BoardController control = new BoardController();
int result = control.insert(board);
JSONObject json = new JSONObject();
json.put("result", result);
if(result == 0){
	json.put("message", control.getErrorMsg());
}else if(result > 0){
	out.print("<a href='./list.jsp'>리스트보기</a><br/>");
}
out.print(json.toString());


%>