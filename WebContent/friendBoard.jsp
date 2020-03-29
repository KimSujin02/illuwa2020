<%@page import="java.util.Vector"%>
<%@page import="illuwa.BoardDTO"%>
<%@page import="illuwa.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>illuwa - friend</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<%
BoardDAO dao = new BoardDAO();
BoardDTO dto = new BoardDTO();
Vector<BoardDTO> vlist = dao.friendBoard();
int count = vlist.size();
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
<script type="text/javascript">
	function read(num) {
		if(readForm.id.value=="") {
			alert("로그인 해주세요");
		} else {
			document.readForm.num.value=num;
			document.readForm.id;
			document.readForm.action="readBoard.jsp";
			document.readForm.submit();
		}
	}
	function write(id) {
		if(writeForm.id.value=="") {
			alert("로그인 해주세요");
		} else {
			document.writeForm.id;
			document.writeForm.action="writeBoard.jsp";
			document.writeForm.submit();
		}
	}
</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="header.jsp"/>
	<jsp:include page="sidebar.jsp"/>
	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">친구고민 게시판</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">친구고민 게시판</li>
			</ol>
			<p class="text-right"><a class="btn btn-info" href=javascript:write()>글쓰기</a></p>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i>
					친구고민 글 목록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>조회수</th>
									<th>답글수</th>
								</tr>
							</thead>
							<tbody>
	<%
				int num= 0;
				int m = 1;
				String title = "";
				for(int i = 0; i < vlist.size(); i++) {
					dto = vlist.get(i);
					num = dto.getNum();
					title = dto.getTitle();
					
					out.println("<tr>");
					out.println("<td>" + m + "</td>");
					out.println("<td>");
					out.println("<a href=javascript:read('" + num + "')>" + dto.getTitle() + "</a></td>");
					out.println("<td>" + dto.getWriter() + "</td>");
					out.println("<td>" + dto.getDate() + "</td>");
					out.println("<td>" + dto.getReadcount() + "</td>");
					out.println("<td>" + dto.getReplycount() + "</td>");
					m++;
					}
					out.println("</tr>");
	%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
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
<form name="readForm" method="post">
	<input type="hidden" name="num">
	<input type="hidden" name="id" value="<%=id%>">
</form>
<form name="writeForm" method="post">
	<input type="hidden" name="id" value="<%=id%>">
</form>
</html>