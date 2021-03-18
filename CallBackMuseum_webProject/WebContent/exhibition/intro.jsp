<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미술관소개</title>
<link rel="stylesheet" type="text/css" href="css/intro.css"/>
</head>
<script>
	function goDetail(idx) {
		location.href="../exhibition/detail?idx=" + idx;
	}
</script>
<body>
		<div class="divTitle">
		<h2 class="title"><span>현재 전시</span></h2>
		</div>
		<div class="nowList">	
			<table class="now-table">
			<c:forEach var="list" items="${listArray}" varStatus="status">
				<tr>
				<c:forEach var="vo" items="${status.current}">				
					<c:if test="${vo.exhib_idx > 200 }">
					<td class="td-img" onclick="goDetail('${vo.exhib_idx}')">
						<img width="350" height="450" src="${pageContext.request.contextPath }/exhibition/images/${vo.exhib_thumb_path}" alt="thumbnail">
					</td>
					</c:if>		
					
					<c:if test="${vo.exhib_idx < 200 }">
					<td class="td-img" onclick="goDetail('${vo.exhib_idx}')">
						<img width="350" height="450" src=${vo.exhib_thumb_path } alt="thumbnail">
					</td>
					</c:if>	
				</c:forEach>
				</tr>
				<tr>
				<c:forEach var="vo" items="${status.current}">
					<td class="td-subject" onclick="goDetail('${vo.exhib_idx}')">
						${vo.exhib_subject }
					</td>
				</c:forEach>
				</tr>
				<tr>
				<c:forEach var="vo" items="${status.current}">
					<td class="td-date">
						${vo.getStartString() }-${vo.getEndString() }
					</td>
				</c:forEach>
				</tr>
			</c:forEach>
			</table>
		</div>
		
		<div class="info">
			<div class="divTitle">
			<h2 class="title"><span>콜백뮤지엄 방문</span></h2>
			</div>
			<div class="visit">
				<span class="addr">주소 : 서울특별시 서초구 강남대로 459 백암빌딩 1층 TEL:02)3486-9600</span><br>
				<img class="roadImg" style="width:600px; height:400px;"  src="../exhibition/images/location1.png" alt="위치지도"><br>
			</div>
			<div class="way">
				<h3>&nbsp;&nbsp;찾아오시는 길</h3>
				<p>&nbsp;&nbsp;버스 : 하차) 신논현역, (구)교보타워 사거리 / 신논현역, 씨티은행</p>
				<p>&nbsp;&nbsp;지하철 : 신논현역 9호선 6번출구 - 강남역 방향 도보 3분 <br>&nbsp;&nbsp;* 주차가 불가능하오니 대중교통을 이용해 주시기 바랍니다.</p>
				<hr>
				<h3 class="line">&nbsp;&nbsp;관람시간</h3>
				<p>&nbsp;&nbsp;오후 12시 - 오후 7시 매주 월요일 휴관(신정, 구정, 추석 연휴 휴관)</p>
				<hr>
				<h3 class="line">&nbsp;&nbsp;관람요금</h3>
				<p>&nbsp;&nbsp;별도 공지시까지 무료 입장</p><br>
			</div>
		</div><br>
		<div class="brochure">
			<form action="../exhibition/brochure" method="post">
			<div class="divTitle">
			<h2 class="title" id="brochure-title">브로슈어 다운로드</h2>
			</div>
			
			<div class="download">
				<p>년도&nbsp;:&nbsp;</p>
					<select name="brochure" id="year">
						<option value="default">선택</option>
						<option value="brochure_kr_2020.pdf">2020</option>
						<option value="brochure_kr_2019.pdf">2019</option>
						<option value="brochure_kr_2018.pdf">2018</option>
					</select>
					<input type="submit" value="다운로드">
			</div>
			</form>
		</div>

</body>
</html>