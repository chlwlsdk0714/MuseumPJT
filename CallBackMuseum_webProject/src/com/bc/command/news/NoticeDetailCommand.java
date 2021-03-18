package com.bc.command.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;

public class NoticeDetailCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		String noti_idx = request.getParameter("noti_idx");
		String searchResult = request.getParameter("searchResult");
		
		NoticeVO nvo = NoticeDAO.getOne(Integer.parseInt(noti_idx));
		NoticeDAO.updateHit(Integer.parseInt(noti_idx));
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("nvo", nvo);
		request.setAttribute("searchResult", searchResult);
		
		return "/news/notice_detail.jsp";
	}
}
