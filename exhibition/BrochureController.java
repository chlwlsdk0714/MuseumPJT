package com.bc.controller.exhibition;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/exhibition/brochure")
public class BrochureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("브로슈어 다운로드");
		
		String fileName = request.getParameter("brochure");
		System.out.println("fileName :" + fileName);
		
		String path = "C:/Mystudy/60_web/CallBackMuseum/WebContent/exhibition/brochure";
		
		File file = new File(path + "/" + fileName);
		
		String mimeType = getServletContext().getMimeType(file.toString()); //파일을 다 스트링타입으로 바꾸기
		
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		
		String downloadName = null;
		
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes("utf-8"), "8859_1");
		} else {
			downloadName = new String(fileName.getBytes("utf-8"), "8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename = \"" + downloadName + "\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream outputStream = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		
		while((data = (fileInputStream.read(b, 0, b.length))) != -1) {
			outputStream.write(b, 0, data);
		}
		outputStream.flush();
		outputStream.close();
		fileInputStream.close();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}



















