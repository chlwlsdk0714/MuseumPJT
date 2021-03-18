package com.bc.edu.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDetImpl;
import com.bc.edu.model.vo.DetailEducationVO;
import com.bc.model.vo.PagingVO;


@WebServlet("/learnsearch")
public class SearchLearnList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchText = request.getParameter("searchtext");
		int totalRecord = new EduDetImpl().getTotalRecord2(searchText);
		System.out.println(totalRecord + "나와라요~");
		PagingVO pvo = new PagingVO(1, totalRecord);
		
		String cPage = request.getParameter("cPage");
		if(cPage != null && !("".equals(cPage))) {
			pvo = new PagingVO(Integer.parseInt(cPage), totalRecord);
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("begin", pvo.getBegin() + "");
		map.put("end", pvo.getEnd() + "");
		map.put("searchText", searchText);
		List<DetailEducationVO> ldVo = null;
		if(searchText != null) {
			ldVo = new EduDetImpl().LnDetSearchPg(map);
		} else {
			ldVo = new EduDetImpl().LnDetSearchPg(map);
		}
		request.setAttribute("leanlist", ldVo);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("pvo", pvo);
		request.getRequestDispatcher("eduadmin/learnList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
