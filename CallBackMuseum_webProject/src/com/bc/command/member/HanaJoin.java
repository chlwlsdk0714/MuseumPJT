package com.bc.command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.MemberDAO;
import com.bc.model.vo.MemberVO;
import com.google.gson.Gson;

@WebServlet("/joinApi")
public class HanaJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
 		response.setContentType("application/json;charset=UTF-8");
 		response.setHeader("Access-Control-Allow-Origin", "*");
 		
 		String id = request.getParameter("id");
 		String pwd = request.getParameter("pwd");
 		String name = request.getParameter("name");
 		String gender = request.getParameter("gender");
 		String phone = request.getParameter("phone");
 		String cellphone = request.getParameter("cellphone");
 		String email = request.getParameter("email");
 		String addr = request.getParameter("addr");
 		String status = request.getParameter("status");
 		
 		MemberVO vo = new MemberVO(id, pwd, name, gender, phone, cellphone,
 				email, addr, status);
 		int result = 0;
 		try {
 			result = MemberDAO.join(vo);
 		} catch (Exception e) {
		}
 		
 		PrintWriter out = response.getWriter();
 		if (result > 0) {
 			String json = new Gson().toJson(vo);
 			out.write(json);
 		} else {
 			out.write("false");
 		}
	}
}
