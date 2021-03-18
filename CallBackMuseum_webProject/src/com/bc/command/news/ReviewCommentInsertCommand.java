package com.bc.command.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.ReviewCommentDAO;
import com.bc.model.dao.ReviewDAO;
import com.bc.model.vo.MemberVO;
import com.bc.model.vo.ReviewCommentVO;
import com.bc.model.vo.ReviewVO;

public class ReviewCommentInsertCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		String rcom_content = request.getParameter("rcom_content");
		String idx = request.getParameter("rev_idx");
		int rev_idx = Integer.parseInt(idx);
		
		// 지금 댓글쓰는 사람의 아이디를 알아내기 위해 세션의 로그인정보 빼오기 
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		
		// VO에 정보를 세팅해서 DAO 메소드 파라미터로 보내기 
		ReviewCommentVO rcvo = new ReviewCommentVO();
		rcvo.setRcom_writer(mvo.getMem_id());
		rcvo.setRcom_content(rcom_content);
		rcvo.setRev_idx(rev_idx);
		rcvo.setRcom_ip(request.getRemoteAddr());
		
		// 댓글 입력처리가 제대로 되었으면 1, 아니면 0 
		int result = ReviewCommentDAO.insert(rcvo);
		
		ReviewVO rvo = ReviewDAO.getOne(rev_idx);
		List<ReviewCommentVO> list = ReviewCommentDAO.getCommentList(rev_idx);
		String path = "";
		
		if (result > 0) {
			path = "/news/review_detail.jsp";
		}
		else {
			String msg = "댓글+등록+과정에서+오류가+발생하였습니다.+다시+시도해주십시오.";
			path = "/news/review_detail.jsp?msg=" + msg;
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("rvo", rvo);
		request.setAttribute("list", list);
		
		return path;
	}

}
