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

## How to use? & ## Screenshots  
##### 1.main.jsp에서 서버를 작동시킨다.   
2.상단 네비바에 있는 Exhibition 가서 뮤지엄 소개를 클릭한다.   
![스크린샷(4)](https://user-images.githubusercontent.com/73566078/110464285-4d3c6780-8116-11eb-9dee-594d2003f2b0.png)   
3.뮤지엄 소개 페이지에서 현재 전시 리스트를 볼 수 있다.   
![스크린샷(5)](https://user-images.githubusercontent.com/73566078/110464291-4e6d9480-8116-11eb-8971-1acb4c989ae6.png)   
4.같은 페이지 하단으로 가면 연도별 브로슈어를 다운받을 수 있다.   
![스크린샷(6)](https://user-images.githubusercontent.com/73566078/110464296-4f9ec180-8116-11eb-8cbe-5ef5e4a5d41c.png)   
5.다시 네비바에서 캘린더를 클릭한다.   
![스크린샷(7)](https://user-images.githubusercontent.com/73566078/110464305-5299b200-8116-11eb-8785-5be1e823a0d4.png)   
6.캘린더 페이지에선 사용자가 선택한 날짜에 해당하는 전시 리스트를 볼 수 있다.
7.우측 '현재 전시 더보기'를 클릭하면 전시 페이지로 이동해 더 많은 현재 전시 목록을 볼 수 있다.      
![스크린샷(8)](https://user-images.githubusercontent.com/73566078/110464310-54637580-8116-11eb-831d-da8c38b6f9f4.png) 

8. 검색어에 해당하는 전시 목록을 조회할 수 있다.
![스크린샷(10)](https://user-images.githubusercontent.com/73566078/110464316-56c5cf80-8116-11eb-85ac-d1c67efab1f3.png)
![스크린샷(11)](https://user-images.githubusercontent.com/73566078/110464326-59282980-8116-11eb-98e7-35722bea0e13.png)   
9.네비바 Exhibition아래 전시페이지로 가면 현재 전시와 함께 예정전시, 연도별 과거전시 목록을 볼 수 있다.   
![스크린샷(13)](https://user-images.githubusercontent.com/73566078/110465146-672a7a00-8117-11eb-9afc-e7a4dd7f7a92.png)

10.전시리스트를 볼 수 있는 페이지에서 썸네일을 누르면 각 전시에 해당하는 상세정보를 볼 수 있다.   
![스크린샷(12)](https://user-images.githubusercontent.com/73566078/110464336-5c231a00-8116-11eb-8278-7e016b26b48c.png)


## Features
* ajax를 활용하여 전시리스트 조회하기
* 전시리스트 페이징처리로 화면에 출력하기

## Code Example
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




   









