package com.bc.edu.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.edu.model.vo.AdminDocJoinOptionVO;
import com.bc.edu.model.vo.LearnDocumentsVO;
import com.bc.resource.DBService;

public class EduLearnDocDAO {
	public List<AdminDocJoinOptionVO> learnDocIdx() throws Exception {
		SqlSession session = DBService.getFactory().openSession();
		List<AdminDocJoinOptionVO> list = session.selectList("eddoc.joineduidx");
		session.close();
		return list;
	}

	public int getTotalRecord() {
		int result = 0;
		SqlSession session = DBService.getFactory().openSession();
		result = session.selectOne("eddoc.totalrecord");
		session.close();
		return result;
	}

	public LearnDocumentsVO pickAllList(String idx) {

		SqlSession session = DBService.getFactory().openSession();
		LearnDocumentsVO vo = session.selectOne("eddoc.pickvo", idx);
		session.close();
		return vo;
	}

	public int docLiInsert(LearnDocumentsVO ldVo) {
		SqlSession session = DBService.getFactory().openSession(true);
		int res = session.insert("eddoc.docinsert", ldVo);
		session.close();
		System.out.println(res);
		return res;
	}

	public int docLiUpdate(LearnDocumentsVO ldVo) {
		SqlSession session = DBService.getFactory().openSession(true);
		int res = session.update("eddoc.docupdate", ldVo);
		session.close();
		return res;
	}

	public List<LearnDocumentsVO> LnDocAllListPg(Map<String, String> map) {
		SqlSession session = DBService.getFactory().openSession();
		List<LearnDocumentsVO> list = session.selectList("eddoc.edulndocvopg", map);
		session.close();
		for (LearnDocumentsVO ldvo : list) {
			ldvo.setEdu_period_start(ldvo.getEdu_period_start().substring(0, 10));
			ldvo.setEdu_period_end(ldvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}
	public List<LearnDocumentsVO> LnDocAllList() {
		SqlSession session = DBService.getFactory().openSession();
		List<LearnDocumentsVO> list = session.selectList("eddoc.edulndocvo");
		session.close();
		for (LearnDocumentsVO ldvo : list) {
			ldvo.setEdu_period_start(ldvo.getEdu_period_start().substring(0, 10));
			ldvo.setEdu_period_end(ldvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}

	public int docDelete(String[] checks) {
		List<String> list = new ArrayList<>(Arrays.asList(checks));
		int res = 0;
		for (String string : list) {
			SqlSession session = DBService.getFactory().openSession(true);
			System.out.println(string);
			session.update("eddoc.docdelete", string);
			session.close();
			res++;
		}
		return res;
	}
	
	public List<LearnDocumentsVO> LnDocsearchPg(Map<String, String> map) {
		SqlSession session = DBService.getFactory().openSession();
		List<LearnDocumentsVO> list = session.selectList("eddoc.LnDocsearchPg", map);
		session.close();
		for (LearnDocumentsVO ldvo : list) {
			ldvo.setEdu_period_start(ldvo.getEdu_period_start().substring(0, 10));
			ldvo.setEdu_period_end(ldvo.getEdu_period_end().substring(0, 10));
		}
		return list;
	}
}
