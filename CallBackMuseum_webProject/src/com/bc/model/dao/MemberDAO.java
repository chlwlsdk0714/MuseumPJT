package com.bc.model.dao;

import org.apache.ibatis.session.SqlSession;
import com.bc.model.vo.MemberVO;
import com.bc.resource.DBService;

public class MemberDAO {

	public static MemberVO findById(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("member.findById", id);
		ss.close();
		return mvo;
	}	
	
	public static int checkId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = 0;
		result = ss.selectOne("member.checkId", id);
		ss.close();
		return result;
	}	
	
	public static boolean hasId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("member.hasId", id);
		ss.close();
		return mvo != null;
	}	
	
	// null != null
	
	public static int join(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession(true);	//오토커밋 상태의 sqlSession생성
		int result = ss.insert("member.join", mvo);
		ss.close();
		return result;
	}
	public static int update(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.update", mvo);
		ss.close();
		return result;
	}
	public static int updateToLeave(String mem_id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.updateToLeave", mem_id);
		ss.close();
		return result;
	}
}
