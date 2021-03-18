package com.bc.edu.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDetImpl;
import com.bc.edu.model.vo.DetailEducationVO;

public class LeanDetail implements EduCommandServlet{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DetailEducationVO devo;
		// 교육 상세페이지
		try {
			devo = new EduDetImpl().detailMenu(request.getParameter("param"));
			request.setAttribute("devo", devo);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "eduadmin/leaneducation.jsp";
	}
}
