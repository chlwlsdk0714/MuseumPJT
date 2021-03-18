package com.bc.command.news;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.ReviewDAO;
import com.bc.model.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewUpdateCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
			System.out.println(">>>>type: " + type);
		String cPage = request.getParameter("cPage");
			System.out.println("> cPage: " + cPage);
		String idx = request.getParameter("rev_idx");
		int rev_idx = Integer.parseInt(idx);
		String path = "";
		
			System.out.println("> rev_idx: " + idx);
		
		ReviewVO rvo = ReviewDAO.getOne(rev_idx);
		
		/*--- 수정폼으로 보내주는 역할 --- */
		if ("updateReview".equals(type)) {
			System.out.println("수정폼 보내기!");
			path = "/news/review_update.jsp";
		}
		/*--- 수정작업을 처리하는 역할 --- */
		else if ("updateReviewProc".equals(type)) {

//			윈도우용 저장위치 (리프레쉬 안 해도 되는 경로)
//			"D:\\MyWork2\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Vanilla\\resources\\upload"

//			맥용 저장위치 (리프레쉬 안 해도 되는 경로)
//			String filePath = "/Users/Greedysoo/Documents/MyStudy/60_web/.metadata"
//		 			+ "/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/VanillaERP/resources/upload";
			
			// 파일 저장 위치
		 	String filePath = "/Users/Greedysoo/Documents/MyStudy/60_web/50_CallBackMuseum_0220/WebContent/news/image";
		    File file = new File(filePath);

		    if (!file.exists()) {
		        file.mkdirs();
		    }
			MultipartRequest mr = new MultipartRequest(
											request, filePath, (10 * 1024 * 1024),
											"UTF-8", new DefaultFileRenamePolicy());
			
			// 전달받은 데이터 VO에 저장하기 
			rvo.setRev_category(mr.getParameter("rev_category"));
			rvo.setRev_subject(mr.getParameter("rev_subject"));
			rvo.setRev_content(mr.getParameter("rev_content"));
			
			// 첨부파일 처리
			if (mr.getFile("rev_file_name") != null) {
				rvo.setRev_file_name(mr.getFilesystemName("rev_file_name"));
				rvo.setRev_ori_name(mr.getOriginalFileName("rev_file_name"));
				
			} else {
				rvo.setRev_file_name("");
				rvo.setRev_ori_name("");
			}
			
			// DB에 입력(저장) 처리 (result는 0 또는 1로 도출)
			int result = ReviewDAO.update(rvo);
			
			if (result > 0) {
				rvo = ReviewDAO.getOne(rev_idx);
			}
			else {
				System.out.println("result = 0");
			}
			
			String msg = "";
			
			if (result > 0) {
				rvo = ReviewDAO.getOne(rev_idx);
				msg = "수정이+완료되었습니다.";
			} else {
				msg = "수정처리+과정에서+문제가+발생하였습니다.+다시+시도해주십시오.";
			}
			
			path = "/news/review_detail.jsp?&msg=" + msg;
		}
		request.setAttribute("rvo", rvo);
		request.setAttribute("cPage", cPage);
		
		return path;
	}
}
