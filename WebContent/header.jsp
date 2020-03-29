<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>illuwa</title>
<%
String id = "";
Cookie[] cookies = request.getCookies();
if(cookies != null) {
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("id")) {
			id = cookies[i].getValue();
		}
	}
} else { id=""; }
%>
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="home.jsp">illuwa</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
		<!-- 간격두기용으로 냅둠 -->
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0"></form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-user fa-fw"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<% 
					if(id.equals("")) {%>
					<a class="dropdown-item" href="login.jsp">Login</a>
					<a class="dropdown-item" href="join.jsp">Join</a>
					<%  } else { %>
					<a class="dropdown-item" href="mypage.jsp"><%=id %>님 안녕하세요!</a>
					<a class="dropdown-item" href="mypage.jsp">MyPage</a>
					<a class="dropdown-item" href="message.jsp">Message</a>
					<div class="dropdown-divider"> </div>
					<a class="dropdown-item" href="logout.jsp">Logout</a>
					<% } %>
				</div>
			</li>
		</ul>
	</nav>
</body>
</html>