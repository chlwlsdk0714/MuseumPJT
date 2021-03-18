<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>leanEducation</title>
	<link rel="stylesheet" href="eduadmin/css/learnlist.css">
</head>
<body>
	<div class="title-wrap">
		<div class="title">
			<span>참여신청</span>
		</div>
	</div>
	
	<div class="title_area">
		<h4 class="sub_title">
			<span>예약중인 교육</span>
		</h4>
	</div>
		<!-- 검색박스 -->
	<div class="sch_area">
		<div class="search_box">
			<div class="input_wrap">
				<input type="text" name="searchText" id="searchText" placeholder="검색어를 입력하세요.">
			</div>
			<button type="button" onclick="fn_searchList('${pageNo}')">
				<span class="fas fa-search">>검색</span>
			</button>
		</div>
	</div>
	<div class="sect1">
		<div class="brd_area">
			<div class="brd_title">
				<ul class="list_type4-career" id="ingList">
				<c:forEach var="leanvo" items="${leanlist }">
					<c:if test="${leanvo.edu_detailstatus == 'EDUDT01'}">
					<li>
						<div class="event-info">
						<a href="lean?param=${leanvo.edu_detidx }" class="place_type">
							<span class="selectspan underline">${leanvo.edu_detailname }</span> 
							<span class="selectspan">${leanvo.edu_period_start } ~ ${leanvo.edu_period_end }</span> 
							<span class="selectspan red">예약중</span>
						</a>
						</div>
					</li>
					</c:if>
				</c:forEach>
				</ul>
					<!-- 페이징 -->
			</div>
		</div>
	</div>
	<ol class="paging">
		<c:choose>
			<c:when test="${pvo.nowBlock eq 1}">
				<li class="disable"><i class="fas fa-angle-double-left"></i></li>
				<li class="disable"><i class="fas fa-angle-left"></i></li>
			</c:when>
			<c:when test="${pvo.nowBlock > 1}">
				<li onclick="goPage('1')"><i class="fas fa-angle-double-left"></i></li>
				<li onclick="goPage('${pvo.nowPage - 1}')"><i
					class="fas fa-angle-left"></i></li>
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
				<li onclick="goPage('${pvo.nowPage + 1}')"><i
					class="fas fa-angle-right"></i></li>
				<li onclick="goPage('${pvo.totalPage}')"><i
					class="fas fa-angle-double-right"></i></li>
			</c:when>
		</c:choose>
	</ol>
	<c:if test="${login.mem_id eq 'admin'}">
	<div class="link-a-btn">
		<a href="learnUtil?paramUtil=learnInsert" class="a_btn"><span>추가</span></a>
		<a href="learnUtil?paramUtil=learnUpdate" class="a_btn"><span>수정</span></a>
		<a href="learnUtil?paramUtil=learnDelete" class="a_btn"><span>삭제</span></a>
	</div>
	</c:if>
</body>
<script>
	function goPage(pageNum) {
		location.href = "learnlist?cPage=" + pageNum;
	}
	function fn_searchList(pageNum) {
		let searchText = document.querySelector('#searchText').value;
		location.href = "learnsearch?cPage=" + pageNum + "&searchtext=" + searchText;
		
	}	
</script>
</html>