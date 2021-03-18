package com.bc.control.exhibition.api;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;
import com.bc.model.vo.ExhibVO;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/exhibition/insert")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static int size = 100 * 1024 * 1024;
	//final static String path = "exhibition/images";
	//path : 실제 파일이 저장되는 경로

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("전시정보 입력~~");
		request.setCharacterEncoding("UTF-8");
		

		String realpath = request.getServletContext().getRealPath("exhibition/images");
		System.out.println("realpath : " +realpath);
		
		/*
		 * File f = new File(realpath); if( !f.exists()) f.mkdirs();
		 */
		
		MultipartRequest mr = new MultipartRequest(request, realpath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration parameterNames = mr.getParameterNames();
		System.out.println("파라미터 목록 시작");
		while(parameterNames.hasMoreElements()) {
			System.out.println(parameterNames.nextElement());
		}
		System.out.println("파라미터 목록 끝");
		
		// string으로 입력받은 날짜 Date타입으로 바꾸기
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		String parameter = mr.getParameter("exhib_period_start");
		System.out.println("exhib_period_start: " + parameter);
		Date sd = null;
		Date ed = null;
		try {
			sd = df.parse(parameter);
			ed = df.parse(mr.getParameter("exhib_period_end"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// vo객체에 입력한 값 담기
		ExhibVO vo = new ExhibVO();
		vo.setExhib_subject(mr.getParameter("exhib_subject"));
		vo.setExhib_period_start(sd);
		vo.setExhib_period_end(ed); // STRING을 DATE로 바꿔서 넣어줌
		vo.setExhib_venue(mr.getParameter("exhib_venue"));
		vo.setExhib_artist(mr.getParameter("exhib_artist"));
		vo.setExhib_artworks_cnt(mr.getParameter("exhib_artworks_cnt"));
		vo.setExhib_organization(mr.getParameter("exhib_organization"));
		vo.setExhib_content(mr.getParameter("exhib_content"));

		System.out.println("vo:" + vo);

		// 파일 있는지 없는지 체크
		if (mr.getFile("exhib_thumb_path") != null) {
			vo.setExhib_thumb_path(mr.getFilesystemName("exhib_thumb_path")); 
		} else {
			vo.setExhib_thumb_path(mr.getFilesystemName(""));
		}
		int result = ExhibitionDAO.insertData(vo);
		System.out.println(">>result:" + result);
	    
		String res = new Gson().toJson(result); //json처리안하고 gson사용. result는 idx인 상태.  
		System.out.println("res : " + res);
		
		System.out.println("이미지 경로:" +vo.getExhib_thumb_path());
//		PrintWriter out = response.getWriter();
		
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(res);
//		
		//if (result > 0) {
			//out.write(result); //result는 idx가 된 상태 //result대신 true쓰니까 syntaxError는 나지 않음. json으로 파싱되는 데에 문제가 있었던 듯.
//		} else {
			
//			out.write("false");
//		}

	}
}
