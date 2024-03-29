DROP TABLE BOARD;
DROP SEQUENCE board_idx_seq;
DROP TABLE BOARD_COMMENT;
DROP SEQUENCE comment_idx_seq;

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