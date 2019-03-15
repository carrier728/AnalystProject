package com.jbc.analyst_pjt.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jbc.analyst_pjt.board.vo.Paging;
import com.jbc.analyst_pjt.member.dao.MemberDAO;
import com.jbc.analyst_pjt.member.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	// 저장
	public void insert(MemberVO memberVO) {
		if (memberVO != null && memberVO.getM_userId() != null)
			memberDAO.insert(memberVO);
	}
	
	// 레벨 변경
	public void updateLevel(String m_userId, int m_lev) {
		// 해당 userid의 글을 읽어온다.
		// vo가 널이 아니면서 lev이 다른 경우에만 업데이트를 한다.
		memberDAO.updateLevel(m_userId, m_lev);
	}

	// 아이디 개수 조회
	public int getUserIdCount(String m_userId) {
		return memberDAO.getUserIdCount(m_userId);
	}
	
	// 이메일 개수 조회
	public int getEmailCount(String m_email) {
		return memberDAO.getEmailCount(m_email);
	}
	
	// 비밀번호 확인
	public int passwordCheck(String m_userId, String m_userPw) {
		int idcount = memberDAO.getUserIdCount(m_userId);
		String log_password = memberDAO.passwordCheck(m_userId);

		if (idcount == 0) {
			return 1;
		} else if (idcount != 0 && !m_userPw.equals(log_password)) {
			return 2;
		} else {
			return 3;
		}
	}

	// IDX로 가져오기
	public MemberVO selectById(String m_userId) {
		return memberDAO.selectById(m_userId);
	}
	
	// 아이디 찾기
	public MemberVO findId(String m_email) {
		return memberDAO.findId(m_email);
	}
	
	// 회원정보 수정
	public void updateOk(MemberVO vo) {
		System.out.println("MemberService.java > updateOk메소드 > 3가지 :" + vo);
		String real_pw = memberDAO.passwordCheck(vo.getM_userId());
		if(vo.getM_userPw().equals(real_pw)){
		memberDAO.update(vo);
		}
	}
	
	// 비밀번호 변경
	public void updatePw(MemberVO vo) {
		System.out.println("MemberService.java > updatePw메소드 > 3가지 :" + vo);
		memberDAO.updatePw(vo);
	}
	// 비밀번호 재설정
	public void updatePw2(MemberVO vo) {
		System.out.println("MemberService.java > updatePw2메소드 > 3가지 :" + vo);
		memberDAO.updatePw(vo);
	}
	
    // 회원가입 키 저장
    public void updateKey(String m_email, String m_joinKey) {
        memberDAO.updateKey(m_email, m_joinKey);
    }
    
    // 회원가입 키 얻기
    public String getKey(String m_email) {
            return memberDAO.getKey(m_email);
    }
    
    // 비번 찾기
    public String findPw(String m_userId) {
    	return memberDAO.findPw(m_userId);
    }
    
    // 비번 찾기 키 저장
    public void insertPwKey(String m_email, String m_pwKey) {
    	memberDAO.insertPwKey(m_email, m_pwKey);
    }
    
    // 비번 찾기 키 초기화
    public void insertPwKey2(String m_userId) {
    	memberDAO.insertPwKey2(m_userId);
    }
    
    // 회원정보 1페이지 가져오기
    public Paging<MemberVO> selectMemberAll(int currentPage, int pageSize, int blockSize) {
    	Paging<MemberVO> paging = null;
    	int totalCount = memberDAO.selectCount();
    	paging = new Paging<MemberVO>(totalCount, currentPage, pageSize, blockSize);
    	if(totalCount>0) {
    		HashMap<String, Integer> map = new HashMap<String, Integer>();
    		map.put("startNo", paging.getStartNo());
    		map.put("endNo", paging.getEndNo());
    		List<MemberVO> list = memberDAO.selectMemberAll(map); // 1페이지 분량 가져오기
    		// 변경된 리스트 페이징 객체에 삽입
    		paging.setLists(list);
    	}
    	return paging;
    }
    
	// 회원 탈퇴
	public void memberOut(String m_userId) {
		memberDAO.memberOut(m_userId);
	}    
}
