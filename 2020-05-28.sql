CREATE TABLE member(
num INT PRIMARY KEY,
NAME VARCHAR(50),
addr VARCHAR(50));

DESC member;

INSERT INTO member (num, NAME, addr) VALUES (1,'pjh','incheon');
INSERT INTO member (num, NAME) VALUES (2,'qwe');
INSERT INTO member VALUES(3,'스티브잡스','미국'); 
#에러 발생 - primary key 칼럼에는 중복된 값이 들어가면 안됨
#INSERT INTO member (num, NAME, addr) VALUES (1,'조스','미국');
#에러발생 - primary key 캄럼에는 값이 반드시 있어야 함.
#INSERT INTO member (NAME,addr) VALUES('조스','미국');

SELECT * FROM member;

SELECT NUM FROM member;

SELECT num, NAME, FROM member;

SELECT num, NAME, addr FROM member;

UPDATE member SET addr = '일본',NAME = '손정잉' WHERE num = 2;

SELECT * FROM dept;

SELECT * FROM emp;

SELECT * FROM bonus;

SELECT * FROM salgrade;