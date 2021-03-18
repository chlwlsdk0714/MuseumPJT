<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>교육계층수정페이지</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		function gogoUpdate(frm) {
				// alert(">> sendData() 시작");
			var firstForm = document.forms[0];
			for (var i = 0; i < firstForm.elements.length; i++) {
				console.log(firstForm.elements[i]);
				if(i == 3) continue; // file은 옵션이므로 제외
				if(firstForm.elements[i].value.trim() == ""){
					alert(firstForm.elements[i].title + "입력하세요");
					firstForm.elements[i].focus();
					return
				}
			}
			let formData = new FormData(document.querySelector("#eduUpdate"));
			
			$.ajax("updateEdu", {
				method: "post",
				processData: false,
				contentType: false,
				data: formData,
				dataType: "json",
				success: function (res) {
					console.log(res);
					if(res) {
						alert("처리 성공");
						location.href = "education";
					} else {
						alert("처리 못함");
					}
				},
				error : function( jqXHR, textStatus, errorThrown){
				alert("[예외발생] Ajax 처리실패!!!\n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " +  textStatus + "\n"
						+ "errorThrown : " +  errorThrown);
				}
			});
		}
	</script>	
	</head>
	<body>
	<div>
		<h2>페이지주인의 Education Update 페이지입니당</h2>
	</div>
	<div>
	<form id="eduUpdate" method="post" enctype="multipart/form-data">
	<table border="">
		<tbody>
			<tr>
				<th><p>교육대상</p></th>
				<td>
					<input type="text" name="eduname" value="${eduvo.edu_name }">
				</td>
			</tr>
			<tr>
				<th><p>교육 별명</p></th>
				<td>
					<input type="text" name="edutitle" value="${eduvo.edu_title }">
				</td>
			</tr>
			<tr>
				<th><p>교육내용</p></th>
				<td>
					<input type="text" name="educontents" value="${eduvo.edu_contents }">
				</td>
			</tr>
			<tr>
				<th><p>이미지 추가</p></th>
				<td>
					<input type="file" name="edufile">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="idx" value="${eduvo.edu_idx}">
					<input type="button" value="수정" onclick="gogoUpdate(this.form)">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>	
	</body>
</html>