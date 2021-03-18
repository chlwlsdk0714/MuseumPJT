<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1 문의</title>
	<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
	<link rel="stylesheet" href="css/inquiry.css" type="text/css">
<script>
	function inquiryList() {
		let li1 = document.querySelector("#li1");
		let li2 = document.querySelector("#li2");
		li1.classList.remove("now");
		li2.classList.add("now");
		location.href = "inquiryController?type=inquiryList";
	}
	
 	function sendInquiry(frm) {
 		if (!frm.reportValidity()) {
 			return;
 		}
		frm.action = "inquiryController?type=insert";
		frm.submit();
	} 
</script>
</head>
<body>
    <div class="title-wrap">
        <div class="title">1:1 문의</div>
    </div>
    <div class="line-nav-wrap">
        <div class="line-nav">
            <ul>
                <li id="li1" class="now">1:1 문의하기</li>
                <li id="li2" onclick="inquiryList()">나의 문의내역</li>
            </ul>
        </div>
    </div>
	<form name="inq-form" action="inquiryController" method="post">
		<div class="table-wrap">
			<table class="insert-table">
				<thead>
					<tr>
						<td colspan="2">궁금하신 내용을 문의하시면 댓글로 답변드립니다.</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>분류</th>
						<td><select name="inqCode">
								<option value="01">일반</option>
								<option value="02">전시</option>
								<option value="03">교육</option>
								<option value="04">홈페이지</option>
								<option value="05">예약</option>
								<option value="06">홍보</option>
								<option value="07">대관</option>
								<option value="08">기타</option>
						</select></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input class="input-subject" name="subject" type="text"
							placeholder="제목을 입력하세요." required></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="contentArea" cols="30"
								rows="10" required></textarea></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input id="btn" type="button" value="문의하기" onclick="sendInquiry(this.form)">
							<input type="hidden" name="type" value="insert">
						</td>
					</tr>
				</tfoot>
			</table>
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