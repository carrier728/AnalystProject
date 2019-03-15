DROP  SEQUENCE reportNo_seq;
DROP TABLE REPORT;

CREATE SEQUENCE reportNo_seq;
CREATE TABLE report(
	reportNo NUMBER(10) PRIMARY KEY,
	itemName VARCHAR(50) NOT NULL,
	reportDate DATE DEFAULT SYSDATE,
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

SELECT TRUNC(SYSDATE) - TO_DATE('20180723', 'yyyymmdd') dw from dual;


SELECT  REPORTNO,TO_NUMBER(TRUNC(SYSDATE) - (SELECT REPORTDATE FROM REPORT WHERE reportNo=1)) dw FROM REPORT;

SELECT ROUND(SYSDATE- REPORTDATE) FROM REPORT;


--==============================================================================================
   select
    	R.*
   from
    	(select rownum rnum, Q.* from (select * from REPORT order by REPORTNO desc) Q  where rownum <= 2) R
   where
    	rnum >= 1;
    
    select rownum rnum, Q.* from (select * from REPORT order by REPORTNO desc) Q  where rownum >= 2;
    

   
select count(*) from report where analystName = '애널리스트1';   

-- ============================================================================
SELECT count(*) FROM report WHERE currentPrice < after1MPrice AND INVESTOPINION = 'BUY' AND ANALYSTNAME = '최산';

SELECT count(*) FROM REPORT WHERE ANALYSTNAME = '최산' AND AFTER1MPRICE != -1;
	
--====================================================================================
select 1, count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after1MPrice = -1
UNION ALL
select 3, count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after3MPrice = -1
UNION ALL
select 6, count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after6MPrice = -1
UNION ALL
select 12, count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after1YPrice = -1;
--====================================================================================
SELECT count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after1MPrice = -1
UNION ALL
select count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after3MPrice = -1
UNION ALL
select count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after6MPrice = -1
UNION ALL
select count(*) from report	WHERE 	analystName = '최산'	AND investOpinion = 'BUY' AND NOT after1YPrice = -1;

--=================================================================================
SELECT
	a.*, b.*, c.*, d.*
FROM 
(SELECT count (*) count1M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER1MPRICE = -1) a,
(SELECT count (*) count3M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER3MPRICE = -1) b,
(SELECT count (*) count6M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER6MPRICE = -1) c,
(SELECT count (*)  count1Y FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER1YPRICE = -1) d;



--================

SELECT * FROM report WHERE 
ANALYSTNAME = '애널리스트1' 
AND INVESTOPINION = 'BUY' 
AND AFTER1MPRICE != -1;
SELECT
	count1M.*, count3M.*, count6M.*, count1Y.*
FROM 
	(SELECT count (*) count1M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER1MPRICE = -1) count1M,
	(SELECT count (*) count3M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER3MPRICE = -1) count3M,
	(SELECT count (*) count6M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER6MPRICE = -1) count6M,
	(SELECT count (*) count1Y FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER1YPRICE = -1) count1Y;

-- ====================================== BUY 보고서 적중개수 구하기 ============
SELECT
	count1M.*, count3M.*, count6M.*, count1Y.*
FROM 
	(SELECT count (*) count1M FROM report WHERE CURRENTPRICE < AFTER1MPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER1MPRICE = -1) count1M,
	(SELECT count (*) count3M FROM report WHERE CURRENTPRICE < AFTER1MPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER3MPRICE = -1) count3M,
	(SELECT count (*) count6M FROM report WHERE CURRENTPRICE < AFTER1MPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER6MPRICE = -1) count6M,
	(SELECT count (*) count1Y FROM report WHERE CURRENTPRICE < AFTER1MPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'BUY' AND NOT AFTER1YPRICE = -1) count1Y;

-- ====================================== SELL 보고서 적중개수 구하기 ======================
SELECT
	count1M.*, count3M.*, count6M.*, count1Y.*
FROM 
	(SELECT count (*) count1M FROM report WHERE CURRENTPRICE > AFTER1MPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER1MPRICE = -1) count1M,
	(SELECT count (*) count3M FROM report WHERE CURRENTPRICE > AFTER3MPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER3MPRICE = -1) count3M,
	(SELECT count (*) count6M FROM report WHERE CURRENTPRICE > AFTER6MPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER6MPRICE = -1) count6M,
	(SELECT count (*) count1Y FROM report WHERE CURRENTPRICE > AFTER1YPRICE AND ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER1YPRICE = -1) count1Y;

-- =================================== SELL 보고서 개수 구하기 ==================== 	
SELECT
	count1M.*, count3M.*, count6M.*, count1Y.*
FROM 
	(SELECT count (*) count1M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER1MPRICE = -1) count1M,
	(SELECT count (*) count3M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER3MPRICE = -1) count3M,
	(SELECT count (*) count6M FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER6MPRICE = -1) count6M,
	(SELECT count (*) count1Y FROM report WHERE ANALYSTNAME = '최산' AND INVESTOPINION = 'SELL' AND NOT AFTER1YPRICE = -1) count1Y;
	
-- ===============================================================
SELECT * FROM report WHERE ANALYSTNAME = '최산' ORDER BY REPORTDATE desc;
-- ===============================================================

-- 각각의 값
SELECT 
	(AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE
FROM 
	REPORT
WHERE
	AFTER1MPRICE != -1;

-- 합
SELECT 
	(sum ((AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*)
FROM 
	REPORT
WHERE
	AFTER1MPRICE != -1
	AND ANALYSTNAME ='최산';

-- 4개 한꺼번에 가져오기
SELECT
	changeRate1M.*, changeRate3M.*, changeRate6M.*, changeRate1Y.*
FROM 
	(SELECT (sum ((AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*) FROM REPORT WHERE AFTER1MPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME ='최산') changeRate1M,
	(SELECT (sum ((AFTER3MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*) FROM REPORT WHERE AFTER3MPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME ='최산') changeRate3M,
	(SELECT (sum ((AFTER6MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*) FROM REPORT WHERE AFTER6MPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME ='최산') changeRate6M,
	(SELECT (sum ((AFTER1YPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*) FROM REPORT WHERE AFTER1YPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME ='최산') changeRate1Y;

-- 삭제
	SELECT 
		   NVL2((sum ((AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),(sum ((AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),0)  ,(sum ((AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*) 
	FROM 
		REPORT
	WHERE 
		AFTER1MPRICE != -1 
		AND INVESTOPINION = 'BUY' 
		AND ANALYSTNAME = '최산';
	
	SELECT 
		   NVL2((sum ((AFTER1YPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),(sum ((AFTER1YPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),0)  
	FROM 
		REPORT
	WHERE 
		AFTER1YPRICE != -1 
		AND INVESTOPINION = 'BUY'
		AND ANALYSTNAME = '최산';
	
	
-- ======================================
SELECT
	changeRate1M.*, changeRate3M.*, changeRate6M.*, changeRate1Y.*
FROM 
	(SELECT NVL2((sum ((AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),(sum ((AFTER1MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),0) FROM REPORT WHERE AFTER1MPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME = '최산') changeRate1M,
	(SELECT NVL2((sum ((AFTER3MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),(sum ((AFTER3MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),0) FROM REPORT WHERE AFTER3MPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME = '최산') changeRate3M,
	(SELECT NVL2((sum ((AFTER6MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),(sum ((AFTER6MPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),0) FROM REPORT WHERE AFTER6MPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME = '최산') changeRate6M,
	(SELECT NVL2((sum ((AFTER1YPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),(sum ((AFTER1YPRICE-CURRENTPRICE) / CURRENTPRICE)) / count (*),0) FROM REPORT WHERE AFTER1YPRICE != -1 AND INVESTOPINION = 'BUY' AND ANALYSTNAME = '최산') changeRate1Y;
	
-- ================================================================

SELECT
	count1M.*, count3M.*, count6M.*, count1Y.*
FROM
	(SELECT count (*) FROM	REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE < AFTER1MPRICE AND ANALYSTNAME='최산') count1M,
	(SELECT count (*) FROM	REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE < AFTER1MPRICE AND ANALYSTNAME='최산') count3M,
	(SELECT count (*) FROM	REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE < AFTER1MPRICE AND ANALYSTNAME='최산') count6M,
	(SELECT count (*) FROM	REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE < AFTER1MPRICE AND ANALYSTNAME='최산') count1Y;

-- ==================================================
SELECT
	count1M.*, count3M.*, count6M.*, count1Y.*
FROM 
	(SELECT count (*) count1M FROM REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE <= AFTER1MPRICE AND ANALYSTNAME='최산' AND TARGETPRICE != -1) count1M,
	(SELECT count (*) count3M FROM	REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE <= AFTER3MPRICE AND ANALYSTNAME='최산' AND TARGETPRICE != -1) count3M,
	(SELECT count (*) count6M FROM	REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE <= AFTER6MPRICE AND ANALYSTNAME='최산' AND TARGETPRICE != -1) count6M,
	(SELECT count (*) count1Y FROM REPORT WHERE INVESTOPINION = 'BUY' AND TARGETPRICE <= AFTER1YPRICE AND ANALYSTNAME='최산' AND TARGETPRICE != -1) count1Y;

SELECT 
	*
FROM 
	REPORT 
WHERE 
	INVESTOPINION = 'BUY' 
	AND TARGETPRICE <= AFTER1MPRICE 
	AND ANALYSTNAME='최산' 
	AND TARGETPRICE != -1;