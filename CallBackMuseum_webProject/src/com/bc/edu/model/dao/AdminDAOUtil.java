package com.bc.edu.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.edu.model.vo.EducationVO;
import com.bc.resource.DBService;

public class AdminDAOUtil {
	
	public int insert(EducationVO eduVo) {
		SqlSession session = DBService.getFactory().openSession(true);
		int res = session.insert("edu.eduinsert",eduVo);
		session.close();
		return res;
	}
	
	public int update(EducationVO eduVo) {
		SqlSession session = DBService.getFactory().openSession(true);
		int res = session.insert("edu.eduupdate",eduVo);
		session.close();
		return res;
	}
	
	public int delete(String[] checks) {
		List<String> list = new ArrayList<>(Arrays.asList(checks));
		int res = 0;
		// 타이틀 교육 delete 상태값 변경
		for (String string : list) {
			SqlSession session = DBService.getFactory().openSession(true);
			System.out.println(string);
			session.update("edu.edudelete",string);
			session.close();
			res++;
		}
		// 타이틀 교육에 속한 db 비표시
		for (String string : list) {
			SqlSession session = DBService.getFactory().openSession(true);
			session.update("edudet.leandelete",string);
			session.close();
			res++;
		}
		return res;
	}
}
