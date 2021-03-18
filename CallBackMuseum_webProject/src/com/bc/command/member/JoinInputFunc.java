package com.bc.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.model.dao.MemberDAO;
import com.bc.model.vo.MemberVO;


public class JoinInputFunc implements CommandServlet {
	
	// 회원가입 버튼 누르면 JoinFunc 타고 들어옴
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// newMember.jsp에서 사용자에게 입력받은 값을 가져온다
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String callNumber = request.getParameter("area") + "-" + request.getParameter("phone");
		String cellPhone = request.getParameter("cellphone_prefix") + "-" + request.getParameter("cellphone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		//vo에 입력받은 값을 담아줌
		MemberVO vo = new MemberVO(id, pw, name, gender, callNumber, cellPhone, email, address, "0");
		
		System.out.println(">>joinFunc.execute 실행");
		System.out.println(id);
		System.out.println(pw);
		System.out.println(vo.getMem_addr());
						
		// DB연결하고 데이터 가져오기
		boolean hasId = MemberDAO.hasId(id);
		
		String returnPath = null;
		// memberID 와 db데이터 id 비교 
		if (hasId) {	//같은거있을시 아이디 중복 
			System.out.println("중복아이디");
			returnPath = "newMember.jsp?msg=아이디+중복입니다";
		} else { // 없을시 회원가입 진행
			System.out.println("회원가입 시도합니다");
			//dao.join()해주고 페이지 이동
			MemberDAO.join(vo);
			//session : request.getSession(); -> user라는 이름으로 입력받은 데이터를 세션에 저장 
			request.getSession().setAttribute("user", vo);
			returnPath = "../main/index?msg=회원가입이+완료되었습니다.+로그인+후+이용해주시기+바랍니다.";
		}
		return returnPath;
	}
}
