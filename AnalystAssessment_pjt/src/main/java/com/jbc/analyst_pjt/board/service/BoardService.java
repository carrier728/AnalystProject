package com.jbc.analyst_pjt.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jbc.analyst_pjt.board.dao.BoardDAO;
import com.jbc.analyst_pjt.board.dao.CommentDAO;
import com.jbc.analyst_pjt.board.vo.BoardVO;
import com.jbc.analyst_pjt.board.vo.CommentVO;
import com.jbc.analyst_pjt.board.vo.Paging;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private CommentDAO commentDAO;
	
	// 리스트
	public Paging<BoardVO> selectList(int currentPage, int pageSize, int blockSize){
		Paging<BoardVO> paging = null;
		int totalCount = boardDAO.selectCount(); // 전체 개수 얻기
		// 페이징 객체 생성
		paging = new Paging<BoardVO>(totalCount, currentPage, pageSize, blockSize);
		if(totalCount>0) { // 글이 존재할때만
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", paging.getStartNo());
			map.put("endNo", paging.getEndNo());
			List<BoardVO> list = boardDAO.selectList(map); // 1페이지 분량 얻어오기
			// 여기에서는 댓글의 개수를 리스트에 넣어야 한다.
			if(list!=null && list.size()>0) { // 글이 존재하면
				for(BoardVO vo : list) {
					// 지정글의 댓글의 개수를 구한다.
					int commentCount = commentDAO.selectCountRef(vo.getB_idx());
					// 댓글의 개수에 VO에 넣는다.
					vo.setCommentCount(commentCount);
				}
			}
			// 변경된 리스트를 페이징 객체에 넣어준다.
			paging.setLists(list);
		}
		return paging;
	}
	// 저장하기
	public void writeOk(BoardVO vo) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("BoardService > writeOk > BoardVO vo : " + vo);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");		
		// vo값이 유효한지 판단을 꼭해줘야 한다.
		if(vo!=null) boardDAO.insert(vo);
	}
	
	// 내용보기
	// mode값이 0 이면 조회수를 증가시키지 않고 1이면 조회수 증가
	public BoardVO view(int b_idx, int mode) {
		BoardVO vo = null; 
		vo = boardDAO.selectByIdx(b_idx); // 글가져오기
		if(vo!=null) { // 글이 존재하면
			if(mode==1) {
				boardDAO.hitUpdate(b_idx); // 조회수 증가
				vo.setB_hit(vo.getB_hit()+1);
			}
			// 댓글을 읽어서 VO에 넣어준다.
			List<CommentVO> list = commentDAO.selectRefList(b_idx);
			vo.setCommentCount(list.size());
			vo.setCommentList(list);
		}
		return vo;
	}
	// 댓글 저장
	public void commentInsertOk(CommentVO vo) {
		// vo의 유효성을 검사해야 한다.
		if(vo.getC_ref()!=0) {
			commentDAO.insert(vo);
		}
	}
	// 댓글 수정
	public void commentUpdateOk(CommentVO vo) {
		// vo의 유효성을 검사해야 한다.
		if(vo.getC_ref()!=0) {
			CommentVO dbVO = commentDAO.selectByIdx(vo.getC_idx());
			if(dbVO!=null && dbVO.getM_userPw().equals(vo.getM_userPw())) { // 비번이 같을때만
				commentDAO.update(vo);
			}
		}
	}
	// 댓글 삭제
	public void commentDeleteOk(CommentVO vo) {
		// vo의 유효성을 검사해야 한다.
		if(vo.getC_ref()!=0) {
			CommentVO dbVO = commentDAO.selectByIdx(vo.getC_idx());
			if(dbVO!=null && dbVO.getM_userPw().equals(vo.getM_userPw())) { // 비번이 같을때만
				commentDAO.delete(vo.getC_idx());
			}
		}
	}
	// 1개얻기
	public BoardVO selectByIdx(int idx) {
		return boardDAO.selectByIdx(idx);
	}
	// 댓글 1개 얻기
	public CommentVO selectByCommentIdx(int c_idx) {
		return commentDAO.selectByIdx(c_idx);
	}	
	// 수정
	public void updateOk(BoardVO vo) {
		// vo값이 유효한지 판단을 꼭해줘야 한다.
		if(vo!=null && vo.getB_idx()!=0) {
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println("BoardService > updateOk > vo : " + vo);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");			
			BoardVO dbVO = boardDAO.selectByIdx(vo.getB_idx());
			if(dbVO!=null && dbVO.getM_userPw().equals(vo.getM_userPw())) { // 비번이 같을때만
				boardDAO.update(vo);
			}
		}
	}
	// 삭제
	public void deleteOk(BoardVO vo) {
		BoardVO dbVO = boardDAO.selectByIdx(vo.getB_idx());
		if(dbVO!=null && dbVO.getM_userPw().equals(vo.getM_userPw())) { // 비번이 같을때만
			boardDAO.delete(vo.getB_idx());
		}
	}
	
}
