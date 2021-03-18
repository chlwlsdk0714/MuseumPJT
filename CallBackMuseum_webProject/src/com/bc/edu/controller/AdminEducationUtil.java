package com.bc.edu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.command.AdminEducationDelete;
import com.bc.edu.command.AdminEducationInsert;
import com.bc.edu.command.AdminEducationUpdate;
import com.bc.edu.command.EduCommandServlet;
import com.bc.edu.command.EduCommandServletImpl;

@WebServlet("/adminEduBtn")
public class AdminEducationUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String param = request.getParameter("utilparam");
		System.out.println(param);
		EduCommandServlet Csl = null;
		if("insert".equals(param)) {
			Csl = new AdminEducationInsert();
		// 타이틀 추가버튼 눌렀을떄
		} 
		/*
		 * else if("eduinsert".equals(param)) { // 안씀 Csl = new
		 * AdminEducationInsertFileUpload(); }
		 */ else if("delete".equals(param)) {
			// 타이틀 삭제 페이지 넘기기
			Csl = new AdminEducationDelete();
		} else if("update".equals(param)) { 	// 업데이트 화면 전환
			Csl = new AdminEducationDelete();
		} else if("updateEdu".equals(param)) { // 업데이트 입력창으로 이동
			Csl = new AdminEducationUpdate();
		}else {	// 파라미터 값 없을시 매인으로
			Csl = new EduCommandServletImpl();
		}
	// api로 ajax 처리 안씀!!!!!!!!!!!!!
//		else if("deleteAct".equals(param)) {
//			Csl = new AdminEducationDeleteUpload();
//		}
			
		String path = Csl.execute(request, response);
		System.out.println(path);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("utilparam");
		System.out.println(param);
		doGet(request, response);
	}

}
