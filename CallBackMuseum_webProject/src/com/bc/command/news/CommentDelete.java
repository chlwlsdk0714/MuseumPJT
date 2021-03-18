package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;

public class CommentDelete implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer inq_num = Integer.parseInt(request.getParameter("inq_num")); 
		InquiryDAO.delComment(inq_num);
		
		throw new SendRedirectException("inquiryController?type=inquiryDetail&inq_idx=" + inq_num);
	}

}
