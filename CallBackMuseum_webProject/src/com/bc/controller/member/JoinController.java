package com.bc.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.CommandServlet;
import com.bc.command.member.FinalQuitFunc;
import com.bc.command.member.Go_inquiryList;
import com.bc.command.member.JoinFunc;
import com.bc.command.member.JoinInputFunc;
import com.bc.command.member.LoginFunc;
import com.bc.command.member.LogoutFunc;
import com.bc.command.member.MyList;
import com.bc.command.member.MyListDetail;
import com.bc.command.member.MypageFunc;
import com.bc.command.member.UpdateCompleteFunc;
import com.bc.command.member.UpdateFunc;
import com.bc.command.news.SendRedirectException;
import com.bc.command.member.QuitFunc;
import com.bc.command.member.ReservationList;

@WebServlet("/member/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JoinController 도착!");
		
		String type = request.getParameter("type");	// type으로 글자 받아오기
		System.out.println(">> join에서 type : " + type);
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
	         CommandServlet Csl = null;
	         if("join".equals(type)) {
	            Csl = new JoinFunc();
	         } else if("login".equals(type)) {
	            Csl = new LoginFunc();
	         } else if("joinInput".equals(type)) {
	            Csl = new JoinInputFunc();
	         } else if("update".equals(type)) {
	            Csl = new UpdateFunc();
	         } else if("updatecomplete".equals(type)) {
	            Csl = new UpdateCompleteFunc();
	         } else if("logout".equals(type)) {
	            Csl = new LogoutFunc();
	         } else if("quit".equals(type)) {
	            Csl = new QuitFunc();
	         } else if("mypage".equals(type)) {
	            Csl = new MypageFunc();
	         } else if ("finalQuit".equals(type)) {
	            Csl = new FinalQuitFunc();
	         } else if ("mylist".equals(type)) {
	            Csl = new MyList();
	         } else if ("mylistDetail".equals(type)) {
	            Csl = new MyListDetail();
	         } else if ("go_inquiryList".equals(type)) {
	            Csl = new Go_inquiryList();
	         } else if ("reservationList".equals(type)) {
	            Csl = new ReservationList();
	         }
	         
	         String path = Csl.execute(request, response);
	         System.out.println("path 의 주소는?: " + path);
	         request.getRequestDispatcher(path).forward(request, response);   
	      } catch (SendRedirectException e) {
	         response.sendRedirect(e.getPath());
	      }
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// 데이터 주고받을 때 한글깨짐 방지처리
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
