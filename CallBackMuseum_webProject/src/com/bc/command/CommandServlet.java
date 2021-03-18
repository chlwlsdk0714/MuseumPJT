package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandServlet {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	/*
	 * 서블릿 매개변수 받는 인터페이스
	 */
}
