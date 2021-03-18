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
/* 	function includeck(checked) {
	    let tables = document.getElementById(checked);
        let checkbox = document.getElementsByTagName("input");
        for(var i=0; i < checkbox.length; i++){
        	if(checkbox[i].value == checked){
        		checkbox[i].checked = !checkbox[i].checked;
        	}
        }
	} */
	
	function includeck(checked) {
		$('.checkboxes').click(function(){
	        let checkbox = document.getElementsByTagName("input");
	        for(var i=0; i < checkbox.length; i++){
	        	if(checkbox[i].value == checked){
	        		checkbox[i].checked = !checkbox[i].checked;
	        	}
	        }
		});
	}
	
/* 	$(function() {
		$('.checkboxes').click(function(){
	        let checkbox = document.getElementsByTagName("input");
	        for(var i=0; i < checkbox.length; i++){
	        	if(checkbox[i].value == checked){
	        		checkbox[i].checked = !checkbox[i].checked;
	        	}
	        }
		});
	}); */
	
	function deleteGo(frm) {
		let findAny = false;
		let prop = "deletelearn";
		$("input[type='checkbox']").each(function () {
			findAny = findAny || this.checked;
		});
		
		if(findAny == false) {
			alert("선택을 해줘요");
			return false;
		}
		
		learnUtillGo(prop);
	}
	
	function learnUtillGo(prop) {
		let formData = $("form").serialize();
		$.ajax(prop, {
			method: "get",
			data: formData,
			dataType: "json",
			success: function (res) {
				console.log(res);
				if(res) {
					alert("처리 성공");
					location.href = "learnlist";
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
			alert("하나만 체크 해줘요" + count + "개 체크됨");
			return false;
		} else if(count < 1){
			alert("선택을 해줘요");
			return false;
		}		
		
		frm.action = "learnUtil";
		frm.submit();
	}
</script>
<style>
.upt-div {
	display: flex;
}	
.utilgo-in {
	position: sticky;
}

.edu-up-table {
	margin: 10px;
	position: relative;
	display: block;
	width: 100%;
}
</style>
</head>
<body>
<c:if test="${param.paramUtil == 'learnDelete'}">
	<h2>삭제페이지</h2>
</c:if>
<c:if test="${param.paramUtil == 'learnUpdate'}">
	<h2>수정페이지</h2>
</c:if>
	<div class="upt-div">
		<section>
			<div>
				<form method="get">
					<ul>
						<c:forEach var="learnvo" items="${learnlist}">
						<c:if test="${learnvo.edu_detailstatus == 'EDUDT01'}">
							<li class="edu-up-table">
								<table id="${learnvo.edu_detidx}" onclick="includeck('${learnvo.edu_detidx}')">
									<tbody>
										<tr class="checkboxes">
											<td colspan="2">
												<img src="${learnvo.edu_leanimglocal }"/>
											</td>
										</tr>
										<tr class="checkboxes">
											<th>교육대상</th>
											<td>${learnvo.edu_target }</td>								
											<th>교육내용</th>
											<td>${learnvo.edu_impt_contents }</td>								
										</tr>
										<tr>
											<th>교육장소</th>
											<td>${learnvo.edu_detailaddr } 호</td>								
											<th>교육카테고리</th> 
											<c:if test="${param.paramUtil == 'learnUpdate'}">
											<td>
												<select name="title">
												<c:forEach var="eduvo" items="${edulist}">
												    <option value="${eduvo.edu_idx }">${eduvo.edu_name }</option>
												</c:forEach>
												</select>
											</td>						
											</c:if>
										</tr>
										<tr class="checkboxes">
											<th>교육이름</th>
											<td>${learnvo.edu_detailname }</td>								
											<th>교육가격</th>
											<td>${learnvo.edu_price }</td>								
										</tr>
										<tr class="checkboxes">
											<th>추천교육계층</th>
											<td>${learnvo.edu_detailtarget }</td>								
											<th>문의전화</th>
											<td>${learnvo.edu_phone }</td>								
										</tr>
										<tr class="checkboxes">
											<th>교육기간</th>
											<td>${learnvo.edu_period_start } ~ ${learnvo.edu_period_end }</td>
											<th>교육시간</th>
											<td>${learnvo.edu_detailtime }시간</td>
										</tr>
		
										<%-- <tr class="checkboxes">
											<th class="contact_num">문의</th>
											<td class="contact_num">미술관교육과 ${devo.edu_phone }(09~18시, 월~금)</td>
										</tr> --%>
									</tbody>								
								</table>
								<input type="checkbox" id="${learnvo.edu_detidx}" name="eduleancheck" value="${learnvo.edu_detidx}">
							</li>
							</c:if>
						</c:forEach>
					</ul>
					<c:if test="${param.paramUtil == 'learnDelete'}">
						<input class="utilgo-in" type="button" value="삭제" onclick="deleteGo(this.form)">
					</c:if>
					<c:if test="${param.paramUtil == 'learnUpdate'}">
						<input type="hidden" name="paramUtil" value="updateEdu">
						<input class="utilgo-in" type="button" value="수정" onclick="updateGo(this.form)">
					</c:if>
				</form>
			</div>
		</section>
	</div>
</body>
</html>