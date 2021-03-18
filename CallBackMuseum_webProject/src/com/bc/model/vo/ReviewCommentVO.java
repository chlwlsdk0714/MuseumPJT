package com.bc.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReviewCommentVO {
	
	private int rcom_idx;
	private String rcom_writer;
	private String rcom_content;
	private String rcom_write_date;
	private String rcom_ip;
	private int rev_idx;
	private String mem_name;

}
