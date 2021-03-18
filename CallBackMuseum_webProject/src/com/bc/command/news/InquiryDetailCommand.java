package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;
import com.bc.model.vo.InquiryVO;
import com.bc.model.vo.MemberVO;

public class InquiryDetailCommand implements CommandServlet{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		if (mvo == null) {
			System.out.println("mvo가 없..다");
			throw new IllegalStateException("mvo가 없떠");
		}
		System.out.println(mvo);
		
		String idx = request.getParameter("inq_idx");
		//String page = request.getParameter("cPage");
		
		InquiryVO ivo = InquiryDAO.findByInqnum(idx);
		
		if (ivo != null) {
			ivo = InquiryDAO.findByInqnum(idx);
			request.getSession().setAttribute("ivo", ivo);
			System.out.println("불러왔으까?");
			return "inquiryDetail.jsp";
		} else {
			System.out.println("못불러왔으까?");
			return "inquiryList.jsp";
		}
	}
}
