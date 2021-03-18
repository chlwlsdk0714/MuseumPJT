package com.bc.edu.api.edudoc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduLearnDocDAO;
import com.bc.edu.model.vo.LearnDocumentsVO;
import com.bc.edu.model.vo.PagingVO;

@WebServlet("/edlearndoc")
public class EduLearnDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int totalRecord = new EduLearnDocDAO().getTotalRecord();
		PagingVO pvo = new PagingVO(1, totalRecord);
		
		String cPage = request.getParameter("cPage");
		if(cPage != null && !("".equals(cPage))) {
			pvo = new PagingVO(Integer.parseInt(cPage), totalRecord);
		}
		
		String searchText = request.getParameter("searchtext");
		Map<String, String> map = new HashMap<>();
		map.put("begin", pvo.getBegin() + "");
		map.put("end", pvo.getEnd() + "");
		map.put("searchText", searchText);
		List<LearnDocumentsVO> ldVo = null;
		if(searchText != null) {
			ldVo = new EduLearnDocDAO().LnDocsearchPg(map);
		} else {
			ldVo = new EduLearnDocDAO().LnDocAllListPg(map);
		}
		request.setAttribute("ldVo", ldVo);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("pvo", pvo);
		request.getRequestDispatcher("eduadmin/learnedudocument.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
