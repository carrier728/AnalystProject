package com.jbc.analyst_pjt.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jbc.analyst_pjt.board.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//  1. 전체 개수 구하기 -->
	public int selectCount() {
		return sqlSession.selectOne("mybatis.board.selectCount");
	}
	//  2. 1개 구하기 -->
	public BoardVO selectByIdx(int b_idx) {
		return sqlSession.selectOne("mybatis.board.selectByIdx", b_idx);
	}
	//  3. 1페이지 구하기 -->
	public List<BoardVO> selectList(HashMap<String, Integer> map) {
		return sqlSession.selectList("mybatis.board.selectList", map);
	}
	//  4. 저장 -->
	public void insert(BoardVO vo) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("BoardDAO > insert > BoardVO vo : " + vo);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
		sqlSession.insert("mybatis.board.insert",vo);
	}
	//  5. 수정 -->
	public void update(BoardVO vo) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("BoardDAO > updateOk > vo : " + vo);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		sqlSession.update("mybatis.board.update",vo);
	}
	//  6. 삭제 -->
	public void delete(int b_idx) {
		sqlSession.delete("mybatis.board.delete",b_idx);
	}
	//  7. 조회수증가 -->
	public void hitUpdate(int b_idx) {
		sqlSession.update("mybatis.board.hitUpdate",b_idx);
	}
}
