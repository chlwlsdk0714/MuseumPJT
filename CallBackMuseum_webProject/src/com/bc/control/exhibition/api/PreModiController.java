package com.bc.control.exhibition.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;
import com.bc.model.vo.ExhibVO;

@WebServlet("/exhibition/preModi")
public class PreModiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//href로 보낼 때는 get방식밖에 안된다! //get을 안 써주니 405오류가 떴음!!
		System.out.println("test preModi");
		 
		String idx = request.getParameter("idx");
		//System.out.println("idx : " + idx);
		
		ExhibVO evo = ExhibitionDAO.forDetail(Integer.parseInt(idx));
		//System.out.println("list :" +list);
		
		request.setAttribute("evo", evo);
		
		request.getRequestDispatcher("modiExhib.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	
}
