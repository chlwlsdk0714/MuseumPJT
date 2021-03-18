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
public class EducationVO {
	private String edu_idx;
	private String edu_name;
	private String edu_title;
	private String edu_contents;
	private String edu_imglocal;
	private String edu_imgname;
	private String edu_status;
}
