<%@page import="illuwa.BoardDTO"%>
<%@page import="illuwa.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8"); 
BoardDAO boardDAO = new BoardDAO();
BoardDTO boardDTO = new BoardDTO();
String title = request.getParameter("title");
String content = request.getParameter("content");
String image = request.getParameter("image");
int subject = Integer.parseInt(request.getParameter("subject"));
String id = request.getParameter("id");
String ip = request.getParameter("ip");
boardDTO.setTitle(title);
boardDTO.setContent(content);
boardDTO.setImage(image);
boardDTO.setSubject(subject);
boardDTO.setWriter(id);
boardDTO.setIp(ip);
if(boardDAO.insertBoard(boardDTO) == 1) {
}
%>