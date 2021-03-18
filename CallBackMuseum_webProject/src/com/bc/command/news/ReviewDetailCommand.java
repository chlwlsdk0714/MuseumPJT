package com.bc.command.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.ReviewCommentDAO;
import com.bc.model.dao.ReviewDAO;
import com.bc.model.vo.ReviewCommentVO;
import com.bc.model.vo.ReviewVO;

public class ReviewDetailCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		String rev_idx = request.getParameter("rev_idx");
		String searchResult = request.getParameter("searchResult");
		
		ReviewVO rvo = ReviewDAO.getOne(Integer.parseInt(rev_idx));
		ReviewDAO.updateHit(Integer.parseInt(rev_idx));
		
		// 해당 게시글에 달린 댓글 목록 불러오기 
		List<ReviewCommentVO> list = ReviewCommentDAO.getCommentList(Integer.parseInt(rev_idx));
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("rvo", rvo);
		request.setAttribute("searchResult", searchResult);
		request.setAttribute("list", list);
		
		return "/news/review_detail.jsp";
	}
}
