package com.bc.edu.command.learndocu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LearnDocCommandServlet {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}
