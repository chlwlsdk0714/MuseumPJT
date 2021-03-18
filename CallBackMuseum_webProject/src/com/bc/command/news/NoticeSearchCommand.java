package com.bc.command.news;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;
import com.bc.model.vo.PagingVO;

public class NoticeSearchCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchText = request.getParameter("searchText");
		System.out.println(">>searchText: " + searchText);
		
		int searchRecord = NoticeDAO.getSearchRecord(searchText);
		System.out.println("searchRecord : " + searchRecord);
		PagingVO pvo = new PagingVO(1, searchRecord);
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			pvo = new PagingVO(Integer.parseInt(cPage), searchRecord);
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("begin", pvo.getBegin() + "");
		map.put("end", pvo.getEnd() + "");
		map.put("searchText", searchText);
		
		List<NoticeVO> list = NoticeDAO.getSearchList(map);
		
		request.setAttribute("searchText", searchText);
		request.setAttribute("searchResult", true);
		request.setAttribute("searchRecord", searchRecord);
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);
		
		return "/news/notice.jsp";
	}

}
