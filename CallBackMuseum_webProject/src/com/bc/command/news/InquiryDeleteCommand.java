package com.bc.command.news;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;
import com.bc.model.vo.InquiryVO;

public class InquiryDeleteCommand implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		InquiryVO ivo = (InquiryVO)request.getSession().getAttribute("ivo");
		
		if(InquiryDAO.delStatus(ivo) > 0) {
			System.out.println("삭제완료");
			request.getSession().setAttribute("ivo", ivo);
			throw new SendRedirectException("inquiryController?type=inquiryList");
		} else {
			System.out.println("삭제실패");
			String failString = "삭제처리가 실패했습니다";
			String fail = URLEncoder.encode(failString, "UTF-8");			
			throw new SendRedirectException("inquiryController?type=inquiryList?msg=" + fail);
		}
	}

}
