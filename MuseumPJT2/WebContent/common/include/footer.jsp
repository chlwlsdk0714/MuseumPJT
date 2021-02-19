<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<!-- normalize.css -->
<script src="https://kit.fontawesome.com/55068700bb.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<style>
footer {
	box-sizing: border-box;
	height: 250px;
    display: flex;
    justify-content: center;
	background-color: gray;
}
.leftBar {
	box-sizing: border-box;
	color: gray;
	width: 30%;
	background-color: #111;
	padding: 40px 0 30px 2.4rem;
	height: 300px;
}
.rightBar {
	box-sizing: border-box;
	color: gray;
	display: flex;
    flex-direction: column;
    align-items: center;
	width: 70%;
	background-color: #111;
	padding: 5px 30px 0 2.4rem;
	word-wrap: break-word;
	height: 300px;
	text-align: center;
}
li {
	float: left;
	list-style: none;
}
.rightBar h1 {
	padding: 5px;
	margin: 0px;
	/* right-margin: 15px; */
	word-break: normal;
	display: flex;
	justify-content: center;
}
.bottomlist a {
	color: gray;
	bottom-padding: 20px;
	text-decoration: none;
	display: flex;
	justify-content: center;
}
.bottomlist a:hover {
	color: white;
}
.bannerIcon i {
	font-size: 50px;
	color: gray;
}
.bannerIcon {
	display: flex;
	justify-content: center;
}
.leftBar i {
	font-size: 100px;
	color: gray;
}
.bannerIcon li {
	margin: 20px 20px 0 20px;
}
.bannerIcon i:hover {
	color: white;
}
@media screen and (max-width: 1000px) {
	.leftBar {
		display: none;
	}
	.rightBar {
		width: 100%;
	}
	.bannerIcon li {
	margin: 0 10px 0 10px;
	}
}
</style>
</head>
	<footer>
		<div class="leftBar">
			<h1><i class="fas fa-landmark">&nbsp;</i>CALLBACK MUSEUM</h1>
		</div>
		<div class="rightBar">
		<h3>[ CALLBACK MUSEUM ]</h3>
			<p>대표자 콜백팀 | 사업자등록번호 969-59-19000 Copyright (c)2021 National
				Museum of CallBack and Contemporary Art, Korea All rights reserved.<br>
				대표전화 02-0101-9900 전시관련 02-0202-9900 기타문의 02-0303-9900 메일문의 callback_museum@bit.com</p>
			<ul class="bannerIcon">
				<li><i class="fab fa-facebook-square"></i></li>
				<li><i class="fab fa-instagram-square"></i></li>
				<li><i class="fab fa-line"></i></li>
				<li><i class="fab fa-youtube-square"></i></li>
				<li><i class="fab fa-goodreads"></i></li>
			</ul>
			<ul class="bottomlist">
				<li><a href="#">이용약관&nbsp;&nbsp;</a></li>
				<li><a href="#">개인정보처리방침&nbsp;&nbsp;</a></li>
				<li><a href="#">저작권정책&nbsp;&nbsp;</a></li>
				<li><a href="#">국민신문고&nbsp;&nbsp;</a></li>
				<li><a href="#">정보공개&nbsp;&nbsp;</a></li>
			</ul>
		</div>
	</footer>
</body>
</html>