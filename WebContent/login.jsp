<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>illuwa - login</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-5">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
							<div class="card-body">
								<form method="post" action="loginPro.jsp">
									<div class="form-group">
										<label class="small mb-1" for="inputId">ID</label>
										<input class="form-control py-4" name="id" id="inputId" type="text" placeholder="아이디를 입력해주세요." />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="inputPw">Password</label>
										<input class="form-control py-4" name="pw" id="inputPw" type="password" placeholder="비밀번호를 입력해주세요." />
									</div>
									<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
										<input type="submit" class="btn btn-primary" value="Login"></input>
									</div>
								</form>
							</div>
							<div class="card-footer text-center">
								<div class="small">
									<a href="join.jsp">아직 계정이 없습니까? 일루와에 join 하십시오. ( ͡° ͜ʖ ͡°) </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
