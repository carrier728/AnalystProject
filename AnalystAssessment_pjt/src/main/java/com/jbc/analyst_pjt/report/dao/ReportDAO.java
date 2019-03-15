package com.jbc.analyst_pjt.report.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jbc.analyst_pjt.report.vo.IndustryVO;
import com.jbc.analyst_pjt.report.vo.ReportVO;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 개수 가져오기
	public int selectCount() {
		return sqlSession.selectOne("mybatis.report.selectCount");
	}
	
	// 1개 값 가져오기
	public ReportVO selectByReportNo(int reportNo) {
		return sqlSession.selectOne("mybatis.report.selectByReportNo", reportNo);
	}
	
	// 1페이지 값 가져오기
	public List<ReportVO> selectList(HashMap<String, Integer> map){
		return sqlSession.selectList("mybatis.report.selectList", map);
	}
	
	// 저장
	public void insert(ReportVO vo) {
		sqlSession.insert("mybatis.report.insert", vo);
	}
	
	// 수정
	public void update(ReportVO vo) {
		sqlSession.update("mybatis.report.update", vo);
	}
	
	// 삭제
	public void delete(int reportNo) {
		sqlSession.delete("mybatis.report.delete", reportNo);
	}
	
	// 주가 수정
	public void priceUpdate(ReportVO vo) {
		sqlSession.update("mybatis.report.priceUpdate", vo);
	}
	
	// 산업명 테이블 가져오기
	public List<IndustryVO> industryList() {
		return sqlSession.selectList("mybatis.report.industryList");
	}
	
	// 애널리스트 이름 개수
	public int getAnalystNameCount(String analystName) {
		return sqlSession.selectOne("mybatis.report.analystNameCount", analystName);
	}
}
