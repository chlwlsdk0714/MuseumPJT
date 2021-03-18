package com.bc.edu.api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.AdminLeanDAO;

@WebServlet("/deletelearn")
public class AdminLearnEduDeleteApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		//int res = new AdminDAOUtil().delete(request.getParameterValues("educheck"));
		int res = new AdminLeanDAO().delete(request.getParameterValues("eduleancheck"));
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.write("true");
		} else {
			out.write("false");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
