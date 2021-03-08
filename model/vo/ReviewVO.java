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
public class ReviewVO {
	private int rev_idx;
	private String rev_category;
	private String rev_writer;
	private String rev_subject;
	private String rev_content;
	private String 	rev_write_date;
	private String rev_file_name;
	private String rev_ori_name;
	private int rev_hit;
	private String rev_del_status;
	private String comm_cnt;
	private String mem_name;
}
