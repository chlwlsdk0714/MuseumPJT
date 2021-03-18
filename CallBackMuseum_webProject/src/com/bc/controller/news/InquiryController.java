package com.bc.controller.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.command.news.CommentCommand;
import com.bc.command.news.CommentDelete;
import com.bc.command.news.InquiryCommand;
import com.bc.command.news.InquiryDeleteCommand;
import com.bc.command.news.InquiryDetailCommand;
import com.bc.command.news.InquiryInsertCommand;
import com.bc.command.news.InquiryListCommand;
import com.bc.command.news.InquiryModifyCommand;
import com.bc.command.news.ModifyCompleteCommand;
import com.bc.command.news.SendRedirectException;

@WebServlet("/news/inquiryController")
public class InquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println("inquiry type : " + type);
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		CommandServlet Csl = null;
		
		try {
			
			if("insert".equals(type)) {
				Csl = new InquiryInsertCommand();
			}
			else if ("inquiry".equals(type)) {
				Csl = new InquiryCommand(); 
			}
			else if("inquiryList".equals(type)) {
				Csl = new InquiryListCommand();
			}
			else if("inquiryDetail".equals(type)) {
				Csl = new InquiryDetailCommand();
			}
			else if("inquiryModify".equals(type)) {
				Csl = new InquiryModifyCommand();
			}
			else if("ModifyComplete".equals(type)) {
				Csl = new ModifyCompleteCommand();
			}
			else if("inquiryDelete".equals(type)) {
				Csl = new InquiryDeleteCommand();
			}
			else if("comment".equals(type)) {
				Csl = new CommentCommand();
			}
			else if ("commentDelete".equals(type)) {
				Csl = new CommentDelete();
			}
			
			String path = Csl.execute(request, response);
			System.out.println("path 의 주소는?: " + path);
			request.getRequestDispatcher(path).forward(request, response);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
			response.sendRedirect("../member/join?type=login");
		} catch (SendRedirectException e) {
			response.sendRedirect(e.getPath());			
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 데이터 주고받을 때 한글깨짐 방지처리
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
