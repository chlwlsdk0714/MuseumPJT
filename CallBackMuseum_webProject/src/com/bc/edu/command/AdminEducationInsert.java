package com.bc.edu.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminEducationInsert implements EduCommandServlet{
	// insert page command
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "eduadmin/admininsert.jsp";
	}
	
}
