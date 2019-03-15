package com.jbc.analyst_pjt.assess.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jbc.analyst_pjt.report.vo.ChangeRateVO;
import com.jbc.analyst_pjt.report.vo.CountVO;
import com.jbc.analyst_pjt.report.vo.ReportVO;

@Repository
public class AssessDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 전체 보고서 개수 구하기
	public int countReport(String analystName) {
		return sqlSession.selectOne("mybatis.assess.countReport", analystName);
	}
	
	// BUY 보고서 개수 한꺼번에 가져오기
	public CountVO countBuyReport(String analystName) {
		return sqlSession.selectOne("mybatis.assess.countBuyReport", analystName);
	}
	
	// 적중 BUY 보고서 개수 한꺼번에 가져오기
	public CountVO countHitBuyReport(String analystName) {
		return sqlSession.selectOne("mybatis.assess.countHitBuyReport", analystName);
	}
	
	// SELL 보고서 개수 한꺼번에 가져오기
	public CountVO countSellReport(String analystName) {
		return sqlSession.selectOne("mybatis.assess.countSellReport", analystName);
	}
	
	// 적중 SELL 보고서 개수 한꺼번에 가져오기
	public CountVO countHitSellReport(String analystName) {
		return sqlSession.selectOne("mybatis.assess.countHitSellReport", analystName);
	}
	
	// 최근 보고서 구하기
	public List<ReportVO> recentReport(String analystName) {
		return sqlSession.selectList("mybatis.assess.recentReport", analystName);
	}
	
	// BUY 주가 상승률 구하기
	public ChangeRateVO changeBuyRate(String analystName) {
		return sqlSession.selectOne("mybatis.assess.changeBuyRate", analystName);
	}
	
	// SELL 주가 상승률 구하기
	public ChangeRateVO changeSellRate(String analystName) {
		return sqlSession.selectOne("mybatis.assess.changeSellRate", analystName);
	}
	
	// 목표가 달성 BUY 보고서 개수 구하기
	public CountVO targetRate(String analystName) {
		return sqlSession.selectOne("mybatis.assess.targetRate", analystName);
	}
}
