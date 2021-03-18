package com.bc.command.news;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;

public class NoticeInsertCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Map<String, String> map = new HashMap<>();
		map.put("noti_subject", subject);
		map.put("noti_content", content);
		
		int result = NoticeDAO.insert(map);
		System.out.println("insert 처리 개수: " + result);
		
		NoticeVO nvo = null;
		if (result > 0) {
			nvo = NoticeDAO.getNew();			
		}
		
		request.setAttribute("nvo", nvo);
		request.setAttribute("cPage", 1);
		
		return "/news/notice_detail.jsp";
	}
}
