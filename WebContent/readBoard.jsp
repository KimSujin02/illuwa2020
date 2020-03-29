<%@page import="illuwa.BoardDTO"%>
<%@page import="illuwa.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>illuwa</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	function up(writer) {
		if(upFrm.id.value != writer) {
			alert("수정은 작성자만 가능합니다.");
		} else {
			document.upFrm.num;
			document.upFrm.id;
			document.upFrm.action="updateBoard.jsp";
			document.upFrm.submit();
		}
	}
	function del(writer) {
		if(delFrm.id.value != writer) {
			alert("삭제는 작성자만 가능합니다.");
		} else {
			document.delFrm.num;
			document.delFrm.id;
			document.delFrm.action="deleteBoard.jsp";
			document.delFrm.submit();
		}
	}
</script>
<%
String id = request.getParameter("id");
String num1 = request.getParameter("num");
int num = Integer.parseInt(num1);

BoardDAO boardDAO = new BoardDAO();
BoardDTO boardDTO = null;
if(boardDAO.readcountUpdate(num) == 1 ){
	boardDTO = boardDAO.readBoard(num);
	session.setAttribute("board", boardDTO);
}
%>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="header.jsp"/>
	<jsp:include page="sidebar.jsp"/>
	<div id="layoutSidenav_content">
	<main>
	  <!-- Page Content -->
	  <div class="container">
	    <div class="row">
	      <!-- Post Content Column -->
	      <div class="col-lg-12">
	      <br>
	      	<p>
	      	<% switch(boardDTO.getSubject()) {
	      	case 1 : out.println("<a href=friendBoard.jsp>친구고민 게시판</a>"); break;
	      	case 2 : out.println("<a href=studyBoard.jsp>진로/학업 게시판</a>"); break;
	      	case 3 : out.println("<a href=privateBoard.jsp>성고민 게시판</a>"); break;
	      	case 4 : out.println("<a href=loveBoard.jsp>연애고민 게시판</a>"); break;
	      	case 5 : out.println("<a href=otherBoard.jsp>기타 게시판</a>"); break;
	      	}
	      	%>
	      	</p>
	        <!-- Title -->
	        <h1 class="mt-4"><%=boardDTO.getTitle() %></h1>
	        <!-- Author -->
	        <p class="lead">
	          	writer <a href="#"><%=boardDTO.getWriter() %></a>&nbsp;<%=boardDTO.getDate() %>
	        </p>
	        <hr>
	        <!-- Preview Image -->
	        <%if(boardDTO.getImage().equals("")) { %>
	        <%} else {%>
	        <img class="img-fluid rounded" src="<%=boardDTO.getImage() %>" alt="">
	        <hr>
	        <%} %>
	        <!-- Post Content -->
	        <p class="lead"><%=boardDTO.getContent() %></p>
	        <hr>
	        <table>
		        <tr>
					<td colspan=2>
						<input type="button" class="btn btn-info" value="수정" onClick="javascript:up('<%=boardDTO.getWriter() %>')">
						<input type="button" class="btn btn-danger" value="삭제" onClick="javascript:del('<%=boardDTO.getWriter() %>')">
					</td>
				</tr>
			</table>
	        <!-- Comments Form -->
	        <div class="card my-4">
	          <h5 class="card-header">댓글 달기</h5>
	          <div class="card-body">
	            <form>
	              <div class="form-group">
	                <textarea class="form-control" rows="3"></textarea>
	              </div>
	              <button type="submit" class="btn btn-primary">Submit</button>
	            </form>
	          </div>
	        </div>
	
	        <!-- Single Comment -->
	        <div class="media mb-4">
	          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	          <div class="media-body">
	            <h5 class="mt-0">Commenter Name</h5>
	            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	          </div>
	        </div>
	
	        <!-- Comment with nested comments -->
	        <div class="media mb-4">
	          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	          <div class="media-body">
	            <h5 class="mt-0">Commenter Name</h5>
	            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	
	            <div class="media mt-4">
	              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	              <div class="media-body">
	                <h5 class="mt-0">Commenter Name</h5>
	                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	              </div>
	            </div>
	
	            <div class="media mt-4">
	              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
	              <div class="media-body">
	                <h5 class="mt-0">Commenter Name</h5>
	                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	              </div>
	            </div>
	
	          </div>
	        </div>
	
	      </div>
	
	    </div>
	  </div>
	<jsp:include page="footer.jsp"/>
	</main>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
<form name = "upFrm" method="post">
	<input type = "hidden" name="num" value="<%=num%>">
	<input type = "hidden" name="id" value="<%=id%>">
</form>
<form name = "delFrm" method="post">
	<input type = "hidden" name="num" value="<%=num%>">
	<input type = "hidden" name="id" value="<%=id%>">
</form>

</html>