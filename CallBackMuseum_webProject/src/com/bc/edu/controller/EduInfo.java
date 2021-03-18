package com.bc.edu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.command.EduCommandServlet;
import com.bc.edu.command.EduCommandServletImpl;
import com.bc.edu.command.ProCommandImpl;

@WebServlet("/education")
public class EduInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		EduCommandServlet Csl = null;
		
		String path = "";
		if("edumain".equals(param) || param == null) {
			Csl = new EduCommandServletImpl();
		} else {
			path = new ProCommandImpl().listpag(request, response);
		}
		if("".equals(path)) {
			path = Csl.execute(request, response);
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
