package com.bc.controller.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.command.news.ReviewCommentDeleteCommand;
import com.bc.command.news.ReviewCommentInsertCommand;
import com.bc.command.news.ReviewCommentUpdateCommand;
import com.bc.command.news.ReviewDeleteCommand;
import com.bc.command.news.ReviewDetailCommand;
import com.bc.command.news.ReviewInsertCommand;
import com.bc.command.news.ReviewUpdateCommand;

@WebServlet("/news/reviewController")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println(">> type : " + type);
		
		CommandServlet command = null;
		
		if ("detail".equals(type)) {
			command = new ReviewDetailCommand();
		}
		else if ("insertReview".equals(type)) {
			command = new ReviewInsertCommand();
		}
		else if ("updateReview".equals(type)) {
			command = new ReviewUpdateCommand();
		}
		else if ("updateReviewProc".equals(type)) {
			command = new ReviewUpdateCommand();
		}
		else if ("deleteReview".equals(type)) {
			command = new ReviewDeleteCommand();
		}
		else if ("insertComment".equals(type)) {
			command = new ReviewCommentInsertCommand();
		}
		else if ("updateComment".equals(type)) {
			command = new ReviewCommentUpdateCommand();
		}
		else if ("deleteComment".equals(type)) {
			command = new ReviewCommentDeleteCommand();
		}
		
		request.setCharacterEncoding("UTF-8");
		String path = command.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
