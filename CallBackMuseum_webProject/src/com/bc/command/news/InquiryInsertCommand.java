package com.bc.command.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;
import com.bc.model.vo.InquiryVO;
import com.bc.model.vo.MemberVO;

public class InquiryInsertCommand implements CommandServlet{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("login") == null) {
			return "../member/join?type=logout";
		}

		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		if (mvo == null) {
			System.out.println("mvo가 눌이에요");
			throw new IllegalStateException("mvo가 눌이에요");
		}
		System.out.println(mvo);
		String writer = mvo.getMem_name();
		String idx = request.getParameter("inqCode");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		InquiryVO ivo = new InquiryVO();
		
		ivo.setInq_writer(writer);
		ivo.setCategoryWithIdx(idx);
		ivo.setInq_subject(subject);
		ivo.setInq_content(content);
		ivo = InquiryDAO.writeInquiry(ivo);
		System.out.println(ivo);
		
		
		if (ivo != null) {
			List<InquiryVO> list = InquiryDAO.findbyWriter(writer);
			request.getSession().setAttribute("ivolist", list);
			System.out.println("입력성공");
			throw new SendRedirectException("../news/inquiryController?type=inquiryList");
		} else {
			System.out.println("실패");
			throw new SendRedirectException("../news/inquiryController?type=inquiryList");
		}
	}

}
