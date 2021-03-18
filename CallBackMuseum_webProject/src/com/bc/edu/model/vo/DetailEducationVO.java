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
public class DetailEducationVO {
	private String edu_detidx;
	private String edu_target;
	private String edu_impt_contents;
	private String edu_detailaddr;
	private String edu_idx;
	private String edu_detailname;
	private String edu_price;
	private String edu_detailtarget;
	private String edu_period_start;
	private String edu_period_end;
	private String edu_detailtime;
	private String edu_phone;
	private String edu_leanimgname;
	private String edu_leanimglocal;
	private String edu_detailstatus;
}
