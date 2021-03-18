package com.bc.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDAOImpl;
import com.bc.edu.model.dao.EduDetImpl;
import com.bc.edu.model.dao.EduLearnDocDAO;
import com.bc.edu.model.vo.DetailEducationVO;
import com.bc.edu.model.vo.EducationVO;
import com.bc.edu.model.vo.LearnDocumentsVO;

@WebServlet("/docupdate")
public class EduLearnDocInsertUpdateControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String idx = request.getParameter("eduleancheck");
		LearnDocumentsVO ldVo = new EduLearnDocDAO().pickAllList(idx);
		List<DetailEducationVO> list = new EduDetImpl().detailEdu();
		request.setAttribute("detlist", list);
		List<EducationVO> edulist;
		try {
			edulist = new EduDAOImpl().exam();
			request.setAttribute("edulist", edulist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("ldVo", ldVo);
		request.setAttribute("detidx", ldVo.getEdu_detidx());
		request.setAttribute("eduidx", ldVo.getEdu_idx());
		request.getRequestDispatcher("eduadmin/learnedudocumentupdatewrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
