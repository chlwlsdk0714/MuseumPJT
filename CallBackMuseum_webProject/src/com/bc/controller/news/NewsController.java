package com.bc.controller.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.command.news.FAQCommand;
import com.bc.command.news.InquiryCommand;
import com.bc.command.news.NoticeCommand;
import com.bc.command.news.ReviewCommand;

@WebServlet("/news/newsController")
public class NewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println(">> type : " + type);
		
		CommandServlet command = null;
		
		if ("notice".equals(type)) {
			command = new NoticeCommand();
		}
		else if ("faq".equals(type)) {
			command = new FAQCommand();
		}
		else if ("inquiry".equals(type)) {
			command = new InquiryCommand();
		}
		else if ("review".equals(type)) {
			command = new ReviewCommand();
		}
		
		String path = command.execute(request, response);
		System.out.println("path: " + path);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
