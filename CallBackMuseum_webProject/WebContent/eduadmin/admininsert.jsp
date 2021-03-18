<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>adminInsert</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function insertgogo() {
		let find = true;
		var firstForm = document.forms[0];
		for (var i = 0; i < firstForm.elements.length; i++) {
			console.log(firstForm.elements[i]);
			if(i == 3) continue; // file은 옵션이므로 제외
			if(firstForm.elements[i].value.trim() == ""){
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				find = false;
				return
			}
		}
		//let formData = new FormData(document.querySelector("form"));
		let formData = new FormData(document.querySelector("#formdata"));
		console.log(formData);
		$.ajax("eduinsert", {
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
			<h2>페이지주인의 Education Insert 페이지입니당</h2>
		</div>
		<div>
		<form id="formdata" method="post" enctype="multipart/form-data">
		<table border="">
			<tbody>
				<tr>
					<th><p>교육대상</p></th>
					<td>
						<input type="text" name="eduname" value="">
					</td>
				</tr>
				<tr>
					<th><p>교육 별명</p></th>
					<td>
						<input type="text" name="edutitle" value="">
					</td>
				</tr>
				<tr>
					<th><p>교육내용</p></th>
					<td>
					
						<input type="text" name="educontents" value="">
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
					<input type="hidden" name="utilparam" value="eduinsert">
					<input type="button" value="추가" onclick="insertgogo()">
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		</div>
	</body>
</html>