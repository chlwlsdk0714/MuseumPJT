<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link rel="stylesheet" href="css/inquiryList.css" type="text/css">
<style>
tr[onclick]:hover {
	background-color: #eeeeee;
	cursor: pointer;
}
</style>
<script>
	function inquiry() {
		let li1 = document.querySelector("#li1");
		let li2 = document.querySelector("#li2");
		li2.classList.remove("now");
		li1.classList.add("now");
		location.href="inquiryController?type=inquiry";
	}
</script>
</head>
<body>
	<div class="title-wrap">
		<div class="title">1:1 문의내역</div>
	</div>
	<div class="line-nav-wrap">
		<div class="line-nav">
			<ul>
			<c:if test="${sessionScope.login.mem_id ne 'admin'}">
				<li id="li1" onclick="inquiry()">1:1 문의하기</li>
				<li id="li2" class="now">나의 문의내역</li>
			</c:if>
			<c:if test="${sessionScope.login.mem_id eq 'admin'}">
				<li id="li2" class="now">전체 문의내역</li>
			</c:if>
			</ul>
		</div>
	</div>
	<form method="post">
	<div class="userAsk-wrap">	
		<div class="userAsk">
		<c:if test="${sessionScope.login.mem_id ne 'admin'}">
			<p>${sessionScope.login.mem_name}님이&nbsp;문의하신&nbsp;내역입니다.</p>
			</c:if>
		<c:if test="${sessionScope.login.mem_id eq 'admin'}">
			<p>전체 문의 내역입니다.</p>
			</c:if>
		</div>
	</div>	
		<div class="table-wrap">
			<table>
				<tbody>
					<c:if test="${empty list}">
						<tr class="no-writing">
							<td>문의하신 글이 없습니다.</td>
						</tr>
					</c:if>

					<c:if test="${not empty list }">
						<div class="table-body">
							<c:forEach var="ivo" items="${list}">
								<c:if test="${ivo.inq_del_status eq 0}">
								
								<tr class="row-list" onclick='location.href="inquiryController?type=inquiryDetail&inq_idx=${ivo.inq_num}"'>
									<td>
									<c:if test="${sessionScope.login.mem_id eq 'admin'}"> 
										<span>${ivo.inq_num}</span> 
										<span class="dash">&nbsp;&nbsp; | &nbsp;&nbsp;</span></c:if> 
										<span>${ivo.inq_date}</span> 
										<span class="dash">&nbsp;&nbsp; | &nbsp;&nbsp;</span> 
										<span>[${ivo.inq_category}문의 ]</span>
									<c:if test="${sessionScope.login.mem_id eq 'admin'}"> 
										<span class="dash">&nbsp;&nbsp; | &nbsp;&nbsp;</span>
										<span> 작성자 : ${ivo.inq_writer} </span>
									</c:if>
										<br><br> 
										<span id="subject">${ivo.inq_subject }</span>
									</td>
									<c:if test="${empty ivo.inq_answer}">
										<td><div class="ans">미답변</div></td>
									</c:if>
									<c:if test="${not empty ivo.inq_answer}">
										<td><div class="ans" class="ans-complete">답변완료&nbsp;<i class="fas fa-check"></i></div></td>
									</c:if>
								</tr>
								</c:if>
							</c:forEach>
						</div>
						</c:if>
			</table>
				
				<!-- 페이징 처리 -->
						<ol class="butBox">
						<c:choose>
						<c:when test="${paging.nowPage eq 1}">
							<li class="prev disable">이전</li>
						</c:when>
						<c:when test="${paging.nowPage > 1}">
							<li onclick="goPage(${paging.nowPage - 1})">이전</li>
						</c:when>
						</c:choose>
						
						<c:forEach var="pageNo" begin="${paging.startPage}" end="${paging.endPage}">
							<c:if test="${paging.nowPage eq pageNo}">
								<li class="now-page">${pageNo}</li>
							</c:if>
							<c:if test="${paging.nowPage ne pageNo}">
								<li onclick="goPage(${pageNo})">${pageNo}</li>
							</c:if>
						</c:forEach>
							
						<c:choose>
						<c:when test="${paging.nowPage eq paging.totalPage }">
							<li class="next disable">다음</li>
						</c:when>
						<c:when test="${paging.nowPage < paging.totalPage }">
							<li onclick="goPage(${paging.nowPage + 1})" class="next">다음</li>
						</c:when>
						</c:choose>
						</ol>
		</div>
	</form>
	<script>
	function goPage(pageNum) {
		location.href = "inquiryController?type=inquiryList&cPage=" + pageNum;
	}
	
	function goDetail(pageNum, inq_idx) {
		location.href = "inquiryController?type=inquirydetail&cPage=" + pageNum 
					  + "&inq_idx=" + inq_idx;//${ivo.inq_num};
	}
</script>
</html>