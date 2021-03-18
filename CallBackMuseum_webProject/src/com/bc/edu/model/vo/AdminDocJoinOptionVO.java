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
public class AdminDocJoinOptionVO {
	public String edu_idx;
	public String edu_name;
	public String edu_detidx;
	public String edu_impt_contents;
}
