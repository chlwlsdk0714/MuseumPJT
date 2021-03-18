package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.vo.InquiryVO;
import com.bc.model.vo.MemberVO;

public class InquiryModifyCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		InquiryVO vo = (InquiryVO)request.getSession().getAttribute("ivo");
		if (mvo == null) {
			System.out.println("mvo없댱");
			throw new IllegalStateException("mvo가 없어");
		}
		System.out.println(mvo);
		System.out.println(vo);
		
		//String idx = request.getParameter("inq_idx");
		
		if (vo != null) {
			//vo = InquiryDAO.findByInqnum(idx);
			//request.getSession().setAttribute("ivo", vo);
			System.out.println("불러왔으까?");
			return "inquiryModify.jsp";
		} else {
			System.out.println("못불러왔..다?");
			return "inquiryDetail.jsp";
		}
	}
}
