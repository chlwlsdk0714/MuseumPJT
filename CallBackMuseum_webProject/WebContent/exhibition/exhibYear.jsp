<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기간별 전시 조회 페이지 (현재,과거,예정)</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/exhibYear.css"/>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	$(function(){
		/* $("#nowBtn").click(function(){
			getList(1); 
			$("#nowBtn").toggle();
		});
		 */
		$("#twentyBtn").click(function(){
			getList(2);
			$("#twenty").toggle();
		});
		
		$("#nineTeenBtn").click(function(){
			getList(3);
			$("#nineTeen").toggle();
		});
		
		$("#eightTeenBtn").click(function(){
			getList(4);
			$("#eightTeen").toggle();
		});
		
		$("#futureBtn").click(function(){ //예정전시
			getList(5); 
			$("#future").toggle();
		});
		
	}); 
	
	function makeLi(param){ 
		//console.log(param);
		let li = "";
		li += "<div><a href='detail?idx="+ param.exhib_idx +"'>";
		li += "<table>" ;
		
		//파일 이름이 http로 시작하지 않으면 으로 분기처리
		if(param.exhib_thumb_path.includes('http')) {
			li += "<tr><th><img width=250 height=325 src=" + param.exhib_thumb_path + "></th></tr>"; //여기엔 this가 어딨니.param이라는 변수에 얘네 값을 넣어서.
		} else {
			li += "<tr><th><img width=250 height=325 src=" + "\"${pageContext.request.contextPath}/exhibition/images/" + param.exhib_thumb_path + "\"" + "></th></tr>";
		}
		//console.log(param.exhib_thumb_path);
		li += "<tr><th>" + param.exhib_subject + "</th></tr>";
		li += "<tr><th>" + param.getStartString +"-"+ param.getEndString + "</th></tr>";
		li += "</table>" ;
		li += "</a></div>";
		
		return li;
	}
	
	function getList(type){
		$.ajax("../exhibition/year", {
			method : "get",
			dataType : "json", 
			success : function(data){
				console.log(data);
				//alert("ajax 처리 성공");
				var li = "";
				var alist = data.list;
				var today = new Date();
				$.each(alist, function(index, exhibition){ //jQuery.each(array, callback)
					let ymd = this.getStartString.split("/"); //->ex) "20/02/02"
					let start = new Date("20" + ymd[0], ymd[1]-1, ymd[2]); //달은 0부터 시작이니까 -1해주기!
					ymd = this.getEndString.split("/");
					let end = new Date("20" + ymd[0], ymd[1]-1, ymd[2]);
					
					let frontNum = (this.getStartString).substring(0,2);
					//console.log(frontNum);
					if(type === 1){ //현재전시리스트 //2021년
						if(start < today && end > today){
							li += makeLi(this);     //param이 this가 되는거야
						}
					} else if(type === 2){ //2020년 리스트
						if((end < today && frontNum == 20) || (end < today && frontNum == 21)) {
							li += makeLi(this);
						}
					} else if(type === 3) { //2019년 리스트
						if(end < today && frontNum == 19) {
							li += makeLi(this);
						}
					} else if(type === 4) { //2018년 리스트
						if(end < today && frontNum == 18) {
							li += makeLi(this);
						}
					} else if(type === 5) { //예정전시 2021년
						if(start > today && frontNum == 21) {
							li += makeLi(this);
						} 
					}
				});
				
				if(type===1) {
					$("#ul").html(li);
				} else if (type===2) {
					$("#twenty").html(li);
				} else if (type === 3) {
					$("#nineTeen").html(li);
				} else if (type === 4) {
					$("#eightTeen").html(li);
				} else if (type === 5) {
					$("#future").html(li);
				}
		
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("[예외발생] Ajax 처리실패!!! \n"
						+ "jqXHR.readyState :" + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
			}
			
		});
		
	}
	
</script>
</head>
<script>
	function goDetail(idx) {
		location.href="detail?idx=" + idx;
	}
</script>
<body>
	
	
	
	
	<div class="tabYear">
		<h1 class="title">전시</h1>
	</div>
	
	<c:if test="${sessionScope.login.mem_id eq 'admin' }">
	<button id="insertBtn" onclick="location.href='insertExhib.jsp'">작성</button>
	</c:if>
<form action="../exhibition/search" method="get" id="search-form">
	<div id="search-fin">
		<div id="search-box">
			<div class="search-item">
				<input type="text" name="exhib_subject" id="searchText" placeholder="전시명을 입력하세요." autocomplete="off" onfocus="this.value=''">
			</div>
			<div class="search-item">
				<a href="../exhibition/search"><i class="fas fa-search" id="search-icon"></i></a>
			</div>
		</div>
	</div>	
</form>
	<div id="now-div">
	<c:forEach var="vo" items="${list }">
		<form>
		<div id="search-rs">
			<table class="now-table">
				<c:if test="${vo.exhib_idx > '200' }">
				<tr>
					<td class="now-img" onclick="goDetail('${vo.exhib_idx}')">
						<img width="350" height="450" src="${pageContext.request.contextPath }/exhibition/images/${vo.exhib_thumb_path}">
					</td>
				</tr>
				</c:if>
				<c:if test="${vo.exhib_idx < '200' }">
				<tr>
					<td class="now-img" onclick="goDetail('${vo.exhib_idx}')">
						<img width="350" height="450" src="${vo.exhib_thumb_path }" alt="thumbnail">
					</td>
				</tr>
				</c:if>
				<tr>
					<td>${vo.exhib_subject }</td>
				</tr>	
				<tr>
					<td>${vo.getStartString() }-${vo.getEndString() }</td>
				</tr>	
			</table>
		</div>		
		</form>
	</c:forEach>
	</div>
	<div class="nowDiv">
		<table class="now-table">
			<c:forEach var="list" items="${listArray}" varStatus="status">
				
				<tr>
				<c:forEach var="vo" items="${status.current}">	
					<c:if test="${vo.exhib_idx > '200'}">
					<td class="td-img" onclick="goDetail('${vo.exhib_idx}')">
						<img width="350" height="450" src="${pageContext.request.contextPath }/exhibition/images/${vo.exhib_thumb_path}" alt="thumbnail">
					</td>
					</c:if>		
					
					<c:if test="${vo.exhib_idx < '200'}">
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
	<div class="tabYear">
		<h1 class="title">예정 전시</h1>
	</div>
	<div id="laterExhibition">
		<button id="futureBtn" class="year"><h3>2021~</h3></button>
			<div id="future">
			</div>
	</div>
	<div class="tabYear">
		<h1 class="title">과거 전시</h1>
	</div>
	<div id="pastExhibition">
				<button id="twentyBtn" class="year"><h3>2021,2020</h3></button>
				<div id="twenty">
				
				</div>
				<button id="nineTeenBtn" class="year"><h3>2019</h3></button>
				<div id="nineTeen">
				
				</div>
				<button id="eightTeenBtn" class="year"><h3>2018</h3></button>
				<div id="eightTeen">
				</div>
				
	</div>
	
</body>
</html>