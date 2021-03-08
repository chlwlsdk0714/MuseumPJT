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

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "Paging [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage=" + numPerPage
				+ ", pagePerBlock=" + pagePerBlock + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage
				+ ", totalBlock=" + totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + "]";
	}
	
}