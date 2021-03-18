package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.ReviewCommentDAO;
import com.bc.model.vo.ReviewCommentVO;

public class ReviewCommentUpdateCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		String rcom_content = request.getParameter("editing-box");
		String rev_idx = request.getParameter("rev_idx");
		String idx = request.getParameter("rcom_idx");
		int rcom_idx = Integer.parseInt(idx);
		
		System.out.println("> rev_idx: " + idx + ", rcom_idx: " + rcom_idx);

		ReviewCommentVO rcvo = ReviewCommentDAO.getOne(rcom_idx);
		rcvo.setRcom_content(rcom_content);
		int result = ReviewCommentDAO.update(rcvo);
		
		if (result > 0) {
			System.out.println("수정완료 ");
		} else {
			System.out.println("수정 실패 ");
		}
		
		request.setAttribute("rcvo", rcvo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("rev_idx", Integer.parseInt(rev_idx));
		
		return "reviewController?type=detail";
	}
}
