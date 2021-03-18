
package com.bc.controller.exhibition;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.ExhibitionDAO;
import com.bc.model.vo.ExhibVO;
import com.google.gson.Gson;

@WebServlet("/exhibition/year")
public class YearController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	//ajax처리용 서블릿 //연도 선택 버튼 눌렀을 때
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("기간별전시서블릿여기");
		
		//DB에서 데이터 조회 후 JSON 형식 문자열 생성 후 응답 처리
		
		//DB데이터 조회
		List<ExhibVO> list = ExhibitionDAO.getList();
		List<YearForm> parsedList = new ArrayList<>();
		//System.out.println("여기:" + list.get(0));
		//System.out.println("여기:" + list.get(1));
		//System.out.println("여기 : " + list);
		
		//검색된 데이터 JSON 문자열로 바꾸기
		String result = "{\"list\" : [";
		for(ExhibVO vo : list) {
			parsedList.add(new YearForm(vo.getExhib_idx(), vo.getExhib_thumb_path(), vo.getExhib_subject(), vo.getStartString(), vo.getEndString()));
			result += "{";
			result += "\"exhib_idx\" : \"" + vo.getExhib_idx() +"\",";
			result += "\"exhib_thumb_path\" : \"" + vo.getExhib_thumb_path() +"\",";
			result += "\"exhib_subject\" : \"" + vo.getExhib_subject() +"\",";
			result += "\"getStartString\" : \"" + vo.getStartString() +"\",";
			result += "\"getEndString\" : \"" + vo.getEndString() +"\"";
			result += "},";
		}
		
		System.out.println("parse list : "+parsedList + "parseList");
		//문자열 맨 마지막 콤마 제거
		result = result.substring(0,result.length() -1);
		
		result += "]}";
		System.out.println("result : " + result);
		
		Map<String, List<YearForm>> map = new HashMap<>();
		map.put("list", parsedList);
		
		result = new Gson().toJson(map);				
		//JSON 문자열 출력
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(result);
	}
}

class YearForm { //DTO를 사용하는 셈! 제대로 쓰는 것은 다오에서 검색한걸 DTO를 써서 해주고...
	int exhib_idx;
	String exhib_thumb_path;
	String exhib_subject;
	String getStartString;
	String getEndString;
	
	public YearForm(int exhib_idx, String exhib_thumb_path, String exhib_subject, String getStartString,
			String getEndString) {
		super();
		this.exhib_idx = exhib_idx;
		this.exhib_thumb_path = exhib_thumb_path;
		this.exhib_subject = exhib_subject;
		this.getStartString = getStartString;
		this.getEndString = getEndString;
	}	
}
