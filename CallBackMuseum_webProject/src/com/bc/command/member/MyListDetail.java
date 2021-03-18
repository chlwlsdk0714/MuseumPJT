package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;
import com.bc.model.vo.InquiryVO;

public class MyListDetail implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getSession().getAttribute("login")  == null) { 
			return "logMenu.jsp?msg=로그인을+해주세요";
		}
		System.out.println(request.getSession().getAttribute("login"));
		
		String idx = request.getParameter("inq_idx");
		
		InquiryVO ivo = InquiryDAO.findByInqnum(idx);
		
		if (ivo != null) {
			ivo = InquiryDAO.findByInqnum(idx);
			request.getSession().setAttribute("listvo", ivo);
			System.out.println("ivo불러왔습니까?");
			return "mylistDetail.jsp";
		} else {
			System.out.println("ivo못불러왔읍니까?");
			return "mylist.jsp";
		}
	}
}