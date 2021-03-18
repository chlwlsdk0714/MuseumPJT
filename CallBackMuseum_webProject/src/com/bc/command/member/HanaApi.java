package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.MemberDAO;
import com.bc.model.vo.MemberVO;
import com.google.gson.Gson;

@WebServlet("/api")
public class HanaApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		memberVO vo = new memberVO("hana", "1111", "하나", "여", "051-123-4567", "010-1234-5678", "hana@naver.com", "부산", "0");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("id : " + id + ", pw : " + pw);
		
		MemberVO vo = MemberDAO.findById(id);
		String json = null;
		if (vo != null && vo.getMem_pwd().equals(pw)) {
//			json = "{\n";
//			json += "  \"id\" : \"" + vo.getMem_id() + "\",\n";
//			json += "  \"pw\" : \"" + vo.getMem_pwd() + "\",\n";
//			json += "  \"name\" : \"" + vo.getMem_name() + "\",\n";
//			json += "  \"gender\" : \"" + vo.getMem_sex() + "\",\n";
//			json += "  \"cellphone\" : \"" + vo.getMem_cellphone() + "\",\n";
//			json += "  \"result\" : true\n";
//	 		json += "}";
			json = new Gson().toJson(vo);
		} else {
			json = new Gson().toJson(false);
		}
				
		
 		
 		System.out.println(json);
 		response.setContentType("application/json;charset=UTF-8");
 		response.setHeader("Access-Control-Allow-Origin", "*");
 		response.getWriter().write(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
