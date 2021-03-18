<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="css/inquiryDetail.css" type="text/css">
<script>
	function sendModify(frm) {
		frm.action = "inquiryController?type=inquiryModify&cPage=" + ${paging.nowPage};
		frm.submit();
	}
	function sendDelete(frm) {
		if ("${not empty ivo.inq_answer}") {
			alert("답변이 있는 문의글은 삭제가 불가능합니다.");
			frm.preventDefault();
			return;	
		}
		if (confirm("정말 삭제하시겠습니까??") == true){
			//frm.action = "inquiryController?type=inquiryDelete&cPage="+ ${paging.nowPage};
			frm.action = "inquiryController?type=inquiryDelete";
			frm.submit();
		}else{
			frm.preventDefault();
		    return;
		}
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
						<td colspan="4"><a
							href="inquiryController?type=inquiryList&cPage=${paging.nowPage}"><i class="fas fa-align-justify"></i>&nbsp;목록</a>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="underline"><i class="fas fa-user-edit"></i>&nbsp;${sessionScope.ivo.inq_writer}님께서문의하신 내용입니다.</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>분류</th>
						<td>${ivo.inq_category}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${ivo.inq_subject}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="space">${ivo.inq_content}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr class="for-center">
						<td colspan="2" id="btn-td">
							<input id="btn" type="button" value="수정"
								onclick="sendModify(this.form)"> <input type="hidden"
								name="type" value="modify"> <input id="btn" type="button"
								value="삭제" onclick="sendDelete(this.form)"> <input
								type="hidden" name="type" value="delete">
						</td>
					</tr>
					<!-- 댓글 있으면 보여주기 -->
					<c:if test="${not empty ivo.inq_answer}">
						<c:if test="${sessionScope.login.mem_id ne 'admin' }">
							<tr id="inqComment">
								<td colspan="4"><i class="fas fa-chevron-down"></i>&nbsp;문의에 대한 댓글입니다.</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${ivo.inq_admin_writer}<input id="writer" type="hidden"
									value="${ivo.inq_admin_writer}" name="writer"></td>

							</tr>
							<tr>
								<th>작성일</th>
								<td>${ivo.inq_ans_date}<input id="date" type="hidden"
									value="${ivo.inq_ans_date}" name="date">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<%-- <td>${ivo.inq_answer}<input id="content" type="hidden"
									value="${ivo.inq_answer}" name="content">
								</td> --%>
								<td class="space">${ivo.inq_answer}</td>
							</tr>
							<c:if test="${login.mem_id eq 'admin'}">
								<tr>
									<td colspan="2"><input id="modifybtn" type="button"
										value="수정" onclick="sendModifyComment(this.form)"> <input
										type="hidden" name="type" value="modify"> <input
										id="deletebtn" type="submit" value="삭제"
										onclick="sendDeleteComment(this.form)"> <input
										type="hidden" name="inq_num" value="${ivo.inq_num}"></td>
								</tr>
							</c:if>
						</c:if>
					</c:if>
				</tfoot>
			</table>
		</form>

		<div id="comment-wrap">
			<form class="table2">
				<table>
					<c:if test="${not empty ivo.inq_answer}">
						<c:if test="${login.mem_id eq 'admin'}">

							<td colspan="2" id="inq-comment"><i class="fas fa-user-edit"></i>&nbsp;문의에 대한 댓글입니다.</td>
							<tr>
								<th>작성자</th>
								<td>${ivo.inq_admin_writer}<input id="writer" type="hidden"
									value="${ivo.inq_admin_writer}" name="writer"></td>

							</tr>
							<tr>
								<th>작성일</th>
								<td>${ivo.inq_ans_date}<input id="date" type="hidden"
									value="${ivo.inq_ans_date}" name="date">
								</td>
							</tr>
							<tr>
								<th class="admin-textarea">내용</th>
								<td class="admin-textarea">${ivo.inq_answer}
									<input id="content" type="hidden" value="${ivo.inq_answer}"
										   name="content" class="space">
								</td>
							</tr>

						</c:if>
					</c:if>
				</table>
			</form>
			<!-- 관리자일때 댓글쓰기 -->
			<c:if test="${sessionScope.login.mem_id eq 'admin'}">
				<form method="post" action="inquiryController" class="table3">
					<table>
						<tr>
							<td colspan="2"><i class="fas fa-user-edit"></i>&nbsp;댓글 입력 및 수정란입니다.</td>
						</tr>
						<tr>
							<th>관리자</th>
							<td><input class="input-admin" name="admin" type="text"
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
								<input type="hidden" name="inq_num"value="${ivo.inq_num}"> 
								<input id="deletebtn" type="button" value="삭제" onclick="sendDeleteComment(form)">
								<input type="hidden" name="inq_num" value="${ivo.inq_num}">
							</td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</div>



</body>
</html>