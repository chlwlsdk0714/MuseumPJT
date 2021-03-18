package com.bc.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class InquiryVO {
	private int inq_num, inq_del_status;
	private String inq_category_idx, inq_category, inq_subject, inq_content, inq_writer,
			 inq_date, inq_admin_writer, inq_answer, inq_ans_date;
	
	public void setCategoryWithIdx(String idx) {
		this.inq_category_idx = idx;
		if(inq_category_idx.equals("01")) {
			this.inq_category = "일반";
		} else if (inq_category_idx.equals("02")) {
			this.inq_category =  "전시";
		} else if (inq_category_idx.equals("03")) {
			this.inq_category = "교육";
		} else if (inq_category_idx.equals("04")) {
			this.inq_category = "홈페이지";
		} else if (inq_category_idx.equals("05")) {
			this.inq_category = "예약";
		} else if (inq_category_idx.equals("06")) {
			this.inq_category = "홍보";
		} else if (inq_category_idx.equals("07")) {
			this.inq_category = "대관";
		} else if (inq_category_idx.equals("08")) {
			this.inq_category = "기타문의";
		}
	}
}
