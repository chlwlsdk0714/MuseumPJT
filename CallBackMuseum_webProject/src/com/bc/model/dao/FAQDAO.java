package com.bc.model.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.FAQVO;
import com.bc.model.vo.NoticeVO;
import com.bc.resource.DBService;

public class FAQDAO {

	// (R) 전체 질문글 조회 
	public static List<FAQVO> getAll() {
		List<FAQVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("FAQ.all");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	// (R) 카테고리 관람 조회 
	public static List<FAQVO> getCateList(String category) {
		List<FAQVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		switch (category) {
			case "관람":
				category = "cateExhib";
				break;
			case "교통":
				category = "cateTrans";
				break;
			case "홈페이지":
				category = "cateHomePage";
				break;
			case "기타":
				category = "cateEtc";
				break;
		}
		try {
			list = ss.selectList("FAQ." + category);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	
	
	
	// (R) 게시글 1개 상세보기  
		public static NoticeVO getOne(int notiIdx) {
			NoticeVO nvo = null;
			SqlSession ss = DBService.getFactory().openSession();
			try {
				nvo = ss.selectOne("NOTICE.one", notiIdx);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ss.close();
			}
			return nvo;
		}
	
	// (U) 조회수 1 증가 
	public static int updateHit(int notiIdx) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("NOTICE.hit", notiIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
}
