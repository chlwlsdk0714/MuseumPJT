<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 상세내용 입력</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
#tb {
	border: 1px solid red;
}
</style>
<script>
	
	function insertExhib() {
		let formData = new FormData(document.querySelector("form"));
		
		$.ajax("../insert", {
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
		<form method="post" enctype="multipart/form-data">
			<table id="tb">
				<caption>전시 정보 입력</caption>
				<tbody>
					<tr>
						<th>전시명</th>
						<td><input type="text" name="exhib_subject" title="전시명">
						</td>
					</tr>
					<tr>
						<th>시작날짜<br>[yyyy/MM/dd 형식으로 입력해주세요]<br>ex)2021/02/17
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