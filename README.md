## Project title
 CallBackMuseum

## Motivation
### 미술관 웹사이트 만들기

#### 웹사이트 존재 목적
**1. 미술관에서 오픈하는 전시 홍보**   
~~2. 전시 티켓 예매 서비스~~   
3. 전시에 대한 후기 감상 가능   
4. 회원가입시 이용 내역 확인 가능   
5. 미술관 교육참여프로그램 홍보   
6. 교육 자료 배포   
7. 공지를 통해 새소식 알리기   
8. 이용자가 웹사이트를 통해 문의할 수 있음(소통창구)   

## Screenshots
Include logo/demo screenshot etc.

## Features
* ajax를 활용하여 전시리스트 조회하기
* 전시리스트 페이징처리로 화면에 출력하기

## Code Example
* ajax를 활용하여 전시리스트 조회하기

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
			li += "<tr><th><img width=250 height=325 src=" + param.exhib_thumb_path + "></th></tr>"; 
		} else {
			li += "<tr><th><img width=250 height=325 src=" + "\"${pageContext.request.contextPath}/exhibition/images/" + param.exhib_thumb_path + "\"" + ">
			</th></tr>";
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
							li += makeLi(this);    
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

* 전시리스트 페이징처리로 화면에 출력하기
<pre><code>
@WebServlet("/exhibition/period")
public class PeriodController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 시작");
		
		int totalRecord = ExhibitionDAO.getTotalRecord();
		int nowPage = 1;
		
		ExhibPagingVO pvo = new ExhibPagingVO();
		pvo.setNumPerPage(4);
		pvo.setPagePerBlock(10);
		pvo.setPaging(nowPage, totalRecord);
		int totalPage = pvo.getTotalPage();
		
		List<ExhibVO> list = null;
		List<List<ExhibVO>> listArray = new ArrayList<>();
		
		for (int i = nowPage; i <= totalPage; i++) {
			Map<String, Integer> map = new HashMap<>();
			pvo.setPaging(i, totalRecord);
			map.put("begin", pvo.getBegin());
			map.put("end", pvo.getEnd());
			list = ExhibitionDAO.getPaging(map);
			if (list != null) {
				listArray.add(list);				
			}
		}
		
		System.out.println();
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("listArray", listArray);
			
				
		//응답페이지로 위임처리
		request.getRequestDispatcher("exhibYear.jsp").forward(request, response);
		System.out.println("doGet 끝");
	}
	
}
</code></pre>   
<hr/>
-페이징 처리를 위한 VO
<pre><code>
package com.bc.model.vo;

public class ExhibPagingVO {

	// 기본 세팅값 (변하지 않음)
	private int numPerPage = 5; //하나의 페이지에 표시할 게시글 수
	private int pagePerBlock = 5; //블록당 표시하는 페이지 갯수

	// 유동적인 필드 
	private int nowPage = 1; //현재페이지, 디폴트값이 1이다.
	private int nowBlock = 1; //현재 블록(페이지 담는 단위), 디폴트값 1
	
	private int totalRecord = 0; //총 게시물 갯수(원본 게시글 수)
	private int totalPage = 0; //전체 페이지 갯수
	private int totalBlock = 0; //전체 블록 갯수
	
	private int begin = 0; //현재 페이지상의 시작 글번호 e.g) 1, 4, 7, ...
	private int end = 0; //현재 페이지상의 마지막 글번호 eg) 3, 6, 9, ...
	
	private int beginPage = 0; //현재 블록의 시작 페이지 번호 . 그니까 총 글의 개수가 만약 13개다-> 페이지 번호는 1부터 5까지
	private int endPage = 0; //현재 블록의 끝 페이지 번호 
	
	
	public ExhibPagingVO() { }
	
	// 현재 페이지와 총 게시물 개수를 파라미터로 가지는 생성자를 호출하면 모든 값이 한 번에 세팅되도록!
	public ExhibPagingVO(int nowPage, int totalRecord) {
		// nowPage
		this.nowPage = nowPage;
		
		// nowBlock
		nowBlock = (nowPage + pagePerBlock - 1) / pagePerBlock;
		
		// totalRecord
		this.totalRecord = totalRecord;
		
		// totalPage
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage > 0) totalPage++;
		
		// totalBlock
		totalBlock = totalPage / pagePerBlock;
		if (totalPage % pagePerBlock > 0) totalBlock++;
		
		// begin
		begin = numPerPage * (nowPage - 1) + 1;
		
		// end
		end = begin + numPerPage - 1;
		
		
		// beginPage
		beginPage = pagePerBlock * (nowBlock - 1) + 1;
		
		// endPage
		endPage = beginPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
	
	public void setPaging(int nowPage, int totalRecord) {
		// nowPage
		this.nowPage = nowPage;
		
		// nowBlock
		nowBlock = (nowPage + pagePerBlock - 1) / pagePerBlock;
		
		// totalRecord
		this.totalRecord = totalRecord;
		
		// totalPage
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage > 0) totalPage++;
		
		// totalBlock
		totalBlock = totalPage / pagePerBlock;
		if (totalPage % pagePerBlock > 0) totalBlock++;
		
		// begin
		begin = numPerPage * (nowPage - 1) + 1;
		
		// end
		end = begin + numPerPage - 1;
		
		
		// beginPage
		beginPage = pagePerBlock * (nowBlock - 1) + 1;
		
		// endPage
		endPage = beginPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
</code></pre>


## How to use?
1.main.jsp에서 서버를 작동시킨다.   
2.상단 네비바에 있는 Exhibition 가서 뮤지엄 소개를 클릭한다.   
3.뮤지엄 소개 페이지에서 현재 전시 리스트를 볼 수 있다.   
4.같은 페이지 하단으로 가면 연도별 브로슈어를 다운받을 수 있다.   
5.다시 네비바에서 캘린더를 클릭한다.   
6.캘린더 페이지에선 사용자가 선택한 날짜에 해당하는 전시 리스트를 볼 수 있다.   
7.우측 '현재 전시 더보기'를 클릭하면 전시 페이지로 이동해 더 많은 현재 전시 목록을 볼 수 있다.   
8.네비바 Exhibition아래 전시페이지로 가면 현재 전시와 함께 예정전시, 연도별 과거전시 목록을 볼 수 있다.   
9.전시리스트를 볼 수 있는 페이지에서 썸네일을 누르면 각 전시에 해당하는 상세정보를 볼 수 있다.   



