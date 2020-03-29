<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="illuwa.MemberDAO" %>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("inputId");
String msg = "";
MemberDAO dao = new MemberDAO();
int result = dao.confirmId(id);

if(result == 1) {
	msg = "해당 아이디를 사용할 수 있습니다.";
}
if(result == 0) {
	msg = "아이디가 중복됩니다.";
}
%>
<script>
alert("<%=msg %>");
location.href="idCheck.jsp";
</script>