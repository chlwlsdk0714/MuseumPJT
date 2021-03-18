<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="css/mylistDetail.css" type="text/css">
<script>
	function sendModify(frm) {
		frm.action = "../../inquiryController?type=inquiryModify&cPage=" + ${paging.nowPage};
		frm.submit();
	}
	
	function sendDeleteComment(frm) {
		if (confirm("정말 삭제하시겠습니까??") == true){
			frm.action = "inquiryController?type=commentDelete";
			frm.submit();
		}else{
			frm.preventDefault();
		    return;
		}
	}
</script>
<style>
#table-wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 80%;
	margin: 0 auto;
}

#comment-wrap {
	display: flex;
	width: 100%;
}

.table2 {
	display: flex;
	width: 50%;
}

.table3 {
	display: flex;
	width: 50%;
}

.to-inqlist a {
	color: #333;
	font-size: 1em;
	transition-duration: 0.2s;
}
.to-inqlist a:hover {
	color: #db0b2e;
	font-size: 1.02em;
	transition-duration: 0.2s;
}
</style>
</head>
<body>
	<div class="title-wrap">
		<div class="title">1:1 문의내역</div>
	</div>
	<div id="table-wrap">
		<form name="inq-form" action="inquiry" method="post">
			<table class="insert-table">
				<thead>
					<tr class="to-list">
						<td colspan="4">
							<a href="join?type=mylist&cPage=${paging.nowPage}"><i class="fas fa-align-justify"></i>
								&nbsp;목록</a>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="underline"><i class="fas fa-user-edit"></i>
							&nbsp;${sessionScope.listvo.inq_writer}님께서 문의하신 내용입니다.</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>문의 분류</th>
							<td>${listvo.inq_category}</td>
					</tr>
					<tr>
						<th>제목</th>
							<td>${listvo.inq_subject}</td>
					</tr>
					<tr>
						<th>내용</th>
							<td class="space">${listvo.inq_content}</td>
					</tr>
				</tbody>
				<tfoot>
					<c:if test="${not empty listvo.inq_answer}">
						<tr id="inqComment">
							<td colspan="4"><i class="fas fa-chevron-down"></i>
								&nbsp;문의에 대한 댓글입니다.</td>
						</tr>
						<tr>
							<th>작성자</th>
								<td>${listvo.inq_admin_writer}
									<input id="writer" type="hidden" value="${listvo.inq_admin_writer}" name="writer">
								</td>
						</tr>
						<tr>
							<th>작성일</th>
								<td>${listvo.inq_ans_date}
									<input id="date" type="hidden" value="${listvo.inq_ans_date}" name="date">
								</td>
						</tr>
						<tr>
							<th>내용</th>
								<td class="space">${listvo.inq_answer}</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="2" class="to-inqlist">
							<a href="join?type=go_inquiryList"><i class="fas fa-check"></i>
								&nbsp;&nbsp;마이페이지에서는 문의글 수정 및 삭제가 불가합니다. 1:1문의 페이지로 이동하시겠습니까?</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>

			<!-- 관리자일때 댓글쓰기 -->
		<c:if test="${sessionScope.login.mem_id eq 'admin'}">
			<form method="post" action="../news/inquiryController" class="table3">
				<table>
					<tr>
						<td colspan="2"><i class="fas fa-user-edit"></i>
							&nbsp;댓글 입력 및 수정란입니다.</td>
					</tr>
					<tr>
						<th>관리자</th>
							<td>
								<input class="input-admin" name="admin" type="text"
									   placeholder="관리자를 입력하세요."></td>
					</tr>
					<tr>
						<th>내용</th>
							<td><textarea name="content" id="content" cols="30"
									      rows="10"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input id="adminbtn" type="submit" value="댓글입력"> 
							<input type="hidden" name="type" value="comment"> 
							<input type="hidden" name="inq_num"value="${listvo.inq_num}"> 
							<input id="deletebtn" type="button" value="삭제" onclick="sendDeleteComment(form)">
							<input type="hidden" name="inq_num" value="${listvo.inq_num}">
						</td>
					</tr>
				</table>
			</form>
		</c:if>
	</div>
</body>
</html>