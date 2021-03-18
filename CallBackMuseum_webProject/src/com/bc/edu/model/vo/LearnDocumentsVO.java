package com.bc.edu.model.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class LearnDocumentsVO {
	private String doc_idx;
	private String doc_text;
	private String doc_filename;
	private String doc_filelocal;
	private String doc_status;
	private String edu_period_start;
	private String edu_period_end;
	private String edu_impt_contents;
	private String edu_detidx;
	private String edu_idx;
	private String edu_name;
}
