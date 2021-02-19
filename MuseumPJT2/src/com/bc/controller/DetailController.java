package com.bc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.ExhibVO;

@WebServlet("/exhibition/detail")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test detail");
	 
		String idx = request.getParameter("idx");
		System.out.println("idx : " + idx);
		
		ExhibVO evo = DAO.forDetail(Integer.parseInt(idx));
		//System.out.println("evo :" +evo);
		
		request.setAttribute("evo", evo);
		
		request.getRequestDispatcher("exhibDetail.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request,response);
	}
}
