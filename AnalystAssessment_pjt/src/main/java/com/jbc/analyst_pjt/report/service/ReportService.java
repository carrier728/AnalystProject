package com.jbc.analyst_pjt.report.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jbc.analyst_pjt.board.vo.Paging;
import com.jbc.analyst_pjt.report.dao.ReportDAO;
import com.jbc.analyst_pjt.report.vo.IndustryVO;
import com.jbc.analyst_pjt.report.vo.ReportVO;

@Service
public class ReportService {

	@Autowired
	private ReportDAO reportDAO;

	// 리스트
	public Paging<ReportVO> selectList(int currentPage, int pageSize, int blockSize) {
		Paging<ReportVO> paging = null;
		int totalCount = reportDAO.selectCount(); // 전체 개수 얻기
		// 페이징 객체 생성
		paging = new Paging<ReportVO>(totalCount, currentPage, pageSize, blockSize);
		if (totalCount > 0) { // 글이 존재할때만
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", paging.getStartNo());
			map.put("endNo", paging.getEndNo());
			List<ReportVO> list = reportDAO.selectList(map); // 1페이지 분량 얻어오기
			// 변경된 리스트를 페이징 객체에 넣어준다.
			paging.setLists(list);
		}
		return paging;
	}

	// 저장
	public void insert(ReportVO reportVO) {
		if (reportVO != null && reportVO.getAnalystName() != null)
			reportDAO.insert(reportVO);
	}

	// 내용보기
	public ReportVO view(int reportNo) {
		ReportVO vo = null;
		vo = reportDAO.selectByReportNo(reportNo);
		return vo;
	}

	// 1개얻기
	public ReportVO selectByReportNo(int reportNo) {
		return reportDAO.selectByReportNo(reportNo);
	}

	// 수정
	public void updateOk(ReportVO vo) {
		if (vo != null && vo.getReportNo() != 0) {
			reportDAO.update(vo);
		}
	}

	// 삭제
	public void deleteOk(ReportVO vo) {
		if(vo!=null) {
			reportDAO.delete(vo.getReportNo());
		}
	}
	
	// 주가 수정
	public void priceUpdate(ReportVO vo) {
		if (vo != null && vo.getReportNo() != 0) {
			reportDAO.priceUpdate(vo);
		}
	}
	
	// 산업명 테이블 가져오기
	public List<IndustryVO> industryList(){
		return reportDAO.industryList();
	}
	
	// 애널리스트 이름 저장 개수
	public int getAnalystNameCount(String analystName) {
		int analystCount = reportDAO.getAnalystNameCount(analystName);
		System.out.println("@@@@@@@@@@@@@@@@@");
		System.out.println("reportService > analystNameCount : " + analystCount);
		System.out.println("@@@@@@@@@@@@@@@@@");
		return reportDAO.getAnalystNameCount(analystName);
	}
}
