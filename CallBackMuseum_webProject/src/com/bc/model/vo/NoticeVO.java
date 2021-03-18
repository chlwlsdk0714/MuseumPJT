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
public class NoticeVO {
	private int noti_idx;
	private String noti_writer;
	private String noti_subject;
	private String noti_content;
	private String noti_write_date;
	private int noti_hit;
	private String noti_del_status;
	private String mem_name;
}
