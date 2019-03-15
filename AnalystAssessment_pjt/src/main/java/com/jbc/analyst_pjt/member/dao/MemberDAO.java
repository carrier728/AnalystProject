package com.jbc.analyst_pjt.member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jbc.analyst_pjt.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession; // mybatis
	
	// 저장
	public void insert(MemberVO memberVO) {
		sqlSession.insert("member.insert", memberVO);
	}
	
	// 레벨 변경
	public void updateLevel(String m_userId, int m_lev) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_userId", m_userId);
		map.put("m_lev", m_lev+"");
		sqlSession.update("member.updateLevel", map);
	}
	
	// 아이디 개수 조회
	public int getUserIdCount(String m_userId) {
		return sqlSession.selectOne("member.userIdCount", m_userId);
	}
	
	// 이메일 개수 조회
	public int getEmailCount(String m_email) {
		return sqlSession.selectOne("member.emailCount", m_email);
	}
	
	// 비밀번호 확인
	public String passwordCheck(String m_userId) {
		return sqlSession.selectOne("member.passwordCheck", m_userId);
	}
	
	// IDX로 가져오기
	public MemberVO selectById(String m_userId) {
		return sqlSession.selectOne("member.selectById", m_userId);
	}
	
	// 아이디 찾기
	public MemberVO findId(String m_email) {
		return sqlSession.selectOne("member.findId", m_email);
	}
	
	// 회원정보 수정
	public void update(MemberVO vo) {	
	    HashMap<String, String> map = new HashMap<String, String>();
	    map.put("m_userId", vo.getM_userId());
	    map.put("m_userName", vo.getM_userName());
	    map.put("m_email", vo.getM_email());
	    System.out.println("MemberDAO.java > update메소드 > map :" + map);
		sqlSession.update("member.update", map);
	}
	
	// 비밀번호 변경
	public void updatePw(MemberVO vo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_userId", vo.getM_userId());
		map.put("m_userPw", vo.getM_userPw());
		System.out.println("MemberDAO.java > updatePw메소드 > map :" + map);
		sqlSession.update("member.updatePw", map);
	}
	
	// 회원가입 이메일 인증 => 키 저장
    public void updateKey(String m_email, String m_joinKey) {
	    HashMap<String, String> map = new HashMap<String, String>();
	    map.put("m_email", m_email);
	    map.put("m_joinKey", m_joinKey);
	    sqlSession.update("member.updateKey", map);
    }	
    
    // 회원가입 이메일 인증 => 키 얻기
    public String getKey(String m_email) {
        return sqlSession.selectOne("member.getKey", m_email);
    }    
    
    // 비번 찾기
    public String findPw(String m_userId) {
    	return sqlSession.selectOne("member.findPw", m_userId);
    }
    
    // 비번 찾기 키 저장
    public void insertPwKey(String m_email, String m_pwKey) {
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("m_email", m_email);
    	map.put("m_pwKey", m_pwKey);
    	sqlSession.update("member.insertPwKey", map);
    }
    
    // 비번 찾기 키 초기화
    public void insertPwKey2(String m_userId) {
    	sqlSession.update("member.insertPwKey2", m_userId);
    }
    
    // 1페이지 회원정보 가져오기
    public List<MemberVO> selectMemberAll(HashMap<String, Integer> map){
    	return sqlSession.selectList("member.selectMemberAll", map);
    }
    
    // 회원 총 개수 가져오기
    public int selectCount() {
    	return sqlSession.selectOne("member.selectCount");
    }
    
	// 회원탈퇴
	public void memberOut(String m_userId) {
		sqlSession.update("member.memberOut", m_userId);
	}    
}
