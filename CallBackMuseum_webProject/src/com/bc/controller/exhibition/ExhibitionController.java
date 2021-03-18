package com.bc.controller.exhibition;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;
import com.bc.model.vo.ExhibVO;

@WebServlet("/view/exhibition")
public class ExhibitionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//전시 list불러오기
		List<ExhibVO> list = ExhibitionDAO.getList();
		
		//조회된 list 응답페이지에서 사용할 수 있도록 저장
		request.setAttribute("list", list);
		
		//응답페이지로 위임처리
		request.getRequestDispatcher("exhibYear.jsp").forward(request, response);
		System.out.println("doGet 끝");
}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
