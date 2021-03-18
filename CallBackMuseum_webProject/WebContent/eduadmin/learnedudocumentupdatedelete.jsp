<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function includeck(checked) {
		$('.checkboxes').click(function() {
			let checkbox = document.getElementsByTagName("input");
			for (var i = 0; i < checkbox.length; i++) {
				if (checkbox[i].value == checked) {
					checkbox[i].checked = !checkbox[i].checked;
				}
			}
		});
	}

	function deleteGo(frm) {
		let findAny = false;
		let prop = "docdelete";
		$("input[type='checkbox']").each(function() {
			findAny = findAny || this.checked;
		});

		if (findAny == false) {
			alert("선택을 해줘요");
			return false;
		}

		learnUtillGo(prop);
	}

	function learnUtillGo(prop) {
		let formData = $("form").serialize();
		$.ajax(prop, {
			method : "get",
			data : formData,
			dataType : "json",
			success : function(res) {
				console.log(res);
				if (res) {
					alert("처리 성공");
					location.href = "edlearndoc";
				} else {
					alert("처리 못함");
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("[예외발생] Ajax 처리실패!!!\n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});

	}
	function updateGo(frm) {
		let findAny = false;
		let count = 0;
		$("input[type='checkbox']").each(function() {
			findAny = findAny || this.checked;
			if (findAny) {
				count++;
				findAny = false;
			}
		});

		if (count > 1) {
			$("input[type=checkbox]").prop("checked", false);
			alert("하나만 체크 해줘요" + count + "개 체크됨");
			return false;
		} else if (count < 1) {
			alert("선택을 해줘요");
			return false;
		}

		frm.action = "docupdate";
		frm.submit();
	}
</script>
	<link rel="stylesheet" href="eduadmin/css/learnedudocumentupdatedelete.css">
</head>
<body>
	<c:if test="${param.docparam == 'delete'}">
		<h2>삭제페이지</h2>
	</c:if>
	<c:if test="${param.docparam == 'update'}">
		<h2>수정페이지</h2>
	</c:if>
			<div class="divdiv">
				<form class="formdd" method="get">
					<ul>
						<c:forEach var="ldVo" items="${ldVo}">
							<c:if test="${ldVo.doc_status == 'LD01'}">
								<li class="docli">
									<table id="${ldVo.doc_idx}"
										onclick="includeck('${ldVo.doc_idx}')">
										<tbody>
											<tr class="checkboxes">
												<th>교육자료 내용</th>
												<td>${ldVo.doc_text }</td>
											</tr>
										</tbody>
									</table> <input type="checkbox" id="${ldVo.doc_idx}"
									name="eduleancheck" value="${ldVo.doc_idx}">
								</li>
							</c:if>
						</c:forEach>
					</ul>
					<c:if test="${param.docparam == 'delete'}">
						<input type="button" value="삭제" onclick="deleteGo(this.form)">
					</c:if>
					<c:if test="${param.docparam == 'update'}">
						<input type="hidden" name="docparamUtil" value="updateEdu">
						<input type="button" value="수정" onclick="updateGo(this.form)">
					</c:if>
				</form>
			</div>
</body>
</html>