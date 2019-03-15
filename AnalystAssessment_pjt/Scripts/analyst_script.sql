CREATE SEQUENCE analystCode_seq;
CREATE TABLE analyst (
	analystCode NUMBER PRIMARY KEY,
	analystName VARCHAR2(50) NOT NULL,
	firmName VARCHAR2(50) NOT NULL,
	industryName VARCHAR2(50) NOT NULL
);