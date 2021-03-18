<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>페이지 주인의 배움의 추가 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	window.onload = function(){
		document.getElementById("startdate").value = new Date().toISOString().substring(0, 10);
		document.getElementById("enddate").value = new Date().toISOString().substring(0, 10);
	} 

	function insertgogo() {
		let find = true;
		var firstForm = document.forms[0];
		for (var i = 0; i < firstForm.elements.length; i++) {
			console.log(firstForm.elements[i]);
			if(firstForm.elements[i].value.trim() == ""){
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				find = false;
				return
			}
		}
		let formData = new FormData(document.querySelector("#learnInsert"));
		
		$.ajax("learnInsert", {
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
		<h2>페이지 주인의 Learn 추가 페이지 입니다</h2>
	</div>
	<div>
		<form id="learnInsert" method="post" enctype="multipart/form-data">
			<table border="">
				<tbody>
					<tr>
						<th>교육대상</th>
						<td>
							<input type="text" name="learntarget" value="">
						</td>
						<th>교육내용</th>
						<td>
							<input type="text" name="learncontent" value="">
						</td>
					</tr>
					<tr>
						<th>교육장소</th>
						<td>
						<input type="text" name="learndetail" value="">
						</td>
						<th>교육카테고리</th>
						<td>
						<select name="selecBoxes">
							<c:forEach var="edvo" items="${edlist}">
								<c:if test="${edvo.edu_idx == edvo.edu_idx}">
								<option value="${edvo.edu_idx }">${edvo.edu_name}</option>
								</c:if>
								<c:if test="${edvo.edu_idx != edvo.edu_idx}">
								<option value="${edvo.edu_idx }">${edvo.edu_name }</option>
								</c:if>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<th>교육이름</th>
						<td>
							<input type="text" name="learndetailname" value="">
						</td>
						<th>교육가격</th>
						<td>
							<input type="text" name="learnprice" value=""> 원
						</td>
					</tr>
					<tr>
						<th>추천교육계층</th>
						<td>
							<input type="text" name="learndetailtag" value="">
						</td>
					</tr>
					<tr>
						<th>교육기간</th>
						<td>
							<input id="startdate" type="date" name="startdate" value="">
							~
							<input id="enddate" type="date" name="enddate" value="">
						</td>
						<th>교육시간</th>
						<td>
							<input type="text" name="edutime" value=""> 시간
						</td>
					</tr>
					<tr>
						<th><p>이미지 추가</p></th>
						<td colspan="3"><input type="file" name="edufile"></td>
					</tr>
				</tbody>
			</table>
			<input type="button" value="추가" onclick="insertgogo(this.form)">
		</form>

	</div>
	</body>

</html>