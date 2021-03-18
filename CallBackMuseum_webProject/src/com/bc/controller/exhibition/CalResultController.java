package com.bc.controller.exhibition;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;
import com.bc.model.vo.ExhibVO;

@WebServlet("/exhibition/CalResult")
public class CalResultController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CalResult 컨트롤러");
		
		String exhib_period_start = request.getParameter("startDate");
		String exhib_period_end = request.getParameter("endDate");
		//System.out.println("startDate :" + exhib_period_start );
		//System.out.println("endDate: " + exhib_period_end);
		request.setAttribute("exhib_period_start", exhib_period_start);
		request.setAttribute("exhib_period_end", exhib_period_end);
		
		
		Map<String, String> calMap = new HashMap<>();
		calMap.put("exhib_period_start", exhib_period_start);
		calMap.put("exhib_period_end", exhib_period_end);
		//System.out.println(calMap);
		
		List<ExhibVO> list = ExhibitionDAO.calendarResult(calMap);
		//System.out.println(list);
		
		request.setAttribute("calList", list);
		
		request.getRequestDispatcher("calendar.jsp").forward(request, response);
	}
	
}
