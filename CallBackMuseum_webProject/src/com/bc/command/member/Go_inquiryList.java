package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.command.news.SendRedirectException;

public class Go_inquiryList implements CommandServlet{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getSession().getAttribute("login")  == null) { 
			return "logMenu.jsp?msg=로그인을+해주세요";
		}
		throw new SendRedirectException("/news/inquiryController?type=inquiryList");
	}

}
