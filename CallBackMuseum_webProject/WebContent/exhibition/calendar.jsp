<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="css/calendar.css" />
</head>
<script>
	function goDetail(idx) {
		location.href = "detail?idx=" + idx;
	}
	
	function msg(frm){
		let start  = document.getElementById('start').value.split("-");
		start = start[0] + start[1] + start[2];
		let end = document.getElementById('end').value.split("-");
		end = end[0] + end[1] + end[2]
		if(start > end) {
			alert("시작일을 종료일 이전으로 선택해주세요.");
			return;
		} else {
			frm.action = "../exhibition/CalResult";
			frm.submit();
		}
		
	}
	
</script>
<body>
	<div class="all">
	<div class="calendar-titleDiv">
		<h1 class="calendar-title">
			<a href="../exhibition/calendar">캘린더</a>
		</h1>
	</div>
	<div class="calendar-form">
		<form name="calForm" >
			<div class="cal-input">
			<input type="date" name="startDate" id="start" min="2018-01-01" max="2021-12-31" value="${exhib_period_start }" >부터&nbsp;&nbsp;
			<input type="date" name="endDate" id="end" min="2018-01-01" max="2021-12-31" value="${exhib_period_end }">까지&nbsp;&nbsp;
			<input type="button" value="검색" onclick="msg(this.form)">
			</div>
		</form>
	</div>
	<div class="calendar-result">
		<div class="title-div">
			<h2 class="title">전시</h2>
		</div>
		<div class="plus">
			<h4><a href="../exhibition/period">현재전시 더보기</a><i class="fas fa-plus"></i></h4>
		</div>
		<div class="cal-now-div">
			<c:forEach var="vo" items="${list }">
				<div class="cal-now-div2">
					<table class="calendar-now-tb">
						<tr>
							<td class="cal-img" onclick="goDetail('${vo.exhib_idx}')"><img width="325"
								height="425" src="${vo.exhib_thumb_path }" alt="thumbnail">
							</td>
						</tr>
						<tr>
							<td>${vo.exhib_subject }</td>
						</tr>
						<tr>
							<td>${vo.getStartString() }-${vo.getEndString() }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		<c:if test="${empty check }">
			<c:if test="${empty calList}">
				<h4 style="text-align: center;">검색결과가 없습니다.</h4>
			</c:if>
		</c:if>
		<div class="cal-rs-div">
			<c:if test="${not empty calList }">
			<c:forEach var="calvo" items="${calList }">
				<div class="cal-rs1-div">
					<table class="calendar-result-tb">
						<tr>
							<td class="cal-img" onclick="goDetail('${calvo.exhib_idx}')"><img
								width="350" height="450" src="${calvo.exhib_thumb_path }"
								alt="thumbnail"></td>
						</tr>
						<tr onclick="goDetail('${calvo.exhib_idx}')">
							<td>${calvo.exhib_subject }</td>
						</tr>
						<tr>
							<td>${calvo.getStartString() }-${calvo.getEndString() }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
	</div>
</body>
</html>