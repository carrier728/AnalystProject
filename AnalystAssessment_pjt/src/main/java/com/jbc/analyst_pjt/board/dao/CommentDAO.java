package com.jbc.analyst_pjt.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jbc.analyst_pjt.board.vo.CommentVO;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//  지정 번호의 댓글의 개수 -->
	public int selectCountRef(int c_ref) {
		return sqlSession.selectOne("mybatis.comment.selectCountRef", c_ref);
	}
	//  지정 번호의 댓글의 목록 -->
	public List<CommentVO> selectRefList(int c_ref) {
		return sqlSession.selectList("mybatis.comment.selectRefList", c_ref);
	}
	//  저장 -->
	public void insert(CommentVO vo) {
		sqlSession.insert("mybatis.comment.insert",vo);
	}
	//  수정 -->
	public void update(CommentVO vo) {
		sqlSession.update("mybatis.comment.update",vo);
	}
	//  삭제 -->
	public void delete(int c_idx) {
		sqlSession.delete("mybatis.comment.delete",c_idx);
	}
	//  지정 번호의 댓글을 모두 삭제 -->
	public void deleteRef(int c_ref) {
		sqlSession.delete("mybatis.comment.deleteRef",c_ref);
	}
	//  1개얻기 -->
	public CommentVO selectByIdx(int c_idx) {
		return sqlSession.selectOne("mybatis.comment.selectByIdx", c_idx);
	}
}
