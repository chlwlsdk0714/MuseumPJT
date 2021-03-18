
package com.bc.controller.exhibition;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;
import com.bc.model.vo.ExhibVO;

@WebServlet("/exhibition/search")
public class ExhibitionSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전시명으로 검색
		//전시명을 파라미터로 받아오기
		System.out.println("test 111");
		String exhib_subject = request.getParameter("exhib_subject");
		System.out.println("exhib_subject : " + exhib_subject);
		
		//DB에서 리스트 꺼내오기
		List<ExhibVO> list = ExhibitionDAO.searchList(exhib_subject);
		System.out.println("여기list : " +list);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("exhibYear.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
