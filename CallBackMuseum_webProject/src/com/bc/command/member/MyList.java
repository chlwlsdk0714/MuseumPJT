package com.bc.command.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.InquiryDAO;
import com.bc.model.vo.MemberVO;

public class MyList implements CommandServlet  {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
// 로그인 되어있는 정보 없이 중간에 url로 접근시 로그인 페이지로 이동
		if (request.getSession().getAttribute("login") == null) {
			throw new IllegalStateException("로그인이 안되있어요");
		}
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		Map<String, Object> map = null;
		
		String cPage = request.getParameter("cPage");
		if (cPage == null || cPage.length() == 0) {
			cPage = "1";
		}
		
		System.out.println("InquiryListCommand의 cPage : " + cPage);
		
		
		map = InquiryDAO.list(mvo.getMem_name(), Integer.parseInt(cPage), mvo.getMem_id());
		
		request.setAttribute("list", map.get("list"));
		request.getSession().setAttribute("paging", map.get("paging"));
		
		return "mylist.jsp";
	}
	
}
