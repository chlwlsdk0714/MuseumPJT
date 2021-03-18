package com.bc.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.MemberDAO;

@WebServlet("/member/checkId")
public class IdCheckFunc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		
		int result = MemberDAO.checkId(id);
		boolean hasId = result > 0;
		
 		response.setContentType("application/json;charset=UTF-8");
 		response.setHeader("Access-Control-Allow-Origin", "*");
 		response.getWriter().write(String.valueOf(hasId));
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}



}
