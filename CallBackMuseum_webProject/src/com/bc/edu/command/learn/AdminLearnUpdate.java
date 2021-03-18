package com.bc.edu.command.learn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDAOImpl;
import com.bc.edu.model.dao.EduDetImpl;
import com.bc.edu.model.vo.DetailEducationVO;
import com.bc.edu.model.vo.EducationVO;

public class AdminLearnUpdate implements LearnCommandServlet{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			DetailEducationVO devo = new EduDetImpl().detailMenu(request.getParameter("eduleancheck"));
			request.setAttribute("detvo", devo);
			List<EducationVO> list = new EduDAOImpl().exam();
			request.setAttribute("edlist", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "eduadmin/adminlearnupdate.jsp";
	}
}
