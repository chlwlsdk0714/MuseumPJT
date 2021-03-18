package com.bc.edu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.command.learn.AdminLearnDeleteUpate;
import com.bc.edu.command.learn.AdminLearnInsert;
import com.bc.edu.command.learn.AdminLearnUpdate;
import com.bc.edu.command.learn.LearnCommandServlet;

@WebServlet("/learnUtil")
public class AdminLearnUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("paramUtil");
		LearnCommandServlet Lcs = null;
		System.out.println("param" + param);
		if("learnInsert".equals(param)) {
			Lcs = new AdminLearnInsert();
		} else if("learnUpdate".equals(param)) {
			Lcs = new AdminLearnDeleteUpate();
		} else if("learnDelete".equals(param)) {
			Lcs = new AdminLearnDeleteUpate();
		} else if("updateEdu".equals(param)) {
			Lcs = new AdminLearnUpdate();
		}
		
		String path = Lcs.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
