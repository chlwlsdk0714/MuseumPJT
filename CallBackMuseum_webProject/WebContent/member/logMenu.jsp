<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="css/logMenu.css">
<script>
	function login(frm) {
		frm.action = "join?type=login";
		frm.submit();
	}
	function join(frm) {
		frm.action = "join?type=join";
		frm.submit();
	}
</script>
</head>
<body>
	<div id="container">
		<div class="bodyform">
			<div id="hhh1">
				<div id="hh1">로그인</div>
			</div>
			<h5>
				CallBack미술관 홈페이지를 방문해주셔서 감사합니다.<br> 로그인하시면 홈페이지를 보다 편리하게 이용하실 수
				있습니다.
			</h5>
			<form method="post">
				<div class="inputform">
					<div class="input_wrap">
						<label for="memberID" class="blind"></label> <input type="text"
							name="memberID" id="memberID" placeholder="아이디를 입력해주세요.">
					</div>
					<div class="input_wrap">
						<label for="password" class="blind"></label> <input
							type="password" name="password" id="password"
							placeholder="비밀번호를 입력하세요."> <i class="fas fa-eye"
							id="showPwd"></i>
					</div>
					<button class="logbtn" name="logbtn" onclick="login(this.form)">로그인</button>
					<div>
						<input type="hidden" name="type" value="join">
						<button class="joinbtn" name="joinbtn" onclick="join(this.form)">회원가입</button>
					</div>
					<!-- 				<div>
				<label for="idSaveCheck">
					<input type="checkbox" name="idSaveCheck" id="idSaveCheck">
					<span>아이디 저장</span>
				</label>
				</div> -->

				</div>
			</form>
		</div>
	</div>

	<script>
		let showPwdIcon = document.querySelector("#showPwd");
		let passwordInputTag = document.querySelector("#password");
		let isVisiblePassword = false;

		showPwdIcon.addEventListener("click", function() {
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
		if (msg) {
			alert(msg);
		}
	</script>
</body>
</html>
