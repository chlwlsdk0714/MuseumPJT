<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<link rel="stylesheet" href="css/notice.css" type="text/css">
</head>
<body>
	<form name="noti-form" action="noticeController" method="post">
		<div class="title-wrap">
			<div class="title">공지사항</div>
		</div>
		
		<!-- 검색어 입력창 -->
		<div class="search-box">
			<div class="input-wrap">
				<input type="text" name="searchText" id="searchText" 
					placeholder="검색어를 입력하세요.">
				<input type="hidden" name="type" value="search">
				<button type="submit">
					<span><i class="fas fa-search"></i></span>
				</button>
			</div>
		</div>
	</form>
	
	<!-- 공지사항 테이블 -->
	<div class="text-wrap">
		<span class="text">
		<c:if test="${searchResult == null}">
			전체 <span class="number">${totalRecord}</span>건
		</c:if>
		<c:if test="${searchResult == true}">
			<span class="number">"${searchText}"</span> 검색(제목+내용) 결과
			<span class="number">${searchRecord}</span>건
		</c:if>
		</span>
	</div>

	<div class="table-wrap">
		<table class="noti-table">
			<tbody>
		<c:if test="${not empty list}">
			<c:forEach var="nvo" items="${list}">                    	
				<tr onclick="goDetail('${pvo.nowPage}', '${nvo.noti_idx}', ${searchResult})">
					<td>
						${nvo.noti_write_date.substring(0,10)}
						<span class="red">
							&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						</span>
						<i class="far fa-eye">&nbsp;${nvo.noti_hit}</i><br>
						<a class="hover-underline"><c:out value="${nvo.noti_subject}"/></a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
			<c:if test="${empty list}">
				<tr class="none">
					<td>
						<span>검색결과가 존재하지 않습니다.</span>
					</td>
				</tr>
			</c:if>
			
			<!-- 관리자 계정으로 로그인 시 보이는 글쓰기 버튼 -->
			<c:if test="${login.mem_id eq 'admin'}">
				<tr class="writing-btn">
					<td>
						<button type="button" onclick="location.href='notice_insert.jsp'">새 글쓰기</button>
					</td>
				</tr>
			</c:if>
			</tbody>
			
			
			<!-- 페이징 처리 -->
			<tfoot>
				<tr>
					<td>
						<ol class="paging">
					<c:choose>
						<c:when test="${pvo.nowBlock eq 1}">
							<li class="disable"><i class="fas fa-angle-double-left"></i></li>
							<li class="disable"><i class="fas fa-angle-left"></i></li>
						</c:when>
						<c:when test="${pvo.nowBlock > 1}">
							<li onclick="goPage('1')"><i class="fas fa-angle-double-left"></i></li>
							<li onclick="goPage('${pvo.nowPage - 5}')"><i class="fas fa-angle-left"></i></li>
						</c:when>
					</c:choose>
					
					<c:forEach var="pageNo" begin="${pvo.beginPage}" end="${pvo.endPage}">
						<c:if test="${pageNo == pvo.nowPage }">
							<li class="now">${pageNo}</li>
						</c:if>
						<c:if test="${pageNo ne pvo.nowPage}">
							<li onclick="goPage('${pageNo}')">${pageNo}</li>
						</c:if>
					</c:forEach>	
						
					<c:choose>
						<c:when test="${pvo.nowBlock eq pvo.totalBlock}">
							<li class="disable"><i class="fas fa-angle-right"></i></li>
							<li class="disable"><i class="fas fa-angle-double-right"></i></li>
						</c:when>
						<c:when test="${pvo.nowBlock < pvo.totalBlock}">
							<li onclick="goPage('${pvo.nowPage + 5}')"><i class="fas fa-angle-right"></i></li>
							<li onclick="goPage('${pvo.totalPage}')"><i class="fas fa-angle-double-right"></i></li>
						</c:when>
					</c:choose>	
						</ol>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

</body>
<script>
	/* 삭제완료되었는지 아닌지 메시지 창 */
	let msg = "${param.msg}";
	if (msg) {
		alert(msg);
	}
	
	function goDetail(pageNum, idx, searchResult) {
		location.href = "noticeController?type=detail&cPage=" + pageNum 
					  + "&noti_idx=" + idx
					  + "&searchResult=" + searchResult;
		
	}
	function goPage(pageNum) {
		location.href = "newsController?type=notice&cPage=" + pageNum;
	}
</script>
</html>