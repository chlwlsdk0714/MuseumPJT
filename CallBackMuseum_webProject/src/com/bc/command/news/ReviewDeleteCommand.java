package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.ReviewDAO;

public class ReviewDeleteCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rev_idx = request.getParameter("rev_idx");
		String cPage = request.getParameter("cPage");
		
		int result = ReviewDAO.delete(Integer.parseInt(rev_idx));
		String msg = "";
		if (result > 0) {
			msg = "삭제가+정상적으로+처리되었습니다.";
		} else {
			msg = "삭제+처리과정에서+문제가+발생하였습니다.+다시+시도해주십시오.";
		}
		
		request.setAttribute("cPage", cPage);
		
		return "newsController?type=review&msg=" + msg;
	}
}