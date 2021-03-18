package com.bc.edu.api.edudoc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.command.learndocu.LearnDocCommandServlet;
import com.bc.edu.command.learndocu.LearnDocInsertCommandImpl;

@WebServlet("/adDocInsertApi")
public class AdminLearnDocumentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("paramDocUtil");
		LearnDocCommandServlet Lcs = null;
		if("".equals(param)||param == null) {
			Lcs = new LearnDocInsertCommandImpl();
		} 
		String path = Lcs.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
