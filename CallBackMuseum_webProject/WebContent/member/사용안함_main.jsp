<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하나 임시 메인 </title>
<script>

	function update(frm) {
		let login = "${login}";
		console.log(login);
		if (login) {
			frm.action = "join?type=update";
			frm.submit();
		} else {
			alert("로그인 후 이용해주세요.");
			history.back();
		}
	}

	function logout(frm) {
		let login = "${login}";
		console.log(login);
		if (login) {
			frm.action = "join?type=logout";
			frm.submit();
		} else {
			alert("로그인 후 이용해주세요.");
			history.back();
		}
	}


	function quit(frm) {
		let login = "${login}";
		console.log(login);
		if (login) {
			let result = confirm("정말 탈퇴하시겠습니까?");
			if (result) {
				frm.action = "join?type=quit";
				frm.submit();
			} else {
				alert("탈퇴가 취소되었습니다.");
			}
		} else {
			alert("로그인 후 이용해주세요.");
			history.back();
		}
	}
</script>
</head>
<body>
	<h2>main페이지입니다</h2>
	<form method="post">
	<div class="btn">
		<input type="hidden" name="type" value="update">
		<button class="updatebtn" name="updatebtn" onclick="update(this.form)">회원정보수정</button>
	</div>
	<div>
		<input type="hidden" name="type" value="logout">
		<button class="logoutbtn" name="logoutbtn" onclick="logout(this.form)">로그아웃</button>
	</div>
	<div>
		<input type="hidden" name="type" value="quit">
		<button class="quit" type="button" name="signoutbtn" onclick="quit(this.form)">회원탈퇴</button>
	</div>
	</form>
	
	<script>
	let msg = "${param.msg}";
	if (msg) {
		alert(msg);
	}
	</script>
	
</body>
</html>