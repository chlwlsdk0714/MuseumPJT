<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육자료 추가</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		//title option 선택
		let titleOptions = document.querySelectorAll("#idxtitle option");
		selectOption(titleOptions, "${eduidx}");
		
		//교육 option 선택
		categoryChange(document.querySelector("#idxtitle").value);
	});
	
	function categoryChange(eduidx) {
		$.ajax("docidxsel", {
			type : "get",
			dataType : "json",
			success : function(idxData) {
				console.log(idxData);
				let optiontag = "";
				$.each(idxData, function() {
					if(eduidx == this.edu_idx){
						console.log(this.edu_idx); // edu_detidx
						optiontag += "<option value='" + this.edu_detidx + "'>";
						optiontag += this.edu_impt_contents;
						optiontag += "</option>"
					}
				});
				let opti = document.querySelector("#idxoption");
				opti.innerHTML = optiontag;				
				
				let options = document.querySelectorAll("#idxoption option");	
				console.log(options);
				selectOption(options, "${detidx}");
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("[예외발생] Ajax 처리실패!!!\n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});	
		
	}
	
	function selectOption(optionNodes, findValue) {
		for (let option of optionNodes) {
			if (option.value == findValue) {
				option.setAttribute("selected", "selected");
				return;
			}
		}
	}
	
	
	function opsidx() {
		var opt = document.querySelectorAll("#idxtitle option");
 		let detidx = "<c:out value='${eduidx}'/>";
 		for (var i = 0; i < opt.length; i++) {
		 	if (opt[i].value == detidx) {
				$("#idxtitle option:eq("+i+")").attr("selected","selected");	
				break;
			}
		}
 		categoryChange(detidx);
 		opsdetidx();
	}
	
 	function opsdetidx() {
		var opt2 = document.querySelectorAll("#idxoption option"); // 셀렉트 박스
 	 	let edidxd = "<c:out value='${detidx}'/>";  //불러온 파라미터 값
 	 	console.log("opt2");
 	 	console.log(opt2);
 	 	console.log(edidxd);
 		for (var i = 0; i < opt2.length; i++) {
		 	if (opt2[i].value == edidxd) { 	// ajax 로 불러온 파라미터 값이랑 값 비교 
				$("#idxoption option:eq("+i+")").attr("selected","selected");// ajax로 불러온 태그 값 option선택
				break;
			}
		}
	} 
	
	
	
	function DocupdateGo(frm) {

		let formData = new FormData(document.querySelector("#edudocupdate"));
		
		$.ajax("alddocupdate", {
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
		<h2>교육자료 업데이트</h2>
	</div>
	<div>
		<form id="edudocupdate" method="post" enctype="multipart/form-data">
			<table border="">
				<tbody>
					<tr>
						<th><p>교육자료 내용</p></th>
						<td><input type="text" name="docname"
							value="${ldVo.doc_text}"></td>
					</tr>
					<tr>
						<th><p>교육 타이틀 선텍</p></th>
						<td><select id="idxtitle" name="edutitle"
							onchange="categoryChange(this.value)">
								<c:forEach var="eduvo" items="${edulist}">
									<option value="${eduvo.edu_idx }">${eduvo.edu_name }</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<th><p>교육선택</p></th>
						<td><select name="edulearndocidx" id="idxoption">
								<option value=""></option>
						</select></td>
					</tr>
					<tr>
						<th><p>교육 파일</p></th>
						<td><input type="file" name="edufile"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="hidden" name="utilparam"
							value="eduinsert"> 
							<input type="hidden" name="docidx" value="${ldVo.doc_idx}">
							<input type="button" value="추가"
							onclick="DocupdateGo(this.form)"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>