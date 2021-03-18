package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.MemberDAO;
import com.bc.model.vo.MemberVO;

public class UpdateCompleteFunc implements CommandServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 로그인 되어있는 정보 없이 중간에 url로 접근시 로그인 페이지로 이동
		if(request.getSession().getAttribute("login")  == null) { 
			return "logMenu.jsp?msg=로그인을+해주세요";
		} 
		// 회원수정시 입력받은 값 가져오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("area") + "-" + request.getParameter("phone");
		String cellPhone = request.getParameter("cellphone_prefix") + "-" + request.getParameter("cellphone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		// vo객체에 입력받은 값을 담아준다
		MemberVO mvo = new MemberVO(id, pw, name, gender, phone, cellPhone, email, address, "0");
		System.out.println(mvo);
		
		if (MemberDAO.update(mvo) >= 1) {	//수정된 게 있으면 로그인시 세션에 올렸던 login 세션 덮어씌우기
			request.getSession().setAttribute("login", mvo);
			System.out.println("수정 완료");
			
		} else {	//수정된 게 없으면 alert띄우고 login 화면으로 돌아가기
			System.out.println("수정 실패");
			return "logMenu.jsp?msg=수정처리가+실패되었습니다!";
		}
		
		return "/main/index?msg=수정이+완료되었습니다!";
	}
}
