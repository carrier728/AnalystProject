package com.jbc.analyst_pjt.analyst.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jbc.analyst_pjt.analyst.dao.AnalystDAO;
import com.jbc.analyst_pjt.analyst.vo.AnalystVO;
import com.jbc.analyst_pjt.board.vo.Paging;

@Service
public class AnalystService {
	
	@Autowired
	private AnalystDAO analystDAO;
	
	// 리스트
	public Paging<AnalystVO> selectList(int currentPage, int pageSize, int blockSize){
		Paging<AnalystVO> paging = null;
		int totalCount = analystDAO.selectCount(); // 전체 개수 얻기
		// 페이징 객체 생성
		paging = new Paging<AnalystVO>(totalCount, currentPage, pageSize, blockSize);
		if(totalCount>0) { // 글이 존재할때만
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", paging.getStartNo());
			map.put("endNo", paging.getEndNo());
			List<AnalystVO> list = analystDAO.selectList(map); // 1페이지 분량 얻어오기
			// 변경된 리스트를 페이징 객체에 넣어준다.
			paging.setLists(list);
		}
		return paging;
	}
	
	// 저장
	public void insert(AnalystVO analystVO) {
		if(analystVO != null && analystVO.getAnalystName() != null)
			analystDAO.insert(analystVO);
	}
	
	// 내용보기
	public AnalystVO view(int analystCode) {
		AnalystVO vo = null;
		vo = analystDAO.selectByAnalystCode(analystCode);
		return vo;
	}
	
	// 1개얻기
	public AnalystVO selectByAnalystCode(int analystCode) {
		return analystDAO.selectByAnalystCode(analystCode);
	}
	
	// 수정
	public void updateOk(AnalystVO vo) {
		if(vo!=null && vo.getAnalystCode()!=0) {
			AnalystVO dbVO = analystDAO.selectByAnalystCode(vo.getAnalystCode());
			if(dbVO!=null) {
				analystDAO.update(vo);
			}
		}
	}
	
	// 삭제
	public void deleteOk(AnalystVO vo) {
		AnalystVO dbVO = analystDAO.selectByAnalystCode(vo.getAnalystCode());
		if(dbVO!=null) {
			analystDAO.delete(vo.getAnalystCode());
		}
	}	
}
