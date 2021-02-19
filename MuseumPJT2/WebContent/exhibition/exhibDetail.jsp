<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시1</title>
<style>
	table {margin-left: auto; margin-right:auto;}
	.content {text-align: center;}
	.divTitle {
		display: flex;
		justify-content: center;
		}
	.title {
		border-top: 1px solid #303030;
		padding-top: 0.225em;
		padding-bottom: 15px;
		}
	img {display: block; margin: 0 auto;}
	.exhib-content {
		width:50%;
		margin-left: auto; margin-right:auto;
		line-height: 1.8em;
		}
	li {list-style: none; font-weight: 600}	
	a {text-decoration: none;}
</style>
<script>

</script>
</head>
<body>
	<h1 style="border:1px solid #111; background-color: #111; color:lightgray;">header입니다</h1>
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
 	<table>
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
				<a href="../exhibition/period">&lt;&lt;이전 페이지로</a>
			</li>
		</ul>
	</div>
	<div>
		<ul>
			<li></li>
		</ul>
	</div>
	<button type="button" onclick="location.href = 'preModi?idx=${evo.getExhib_idx()}' ">수정</button>
	<button type="button" onclick="delQ()">삭제</button>
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