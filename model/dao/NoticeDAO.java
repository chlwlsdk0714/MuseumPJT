package com.bc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.NoticeVO;
import com.bc.resource.DBService;

public class NoticeDAO {

	// (C) 관리자가 새글 쓰기
	public static int insert(Map<String, String> map) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.insert("NOTICE.insert", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (R) 방금 쓴 새글 1개 검색 
		public static NoticeVO getNew() {
			NoticeVO nvo = null;
			SqlSession ss = DBService.getFactory().openSession();
			try {
				nvo = ss.selectOne("NOTICE.new");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ss.close();
			}
			return nvo;
		}


	// (R) 전체 게시글 수 검색
	public static int getTotalRecord() {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			result = ss.selectOne("NOTICE.totalRecord");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (R) 전체 게시글 조회 
	public static List<NoticeVO> getAll() {
		List<NoticeVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("NOTICE.all");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}


	// (R) 페이징 처리된 게시글 조회 
	public static List<NoticeVO> getList(Map<String, Integer> map) {
		List<NoticeVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("NOTICE.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}


	// (R) 게시글 1개 상세보기  
	public static NoticeVO getOne(int noti_idx) {
		NoticeVO nvo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			nvo = ss.selectOne("NOTICE.one", noti_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return nvo;
	}


	// (R) 검색결과 총 건수 구하기
	public static int getSearchRecord(String searchText) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			result = ss.selectOne("NOTICE.searchRecord", searchText);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		System.out.println("DAO result: " + result);
		return result;
	}


	// (R) 검색결과물 리스트 반환
	public static List<NoticeVO> getSearchList(Map<String, String> map) {
		List<NoticeVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("NOTICE.searchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}


	// (U) 조회수 1 증가 
	public static int updateHit(int noti_idx) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("NOTICE.hit", noti_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (U) 관리자가 글 수정
	public static int update(NoticeVO nvo) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("NOTICE.update", nvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (D..U) 관리자가 글 삭제
	public static int delete(int noti_idx) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("NOTICE.delete", noti_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	
}
