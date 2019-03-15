package com.jbc.test.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jbc.test.dao.TestDAO;

@Service
public class TestService {
	
	@Autowired
	private TestDAO testDAO;
	
	public Map<String, String> test(int n1, int n2){
		Map<String, String> map = new HashMap<String, String>();
		try {
			map.put("today", testDAO.getToday());
			map.put("mul", testDAO.getMul(n1, n2) + "");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}
	
}