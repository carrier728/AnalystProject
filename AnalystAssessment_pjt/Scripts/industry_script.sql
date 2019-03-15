CREATE SEQUENCE industryIdx_seq;
CREATE TABLE industry(
	industryIdx number(5) PRIMARY KEY,
	industryName varchar2(50) NOT NULL
);

DROP SEQUENCE industryIdx_seq;
DROP TABLE INDUSTRY;

select industryName from industry;

INSERT INTO industry 
	(industryIdx, industryName)
VALUES
	(industryIdx_seq.nextval, '화학');
	
select count(*) from analyst where analystName='최산';