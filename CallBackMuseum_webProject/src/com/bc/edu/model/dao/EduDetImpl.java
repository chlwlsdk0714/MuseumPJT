package com.bc.edu.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.edu.model.vo.DetailEducationVO;
import com.bc.resource.DBService;

public class EduDetImpl implements EduDetInterface{
	
	@Override
	public List<DetailEducationVO> exam(String edu_idx) throws Exception {
		SqlSession session = DBService.getFactory().openSession(); 
		List<DetailEducationVO> list = session.selectList("edudet.edudetlist", edu_idx); 
		session.close();
		for (DetailEducationVO eduvo : list) {
			eduvo.setEdu_period_start(eduvo.getEdu_period_start().substring(0, 10));
			eduvo.setEdu_period_end(eduvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}
	
	@Override
	public DetailEducationVO detailMenu(String edu_detidx) throws Exception {
		SqlSession session = DBService.getFactory().openSession();
		DetailEducationVO eduvo = session.selectOne("edudet.edudetpick", edu_detidx);
		session.close();
		
		eduvo.setEdu_period_start(eduvo.getEdu_period_start().substring(0, 10));
		eduvo.setEdu_period_end(eduvo.getEdu_period_end().substring(0, 10));
		return eduvo;
	}
	
	public List<DetailEducationVO> detailEdu() {
		SqlSession session = DBService.getFactory().openSession(); 
		List<DetailEducationVO> list = session.selectList("edudet.edudetalllist"); 
		session.close();
		for (DetailEducationVO eduvo : list) {
			eduvo.setEdu_period_start(eduvo.getEdu_period_start().substring(0, 10));
			eduvo.setEdu_period_end(eduvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}
	
	public int getTotalRecord(String idx) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession();
		result = ss.selectOne("edudet.totalRecord", idx);
		ss.close();
		return result;
	}
	
	public List<DetailEducationVO> getAllPgList(Map<String, Integer> map) {
		SqlSession session = DBService.getFactory().openSession(); 
		List<DetailEducationVO> list = session.selectList("edudet.edualllistpg", map); 
		session.close();
		for (DetailEducationVO eduvo : list) {
			eduvo.setEdu_period_start(eduvo.getEdu_period_start().substring(0, 10));
			eduvo.setEdu_period_end(eduvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}

	public int getTotalRecord() {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession();
		result = ss.selectOne("edudet.totalRecordall");
		ss.close();
		return result;
	}
	
	public int getTotalRecord2(String str) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession();
		result = ss.selectOne("edudet.aaaa", str);
		ss.close();
		return result;
	}
	
	public List<DetailEducationVO> getAllList(Map<String, Integer> map) {
		SqlSession session = DBService.getFactory().openSession(); 
		List<DetailEducationVO> list = session.selectList("edudet.edualllistpag", map); 
		session.close();
		for (DetailEducationVO eduvo : list) {
			eduvo.setEdu_period_start(eduvo.getEdu_period_start().substring(0, 10));
			eduvo.setEdu_period_end(eduvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}
	
	public List<DetailEducationVO> LnDetSearchPg(Map<String, String> map) {
		SqlSession session = DBService.getFactory().openSession(); 
		List<DetailEducationVO> list = session.selectList("edudet.edusearchlistpag", map); 
		session.close();
		for (DetailEducationVO eduvo : list) {
			eduvo.setEdu_period_start(eduvo.getEdu_period_start().substring(0, 10));
			eduvo.setEdu_period_end(eduvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}
}
