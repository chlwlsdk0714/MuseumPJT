package com.bc.edu.api.edudoc;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduLearnDocDAO;
import com.bc.edu.model.vo.AdminDocJoinOptionVO;
import com.google.gson.Gson;

@WebServlet("/docidxsel")
public class AdminLearnSelectDocumentApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static int SIZE = 100 * 1024 * 1024;
	final static String PATH = "eduadmin/image/";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		List<AdminDocJoinOptionVO> docIdxList = null;
		try {
			docIdxList = new EduLearnDocDAO().learnDocIdx();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String result = new Gson().toJson(docIdxList);

		System.out.println(result);
	    response.getWriter().write(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
