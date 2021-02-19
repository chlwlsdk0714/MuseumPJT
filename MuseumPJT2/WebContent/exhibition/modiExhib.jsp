<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 정보 수정</title>
<script>
	function go_exhibYear(frm){
		frm.action="../year"; //year컨트롤러로 보내야 다시 목록으로 back했을 때 현재전시 바로 보임 =====수정 필요
	}
	
	function updateData() {
		var firstForm = document.forms[0];
		for (var i = 0; i < firstForm.elements.length; i++) { //왜 빈칸인데 입력하라고 alert안 뜨냐
			console.log(firstForm.elements[i]);
		}
		for (var i = 0; i < firstForm.elements.length; i++){
			if (firstForm.elements[i].value.trim == "") {
				if (i == 9) continue;
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		document.upForm.submit();
	}
</script>
</head>
<body>
<form action="modiExhib" name="upForm" method="post" enctype="multipart/form-data">
	<table>
		<caption>전시 정보 수정</caption>
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
 		<tfoot>
 			<tr>
 				<td>
 					<input type="button" value="수정" onclick="updateData()">
 					<input type="button" value="목록" onclick="go_exhibYear()">
 				</td>
 			</tr>
 			
 		</tfoot>
	</table>
	<input type="hidden" name="exhib_idx" value="${evo.exhib_idx }">
</form>
</body>
</html>