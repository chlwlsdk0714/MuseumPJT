package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;

public class UpdateFunc implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = null;
		
		// 로그인 되어있는 정보 없이 중간에 url로 접근시 로그인 페이지로 이동
		if(request.getSession().getAttribute("login")  == null) { 
			path = "logMenu.jsp?msg=로그인을+해주세요";
		} else {	// 로그인 되어있으면 updateMember.jsp로 이동
			path = "updateMember.jsp";
		}
		return path;
	}
}
