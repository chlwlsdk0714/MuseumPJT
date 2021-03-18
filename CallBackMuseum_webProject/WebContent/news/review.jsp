<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관람 후기</title>
	<link rel="stylesheet" href="css/review.css" type="text/css">
</head>
<body>
	<form name="review-form" method="post">
		<div class="title-wrap">
			<div class="title">관람 후기</div>
		</div>

		<!-- 검색어 입력창 -->
		<div class="search-box">
			<select id="select">
				<option>전체 검색</option>
				<option>작성자명으로 검색</option>
				<option>분류명으로 검색</option>
				<option>제목+내용 검색</option>
			</select>
			<div class="input-wrap">
				
				<input type="text" name="searchText" id="searchText" 
					placeholder="검색어를 입력하세요.">
				<input type="hidden" name="type" value="search">
				<button type="submit">
					<span><i class="fas fa-search"></i></span>
				</button>
			</div>
		</div>
		
		<!-- 테이블 -->
		<div class="text-container">
			<div class="text-wrap">
				<span class="text">
					전체 <span class="number">${totalRecord}</span>건
				</span>
			</div>
		</div>

		<div class="table-wrap">
			<table class="rev-table">
				<thead>
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
			<c:if test="${not empty list}">
				<c:forEach var="rvo" items="${list}">                    	
					<tr onclick="goDetail('${pvo.nowPage}', '${rvo.rev_idx}', ${searchResult})">
						<td><span class="red">${rvo.rev_category}</span></td>
					<c:if test="${not empty rvo.comm_cnt}">
						<td class="left-align">
							<a class="hover-underline">${rvo.rev_subject}</a>
							<span class="red">(${rvo.comm_cnt})</span>
						</td>
					</c:if>
					<c:if test="${empty rvo.comm_cnt}">
						<td class="left-align">
							<a class="hover-underline">${rvo.rev_subject}</a>
						</td>
					</c:if>
						<td>${rvo.mem_name}</td>
						<td>${rvo.rev_write_date.substring(0,10)}</td>
						<td>${rvo.rev_hit}</td>
					</tr>
				</c:forEach>
			</c:if>
				<c:if test="${empty list}">
					<tr class="none">
						<td colspan="5">
							<span>데이터가 존재하지 않습니다.</span>
						</td>
					</tr>
				</c:if>
					<tr class="line"><td colspan="5"><hr></td></tr>
			
					<!-- 글쓰기 버튼 -->
					<tr class="writing-btn">
						<td colspan="5">
							<button type="button" onclick="insertNew()">새 글쓰기</button>
						</td>
					</tr>
				</tbody>
				<!-- 페이징 처리 -->
				<tfoot>
					<tr>
						<td colspan="5">
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
								<li class="now-page">${pageNo}</li>
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
	</form>
</body>
<script>
	/* 게시글이 지워졌는지 알려줌 */
	let msg = "${param.msg}";
	if (msg) {
		alert(msg);
	}
	function insertNew() {
		if (${empty login}) {
			let loginChk = confirm("로그인이 필요한 기능입니다. 로그인하시겠습니까?");
			if (loginChk) {
				location.href="../member/join?type=login";
			} else {
				return;
			}
		} else {
			location.href="review_insert.jsp";
		}
	}
	function goDetail(pageNum, idx, searchResult) {
		location.href = "reviewController?type=detail&cPage=" + pageNum 
					  + "&rev_idx=" + idx
					  + "&searchResult=" + searchResult;
	}
	function goPage(pageNum) {
		location.href = "newsController?type=review&cPage=" + pageNum;
	}
</script>
</html>