package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.MemberDAO;
import com.bc.model.vo.MemberVO;

public class LoginFunc implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		request.getSession().invalidate();	// 로그인 메뉴 페이지로 들어오면 무조건 세션을 비움
		
		// 로그인할때 사용자가 입력한 값을 받아온다
		String memberID = request.getParameter("memberID");
		if (memberID == null) {
			return "logMenu.jsp";
		}
		
		String password = request.getParameter("password");
		String returnPath = null;

		//join_status가 0인 아이디 검색(탈퇴시 1이기 때문) -> mapper에서 설정해둠
		MemberVO mvo = MemberDAO.findById(memberID);
		System.out.println(mvo);
		
		// vo에 값이 있으면 로그인 성공 후 세션에 login이라는 이름으로 scope상에 올리기
		if (mvo != null) {
			if(mvo.getMem_pwd().equals(password)) {
				 System.out.println("로그인 성공"); 
				 request.getSession().setAttribute("login", mvo);
				 String msg = mvo.getMem_name() + "님,+반갑습니다.+메인화면으로+이동합니다.";
				 returnPath = "../main/index?msg=" + msg;	//로그인 후 메인페이지 (담영이 만든 메인과 연결함 02/19)
			} else { 
				System.out.println("비밀번호를 다시 확인해주세요"); 
				returnPath = "logMenu.jsp?msg=비밀번호를+다시+확인해주세요.";	//로그인 실패시 다시 로그인창 띄우고 alert처리
			}
		} else {
			returnPath = "logMenu.jsp?msg=아이디와+비밀번호를+다시+확인해주세요.";	 //vo에 값 없어도 로그인실패랑 똑같이 처리
		}
		return returnPath;
	}
}
