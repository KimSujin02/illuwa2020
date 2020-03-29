<%@page import="illuwa.InfoDTO"%>
<%@page import="illuwa.InfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>illuwa</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<style>
table {
  border-spacing: 10px;
  border-collapse: separate;
}
table td {
  width: 300px;
}
</style>
<%
InfoDAO dao = new InfoDAO();
InfoDTO dto = new InfoDTO();
dto = dao.allCount();
int member = dto.getMembercount();
int board = dto.getBoardcount();

%>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="header.jsp"/>
	<jsp:include page="sidebar.jsp"/>
	<div id="layoutSidenav_content">
		<main> <!-- Page Content -->
		<div class="container">
			<!-- Jumbotron Header -->
			<header class="jumbotron my-4">
				<h1 class="display-3">Welcome to, 일루와!</h1>
				<p class="lead">일루와에 오신것을 환영합니다! 일루와는 10대 청소년들이 가지고 있는 여러가지 고민들을
					또래 회원들과 함께 공유하고 해결책을 찾을 수 있게 도와주는 웹사이트 입니다!</p>
				<a href="explain.jsp" class="btn btn-info btn-lg">일루와의 기능을
					살펴봅시다!</a>
			</header>
			<table align="center">
				<tr align="center">
					<td><image src="image/friendship.png" height="150" width="150"></image></td>
					<td><image src="image/blog.png" height="150" width="150"></image></td>
					<td><image src="image/confetti.png" height="150" width="150"></image></td>
				</tr>
				<tr align="center">
					<td><h5>누적 회원수</h5></td>
					<td><h5>누적 게시물수</h5></td>
					<td><h5>이벤트</h5></td>
				</tr>
				<tr align="center">
					<td>
						<div class="alert alert-info"><%=member %>명</div>
					</td>
					<td>
						<div class="alert alert-info"><%=board %>개</div>
					</td>
					<td>
						<div class="alert alert-info"><a href="event.jsp">이벤트 보러가기</a></div>
					</td>
				</tr>
			</table>
		</div>
		</main>
		<jsp:include page="footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
</body>
</html>