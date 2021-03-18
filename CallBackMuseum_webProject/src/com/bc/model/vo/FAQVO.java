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
public class FAQVO {
	private int faq_idx;
	private String faq_category;
	private String faq_question;
	private String faq_answer;
	private String faq_del_status;

}
