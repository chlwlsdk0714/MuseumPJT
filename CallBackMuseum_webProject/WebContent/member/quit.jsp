<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	<link rel="stylesheet" href="css/quit.css">
<script>
	function finalquit(frm) {
		frm.action = "join?type=finalQuit";
		frm.submit();
	}
	function back() {
		alert("탈퇴가 취소되었습니다.")
		location.href="/main/index";
	}
	function clearText(field) {
		if (filed.defaultValue == field.value) {
			field.value = "";
		}
	}
</script>
</head>
<body>
   <form class="quit-form" method="post">
      <div id="hhh1">
         <div id="hh1">회원 탈퇴</div>
      </div>
      <section class="info">
         <p><strong id="underline">
            	콜백 미술관 회원 탈퇴 시 아래 내용을 먼저 확인해 주세요.<br>
         </strong></p>
         <ul>
            <li><i class="fas fa-check"></i>&nbsp;&nbsp;회원 탈퇴는 신청하시는 즉시 처리됩니다.</li>
            <br><li><i class="fas fa-check"></i>&nbsp;&nbsp;로그인이 필요한 서비스 이용은 더 이상 이용하실 수 없게 됩니다. (예 : 마이페이지, 이벤트 참여, 게시판 글쓰기 등)</li>
            <br><li><i class="fas fa-check"></i>&nbsp;&nbsp;단, 민원신청, 묻고답하기 게시판에 작성하신 글은 삭제되지 않습니다.</li>
         </ul>
      </section>
      <div class="space"><p><strong>본인 확인을 위하여 아래 정보를 입력해 주세요.</strong></p></div>
      <div>
      <label for="email" class="blind"></label>
      <input type="text" name="email" id="email"
      value="&nbsp;&nbsp;${sessionScope.login.mem_email}" readonly>
      </div>
      <div>
      <label for="name" class="blind"></label>
      <input type="text" name="name" id="name"
      value="&nbsp;&nbsp;${sessionScope.login.mem_name}" readonly>
      </div>
      <div>
      <label for="password" class="blind"></label>
      <input type="password" name="password" id="password"
      onFocus="clearText(this)"
      placeholder="&nbsp;&nbsp;비밀번호를 입력하세요.">
      </div>
      <div class="btn1space">
         <button class="Btn" id="quitBtn" type="button"
               onclick="finalquit(this.form)">탈퇴 신청</button>
         <button class="Btn" id="backBtn" type="button"
               onclick="back(this.form)">취소</button>
      </div>
   </form>
</body>
</html>