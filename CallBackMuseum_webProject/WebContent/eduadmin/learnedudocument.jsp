<%@page import="java.net.URLEncoder"%>
<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교육자료 페이지</title>
	<link rel="stylesheet" href="eduadmin/css/learnedudocument.css">
</head>
<body>
	<!-- 타이틀  -->
	<div class="title-wrap">
		<div class="title">
			<span>교육자료실</span>
		</div>
	</div>
	
	<!-- 검색박스 -->
	<div class="sch_area">
		<div class="search_box">
			<div class="input_wrap">
				<input type="text" name="searchText" id="searchText" placeholder="검색어를 입력하세요.">
			</div>
			<button type="button" onclick="fn_searchList('${pageNo}');">
				<span class="fas fa-search">>검색</span>
			</button>
		</div>
	</div>
	
	<form name="listForm" method="post" action="/common/fileDown.do"
		target="iFrameDownload" class="docform">
<!-- 				<aside class="left_sect2">
					<div class="sch_result_ctrl">
						<h4 class="accordion on">
							<a href="#" role="button"><span>카테고리</span></a>
						</h4>
						<div class="choice_box open_con on">
							<ul>
								<li>
									<div class="choice_wrap">
										<input type="checkbox" id="check_1" name="check_1"
											class="design" onclick="fn_deselect_all();" checked="checked">
										<label for="check_1">전체</label>
									</div>
								</li>


								<li>
									<div class="choice_wrap">
										<input type="checkBox" name="check" id="check_2" value="01"
											class="design" onclick="fn_searchAjaxListChk();"> <label
											for="check_2">전문인</label>
									</div>
								</li>

								<li>
									<div class="choice_wrap">
										<input type="checkBox" name="check" id="check_3" value="02"
											class="design" onclick="fn_searchAjaxListChk();"> <label
											for="check_3">성인</label>
									</div>
								</li>

								<li>
									<div class="choice_wrap">
										<input type="checkBox" name="check" id="check_4" value="03"
											class="design" onclick="fn_searchAjaxListChk();"> <label
											for="check_4">청소년/교사</label>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</aside> -->
		
	<!-- 청소년, 성인, 전문인 리스트 -->
		<div id="list_div">
			<ul class="list_ul">
			<c:forEach var="ldVo" items="${ldVo }">
			<c:if test="${ldVo.doc_status == 'LD01'}">
				<li>
					<span>${ldVo.edu_name}</span>
					<p class="subject">${ldVo.edu_impt_contents}</p>
					<p><span>${ldVo.doc_text }</span></p>
					<p><span>전시기간: ${ldVo.edu_period_start} ~ ${ldVo.edu_period_end }</span></p>
					<div class="files_area">
						<span class="download">
							<a href="downloadAct?filename=${ldVo.doc_filename }">${ldVo.doc_filename }</a>
						</span>
					</div>
				</li>
			</c:if>
			</c:forEach>
			<c:if test="${empty ldVo}">
				<li class="none">
					<span>검색결과가 존재하지 않습니다.</span>
				</li>
			</c:if>
			</ul>
		</div>
		
		<div class="paging-wrap">
			<ol class="paging">
				<c:choose>
					<c:when test="${pvo.nowBlock eq 1}">
						<li class="disable"><i class="fas fa-angle-double-left"></i></li>
						<li class="disable"><i class="fas fa-angle-left"></i></li>
					</c:when>
					<c:when test="${pvo.nowBlock > 1}">
						<li onclick="goPage('1')"><i class="fas fa-angle-double-left"></i></li>
						<li onclick="goPage('${pvo.nowPage - 2}')"><i class="fas fa-angle-left"></i></li>
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
						<li onclick="goPage('${pvo.nowPage + 2}')"><i class="fas fa-angle-right"></i></li>
						<li onclick="goPage('${pvo.totalPage}')"><i class="fas fa-angle-double-right"></i></li>
					</c:when>
				</c:choose>	
			</ol>
		</div>
		<c:if test="${login.mem_id eq 'admin'}">
		<div class="link-a-btn">
			<a class="a_btn" href="adDocInsertApi">추가</a>
			<a class="a_btn" href="docutil?docparam=update">수정</a>
			<a class="a_btn" href="docutil?docparam=delete">삭제</a>
		</div>	
		</c:if>
	</form>
</body>
<script>
	function goPage(pageNum) {
		location.href = "edlearndoc?cPage=" + pageNum;
	}
	function fn_searchList(pageNum) {
		let searchText = document.querySelector('#searchText').value;
		location.href = "edlearndoc?cPage=" + pageNum + "&searchtext=" + searchText;
	}
</script>
</html>