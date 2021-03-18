package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.vo.MemberVO;

public class MypageFunc implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String pw = request.getParameter("password");
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("login");
		System.out.println(mvo);
		System.out.println(pw);
		String returnPath = null;
		
		if (pw != null && mvo.getMem_pwd().equals(pw)) {
			System.out.println("마이페이지 입장 성공");
			returnPath = "updateMember.jsp";
		} else {
			System.out.println("비밀번호를 다시 확인해주세요");
			returnPath = "myPage.jsp";
		}
		return returnPath;
	}

}
