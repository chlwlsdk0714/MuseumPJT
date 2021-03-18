package com.bc.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;


public class ExhibVO {
	private int exhib_idx; 
	private String exhib_subject,
		exhib_venue, exhib_artist, exhib_artworks_cnt, exhib_admission, 
		exhib_organization,exhib_content, exhib_thumb_path;
	
	private Date  exhib_period_start, exhib_period_end;
	
	//날짜비교를 위한 메소드
	public boolean isLargerThanToday() {
		Date today = new Date();
		/*
		 if(exhib_period_start.getTime() < today.getTime() &&
		 exhib_period_end.getTime() > today.getTime() ) {
		 }
		 */
		//return exhib_period_start.getTime() > today.getTime();
		return exhib_period_start.getTime() <= today.getTime() 
				&& exhib_period_end.getTime() > today.getTime();
	}

	//날짜 표시 방식 바꾸기(날짜 문자열 출력)
	public String getStartString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		//String start = sdf.format(this.exhib_period_start);
		//System.out.println("start : " + start);
		return sdf.format(exhib_period_start);
	}
	
	public String getEndString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		return sdf.format(exhib_period_end);
	}
	
	public ExhibVO() { }

	public int getExhib_idx() {
		return exhib_idx;
	}

	public void setExhib_idx(int exhib_idx) {
		this.exhib_idx = exhib_idx;
	}

	public String getExhib_subject() {
		return exhib_subject;
	}

	public void setExhib_subject(String exhib_subject) {
		this.exhib_subject = exhib_subject;
	}

	public Date getExhib_period_start() {
		return exhib_period_start;
	}

	public void setExhib_period_start(Date exhib_period_start) {
		this.exhib_period_start = exhib_period_start;
	}

	public Date getExhib_period_end() {
		return exhib_period_end;
	}

	public void setExhib_period_end(Date exhib_period_end) {
		this.exhib_period_end = exhib_period_end;
	}

	public String getExhib_venue() {
		return exhib_venue;
	}

	public void setExhib_venue(String exhib_venue) {
		this.exhib_venue = exhib_venue;
	}

	public String getExhib_artist() {
		return exhib_artist;
	}

	public void setExhib_artist(String exhib_artist) {
		this.exhib_artist = exhib_artist;
	}

	public String getExhib_artworks_cnt() {
		return exhib_artworks_cnt;
	}

	public void setExhib_artworks_cnt(String exhib_artworks_cnt) {
		this.exhib_artworks_cnt = exhib_artworks_cnt;
	}

	public String getExhib_admission() {
		return exhib_admission;
	}

	public void setExhib_admission(String exhib_admission) {
		this.exhib_admission = exhib_admission;
	}

	public String getExhib_organization() {
		return exhib_organization;
	}

	public void setExhib_organization(String exhib_organization) {
		this.exhib_organization = exhib_organization;
	}

	public String getExhib_content() {
		return exhib_content;
	}

	public void setExhib_content(String exhib_content) {
		this.exhib_content = exhib_content;
	}

	public String getExhib_thumb_path() {
		return exhib_thumb_path;
	}

	public void setExhib_thumb_path(String exhib_thumb_path) {
		this.exhib_thumb_path = exhib_thumb_path;
	}

	@Override
	public String toString() {
		return "exhibVo [exhib_idx=" + exhib_idx + ", exhib_subject=" + exhib_subject + ", exhib_period_start="
				+ exhib_period_start + ", exhib_period_end=" + exhib_period_end + ", exhib_venue=" + exhib_venue
				+ ", exhib_artist=" + exhib_artist + ", exhib_artworks_cnt=" + exhib_artworks_cnt + ", exhib_admission="
				+ exhib_admission + ", exhib_organization=" + exhib_organization + ", exhib_content=" + exhib_content
				+ ", exhib_thumb_path=" + exhib_thumb_path + "]";
	}
	
	
}
