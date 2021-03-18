package com.bc.edu.api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.AdminDAOUtil;
import com.bc.edu.model.vo.EducationVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/updateEdu")
public class AdminEducationUpdateApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static int SIZE = 100 * 1024 * 1024;
	final static String PATH = "eduadmin/image/";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		int res = 0;
		String  directory = request.getSession().getServletContext().getRealPath(PATH);
		// 파일 처리 세팅
		MultipartRequest mr = new MultipartRequest(request, directory, (SIZE),
				"UTF-8", new DefaultFileRenamePolicy());
		// edu 객체에 담기
		EducationVO eduVo = new EducationVO();
		eduVo.setEdu_idx(mr.getParameter("idx"));
		eduVo.setEdu_name(mr.getParameter("eduname"));
		eduVo.setEdu_title(mr.getParameter("edutitle"));
		eduVo.setEdu_contents(mr.getParameter("educontents"));
		eduVo.setEdu_status(mr.getParameter("ED01"));
		// 파일 있는지 없는지 체크
		if(mr.getFile("edufile") != null) {
			eduVo.setEdu_imgname(mr.getOriginalFileName("edufile"));
			eduVo.setEdu_imglocal(PATH + eduVo.getEdu_imgname());
			res = new AdminDAOUtil().insert(eduVo);
		} else {
			eduVo.setEdu_imgname(mr.getOriginalFileName(""));
			eduVo.setEdu_imglocal("");
			res = new AdminDAOUtil().update(eduVo);
		}
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
