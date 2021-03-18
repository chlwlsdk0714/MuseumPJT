package com.bc.edu.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDAOImpl;
import com.bc.edu.model.vo.EducationVO;

public class EduCommandServletImpl implements EduCommandServlet{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<EducationVO> list;
		try {
			list= new EduDAOImpl().exam();
			request.setAttribute("edulist", list);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return "eduadmin/education.jsp";
	}
	
}
