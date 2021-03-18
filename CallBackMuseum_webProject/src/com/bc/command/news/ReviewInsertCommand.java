package com.bc.command.news;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.ReviewDAO;
import com.bc.model.vo.MemberVO;
import com.bc.model.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewInsertCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		
		// 파일 저장 위치
		String realpath = request.getServletContext().getRealPath("news/image");
//	 	String path = "C:MyStudy/60_web/CallBackMuseum/WebContent/news/image/";
//		String path = "C:MyStudy/60_web/CallBackMuseum/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Vanilla/resources/upload/";
		
		File file = new File(realpath);

	    if (!file.exists()) {
	        file.mkdirs();
	    }
		MultipartRequest mr = new MultipartRequest(
										request, realpath, (10 * 1024 * 1024),
										"UTF-8", new DefaultFileRenamePolicy());
		
		// 전달받은 데이터 VO에 저장하기 
		ReviewVO rvo = new ReviewVO();
		rvo.setRev_category(mr.getParameter("rev_category"));
		rvo.setRev_subject(mr.getParameter("rev_subject"));
		rvo.setRev_content(mr.getParameter("rev_content"));
		rvo.setRev_writer(mvo.getMem_id());
		
		// 첨부파일 처리
		if (mr.getFile("rev_file_name") != null) {
			rvo.setRev_file_name(mr.getFilesystemName("rev_file_name"));
			rvo.setRev_ori_name(mr.getOriginalFileName("rev_file_name"));
			System.out.println("(command)rvo.getRev_ori_name: " + rvo.getRev_ori_name());
		} else {
			rvo.setRev_file_name("");
			rvo.setRev_ori_name("");
		}
		
		
		// DB에 입력(저장) 처리 (result는 0 또는 1로 도출)
		int result = ReviewDAO.insert(rvo);
		
		if (result > 0) {
			rvo = ReviewDAO.getNew();
		}
		else {
			System.out.println("result = 0");
		}
		
		request.setAttribute("cPage", 1);
		request.setAttribute("rvo", rvo);

		return "/news/review_detail.jsp";
	}
}
