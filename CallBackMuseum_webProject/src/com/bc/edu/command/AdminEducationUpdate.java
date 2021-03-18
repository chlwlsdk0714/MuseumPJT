package com.bc.edu.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDAOImpl;
import com.bc.edu.model.vo.EducationVO;

public class AdminEducationUpdate implements EduCommandServlet {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EducationVO vo;
		try {
			vo = new EduDAOImpl().detailSelectIdx(request.getParameter("educheck"));
			request.setAttribute("eduvo", vo);
			System.out.println(request.getParameter("educheck"));
			System.out.println(vo + "나와리~나와라요~");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return "eduadmin/adminupdate.jsp";
	}
}
