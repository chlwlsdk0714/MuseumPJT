package com.bc.edu.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.edu.model.vo.EducationVO;
import com.bc.resource.DBService;

public class EduDAOImpl implements EduDAOInterface{

	@Override
	public List<EducationVO> exam() throws Exception {
		 	 
		 SqlSession session = DBService.getFactory().openSession(); 
		 List<EducationVO> list = session.selectList("edu.allList"); 
		 session.close();
		 return list;
	}
	
	@Override
	public EducationVO detailMenu(String edu_title) throws Exception {
		SqlSession session = DBService.getFactory().openSession(); 
		EducationVO edVo = session.selectOne("edu.eduvo", edu_title);
		session.close();
		return edVo;
	}
	
	public EducationVO detailSelectIdx(String idx) throws Exception {
		SqlSession session = DBService.getFactory().openSession(); 
		EducationVO edVo = session.selectOne("edu.eduvoselect", idx);
		session.close();
		return edVo;
	}
	
	
}
