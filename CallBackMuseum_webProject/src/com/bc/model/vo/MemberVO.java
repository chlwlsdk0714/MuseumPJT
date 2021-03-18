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
public class MemberVO {
	private String mem_id, mem_pwd, mem_name, mem_sex, mem_phone, 
			mem_cellphone, mem_email, mem_addr, mem_join_status;
		
	public String prefixPhone() {
		int dash = mem_phone.indexOf("-");
		return mem_phone.substring(0, dash);
	}
	
	public String bodyPhone() {
		int dash = mem_phone.indexOf("-");
		String body = mem_phone.substring(dash + 1); 
		return body;
	}

	public String prefixCellphone() {
		int dash = mem_cellphone.indexOf("-");
		return mem_cellphone.substring(0, dash);
	}
	
	public String bodyCellphone() {
		int dash = mem_cellphone.indexOf("-");
		return mem_cellphone.substring(dash + 1);
	}
}
