DROP TABLE MEMBER;

CREATE TABLE member(
	m_idx NUMBER(5) PRIMARY KEY,
	m_userId varchar2(20) NOT NULL,
	m_userPw varchar2(30) NOT NULL,
	m_userName varchar2(30) NOT NULL,
	m_email varchar2(50) NOT NULL,
	m_lev NUMBER(3) DEFAULT 0,
	m_regDate timestamp DEFAULT SYSDATE,
	m_joinKey varchar2(50) DEFAULT '',
	m_pwKey varchar2(50) DEFAULT '',
	m_temp varchar2(100)
);
CREATE SEQUENCE member_idx_seq;

DROP SEQUENCE reportNo_seq;
DROP TABLE report;

CREATE SEQUENCE reportNo_seq;
CREATE TABLE report(
	reportNo NUMBER(10) PRIMARY KEY,
	itemName VARCHAR(50) NOT NULL,
	reportDate DATE NOT NULL,
	industryName VARCHAR2(50) NOT NULL,
	analystName VARCHAR2(50) NOT NULL,
	investOpinion VARCHAR2(10) NOT NULL,
	targetPrice NUMBER(10) DEFAULT -1,
	currentPrice NUMBER(10) NOT NULL,
	after1MPrice NUMBER(10) DEFAULT -1,
	after3MPrice NUMBER(10) DEFAULT -1,
	after6MPrice NUMBER(10) DEFAULT -1,
	after1YPrice NUMBER(10) DEFAULT -1
);
DROP SEQUENCE industryIdx_seq;
DROP TABLE INDUSTRY;
CREATE SEQUENCE industryIdx_seq;
CREATE TABLE industry(
	industryIdx number(5) PRIMARY KEY,
	industryName varchar2(50) NOT NULL
);

CREATE SEQUENCE board_idx_seq;
CREATE TABLE board(
	b_idx NUMBER PRIMARY KEY,
	m_userId VARCHAR2(50) NOT NULL,
	m_userPw VARCHAR2(100) NOT NULL,
	b_title VARCHAR2(150) NOT NULL,
	b_content VARCHAR2(2000) NOT NULL,
	b_date TIMESTAMP DEFAULT SYSDATE,
	b_hit NUMBER DEFAULT 0
	);
	
CREATE SEQUENCE comment_idx_seq;
CREATE TABLE board_comment(
	c_idx NUMBER PRIMARY KEY,
	c_ref NUMBER NOT NULL,
	m_userId VARCHAR2(50) NOT NULL,
	m_userPw VARCHAR2(100) NOT NULL,
	c_content VARCHAR2(2000) NOT NULL,
	c_date TIMESTAMP DEFAULT SYSDATE,
	c_group NUMBER(4),
	c_step NUMBER(4),
	c_indent NUMBER(4)
	);
	
CREATE SEQUENCE analystCode_seq;
CREATE TABLE analyst (
	analystCode NUMBER PRIMARY KEY,
	analystName VARCHAR2(50) NOT NULL,
	firmName VARCHAR2(50) NOT NULL,
	industryName VARCHAR2(50) NOT NULL
);