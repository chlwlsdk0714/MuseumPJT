package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.NoticeDAO;
import com.bc.model.vo.NoticeVO;

public class NoticeUpdateCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		String idx = request.getParameter("noti_idx");
		int noti_idx = Integer.parseInt(idx);
		String path = "";
		
		NoticeVO nvo = null;
		
		/*--- 수정폼으로 보내주는 역할 --- */
		if ("update".equals(type)) {
			nvo = NoticeDAO.getOne(noti_idx);
			path = "/news/notice_update.jsp";
		}
		/*--- 수정작업을 처리하는 역할 --- */
		else if ("updateProc".equals(type)) {
			String noti_subject = request.getParameter("subject");
			String noti_content = request.getParameter("content");
			
			nvo = new NoticeVO();
			nvo.setNoti_idx(noti_idx);
			nvo.setNoti_subject(noti_subject);
			nvo.setNoti_content(noti_content);
			
			int result = NoticeDAO.update(nvo);
			
			String msg = "";
			if (result > 0) {
				nvo = NoticeDAO.getOne(noti_idx);
				msg = "수정이+완료되었습니다.";
			} else {
				msg = "수정처리+과정에서+문제가+발생하였습니다.+다시+시도해주십시오.";
			}
			
			path = "/news/notice_detail.jsp?cPage=" + cPage + "&msg=" + msg;
		}
		request.setAttribute("nvo", nvo);
		request.setAttribute("cPage", cPage);
		
		return path;
	}
}
