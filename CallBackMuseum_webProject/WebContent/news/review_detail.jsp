<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관람 후기 상세페이지</title>
	<link rel="stylesheet" href="css/review_detail.css" type="text/css">
</head>
<body>
	<div class="title-wrap">
		<div class="title">관람 후기</div>
	</div>

	<div class="rev-table-wrap">
		<table class="rev-detail-table">
		<c:if test="${not empty rvo}">
			<thead>
				<tr>
					<td class="date">
						${rvo.rev_write_date.substring(0, 10)}
					</td>
				</tr>
				<tr>
					<td class="detail-title">
						<span class="cate">${rvo.rev_category}</span>
						<c:out value="${rvo.rev_subject}"/>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="writer">${rvo.mem_name}</td>
				</tr>
			<c:if test="${not empty rvo.rev_file_name}">
				<tr>
					<td class="img">
						<img src="../news/image/${rvo.rev_file_name}" alt="사진">
					</td>
				</tr>
			</c:if>	
				<tr>
					<td class="content"><c:out value="${rvo.rev_content}"/></td>
				</tr>
			</tbody>
		</c:if>
		<c:if test="${empty rvo}">
			<tbody>
				<tr><td>표시할 내용 없음</td></tr>
			</tbody>
		</c:if>
			<tfoot>
				<tr class="btn">
					<td>
						<!-- 본인의 계정으로 로그인 시 보이는 수정/삭제 버튼 -->
						<c:if test="${login.mem_id eq rvo.rev_writer}">
						<button type="button" onclick="goUpdate('${rvo.rev_idx}', '${cPage}')">수정</button>
						<button type="button" onclick="goDelete('${rvo.rev_idx}', '${cPage}')">삭제</button>
						</c:if>
						<button type="button" onclick="goList('${cPage}', ${searchResult})">목록</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
	<form name="comment-form" method="post">
		<div class="comment-container">
			<table class="comment-table">
				<thead>
					<tr class="comment-label">
						<td>댓글 <i class="far fa-comment-dots"></i></td>
					</tr>
				</thead>
			<c:if test="${not empty list}">
			<c:forEach var="rcvo" items="${list}">
				<tbody>
					<tr class="comment-name">
						<td>
							<i class="fas fa-user-circle"></i>&nbsp;&nbsp;${rcvo.mem_name}
						</td>
					</tr>
					<tr class="comment-content">
						<td>${rcvo.rcom_content}</td>
					</tr>
					<tr class="comment-date">
						<td>
							${rcvo.rcom_write_date}&nbsp;&nbsp;|
							
						<c:if test="${login.mem_id ne rcvo.rcom_writer}">
							<a onclick="goReportComment()">신고</a>
						</c:if>
						<c:if test="${login.mem_id eq rcvo.rcom_writer}">
							<a onclick="goUpdateComment('${rcvo.rcom_write_date}', '${rcvo.rcom_idx}')">수정</a> |
							<a onclick="goDeleteComment('${rcvo.rcom_idx}')">삭제</a>
						</c:if>
						
						</td>
					</tr>
				</tbody>
			</c:forEach>
			</c:if>
				<tfoot>
					<tr>
						<td>
							<div id="writing-label">댓글 쓰기 <i class="fas fa-chevron-down"></i></div>
							<textarea name="rcom_content" id="comm-input" cols="100" rows="10"></textarea>
							<div id="writing-btn">
								<input type="hidden" name="cPage" value="${cPage}">
								<input type="hidden" name="rev_idx" value="${rvo.rev_idx}">
								<input type="button" onclick="insertComment(this.form)" value="등록">
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form>
</body>
<script>
	/* 댓글 입력 창을 클릭했을 때 로그인하지 않은 상태이면 로그인창으로 이동시키기 */
	if (${empty login}) {
		document.querySelector("#comm-input").addEventListener("click", function(){
			let loginChk = confirm("댓글 등록은 로그인이 필요한 기능입니다. 로그인하시겠습니까?");
			if (loginChk) {
				location.href="../member/join?type=login";
			} else {
				return;
			}
		});	
	}
	
	/* 댓글 정상등록되지 않았을 때 뜨는 메시지 창 */
	let msg = "${param.msg}";
	if (msg) {
		alert(msg);
	}
	
	/* 댓글 입력 */
	function insertComment(frm) {
		frm.action="reviewController?type=insertComment";
		frm.submit();
	}
	
	/* 목록버튼 누르면 목록 돌아가기 */
	function goList(pageNum, searchResult) {
		if (searchResult) {
			history.back();
		} else {
			location.href="newsController?type=review&cPage=" + pageNum;
		}
	}
	
	/* 수정버튼 누르면 수정폼으로 이동 */
	function goUpdate(rev_idx, cPage) {
		location.href="reviewController?type=updateReview&cPage=" + cPage 
					+ "&rev_idx=" + rev_idx;
	}
	
	/* 삭제버튼 누르면 정말 삭제할지 물어본 뒤 삭제 */
	function goDelete(rev_idx, cPage) {
		if (${not empty list}) {
			alert("댓글이 등록된 글은 삭제할 수 없습니다.");
			return;
		} else {
			let deleteChk = confirm("정말로 삭제하시겠습니까?");
			if(deleteChk == true){
				location.href="reviewController?type=deleteReview&cPage=" + cPage 
							+ "&rev_idx=" +  rev_idx;
			} else {
			  return;
			}
		}
	}

	/* 댓글 신고하기 */
	function goReportComment() {
		let reportChk = confirm("해당 댓글을 신고 접수하시겠습니까?");
		if(reportChk == true){
			alert("신고 접수되었습니다. 신고된 댓글은 관리자가 검토 후 삭제처리될 수 있습니다.");
		} else {
		  return;
		}
	}

	/* 댓글 수정하기 */
	function goUpdateComment(date, idx) {
		var comments = document.querySelectorAll(".comment-table tbody");
		for (var i = 0; i < comments.length; i++) {
			var content = comments[i].childNodes[3];
			var lastLine = comments[i].lastElementChild;
			var wDate = lastLine.innerText.substring(0, 19);
			if (wDate == date) {
				var string = comments[i].childNodes[3].firstElementChild.textContent;
				lastLine.classList.toggle("none");
				content.firstElementChild.innerHTML = ""
					+ "<textarea name='editing-box' class='editing-box'>" + string + "</textarea>" + "<br>"
					+ "<div class='editing-btn-wrap'>"
					+ "<input class='editing-btn' type='button' value='수정' onclick='edit(this.form)'>"
					+ "<input class='editing-btn' type='button' value='취소' onclick='cancel()'></div>"
					+ "<input type='hidden' name='rcom_idx' value='" + idx + "'>";
			}
		}
	}
	
	/* 댓글 수정의 '수정' 버튼 */
	function edit(frm) {
		frm.action="reviewController?type=updateComment";
		frm.submit();
		var newText = document.querySelector(".editing-box").value;
		var td = document.querySelector(".editing-box").parentElement;
		td.innerHTML = newText;
		td.parentElement.nextElementSibling.classList.toggle("none");
	}
	
	/* 댓글 수정을 '취소'하는 버튼 (미완이지만 일단 대충 기능은 함)*/
	function cancel() {
		var str = document.querySelector(".editing-box").value;
		var td = document.querySelector(".editing-box").parentElement;
		td.innerHTML = str;
		td.parentElement.nextElementSibling.classList.toggle("none");
	}

	/* 댓글 삭제하기 */
	function goDeleteComment(rcom_idx) {
		let deleteChk = confirm("정말 삭제하시겠습니까?");
		if(deleteChk == true){
			location.href="reviewController?type=deleteComment&rcom_idx=" + rcom_idx
					+ "&rev_idx=" + ${rvo.rev_idx} + "&cPage=" + ${cPage};
		} else {
		  return;
		}
	}
	
</script>
</html>
