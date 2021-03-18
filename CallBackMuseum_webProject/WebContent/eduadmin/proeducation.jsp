<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육 > 미술관교육소개</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="eduadmin/css/prolist.css">

</head>
<body>
	<h3 class="sub_title">
		<span>미술관 교육소개</span>
	</h3>
	<div class="title_area">
		<h3 class="sub_title">
			<span>${eduVo.edu_name } 교육</span>
		</h3>
	</div>
	<div class="extra_tit_area">
		<!-- educontants 내용 -->
		<span>${eduVo.edu_contents }</span>
	</div>
	<div class="extra_tit_img">
		<img src="${eduVo.edu_imglocal}">
	</div>
 	<div class="program_list_text_in">
		<ul>
		<c:forEach var="dvo" items="${detaillist}">
			 <c:if test="${dvo.edu_detailstatus eq 'EDUDT01'}">
			<li>
				<h6 class="hhhhhh-6">${dvo.edu_target}</h6>
				<div class="art_info">
					<table class="data_type1">
 						<tbody>
							<tr>
								<th scope="row">주요내용</th>
								<td><a href="lean?param=${dvo.edu_detidx }">${dvo.edu_impt_contents}</a></td>
							</tr>
							<tr>
								<th scope="row">운영시기</th>
								<td>${dvo.edu_period_start } ~ ${dvo.edu_period_end }</td>
							</tr>
							<tr>
								<th scope="row">장소</th>
								<td>${dvo.edu_detailaddr }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</li>
			</c:if> 
			</c:forEach>
		</ul>
	</div>
	
						<ol class="paging">
					<c:choose>
						<c:when test="${pvo.nowBlock eq 1}">
							<li class="disable"><i class="fas fa-angle-double-left"></i></li>
							<li class="disable"><i class="fas fa-angle-left"></i></li>
						</c:when>
						<c:when test="${pvo.nowBlock > 1}">
							<li onclick="goPage('1')"><i class="fas fa-angle-double-left"></i></li>
							<li onclick="goPage('${pvo.nowPage - 1}')"><i class="fas fa-angle-left"></i></li>
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
							<li onclick="goPage('${pvo.nowPage + 1}')"><i class="fas fa-angle-right"></i></li>
							<li onclick="goPage('${pvo.totalPage}')"><i class="fas fa-angle-double-right"></i></li>
						</c:when>
					</c:choose>	
						</ol>
						<c:if test="${login.mem_id eq 'admin'}">
	<div class="a-div-btn">
		<a href="learnUtil?paramUtil=learnInsert" class="a_btn"><span>추가</span></a>
		<a href="learnUtil?paramUtil=learnUpdate" class="a_btn"><span>수정</span></a>
		<a href="learnUtil?paramUtil=learnDelete" class="a_btn"><span>삭제</span></a>
	</div>
	</c:if>
</body>
<script>
	function goPage(pageNum) {
		location.href = "education?cPage=" + pageNum + "&param=${param.param}";
	}
</script>
</html>
