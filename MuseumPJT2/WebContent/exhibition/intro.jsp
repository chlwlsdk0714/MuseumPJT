<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미술관소개</title>
<style>
	li {
		list-style: none;
		text-align:left;
	}
	a {text-decoration: none;}
	#br_year {display: inline;}
	.divTitle {display: flex; padding-left:30px; padding-top:20px;}
	.title {
		border-top: 1px solid #303030;
		padding-top: 0.225em;}
	.list {display: inline;}
	.visit {
		padding-left: 30px;
		float: left;
		}
	.info {height:530px;}	
	.line {border-bottom: 1px solid #303030; }
	
	/*----------------테이블 관련-------------------*/
	
	.now-table {
		border-collapse: collapse;
		width: 50%;
		margin:auto;
	}
	.now-table td {
		width: 300px;
		padding: 10px 50px;
	}
	.td-subject {
		font-size: 1.2em;
		font-weight: 600;
	}
	.td-img {
		text-align: center;
	}
	.td-img:hover, .td-subject:hover {
		cursor: pointer;
	}
	.td-date {
		border-top: 2px solid #606060;
	}
	
</style>
</head>
<script>
	function goDetail(idx) {
		location.href="../exhibition/detail?idx=" + idx;
	}
</script>
<body>
	<h1 style="border:1px solid #111; background-color: #111; color:lightgray;">header입니다</h1>
	
	
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
				<p class="line">&nbsp;&nbsp;지하철 : 신논현역 9호선 6번출구 - 강남역 방향 도보 3분 <br>&nbsp;&nbsp;* 주차가 불가능하오니 대중교통을 이용해 주시기 바랍니다.</p>
				<h3>&nbsp;&nbsp;관람시간</h3>
				<p class="line">&nbsp;&nbsp;오후 12시 - 오후 7시 매주 월요일 휴관(신정, 구정, 추석 연휴 휴관)</p>
				<h3>&nbsp;&nbsp;관람요금</h3>
				<p>&nbsp;&nbsp;별도 공지시까지 무료 입장</p><br>
			</div>
		</div><br>
		<div class="brochure">
			<form>
			<div class="divTitle">
			<h2 id="br_start"><span>브로슈어 다운로드</span></h2>
			</div>
			
			<div class="download">
				<div id="br_year">년도&nbsp;:&nbsp;</div>
					<select name="year" id="year" onChange="download(this.value)">
						<option value="default">선택</option>
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
					</select>
					<a href="exhibition/brochure/brochure_kr_2017.pdf" download>다운로드</a>
			</div>
			</form>
		</div>

	<%@ include file="../common/include/footer.jsp" %>
</body>
</html>