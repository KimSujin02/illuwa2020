<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>illuwa - writeBoard</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
function checkValue() { 
	var form = document.writeInfo;
	if(!form.inputTitle.value){
		alert("제목을 입력하세요.");
		return false;
	}
	if(form.inputContent.value.length < 6){
		alert("내용을 5자 이상으로 입력하세요.");
		return false;
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
	<div class="center-block">
			<h3 class="mt-4">게시물 작성</h3>
			<form method="post" action="writeBoardPro.jsp" name="writeInfo" onsubmit="return checkValue()">
			<div class="form-row">
				<div class="col-md-8">
					<div class="form-group">
						<label class="small mb-1" for="inputTitle">제목</label>
						<input class="form-control" name="title" id="inputTitle" type="text" placeholder="제목을 입력해주세요." />
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-8">
					<div class="form-group">
						<label class="small mb-1" for="inputContent">내용</label>
						<textarea class="form-control" name="content" rows="10" cols="50" id="inputContent" placeholder="내용을 입력해주세요."></textarea>
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-8">
					<div class="form-group">
						<label class="small mb-1" for="inputImage">이미지 삽입</label>
						<input class="form-control" name="image" id="inputImage" type="file" />
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-8">
					<div class="form-group">
							<label class="small mb-1">게시판</label><br>
							<div class="custom-control custom-radio">
								<input type="radio" name="subject" id="inputSubject1" class="custom-control-input" value="1" checked="checked">
								<label class="custom-control-label" for="inputSubject1">친구고민 게시판</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" name="subject" id="inputSubject2" class="custom-control-input" value="2">
								<label class="custom-control-label" for="inputSubject2">학업/진로고민 게시판</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" name="subject" id="inputSubject3" class="custom-control-input" value="3">
								<label class="custom-control-label" for="inputSubject3">성고민 게시판</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" name="subject" id="inputSubject4" class="custom-control-input" value="4">
								<label class="custom-control-label" for="inputSubject4">연애고민 게시판</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" name="subject" id="inputSubject5" class="custom-control-input" value="5">
								<label class="custom-control-label" for="inputSubject5">기타 게시판</label>
							</div>
							<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
						</div>
				</div>
			</div>
			<div class="form-group mt-4 mb-0">
				<input type="submit" class="btn btn-info" value="글 작성하기"></input>
				<a class="btn btn-info" href="home.jsp">취소</a>
			</div>
			</form>
			</div>
	</div>
	</main>
	<jsp:include page="footer.jsp"/>
	</div>
</body>
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
</html>