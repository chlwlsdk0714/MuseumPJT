package com.bc.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;import com.bc.model.vo.InquiryPaging;
import com.bc.model.vo.InquiryVO;
import com.bc.resource.DBService;

public class InquiryDAO {
	
	public static InquiryVO writeInquiry(InquiryVO ivo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("inquiry.writeInquiry", ivo);
		if (result == 0) {
			ss.close();
			return null;
		}
		
		int inqNum = ss.selectOne("inquiry.currval");
		ivo.setInq_num(inqNum);
		InquiryVO vo = ss.selectOne("inquiry.findById", inqNum);
		ss.close();
		return vo;
	}
	
	public static List<InquiryVO> findbyWriter(String writer) {
		SqlSession ss = DBService.getFactory().openSession();
		List<InquiryVO> lvo = new ArrayList<>();
		lvo = ss.selectList("inquiry.findByWriter", writer);
		ss.close();
		for (InquiryVO ivo : lvo) {
			ivo.setInq_date(ivo.getInq_date().substring(0, 10));//10개 숫자까지만 저장(날짜)
		}
		
		return lvo;
	}
	
	public static InquiryVO findByInqnum(String inq_num) {
		SqlSession ss = DBService.getFactory().openSession();
		InquiryVO ivo = ss.selectOne("inquiry.findByInqnum", inq_num);
		ss.close();
		return ivo;
	}
	
	public static int updateInq(InquiryVO ivo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("inquiry.update", ivo);
		ss.close();
		return result;
	}
	
	public static int delStatus(InquiryVO ivo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("inquiry.delStatus", ivo);
		ss.close();
		return result;
	}
	
	public static int appendComment(String adminName, String content, int inq_num) {
		SqlSession ss = DBService.getFactory().openSession(true);
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("inq_admin_writer", adminName);
		parameterMap.put("inq_answer", content);
		parameterMap.put("inq_num", inq_num);		
				
		int result = ss.update("inquiry.appendComment", parameterMap);
		ss.close();
		return result;
	}
	
	public static int delComment(int inq_num) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("inquiry.delComment", inq_num);
		ss.close();
		return result;
	}
	
	public static Map<String, Object> list(String writer, int nowPage, String memberId) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("writer", writer);
		parameterMap.put("id", memberId);		
		
		int totalRow = ss.selectOne("inquiry.totalRow", parameterMap);
		//전체 게시글 수
		
		InquiryPaging paging = new InquiryPaging(totalRow, nowPage);
		System.out.println(paging);
		
		parameterMap.put("startRow", paging.getStartRow());
		parameterMap.put("endRow", paging.getEndRow());
		
		// 현재 페이지에 해당하는 리스트 가져오기
		List<InquiryVO> list = ss.selectList("inquiry.list", parameterMap);
		
		resultMap.put("list", list);	//전체 게시글 수
		resultMap.put("paging", paging);
		
		System.out.println(parameterMap);
		System.out.println(resultMap);
		return resultMap;
	}
	

}
