package com.bc.edu.api.edudoc;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadAct")
public class DowloadControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("filename");
		String direc = "C:/MyStudy/60_web/CallBackMuseum/WebContent/eduadmin/file/"; // 실제 파일 경로
		File file = new File(direc + "/" + fileName);
		
		String mimeType = getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		
		String downliadName = null;
		
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downliadName = new String(fileName.getBytes("utf-8"), "8859_1");
		} else {
			downliadName = new String(fileName.getBytes("utf-8"), "8859_1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=\""+ downliadName + "\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream outputStream = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		
		while ((data = (fileInputStream.read(b ,0, b.length))) != -1) {
			outputStream.write(b, 0, data);
		}
		outputStream.flush();
		outputStream.close();
		fileInputStream.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
