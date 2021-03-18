package com.bc.edu.api.edudoc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduLearnDocDAO;
import com.bc.edu.model.vo.LearnDocumentsVO;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/alddoc")
public class AdminLearnDocumentInsertApi extends HttpServlet {
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
		LearnDocumentsVO ldVo = new LearnDocumentsVO();
		ldVo.setDoc_status("LD01");
		ldVo.setDoc_text(mr.getParameter("docname"));
		ldVo.setEdu_detidx(mr.getParameter("edulearnidx"));
		ldVo.setEdu_idx(mr.getParameter("eduidx"));

		if(mr.getFile("edufile") != null) {
			ldVo.setDoc_filename(mr.getOriginalFileName("edufile"));
			ldVo.setDoc_filelocal(PATH + ldVo.getDoc_filename());
			//DAO
			res = new EduLearnDocDAO().docLiInsert(ldVo);
		} else {
			ldVo.setDoc_filename("");
			ldVo.setDoc_filelocal("");
			res = new EduLearnDocDAO().docLiInsert(ldVo);
		}
		String result = new Gson().toJson(res);
		response.setContentType("application/json;charset=UTF-8");
	    response.getWriter().write(result);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
