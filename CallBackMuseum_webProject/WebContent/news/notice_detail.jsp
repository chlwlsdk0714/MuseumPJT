<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세페이지</title>
	<link rel="stylesheet" href="css/notice_detail.css" type="text/css">
</head>
<body>
	<form name="notiform" method="post">
		<div class="title-wrap">
			<div class="title">공지사항</div>
		</div>
		<div class="table-wrap">
			<table class="noti-detail-table">
			<c:if test="${not empty nvo}">
				<thead>
					<tr>
						<td class="date">${nvo.noti_write_date.substring(0, 10)}</td>
					</tr>
					<tr>
						<td class="detail-title"><c:out value="${nvo.noti_subject}"/></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="writer">${nvo.mem_name}</td>
					</tr>
					<tr>
						<td class="content"><c:out value="${nvo.noti_content}"/></td>
					</tr>
				</tbody>
				<tfoot>
					<tr class="btn">
						<td>
					<!-- 관리자 계정으로 로그인 시 보이는 수정/삭제 버튼 -->
					<c:if test="${login.mem_id eq 'admin'}">
							<button type="button" onclick="goUpdate('${nvo.noti_idx}', '${cPage}')">수정</button>
							<button type="button" onclick="goDelete('${nvo.noti_idx}', '${cPage}')">삭제</button>
					</c:if>
							<button type="button" onclick="goList('${cPage}', ${searchResult})">목록</button>
						</td>
					</tr>
                </tfoot>
			</c:if>
            </table>
        </div>
    </form>
</body>
<script>
	/* 수정완료되었는지 아닌지 메시지 창 */
	let msg = "${param.msg}";
	if (msg) {
		alert(msg);
	}
	
	function goList(pageNum, searchResult) {
		if (searchResult) {
			history.back();
		} else {
			location.href="newsController?type=notice&cPage=" + pageNum;
		}
	}
	function goUpdate(noti_idx, cPage) {
		location.href="noticeController?type=update&cPage=" + cPage 
					+ "&noti_idx=" +  noti_idx;
	}
	function goDelete(noti_idx, cPage) {
		let deleteChk = confirm("정말로 삭제하시겠습니까?");
		if(deleteChk == true){
			location.href="noticeController?type=delete&cPage=" + cPage 
						+ "&noti_idx=" +  noti_idx;
		} else {
		  return;
		}
	}
</script>
</html>