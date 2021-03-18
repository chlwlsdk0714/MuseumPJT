<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지 비밀번호 확인</title>
	<link rel="stylesheet" href="css/myPage.css">
</head>

<body>
	<form class="pwdChk-form" method="post">
		<div id="hhh1">
			<div id="hh1">비밀번호 확인</div>
		</div>
		<div id="put">
			<h5>
				개인정보 보호를 위해 비밀번호 확인을 부탁드립니다.<br>
			</h5>
		</div>
		<div id="put2">
			<input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요.">
			<i class="fas fa-eye" id="showPwd"></i>
		</div>
		<div class="btn">
			<input type="hidden" name="type" value="mypage">
			<input type="button" class="mypagebtn" id="mypagebtn" value="마이페이지 이동"
				onclick="mypage(this.form)">
		</div>

	</form>
<script>
	let showPwdIcon = document.querySelector("#showPwd");
	let passwordInputTag = document.querySelector("#password");
	let isVisiblePassword = false;
	
	showPwdIcon.addEventListener("click", function () {	
		isVisiblePassword = !isVisiblePassword; 
		
		showPwdIcon.classList.toggle("fa-eye");	
		showPwdIcon.classList.toggle("fa-eye-slash");
		if (isVisiblePassword) {
			passwordInputTag.setAttribute("type", "text");
		} else {
			passwordInputTag.setAttribute("type", "password");
		}			
	});
	
	let msg = "${param.msg}";
	if(msg) {
		alert(msg);
	}
	
	function mypage(frm) {
		frm.action="join";
		frm.submit();
	}
</script>
</body>
</html>