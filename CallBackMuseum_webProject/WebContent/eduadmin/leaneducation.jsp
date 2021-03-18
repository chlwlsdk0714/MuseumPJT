<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lean</title>
<style>
	span{

     display: block;

}
</style>
</head>
<body>
	<div class="title_area">
		<h3 class="sub_title">
			<span>${devo.edu_target }</span>
		</h3>
	</div>
	<div class="sect_array">
		<aside class="left_sect3">
			<img src="${devo.edu_leanimglocal }"/>
		</aside>
		<div class="event_apply_title">
			<h4>
				${devo.edu_detailname} 
			</h4>
		</div>
		<div class="le-s1024">
			<table class="data_type1" border="">
				<tbody>
					<tr>
						<th scope="row">교육기간</th>
						<td>${devo.edu_period_start } ~ ${devo.edu_period_end }</td>
						<th scope="row">교육시간</th>
						<td>${devo.edu_detailtime }시간</td>
					</tr>
					<tr>
						<th scope="row">교육대상</th>
						<td>${devo.edu_detailtarget }</td>
						<th scope="row">교육비</th>
						<td>${devo.edu_price} 원</td>
					</tr>
					<tr>
						<th scope="row">교육장소</th>
						<td>${devo.edu_detailaddr}</td>
						<th scope="row" class="contact_num">문의</th>
						<td class="contact_num">미술관교육과 ${devo.edu_phone }(09~18시, 월~금)</td>
					</tr>
					<tr>
						<td>
							<a href="buylean">교육예매하기</a>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>
	</div>


</body>
</html>