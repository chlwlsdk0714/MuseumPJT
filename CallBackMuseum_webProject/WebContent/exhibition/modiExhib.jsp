<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 정보 수정</title>
<script>
	
	function updateData(frm) {
		
		for (var i = 0; i < frm.elements.length; i++){
			if (frm.elements[i].value.trim() == "") {
				alert(frm.elements[i].title +  " "  +"입력하세요");
				frm.elements[i].focus();
				return;
			}
		} 
		document.modiForm.submit();
		
	} 
	
</script>
<style>
	#modi-tb {
		display: flex; 
		width: 60%;
		height:900px;
		margin: auto;
		text-align: center;
		border-spacing: 20px;
	}
	h3 {padding-left: 40%;}
	.btns {
		display: flex;
		justify-content: center;
		margin-bottom: 3em;
	}
	.btns input {
		margin: 0.5em;
		padding: 0.5em 1.3em;
		
	}
</style>
</head>
<body>
<form action="modiExhib" name="modiForm" method="post" enctype="multipart/form-data">
	<h3>전시 정보 수정</h3>
	<table id="modi-tb">
		<tbody>
		<tr>
 			<th>전시명</th>
 			<td>
 				<input type="text" name="exhib_subject" title="전시명"
 					value="${evo.exhib_subject }" onfocus="this.value=''">
 			</td>
 		</tr>
 		<tr>
 			<th>시작날짜<br>[yyyy/MM/dd 형식으로 입력해주세요]<br>ex)2021/02/17</th>
 			<td>
 				<input type="text" name="exhib_period_start" title="시작날짜"
 					value="${evo.exhib_period_start }" onfocus="this.value=''">
 			</td>
 		</tr>
 		<tr>
 			<th>끝날짜</th>
 			<td>
 				<input type="text" name="exhib_period_end" title="끝날짜"
 					value="${evo.exhib_period_end }" onfocus="this.value=''">
 			</td>
 		</tr>
 		<tr>
 			<th>장소</th>
 			<td>
 				<input type="text" name="exhib_venue" title="장소"
 					value="${evo.exhib_venue }" onfocus="this.value=''">
 			</td>
 		</tr>
 		<tr>
 			<th>작가</th>
 			<td>
 				<input type="text" name="exhib_artist" title="작가"
 					value="${evo.exhib_artist }" onfocus="this.value=''">
 			</td>
 		</tr>
 		<tr>
 			<th>작품수</th>
 			<td>
 				<input type="text" name="exhib_artworks_cnt" title="작품수"
 					value="${evo.exhib_artworks_cnt }" onfocus="this.value=''">
 			</td>
 		</tr>
 		<tr>
 			<th>관람료</th>
 			<td>별도 공지시까지 무료 </td>
 		</tr>
 		<tr>
 			<th>주최 / 후원</th>
 			<td>
 				<input type="text" name="exhib_organization" title="주최"
 					value="${evo.exhib_organization }" onfocus="this.value=''">
 			</td>
 		</tr>
 		<tr>
 			<th>전시 설명</th>
 			<td>
 				<textarea name="exhib_content" rows="8" cols="50" title="설명">
 				</textarea>
 			</td>
 		</tr>
 		<tr>
 			<th>첨부파일</th>
 			<td>
 				<input type="file" name="exhib_thumb_path"
 					value="${evo.exhib_thumb_path }">
 			</td>
 		</tr>
 		</tbody>
	</table>
	<div class="btns">
		<input type="button" value="수정" onclick="updateData(this.form)">
	 	<input type="button" value="목록" onclick="location.href='../exhibition/period'">
		<input type="hidden" name="exhib_idx" value="${evo.exhib_idx }">
	</div>
</form>
</body>
</html>