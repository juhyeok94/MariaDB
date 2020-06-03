#ALLEN의 급여와 동일하거나 더 많이 받는 사원의 이름과 급여를 출력
SELECT ename, sal
FROM emp
WHERE sal >= (SELECT sal
FROM emp
WHERE ename = 'ALLEN');

#'DALLAS'에서 근무하는 사원의 이름, 부서번호를 출력
SELECT ename, deptno
FROM emp
WHERE deptno = (SELECT deptno
FROM dept
WHERE loc = 'DALLAS');

#'SALES' 부서에서 근무하는 모든 사원의 이름과 급여를 출력
SELECT ename, sal
FROM emp
WHERE deptno = (SELECT deptno
FROM dept
WHERE dname = 'SALES');

#자신의 직속 상관이 'king'인 사원의 이름과급여를 출력
SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno
FROM emp
WHERE ename = 'KING');

#급여를 3000이상받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의
#이름과 급여, 부서번호를 출력
SELECT ename, sal, deptno
FROM emp
WHERE deptno IN (SELECT deptno
FROM emp
WHERE sal >= 3000);

#IN 연산자를 이용하여 부서별로 가장 급여를 많이 받는사원의 사원번호, 급여, 부서번호출력
SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno;

SELECT empno, sal, deptno, MAX(sal)
FROM emp
GROUP BY deptno;

SELECT empno, sal, deptno
FROM emp
WHERE sal IN(SELECT MAX(sal)
FROM emp
GROUP BY deptno);

#직책이 MANAGER인 사원이 속한 부서의 부서번호, 부서명, 부서위치 출력
SELECT deptno
FROM emp
WHERE job = 'MANAGER'; #10 20 30

SELECT deptno, dname, loc
FROM dept
WHERE deptno = 10 OR deptno = 20 OR deptno = 30;

SELECT deptno, dname, loc
FROM dept
WHERE deptno IN(SELECT deptno
FROM emp
WHERE job = 'MANAGER');
#서브쿼리를 만들기 전에 요구사항을 먼저 만들것


#직책이 'SALESMAN'보다 급여를 많이 받는 사원들의 이름과 급여를 출력
#(ANY 연산자 이용)

SELECT sal 
FROM emp 
WHERE job = 'SALESMAN';

SELECT ename, sal
FROM emp
WHERE sal > (SELECT min(sal) 
FROM emp 
WHERE job = 'SALESMAN');

SELECT ename, sal
FROM emp
WHERE sal > ANY (SELECT sal
FROM emp
WHERE job = 'SALESMAN');

#hiredate의 data type을 확인해야함
#date => curdate() : 2020-06-02 시분초가 안들어감
#datetime => now() : 2020-06-02 11:25:45 시분초까지 들어감
INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (8001, '최수만', '방장', 7900, CURDATE(), 2000, 100, 40);

SELECT *
FROM emp;

#member 테이블의 내용중 num칼럼이 3인 회원의 주소를 한국으로 수정
UPDATE member 
SET addr = '한국'
WHERE num = 3;

SELECT *
FROM member;

#member 테이블 내용중 num 칼럼이 2인 회원의 이름과 주소를 '손마사요시', '일본'로 바꾸기
UPDATE member
SET NAME = '손마사요시', addr = '일본'
WHERE num = 2;

#member 테이블에서 num 칼럼이 3인 회원의 정보를 삭제
DELETE from member1
WHERE num = 7 AND num = 8 AND num = 9 AND num= 10;

DELETE FROM member
WHERE addr = '일본';

START TRANSACTION;

INSERT INTO member (num, NAME, addr) VALUES (7, '베조스1','미국');
INSERT INTO member (num, NAME, addr) VALUES (8, '마스크1','미국');
INSERT INTO member (num, NAME, addr) VALUES (9, '이재용1','한국');

COMMIT;
ROLLBACK;


SELECT * FROM member;

SELECT @@autocommit;
#autocommit = 0은 자동커밋을 지원하지 않음, 안전성
#autocommit = 1은 자동커밋을 지원함, 편리성
Set autocommit = 1;


#DDl
CREATE TABLE test(
num INT,
NAME VARCHAR(50)
);

#테이블 구조 확인하기
DESC test;

#테이블 이름 변경하기
ALTER TABLE member RENAME member1;

#테이블 삭제하기
#drop table을 지우면 롤백이 안됨
DROP TABLE test;

CREATE TABLE test(
num INT,
NAME VARCHAR(21842)
);


CREATE TABLE dept2(
deptno tinyINT PRIMARY KEY,
dname VARCHAR(15) DEFAULT '영업부',
loc CHAR(1) CHECK(loc IN('1','2'))
);

INSERT INTO dept2(deptno, dname, loc) VALUES(10,'관리부','1');
INSERT INTO dept2(deptno, dname, loc) VALUES(20,'관리부','3');
INSERT INTO dept2(deptno, loc) VALUES(30,'2');
INSERT INTO dept2(deptno, dname, loc) VALUES(30,'관리부','3');

SELECT * FROM dept2;

CREATE TABLE dept3(
deptno TINYINT PRIMARY KEY,
dname VARCHAR(15) NOT NULL
);

INSERT INTO dept3(deptno, dname) VALUES(10,'총무부');
INSERT INTO dept3(deptno, dname) VALUES(10,NULL);

CREATE TABLE emp2(
empno SMALLINT PRIMARY KEY,
ename VARCHAR(15) NOT NULL,
deptno TINYINT,
FOREIGN KEY(deptno) REFERENCES dept2(deptno)
);
#emp 테이블에 deptno테이블을 foreign key로 잡겠다
#dept2테이블의 deptno를 참조해서

INSERT INTO emp2(empno, ename, deptno) VALUES(1000,'KIM',10);
INSERT INTO emp2(empno, ename, deptno) VALUES(2000,'LEE',20);
INSERT INTO emp2(empno, ename, deptno) VALUES(3000,'PARK',40);
#40번은 안들어가짐 포린키는 dept2에서 없는정보는 넣을수 없다.
#외래키ㅡㄹ 사용할때 부모테이블에 존재하는 정보를 사용해야함.
INSERT INTO emp2(empno, ename) VALUES(3000,'PARK');
#외래키는 참조키이기때문에 값이 없어도 된다.

SELECT * FROM emp2;


#칼럼 추가
ALTER TABLE dept3 ADD(loc CHAR(1));
DESC dept3;

#칼럼 수정
ALTER TABLE dept3 MODIFY loc CHAR(2);
DESC dept3;

#칼럼 이름 수정
ALTER TABLE dept3 CHANGE loc location CHAR(2);
DESC dept3;

#칼럼삭제
ALTER TABLE dept3 DROP location;
DESC dept3;

CREATE TABLE dept4(
deptno TINYINT,
dname VARCHAR(15),
loc VARCHAR(13)
);

#테이블 복사
INSERT INTO dept4 SELECT * FROM dept;
SELECT * FROM dept4;

#테이블 복사 2 (제약조전은 복사 불가)
CREATE TABLE dept5 AS SELECT * FROM dept;
DESC dept5;
SELECT * FROM dept5;

#테이블 복사 응용(테이블 구조만 복사하고 데이터 값은 안들어감)
CREATE TABLE dept6 AS SELECT * FROM dept WHERE 1=2;
DESC dept6;
SELECT * FROM dept6;

SELECT * FROM member1;

INSERT INTO member1(num, NAME, addr) VALUES(10,'게이즈','이스라엘');

UPDATE member1
SET NAME = '샤넬1', addr = '프랑스1'
WHERE num = 12;
