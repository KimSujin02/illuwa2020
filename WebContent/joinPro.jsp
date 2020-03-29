<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="illuwa.MemberDAO" %>
<%@ page import="illuwa.MemberDTO" %>

<%  request.setCharacterEncoding("utf-8"); 

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setTel(tel);
	dto.setBirth(birth);
	dto.setEmail(email);
	dto.setGender(gender);
	
	int result = dao.joinMember(dto);
	System.out.println(result);
	String msg = "";
	String url = "";
	if(result == 1){ 	
		Cookie cookie = new Cookie("id", id);
		cookie.setMaxAge(60*60*24); //하루유지
		response.addCookie(cookie);
		msg = id + "님 회원가입되었습니다!! 앞으로 자주뵈어요 :D";
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