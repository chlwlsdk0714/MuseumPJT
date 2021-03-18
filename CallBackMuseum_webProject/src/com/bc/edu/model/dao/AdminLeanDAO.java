package com.bc.edu.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.edu.model.vo.DetailEducationVO;
import com.bc.resource.DBService;

public class AdminLeanDAO {

	public int delete(String[] checks) {
		List<String> list = new ArrayList<>(Arrays.asList(checks));
		int res = 0;

		// 타이틀 교육에 속한 db 비표시
		for (String string : list) {
			SqlSession session = DBService.getFactory().openSession(true);
			session.update("edudet.leandelete",string);
			session.close();
			res++;
		}
		return res;
	}
	
	
	public int learnUpdate(DetailEducationVO learnvo) {
		int res = 0;
		System.out.println(learnvo);
		SqlSession session = DBService.getFactory().openSession(true);
		session.update("edudet.leanpgupdate", learnvo);
		session.close();
		res++;
		return res;
	}
	
	public int learnInsert(DetailEducationVO learnvo) {
		int res = 0;
		SqlSession session = DBService.getFactory().openSession(true);
		session.insert("edudet.leanpgInsert", learnvo);
		session.close();
		res++;
		return res;
	}
}
