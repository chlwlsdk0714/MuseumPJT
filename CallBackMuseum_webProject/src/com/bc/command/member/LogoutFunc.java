package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.vo.MemberVO;

public class LogoutFunc implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		System.out.println(mvo);
		String msg = mvo.getMem_name() + "님,+안녕히가십시오.";
		String path = "";
		
		// 로그인 되어있는 정보 없이 중간에 url로 접근시 로그인 페이지로 이동
		if (mvo.getMem_id() == null)  {
			path = "logMenu.jsp?msg=로그인+후+사용해주십시오.";
		} else {
			path = "../main/index?msg=" + msg;
			request.getSession().invalidate();
		}

		return path;	// 로그아웃 후 메인으로 이동.
	}
}
