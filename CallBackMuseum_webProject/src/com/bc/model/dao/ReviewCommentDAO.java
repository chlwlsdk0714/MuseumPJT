package com.bc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.ReviewCommentVO;
import com.bc.resource.DBService;

public class ReviewCommentDAO {


	// (C) 댓글 등록하기
	public static int insert(ReviewCommentVO rcvo) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.insert("RCOM.insert", rcvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}


	// (R) 특정 게시글에 달린 해당 댓글 전부 검색
	public static List<ReviewCommentVO> getCommentList(int rev_idx) {
		List<ReviewCommentVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("RCOM.commentList", rev_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	
	// (R) idx 번호로 댓글 찾기
	public static ReviewCommentVO getOne(int rcom_idx) {
		ReviewCommentVO rcvo = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			rcvo = ss.selectOne("RCOM.one", rcom_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return rcvo;
	}
	
	
	// (U) 댓글 수정
	public static int update(ReviewCommentVO rcvo) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("RCOM.update", rcvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	

	// (D) 댓글 삭제
	public static int delete(int rcom_idx) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.delete("RCOM.delete", rcom_idx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}

}
