package com.bc.command.news;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.ReviewDAO;
import com.bc.model.vo.PagingVO;
import com.bc.model.vo.ReviewVO;

public class ReviewCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalRecord = ReviewDAO.getTotalRecord();
		PagingVO pvo = new PagingVO(1, totalRecord);
		System.out.println("totalRecord: " + totalRecord);

		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			pvo = new PagingVO(Integer.parseInt(cPage), totalRecord);
		}

		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());

		List<ReviewVO> list = ReviewDAO.getList(map);

		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);
		
		return "/news/review.jsp";
	}

}
