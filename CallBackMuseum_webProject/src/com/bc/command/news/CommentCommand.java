package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;

public class CommentCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String admin = request.getParameter("admin");
		String content = request.getParameter("content");
		Integer inq_num = Integer.parseInt(request.getParameter("inq_num")); 
		System.out.println("admin" + admin);
		System.out.println("content" + content);
		System.out.println("inq_num: " + inq_num);
		
		InquiryDAO.appendComment(admin, content, inq_num);
		
		throw new SendRedirectException("inquiryController?type=inquiryDetail&inq_idx=" + inq_num);
	}

}
