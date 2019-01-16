<%@page import="www.bacoder.kr.control.BoardController"%>
<%@page import="www.bacoder.kr.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String strId = request.getParameter("id");

int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	
}
Board board = new Board(id);
board.setTitle(title);
board.setContent(content);
board.setWriter(writer);

BoardController control = new BoardController();
int result = control.update(board);

%>