CREATE TABLE personnel (
	id char(2) PRIMARY KEY,
	name varchar2(30) NOT NULL,
	dept varchar2(20) NOT NULL,
	position char(1),
	duty varchar(20),
	phone varchar(14)
);

INSERT INTO personnel VALUES ('95', '박민우', '인사부', '1', '상무', '010-1234-5678');
INSERT INTO personnel VALUES ('96', '홍길동', '경리부', '2', '과장', '010-3333-4444');