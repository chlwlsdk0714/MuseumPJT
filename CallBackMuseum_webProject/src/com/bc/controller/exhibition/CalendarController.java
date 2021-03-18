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

@WebServlet("/exhibition/calendar")
public class CalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("캘린더 컨트롤러");
		String check = "check"; //main에서 캘린더 들어갔을 때 '검색결과가 없습니다'가 안 보이기 위한 스트링
		
		List<ExhibVO> list = ExhibitionDAO.calendar();
		
		request.setAttribute("list", list);
		request.setAttribute("check", check); 
		
		request.getRequestDispatcher("calendar.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
