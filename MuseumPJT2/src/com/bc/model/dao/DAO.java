package com.bc.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.ExhibVO;
import com.bc.resource.DBService;

public class DAO {
	
	//전시 리스트 조회
	public static List<ExhibVO> getList(){
		try {
			SqlSession ss = DBService.getFactory().openSession();
			List<ExhibVO> list = ss.selectList("MUSEUM.list");
			ss.close();
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//전체 게시글 수 구하기
	public static int getTotalRecord() {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession();
		result = ss.selectOne("MUSEUM.totalRecord");
		ss.close();
		return result;
	}
	
	// 페이징 처리된 게시글 리스트 불러오기 //현재전시
	public static List<ExhibVO> getPaging(Map<String, Integer> map) {
		List<ExhibVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		list = ss.selectList("MUSEUM.paging", map);
		ss.close();
		
		return list;
	}
	
	
	//전시명으로 검색  
	public static List<ExhibVO> searchList(String exhib_subject){
		SqlSession ss = DBService.getFactory().openSession();
		List<ExhibVO> list = ss.selectList("MUSEUM.search", exhib_subject);
		ss.close();
		return list;	
	}
	
	//상세페이지 이동
	public static ExhibVO forDetail(int exhib_idx){
		SqlSession ss = DBService.getFactory().openSession();
		ExhibVO evo = ss.selectOne("MUSEUM.detail", exhib_idx);
		ss.close();
		return evo;	
	}
	
	//전시정보 입력
	public static int insertData(ExhibVO vo){
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("MUSEUM.insert", vo);
		if (result > 0) {
			result = ss.selectOne("MUSEUM.currval");
		}
		ss.close();
		return result;	
	}

	//전시정보 수정
	public static int updateData(ExhibVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("MUSEUM.update", vo);
		ss.close();
		return result;	
	}
	
	//전시정보 삭제
	public static int deleteData(int exhib_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("MUSEUM.delete", exhib_idx);
		ss.close();
		return result;	
	}
	
}
