<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 상세내용 입력</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	#insert {
		display: flex; 
		width: 60%;
		height:800px;
		margin: auto;
		text-align: center;
	}
	#insert-tb {border-spacing: 20px;}
</style>
<script>
	
	function insertExhib() {
		let form = document.querySelector("#insertForm");
		//console.log(form);
		let formData = new FormData(form);
		
		$.ajax("../exhibition/insert", {
			type : "post",
			processData : false,
			contentType : false,
			data : formData,
			dataType : "json",
			success : function(data) { //data -> result :idx
				//console.log(typeof data);
				if(data) {
					alert("처리 성공~");
					location.href="detail?idx=" + data;
				} else {
					alert("처리 실패!!!");
				}
			},
			
			error : function(jqXHR, textStatus, errorThrown){
				alert("[예외발생] Ajax 처리실패!!! \n"
						+ "jqXHR.readyState :" + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
			}
		});
	}
	
</script>
</head>
<body>
	<div id="insert">
		
		<form id="insertForm" method="post" enctype="multipart/form-data">
			<h3>전시 정보 입력</h3>
			<table id="insert-tb">
				<tbody>
					<tr>
						<th>전시명</th>
						<td><input type="text" name="exhib_subject" title="전시명">
						</td>
					</tr>
					<tr>
						<th>시작날짜<br><p style="color:gray;">[yyyy/MM/dd 형식으로 입력해주세요]<br>ex)2021/02/17</p>
						</th>
						<td><input type="text" name="exhib_period_start" title="시작날짜">
						</td>
					</tr>
					<tr>
						<th>끝날짜</th>
						<td><input type="text" name="exhib_period_end" title="끝날짜">
						</td>
					</tr>
					<tr>
						<th>장소</th>
						<td><input type="text" name="exhib_venue" title="장소">
						</td>
					</tr>
					<tr>
						<th>작가</th>
						<td><input type="text" name="exhib_artist" title="작가">
						</td>
					</tr>
					<tr>
						<th>작품수</th>
						<td><input type="text" name="exhib_artworks_cnt" title="작품수">
						</td>
					</tr>
					<tr>
						<th>관람료</th>
						<td>별도 공지시까지 무료</td>
					</tr>
					<tr>
						<th>주최 / 후원</th>
						<td><input type="text" name="exhib_organization" title="주최">
						</td>
					</tr>
					<tr>
						<th>전시 설명</th>
						<td><textarea name="exhib_content" rows="8" cols="50"
								title="설명">
 				</textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="exhib_thumb_path"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td><input type="button" id="sendBtn" value="저장" onclick="insertExhib()"> 
						<input type="button" value="목록" onclick="location.href='period' "></td>
					</tr>

				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>