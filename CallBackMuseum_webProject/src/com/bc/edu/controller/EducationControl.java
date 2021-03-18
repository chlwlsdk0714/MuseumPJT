package com.bc.edu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.command.EduCommandServlet;
import com.bc.edu.command.LeanDetail;

@WebServlet("/lean")
public class EducationControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		// param이 idx 번호에 따라 리스트 뿌려주기
		if(param == null || param.equals("")) {
			response.sendRedirect("error.jsp");
		} else {
			EduCommandServlet Csl = null;
			Csl = new LeanDetail();
			
			String path = Csl.execute(request, response);
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
