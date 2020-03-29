<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="illuwa.MemberDAO" %>

<%  request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id");	
	String pw = request.getParameter("pw");
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.loginMember(id, pw);
	System.out.println(result);
	String msg = "";
	String url = "";
	if(result == 1){ 	
		Cookie cookie = new Cookie("id", id);
		cookie.setMaxAge(60*60*24); //하루유지
		response.addCookie(cookie);
		msg = id + "님 환영합니다!!";
		url = "home.jsp";
	}
	if (result == 0){
		msg = "비밀번호가 일치하지 않습니다.";
		url = "login.jsp";
	}
	if (result == 2){	
		msg = "해당 아이디가 없습니다.";
		url = "login.jsp";
	}
%>
<script>
alert("<%=msg %>");
location.href="<%=url %>";
</script>