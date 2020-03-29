<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String msg = "";
	String url = "";
	if(cookies != null) {
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				msg = "로그아웃 되었습니다.";
				url = "home.jsp";
			}
		}
	}
%>

<script>
alert("<%=msg %>");
location.href="<%=url %>";
</script>