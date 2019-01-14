<%@page import="www.bacoder.kr.model.Board"%>
<%@page import="www.bacoder.kr.control.BoardController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strId = request.getParameter("id");
int id = 0;
try{
	id = Integer.parseInt(strId);
}catch(NumberFormatException e){
	
}
Board board = new Board(id);
out.println(board.toString());
out.print("<br/>Please coding me~!");
%>