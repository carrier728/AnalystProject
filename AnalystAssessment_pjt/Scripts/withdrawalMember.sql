DROP TABLE withdrawalMember;

CREATE TABLE withdrawalMember(
	m_idx NUMBER(5) PRIMARY KEY,
	m_userId varchar2(20) NOT NULL,
	m_userPw varchar2(30) NOT NULL,
	m_userName varchar2(30) NOT NULL,
	m_email varchar2(50) NOT NULL,
	m_lev NUMBER(3) NOT NULL,
	m_regDate timestamp NOT NULL,
	m_joinKey varchar2(50) DEFAULT '',
	m_pwKey varchar2(50) DEFAULT '',
	m_temp varchar2(100)
);