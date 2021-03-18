package com.bc.command.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bc.command.CommandServlet;
import com.bc.model.dao.NoticeDAO;

public class NoticeDeleteCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noti_idx = request.getParameter("noti_idx");
		String cPage = request.getParameter("cPage");
		
		int result = NoticeDAO.delete(Integer.parseInt(noti_idx));
		String msg = "";
		if (result > 0) {
			msg = "삭제가+정상적으로+처리되었습니다.";
		} else {
			msg = "수정처리+과정에서+문제가+발생하였습니다.+다시+시도해주십시오.";
		}
		
		return "newsController?type=notice&cPage=" + cPage + "&msg=" + msg;
	}
}
