package com.bc.edu.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.edu.model.dao.EduDAOImpl;
import com.bc.edu.model.dao.EduDetImpl;
import com.bc.edu.model.vo.DetailEducationVO;
import com.bc.edu.model.vo.EducationVO;
import com.bc.edu.model.vo.PagingVO;

public class ProCommandImpl implements EduCommandServlet{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		subTitle(request, response);
		listUtil(request, response);
		return "eduadmin/proeducation.jsp";
	}
	
	private void subTitle(HttpServletRequest request, HttpServletResponse response) {
		EducationVO dEduVo;
		// 분야 상세 리스트 가져오기
		try {
			dEduVo = new EduDAOImpl().detailMenu(request.getParameter("param"));
			request.setAttribute("eduVo", dEduVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void listUtil(HttpServletRequest request, HttpServletResponse response) {
		// 분야별 교육
		try {
			EducationVO dEduVo = (EducationVO) request.getAttribute("eduVo");
			List<DetailEducationVO> list = new EduDetImpl().exam(dEduVo.getEdu_idx());
			request.setAttribute("detlist", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String listpag(HttpServletRequest request, HttpServletResponse response) {
		subTitle(request, response);
		listUtil(request, response);
		EducationVO dEduVo = (EducationVO) request.getAttribute("eduVo");
		int totalRecord = new EduDetImpl().getTotalRecord(dEduVo.getEdu_idx());
		PagingVO pvo = new PagingVO(1, totalRecord);
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			pvo = new PagingVO(Integer.parseInt(cPage), totalRecord);
		}

		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		map.put("idx", Integer.parseInt(dEduVo.getEdu_idx()));
		List<DetailEducationVO> list = new EduDetImpl().getAllPgList(map);
		
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("detaillist", list);
		request.setAttribute("pvo", pvo);
		return "eduadmin/proeducation.jsp";
	}
}
