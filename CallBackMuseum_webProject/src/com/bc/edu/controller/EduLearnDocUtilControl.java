package com.bc.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduLearnDocDAO;
import com.bc.edu.model.vo.LearnDocumentsVO;

@WebServlet("/docutil")
public class EduLearnDocUtilControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 삭제 수정 페이지
		request.setCharacterEncoding("UTF-8");
		List<LearnDocumentsVO> ldVo = new EduLearnDocDAO().LnDocAllList();
		request.setAttribute("ldVo", ldVo);
		request.getRequestDispatcher("eduadmin/learnedudocumentupdatedelete.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
