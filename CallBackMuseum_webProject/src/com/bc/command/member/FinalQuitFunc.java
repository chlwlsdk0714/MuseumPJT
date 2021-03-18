package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.MemberDAO;
import com.bc.model.vo.MemberVO;

public class FinalQuitFunc implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 로그인 되어있는 정보 없이 중간에 url로 접근시 로그인 페이지로 이동
		if (request.getSession().getAttribute("login") == null) {
			return "logMenu.jsp?msg=로그인을+해주세요";
		}

		// 회원가입 or 로그인 or 정보수정 시 세션에 올려져있는 login에 담긴 DB값 가져오기
		MemberVO mvo = ((MemberVO) request.getSession().getAttribute("login"));
		String name = mvo.getMem_name();
		System.out.println(mvo);

		// 탈퇴 처리가 되면 세션 삭제
		if (MemberDAO.updateToLeave(mvo.getMem_id()) >= 1) {
			request.getSession().invalidate();
			System.out.println("삭제 완료");
		} else { // 탈퇴처리 실패시 alert띄우고 로그인창으로 보내기 (**아직 어디로 보낼지 고민중)
			System.out.println("삭제 실패");
			return "logMenu.jsp?msg=탈퇴가+실패하였습니다!";
		}
		return "../main/index?msg=탈퇴가+완료되었습니다.+" + name + "님,+그동안+이용해주셔서+감사드립니다.";
	}

}