<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교육 > 미술관교육소개</title>
	<link rel="stylesheet" href="eduadmin/css/education.css">
<script>
	function insert_btn(frm) {
		//?utilparam=insert
		frm.action = "adminEduBtn"; //list 요청
		frm.submit();
	}
	function delete_btn(frm) {
		frm.action = "adminEduBtn"; //list 요청
		frm.submit();
	}
	function update_btn(frm) {
		frm.action = "adminEduBtn"; //list 요청
		frm.submit();
	}
</script>
</head>
<body>
	<div class="title-wrap">
		<div class="title">
			<span>미술관 교육소개</span>
		</div>
	</div>
	<div class="intro_container">
		<div class="intro_text_row">
			<div class="red-block"></div>
			<div class="intro_text">
				국립현대미술관은<br>
				현대예술의 역동성과 실험성,<br>
				그리고 일상에서 예술의 가치를 발견할 수 있는<br>
				교육프로그램을 운영합니다.<br>
			</div>
			<div class="intro_extra_text">
				유아부터 성인에 이르기까지 다양한 문화적 배경의 참여자가 함께하는 교육프로그램은<br /> 관람객 스스로 의미 있는
				학습을 통해 현대미술을 경험하고, 사회와의 소통을 시도하는 열린 미술관을 지향합니다.
			</div>
		</div>
	</div>
	
	<p class="program_list_tit">교육프로그램 안내</p>
	
	<form action="education" method="get">
		<div class="gray">
			<div class="edu-list-dv">
				<ul>
				<c:forEach var="eduVo" items="${edulist }">
 				<c:if test="${eduVo.edu_status eq 'ED01'}">
					<li class="edu_list">
						<div class="edu-li-span">${eduVo.edu_name}<br>교육</div>
						<a href="education?param=${eduVo.edu_title}">
							<img class="edu-li-img" src="${eduVo.edu_imglocal}" style="width: 500px; height: 300px;">
						</a>
					</li>
				</c:if> 
				</c:forEach>
				</ul>
			</div>
			
			<c:if test="${login.mem_id eq 'admin'}">
			<div class="link-a-btn">
				<a class="a_btn" href="adminEduBtn?utilparam=insert">추가</a>
				<a class="a_btn" href="adminEduBtn?utilparam=delete">삭제</a>
				<a class="a_btn" href="adminEduBtn?utilparam=update">수정</a>
			</div>
			</c:if>
		</div>
	</form>
</body>
</html>