package com.bc.edu.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.AdminLeanDAO;
import com.bc.edu.model.vo.DetailEducationVO;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/learnInsert")
public class AdminLearnInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static int SIZE = 100 * 1024 * 1024;
	final static String PATH = "eduadmin/image/";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int res = 0;
		String  directory = request.getSession().getServletContext().getRealPath(PATH);
		MultipartRequest mr = new MultipartRequest(request, directory, (SIZE),
				"UTF-8", new DefaultFileRenamePolicy());
		
		DetailEducationVO learnvo = new DetailEducationVO();
		learnvo.setEdu_detidx(mr.getParameter("detidx"));
		learnvo.setEdu_target(mr.getParameter("learntarget"));
		learnvo.setEdu_impt_contents(mr.getParameter("learncontent"));
		learnvo.setEdu_detailaddr(mr.getParameter("learndetail"));
		learnvo.setEdu_idx(mr.getParameter("selecBoxes"));
		learnvo.setEdu_detailname(mr.getParameter("learndetailname"));
		learnvo.setEdu_price(mr.getParameter("learnprice"));
		learnvo.setEdu_detailtarget(mr.getParameter("learndetailtag"));
		learnvo.setEdu_period_start(mr.getParameter("startdate"));
		learnvo.setEdu_period_end(mr.getParameter("enddate"));
		learnvo.setEdu_detailtime(mr.getParameter("edutime"));
		System.out.println(mr.getFile("edufile"));
		if(mr.getFile("edufile") != null) {
			learnvo.setEdu_leanimgname(mr.getOriginalFileName("edufile"));
			learnvo.setEdu_leanimglocal(PATH + learnvo.getEdu_leanimgname());
			res = new AdminLeanDAO().learnInsert(learnvo);
		} else {
			learnvo.setEdu_leanimgname("");
			learnvo.setEdu_leanimglocal("");
			res = new AdminLeanDAO().learnInsert(learnvo);
		}
		String result = new Gson().toJson(res);
		response.setContentType("application/json;charset=UTF-8");
	    response.getWriter().write(result);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
