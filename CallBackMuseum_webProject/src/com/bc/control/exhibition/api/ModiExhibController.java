package com.bc.control.exhibition.api;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;
import com.bc.model.vo.ExhibVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/exhibition/modiExhib")
public class ModiExhibController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("test modiExhib");
		
		request.setCharacterEncoding("utf-8");
		
		//파일 저장 위치
		String path = request.getServletContext().getRealPath("exhibition/images");
		
		MultipartRequest mr = new MultipartRequest(request, path, (10 * 1024 * 1024),
										"UTF-8", new DefaultFileRenamePolicy());
		
		// string으로 입력받은 날짜 Date타입으로 바꾸기
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		Date sd = null;
		Date ed = null;
		try {
			sd = df.parse(mr.getParameter("exhib_period_start"));
			ed = df.parse(mr.getParameter("exhib_period_end"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String idx = mr.getParameter("exhib_idx");
		System.out.println(">>idx : " + idx); 
		
		//사용할 데이터 준비
		ExhibVO vo = new ExhibVO();
		vo.setExhib_idx(Integer.parseInt(idx));
		vo.setExhib_subject(mr.getParameter("exhib_subject"));
		vo.setExhib_period_start(sd);
		vo.setExhib_period_end(ed); // STRING을 DATE로 바꿔서 넣어줌
		vo.setExhib_venue(mr.getParameter("exhib_venue"));
		vo.setExhib_artist(mr.getParameter("exhib_artist"));
		vo.setExhib_artworks_cnt(mr.getParameter("exhib_artworks_cnt"));
		vo.setExhib_organization(mr.getParameter("exhib_organization"));
		vo.setExhib_content(mr.getParameter("exhib_content"));
		vo.setExhib_thumb_path(mr.getFilesystemName("exhib_thumb_path"));

		//DB데이터 수정 요청
		int result = ExhibitionDAO.updateData(vo);
		System.out.println(">>result : " + result);
		System.out.println("수정:" + vo);
		
		//화면 전환
		response.sendRedirect("../exhibition/detail?idx=" + Integer.parseInt(idx));
	}
}
