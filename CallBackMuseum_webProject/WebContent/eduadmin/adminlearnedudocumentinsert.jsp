<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육자료 추가</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		categoryChange(document.getElementById("idxtitle").value);
	});
	
	function categoryChange(eduidx) {
		$.ajax("docidxsel", {
			type : "get",
			dataType : "json",
			success : function(idxData) {
				console.log(idxData);
				var optiontag = "";
				var ilist = idxData;
				$.each(ilist, function() {
					if(eduidx == this.edu_idx){
						console.log(this.edu_idx); // edu_detidx
						optiontag += "<option value='" + this.edu_detidx + "'>";
						optiontag += this.edu_impt_contents
						optiontag += "</option>"
					}
				});
				let opti = document.querySelector("#idxoption");
				opti.innerHTML = optiontag;
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("[예외발생] Ajax 처리실패!!!\n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});	
	}
	
	function DocInsertGo(frm) {
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
		let formData = new FormData(document.querySelector("#edudocinsert"));
		
		$.ajax("alddoc", {
			method: "post",
			processData: false,
			contentType: false,
			data: formData,
			dataType: "json",
			success: function (res) {
				console.log(res);
				if(res) {
					alert("처리 성공");
					location.href = "edlearndoc";
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
		<h2>교육자료 추가</h2>
	</div>
	<div>
		<form id="edudocinsert" method="post" enctype="multipart/form-data">
			<table border="">
				<tbody>
					<tr>
						<th><p>교육자료 내용</p></th>
						<td>
							<input type="text" name="docname" value="">
						</td>
					</tr>
					<tr>
						<th><p>교육 타이틀 선텍</p></th>
						<td>
						<select id="idxtitle" name="eduidx" onchange="categoryChange(this.value)">
							<c:forEach var="eduvo" items="${edulist}">
							    <option value="${eduvo.edu_idx }">${eduvo.edu_name }</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					
					<tr>
						<th><p>교육선택</p></th>
						<td>
						<select name="edulearnidx" id="idxoption">
						    <option value=""></option>
						</select>
						</td>
					</tr>
					<tr>
						<th><p>교육 파일</p></th>
						<td><input type="file" name="edufile"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="hidden" name="utilparam"
							value="eduinsert"> <input type="button" value="추가"
							onclick="DocInsertGo(this.form)">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
</body>
</html>