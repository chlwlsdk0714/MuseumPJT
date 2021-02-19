package com.bc.model.dto;

public class DTO {
	int exhib_idx;
	String exhib_thumb_path;
	String exhib_subject;
	String getStartString;
	String getEndString;
	
	public DTO(int exhib_idx, String exhib_thumb_path, String exhib_subject, String getStartString,
			String getEndString) {
		this.exhib_idx = exhib_idx;
		this.exhib_thumb_path = exhib_thumb_path;
		this.exhib_subject = exhib_subject;
		this.getStartString = getStartString;
		this.getEndString = getEndString;
	}	
}
