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


public class AdminLearnDeleteUpate implements LearnCommandServlet {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<DetailEducationVO> list;
		try {
			list = new EduDetImpl().detailEdu();
			request.setAttribute("learnlist", list);
			title(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return "eduadmin/adminlearndeleteupdate.jsp";
	}
	
	private void title(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<EducationVO> list;
		try {
			list = new EduDAOImpl().exam();
			request.setAttribute("edulist", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
