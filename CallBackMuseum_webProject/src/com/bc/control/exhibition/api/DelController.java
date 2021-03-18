package com.bc.control.exhibition.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;


@WebServlet("/delExhib")
public class DelController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("삭제 컨트롤러 시작");
	
		String exhib_idx = request.getParameter("idx"); //delExhib?idx= 니까 "idx"인걸 받아와야지!!
		
		System.out.println("삭제페이지 idx:" + exhib_idx);
		
		ExhibitionDAO.deleteData(Integer.parseInt(exhib_idx)); 
		
		response.sendRedirect("exhibition/period");
		
	}
}
