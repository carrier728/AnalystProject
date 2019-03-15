package com.jbc.analyst_pjt.member.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
CREATE TABLE member(
	m_idx NUMBER PRIMARY KEY,
	m_userId varchar2(50) NOT NULL UNIQUE,
	m_userPw varchar2(100)	NOT NULL ,
	m_userName varchar2(30)	NOT NULL ,
	m_email varchar2(100) NOT NULL,
	m_lev NUMBER DEFAULT 0,
	m_regDate timestamp DEFAULT SYSDATE, 
	m_temp  varchar2(255),
);
 */

@Data
@XmlRootElement
public class MemberVO {
	private int m_idx;
	private String m_userId;
	private String m_userPw;
	private String m_userName;
	private String m_email;
	private int m_lev;
	private Date m_regDate;
	private String m_joinKey;
	private String m_pwKey;
	private String m_temp;
}