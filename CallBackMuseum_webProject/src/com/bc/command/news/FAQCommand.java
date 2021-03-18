package com.bc.command.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.FAQDAO;
import com.bc.model.vo.FAQVO;

public class FAQCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<FAQVO> list = FAQDAO.getAll();
		
		request.setAttribute("list", list);
		
		return "/news/faq.jsp";
	}

}
