package com.jbc.test.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {
	@Autowired
	private SqlSession sqlSession; // mybatis
	
	public String getToday() throws SQLException {
		return (String) sqlSession.selectOne("mybatis.test.today");
	}
	
	public int getMul(int n1, int n2) throws SQLException {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("num1", n1);
		map.put("num2", n2);
		return (Integer) sqlSession.selectOne("mybatis.test.mul", map);
	}

}
