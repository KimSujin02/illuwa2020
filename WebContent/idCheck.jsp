<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인 페이지</title>
<script type="text/javascript">
function pValue(){
	document.getElementById("inputId").value = opener.document.userInfo.inputId.value;
}
function idCheck(){
	var id = document.getElementById("inputId").value;
	if (!id) {
		alert("아이디를 입력하지 않았습니다.");
		return false;
	} 
	else if(id < "0" || id > "9" && id < "A" || id > "Z" && id < "a" || id > "z") { 
		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
		return false;
	}
	else {
		document.checkForm.inputId.value=id;
		document.checkForm.action="idCheckPro.jsp";
		document.checkForm.submit();
		return true;
	}
}

// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue(){
	// 중복체크 결과인 idCheck 값을 전달한다.
	opener.document.userInfo.idDuplication.value ="idCheck";
	// 회원가입 화면의 ID입력란에 값을 전달
	opener.document.userInfo.inputId.value = document.getElementById("inputId").value;
	if (opener != null) {
       	opener.checkForm = null;
       	self.close();
	}	
}	
</script>
	
</head>
<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form id="checkForm" action="idCheckPro.jsp">
			<input type="text" name="inputId" id="inputId">
			<input type="button" value="중복확인" onclick="idCheck()">
		</form>
		<div id="msg" style="color:red;"></div>
		<br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
	</div>
</div>
<form name="checkForm" method="get">
	<input type="hidden" name="inputId">
</form>
</body>
</html>