package com.bc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.ReviewVO;
import com.bc.resource.DBService;

public class ReviewDAO {

	// (C) 회원이 새글 쓰기
	public static int insert(ReviewVO rvo) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.insert("REVIEW.insert", rvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (R) 최근 게시한 글 한 개 검색
	public static ReviewVO getNew() {
		ReviewVO rvo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			rvo = ss.selectOne("REVIEW.new");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return rvo;
	}


	// (R) 전체 게시글 수 검색
	public static int getTotalRecord() {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			result = ss.selectOne("REVIEW.totalRecord");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (R) 페이징 처리된 게시글 조회 
	public static List<ReviewVO> getList(Map<String, Integer> map) {
		List<ReviewVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("REVIEW.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}


	// (R) 게시글 1개 상세보기  
	public static ReviewVO getOne(int rev_idx) {
		ReviewVO rvo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			rvo = ss.selectOne("REVIEW.one", rev_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return rvo;
	}


//	// (R) 검색결과 총 건수 구하기
//	public static int getSearchRecord(String searchText) {
//		int result = 0;
//		SqlSession ss = DBService.getFactory().openSession();
//		try {
//			result = ss.selectOne("NOTICE.searchRecord", searchText);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			ss.close();
//		}
//		System.out.println("DAO result: " + result);
//		return result;
//	}


//	// (R) 검색결과물 리스트 반환
//	public static List<NoticeVO> getSearchList(Map<String, String> map) {
//		List<NoticeVO> list = null;
//		SqlSession ss = DBService.getFactory().openSession();
//		try {
//			list = ss.selectList("NOTICE.searchList", map);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			ss.close();
//		}
//		return list;
//	}


	// (U) 조회수 1 증가 
	public static int updateHit(int rev_idx) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("REVIEW.hit", rev_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (U) 글 수정하기  
	public static int update(ReviewVO rvo) {
		int result = 0;
		System.out.println("rvo.getRev_ori_name: " + rvo.getRev_ori_name());
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("REVIEW.update", rvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (D..U) 글 삭제
	public static int delete(int rev_idx) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("REVIEW.delete", rev_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}

}
