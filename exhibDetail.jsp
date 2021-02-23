<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시1</title>
<link rel="stylesheet" type="text/css" href="css/exhibDetail.css"/>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<div class="all-detail">
	<div class="divTitle">
 		<h2 class="title">전시</h2>
	</div>
	<div class="detail">
	 	<c:if test="${evo.exhib_idx > '200' }">
	 		<img width="450" height="650" src="${pageContext.request.contextPath }/exhibition/images/${evo.exhib_thumb_path}">
	 	</c:if>
	 	<c:if test="${evo.exhib_idx < '200' }">
	 		<img width="450" height="650" src="${evo.exhib_thumb_path }">
	 	</c:if>
 	<table id="detail-tb">
 		<tr>
 			<td>기간</td>
 			<td>${evo.getStartString() }-${evo.getEndString() }</td>
 		</tr>
 		<tr>
 			<td>장소</td>
 			<td>${evo.exhib_venue } </td>
 		</tr>
 		<tr>
 			<td>작가</td>
 			<td>${evo.exhib_artist } </td>
 		</tr>
 		<tr>
 			<td>작품수</td>
 			<td>${evo.exhib_artworks_cnt }</td>
 		</tr>
 		<tr>
 			<td>관람료</td>
 			<td>별도 공지시까지 무료 </td>
 		</tr>
 		<tr>
 			<td>주최 / 후원</td>
 			<td>${evo.exhib_organization }</td>
 		</tr>
 	</table>
 	</div>
 	<div class="exhib-content">
 			<span>${evo.exhib_content }</span>
 	</div>

	<div class="movePage">
		<ul>
			<li>
				<a href="../exhibition/period" style="color:black;"><i class="far fa-arrow-alt-circle-left"></i>이전 페이지로</a>
			</li>
		</ul>
	</div>
	<div>
		<ul>
			<li></li>
		</ul>
	</div>
	<c:if test="${sessionScope.login.mem_id eq 'admin' }">
	<button type="button" onclick="location.href = 'preModi?idx=${evo.getExhib_idx()}' ">수정</button>
	<button type="button" onclick="delQ()">삭제</button>
	</c:if>
	</div>
</body>
<script>
	
	function delQ(){
		var q = confirm("정말 삭제하시겠습니까?");
		
		if(q) {
			location.href = "../delExhib?idx=${evo.getExhib_idx()}";
			alert("삭제되었습니다.");
		}else {
			alert("삭제 취소!");
		}
	}
</script>
</html>