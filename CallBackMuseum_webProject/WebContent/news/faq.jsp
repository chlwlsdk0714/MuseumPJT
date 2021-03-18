<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FAQ</title>
	<link rel="stylesheet" href="css/faq.css" type="text/css">
	<script src="../common/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$(".faq-question").click(function(){
			$(this).next().slideToggle(200);
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="title-wrap">
			<div class="title">
				FAQ
			</div>
		</div>
		
		<div class="table-wrap">
			<table class="faq-table">
				<tbody>
			<c:if test="${not empty list}">
				<c:forEach var="fvo" items="${list}">                    	
					<tr class="faq-question">
						<td>
							<span class="red">Q</span>
							<a>${fvo.faq_question}</a>
						</td>
					</tr>
					<tr class="faq-answer">
						<td><span class="black">A</span>${fvo.faq_answer}</td>
					</tr>
				</c:forEach>
			</c:if>
				</tbody>
			</table>
		</div>
		<div class="last-text">
			원하시는 답변을 얻지 못하셨나요? <a onclick="goInquiry()">1:1 문의 게시판(바로가기)</a>를 이용해 보세요.
		</div>
	</div>
</body>
<script>
	function goInquiry() {
		if (${empty login}) {
			let loginChk = confirm("일대일 문의는 로그인 후 사용 가능한 기능입니다. 로그인하시겠습니까?");
			if (loginChk) {
				location.href="../member/join?type=login";
			} else {
				return;
			}
		} else {
			location.href="../news/newsController?type=inquiry";
		}
	}
</script>
</html>