package com.bc.edu.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDetImpl;
import com.bc.edu.model.vo.DetailEducationVO;
import com.bc.edu.model.vo.PagingVO;

public class LearnListImpl implements EduCommandServlet{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 교육진행중 리스트 불러오기
		int totalRecord = new EduDetImpl().getTotalRecord();
		PagingVO pvo = new PagingVO(1, totalRecord);
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			pvo = new PagingVO(Integer.parseInt(cPage), totalRecord);
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		List<DetailEducationVO> leanlist = new EduDetImpl().getAllList(map);
		
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("leanlist", leanlist);
		request.setAttribute("pvo", pvo);
		
		return "eduadmin/learnList.jsp";
	}
}
