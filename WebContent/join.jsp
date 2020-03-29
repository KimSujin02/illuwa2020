<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>illuwa - join</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
function checkValue() {
	var form = document.userInfo;
	if(!form.inputId.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	if(!form.inputPw.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(form.inputPw.value != form.inputPwconfirm.value ){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
	if(!form.inputName.value){
		alert("이름을 입력하세요.");
		return false;
	}
	if(!form.inputBirth.value){
		alert("생년웡일을 입력하세요.");
		return false;
	}
	if(isNaN(form.inputBirth.value)){
		alert("년도는 숫자만 입력가능합니다.");
		return false;
	}
	if(form.inputBirth.length > 6 || form.inputBirth.length < 6){
		alert("생년월일을 6자로 입력해주세요. (예시 : 2002년 01월  01일 -> 020101)");
		return false;
	}
	if(!form.inputEmailAddress.value){
		alert("메일 주소를 입력하세요.");
		return false;
	}
	if(!form.inputTel.value){
		alert("전화번호를 입력하세요.");
		return false;
	}
	if(isNaN(form.inputTel.value)){
		alert("전화번호는 - 제외한 숫자만 입력해주세요.");
		return false;
	}
}
// 아이디 중복체크 화면open
function openIdCheck(){
	var id = document.getElementById("inputId").value;
	if(id < "0" || id > "9" && id < "A" || id > "Z" && id < "a" || id > "z") { 
		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
		return false;
	}
	window.name = "parentForm";
	window.open("idCheck.jsp", "checkForm", "width=500, height=300, resizable = no, scrollbars = no");
}

// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
// 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 다시 중복체크를 하도록 한다.
function inputIdChk(){
	document.userInfo.idDuplication.value ="idUncheck";
}

	</script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header"><h3 class="text-center font-weight-light my-4">Join to illuwa</h3></div>
							<div class="card-body">
								<form method="post" action="joinPro.jsp" name="userInfo" onsubmit="return checkValue()">
									<div class="form-row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1" for="inputId">아이디</label>
												<input class="form-control py-4" name="id" maxlength="50" id="inputId" type="text" placeholder="아이디를 입력해주세요." onkeydown="inputIdchk()"/>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group"><br>
												<input type="button" onclick="openIdCheck()" value="중복확인">
												<input type="hidden" name="idDuplication" value="idUncheck"/>
											</div>
										</div>
									</div>
									<div class="form-row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1" for="inputPw">비밀번호</label>
												<input class="form-control py-4" name="pw" id="inputPw" type="password" placeholder="비밀번호를 입력해주세요." />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1" for="inputPwconfirm">비밀번호 확인</label>
												<input class="form-control py-4" name="pw" id="inputPwconfirm" type="password" placeholder="비밀번호를 입력해주세요." />
											</div>
										</div>
									</div>
									<div class="form-row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1" for="inputName">이름</label>
												<input class="form-control py-4" name="name" id="inputName" type="text" placeholder="이름(본명)을 입력해주세요." />
											</div>
										</div>
									</div>
									<div class="form-row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1" for="inputTel">전화번호</label>
												<input class="form-control py-4" name="tel" id="inputTel" type="text" placeholder="전화번호를 -없이 입력해주세요." />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1" for="inputBirth">생년월일</label>
												<input class="form-control py-4" name="birth" id="inputBirth" type="text" placeholder="생년월일 6자리를 입력해주세요." />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="small mb-1" for="inputEmailAddress">이메일</label>
										<input class="form-control py-4" name="email" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요." />
									</div>
									<div class="form-row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1">성별</label><br>
												<div class="custom-control custom-radio">
													<input type="radio" name="gender" id="inputGender1" class="custom-control-input" value="남자">
													<label class="custom-control-label" for="inputGender1">남자</label>
												</div>
												<div class="custom-control custom-radio">
													<input type="radio" name="gender" id="inputGender2" class="custom-control-input" value="여자" checked="checked">
													<label class="custom-control-label" for="inputGender2">여자</label>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group mt-4 mb-0">
										<input type="submit" class="btn btn-primary" value="회원가입"></input>
										<a class="btn btn-primary" href="home.jsp">취소</a>
									</div>
								</form>
							</div>
							<div class="card-footer text-center">
								<div class="small">
									<a href="login.jsp">이미 계정이 있나요? 그럼 로그인하러 가요!</a>
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
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
