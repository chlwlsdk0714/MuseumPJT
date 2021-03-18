package com.bc.controller.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.command.news.NoticeDeleteCommand;
import com.bc.command.news.NoticeDetailCommand;
import com.bc.command.news.NoticeInsertCommand;
import com.bc.command.news.NoticeSearchCommand;
import com.bc.command.news.NoticeUpdateCommand;

@WebServlet("/news/noticeController")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println(">> type : " + type);
		
		CommandServlet command = null;
		
		if ("detail".equals(type)) {
			command = new NoticeDetailCommand();
		}
		else if ("search".equals(type)) {
			command = new NoticeSearchCommand();
		}
		else if ("insert".equals(type)) {
			command = new NoticeInsertCommand();
		}
		else if ("update".equals(type)) {
			command = new NoticeUpdateCommand();
		}
		else if ("updateProc".equals(type)) {
			command = new NoticeUpdateCommand();
		}
		else if ("delete".equals(type)) {
			command = new NoticeDeleteCommand();
		}
		
		String path = command.execute(request, response);
		System.out.println("path: " + path);
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
