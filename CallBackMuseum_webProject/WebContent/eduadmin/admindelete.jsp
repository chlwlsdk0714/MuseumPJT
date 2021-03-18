<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지주인의 Education 관리 페이지입니당</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	function deleteGo(frm) {
		let findAny = false;
		let prop = "deleteEdu";
		$("input[type='checkbox']").each(function () {
			findAny = findAny || this.checked;
		});
		
		if(findAny == false) {
			alert("선택을 해줘요");
			return false;
		}
/* 		let checkboxs = document.querySelectorAll("input[type='checkbox']");
		for (let checkbox of checkboxs) {
			findAny = findAny || checkbox.checked;
			if (findAny) {
				break;
			}
		} */
		utilCall(prop);
	}
	
	function updateGo(frm) {
		let findAny = false;
		let count = 0;
		$("input[type='checkbox']").each(function () {
			findAny = findAny || this.checked;
			if(findAny){
				count++;
				findAny = false;
			} 
		});
		
		if(count > 1){
			$("input[type=checkbox]").prop("checked", false);
			alert("하나만 체크 해줘요" + count);
			return false;
		} else if(count < 1){
			alert("선택을 해줘요");
			return false;
		}
		frm.action = "adminEduBtn";
		frm.submit();
		//utilCall(prop);
	}
	function utilCall(prop) {
		let formData = $("form").serialize();
		$.ajax(prop, {
			method: "get",
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
<style>
.edu-updt-div {
	display: flex;
}
.edu-updt-div li {
	margin: 10px;
	position: relative;
	display: block;
	width: 100%;
}
</style>
</head>
<body>
	<c:if test="${param.utilparam == 'update'}">
		<h2>업데이트 페이지</h2>
	</c:if>
	<c:if test="${param.utilparam == 'delete'}">
		<h2>삭제 페이지</h2>
	</c:if>
	<div class="gray1">
		<section>
			<div class="edu-updt-div">
				<form action="education" method="get">
					<ul>
						<c:forEach var="eduVo" items="${edulist }">
							<c:if test="${eduVo.edu_status eq 'ED01'}">
								<li>
								<label for="${eduVo.edu_idx}"> <span>${eduVo.edu_name}<br /><span>교육</span>
									</span><br> <img src="${eduVo.edu_imglocal}"> 
									<input type="checkbox" id="${eduVo.edu_idx}" name="educheck" value="${eduVo.edu_idx}">
								</label>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					<c:if test="${param.utilparam == 'delete'}">
						<input type="button" value="삭제" onclick="deleteGo(this.form)">
					</c:if>
					<c:if test="${param.utilparam == 'update'}">
						<input type="hidden" name="utilparam" value="updateEdu">
						<input type="button" value="수정" onclick="updateGo(this.form)">
					</c:if>
				</form>
			</div>
		</section>
	</div>
</body>
</html>