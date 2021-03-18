package com.bc.command.news;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;
import com.bc.model.vo.InquiryVO;
import com.bc.model.vo.MemberVO;

public class ModifyCompleteCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		if (mvo == null) {
			System.out.println("mvo없댱");
			throw new IllegalStateException("mvo가 없어");
		}

		InquiryVO ivo = (InquiryVO)request.getSession().getAttribute("ivo");
		ivo.setInq_category_idx(request.getParameter("inqCode"));
		ivo.setCategoryWithIdx(request.getParameter("inqCode"));
		ivo.setInq_subject(request.getParameter("subject"));
		ivo.setInq_content(request.getParameter("content"));
		System.out.println("ivo 현재상태: " + ivo);
		
		if (InquiryDAO.updateInq(ivo) > 0) {
			System.out.println("수정완료");
			request.getSession().setAttribute("ivo", ivo);
			throw new SendRedirectException("inquiryController?type=inquiryList");
		} else {
			System.out.println("수정실패");
			String failString = "수정처리가 실패했습니다";
			String fail = URLEncoder.encode(failString, "UTF-8");			
			throw new SendRedirectException("inquiryController?type=inquiryList?msg=" + fail);
		}
	}
}
