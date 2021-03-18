<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mylist.css" type="text/css">
<script>
function inquiry() {
	let li1 = document.querySelector("#li1");
	let li2 = document.querySelector("#li2");
	li2.classList.remove("now");
	li1.classList.add("now");
	location.href="join?type=mylist";
}

</script>

</head>
<body>
<div class="menubar-wrap">
	<ul class="menubar">
		<li id="first_li">개인정보수정</li>
		<li id="second_li" onclick="location.href='join?type=mylist'">예매/문의내역</li>
	</ul>
</div>
<div>
	<div id="hhh1">
		<div id="hh1">예매내역</div>
	</div>
</div>
<div class="line-nav-wrap">
	<div class="line-nav">
		<ul>
			<li id="li1" onclick="inquiry()">나의 문의내역</li>
			<li id="li2" class="now">나의 예매내역</li>
		</ul>
	</div>
</div>
<form method="post">
	<div class="userAsk-wrap">
		<div class="userAsk">
		<c:if test="${sessionScope.login.mem_id ne 'admin'}">
			<p>${sessionScope.login.mem_name}님이 예매하신 내역입니다.</p>
		</c:if>
		</div>
	</div>
</form>
<div class="space-div"></div>
</body>
</html>