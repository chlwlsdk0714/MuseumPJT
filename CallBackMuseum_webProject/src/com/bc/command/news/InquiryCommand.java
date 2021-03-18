package com.bc.command.news;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.vo.MemberVO;


public class InquiryCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = "";
		////// 관리자일 경우 문의하기페이지 건너뛰고 리스트로 보내기
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		
		if(mvo.getMem_id().equals("admin")) {
			path = "inquiryController?type=inquiryList";
		} else {
			path = "inquiry.jsp";
		}

		return path;
	}

}
