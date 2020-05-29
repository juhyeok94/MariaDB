#prf mariadb_student p16 1.
SELECT empno, ename, job
FROM emp

SELECT * FROM emp

#2.
SELECT empno, sal, deptno
FROM emp
ORDER BY sal DESC;

#3.
SELECT empno, sal, hiredate
FROM emp
ORDER BY sal ASC

#4.
SELECT job, sal
FROM emp
ORDER BY job asc, sal DESC;

#ALIAS
SELECT empno AS "사원번호", ename AS "사원이름"
FROM emp;

SELECT empno AS 사원번호, ename AS 사원이름
FROM emp;

SELECT empno 사원번호, ename 사원이름
FROM emp

#연산자
#emp 테이블에서 부서버호가 10번인 사원들의 급여와 10%인상된 금액을 같이 출력
SELECT deptno, sal, sal*1.1
from emp
WHERE deptno = 10;

#emp 테이블에서 부서번호가 10번인 사원들의 부서번호와 급여와 급여+커미션 출력
#database는 값이 null이면 연산했을때 null이 나옴
#database에 null을 넣는건 결과가 달라질수 있기때문에 좋지 않음
SELECT ename, deptno, sal, comm, sal + ifnull(comm,0)
FROM emp
WHERE deptno = 10;


SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno 
FROM emp
WHERE sal > 3000;

SELECT * FROM emp
WHERE sal > 3000;

#emp 테이블에서 부서번호가 30번이 아닌 사람들의 이름과 부서번호를 출력
SELECT ename, deptno
FROM emp
WHERE deptno != 30 ;

#and or not
SELECT ename, sal
FROM emp
WHERE deptno = 10 and sal >= 3000;

SELECT empno, deptno
FROM emp
WHERE job = 'SALESMAN' OR job = 'MANAGER';

SELECT empno, deptno, job
FROM emp
WHERE job != 'clerk' AND job != 'analyst' AND job != 'president'

#or 연산을 풀어쓴거
SELECT empno, deptno
FROM emp
WHERE job = 'salesman'
UNION ALL
SELECT empno, deptno
FROM emp
WHERE job = 'manager'

#in 연산자
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 10 OR deptno = 20;

SELECT empno, ename, deptno
FROM emp
WHERE deptno IN(10,20);

SELECT empno, ename, deptno
FROM emp
WHERE deptno != 30;

#between 연산자
#숫자뿐만아니라 문자도 가능
SELECT empno, ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

SELECT empno, ename, sal
FROM emp
WHERE sal >= 1000 AND sal <=2000;

SELECT empno, ename
FROM emp
WHERE ename BETWEEN 'FORD' AND 'SCOTT';

SELECT empno, ename
FROM emp
WHERE ename >= 'ford' AND ename <= 'scott'
ORDER BY ename ASC;

#오름차순 asc 
#내림차순 desc 

SELECT ename, deptno
FROM emp
#j로시작하는 모든 문자열
WHERE ename LIKE 'j%';

#사원 이름이 'j'를 포함하는 사원의 사원이름과 부서번호를 출력하기
SELECT ename, deptno
FROM emp
#j를 포함하는 모든 문자열
WHERE ename LIKE '%j%';

#사원의 이름이 두번째 글자가 'A'인 사원의 이름, 급여, 입사일을 출력
SELECT ename, sal, hiredate
FROM emp
WHERE ename LIKE '_A%';

#사원의 이름이 'ES'로 끝나는 사원의 이름, 급여, 입사일을 출력
SELECT ename, sal, hiredate
FROM emp
WHERE ename LIKE '%ES';

#입사년도가 81년인 사원들의 입사일과 사원번호 출력
SELECT ename, hiredate, empno
FROM emp
WHERE hiredate LIKE '1981%';

#커미션이 null 인 사원의 사원이름과 커미션을 출력
SELECT ename, comm
FROM emp
WHERE comm is NULL;

#커미션이 null이 아닌 사원의 사원이름과 ㅓ미션을 출력
SELECT ename, comm
FROM emp
WHERE comm IS NOT NULL;

SELECT CONCAT(ename,'의 직업은',job,'입니다')intro
FROM emp;

SELECT CHAR(65);

SELECT CONCAT(ename,'님') NAME
FROM emp;

SELECT LOWER(ename)
FROM emp;

SELECT UPPER(ename)
FROM emp;

SELECT LPAD('hi',10,'*');

SELECT RPAD('hi',10,'!');

#한글은 3byte 영어는 1btye
SELECT LENGTH('abcde');

SELECT LEFT('abcde',3);

SELECT RIGHT('abcde',3);

SELECT ename, left(ename,3)
FROM emp;

SELECT ename, LEFT(ename,3)
FROM emp;

SELECT ename, RPAD(LEFT(ename,3),LENGTH(ename),'*')
FROM emp;

#여기서 3은 length 즉,  길이
SELECT ename, SUBSTRING(ename, 1, 3)
FROM emp;

SELECT FORMAT(123456.23456789,2);

SELECT CONCAT('ab','bc','cd');

SELECT ename,ifnull(comm,0)
FROM emp;

SELECT ABS(-10);

#반올림
SELECT CEIL(3.1234);

#반내림
SELECT FLOOR(3.424224);

SELECT ROUND(3.2456,1);

SELECT MOD(10,3);

SELECT TRUNCATE(123123.123123,3)

SELECT NOW();

SELECT CURDATE();

SELECT CURTIME();

CREATE TABLE test(
id VARCHAR(50) primary KEY,
sdate DATETIME,
edate DATETIME
);

INSERT INTO test(id,sdate, edate)
VALUES('qwe123',NOW(),ADDDATE(NOW(),INTERVAL 2 DAY));

INSERT INTO test(id,sdate, edate)
VALUES('qwe124',NOW(),ADDDATE(NOW(),INTERVAL 20 DAY));

INSERT INTO test(id,sdate, edate)
VALUES('qwe125',NOW(),ADDDATE(NOW(),INTERVAL 40 DAY));

INSERT INTO test(id,sdate, edate)
VALUES('qwe126',NOW(),ADDDATE(NOW(),INTERVAL 40 HOUR));
 
SELECT id, sdate, edate
FROM test;

SELECT NOW(), SUBDATE(NOW(), INTERVAL 2 HOUR);

SELECT DATEDIFF('2020-05-29','2020-05-21');

SELECT id, DATEDIFF(edate, sdate) diff
FROM test;

SELECT id, TIMESTAMPDIFF(HOUR, sdate, edate)
FROM test;

SELECT TIMESTAMPDIFF(HOUR,'2020-05-29','2020-06-01');
 
SELECT id, DATE_FORMAT(sdate, '%y/%m/%d') sdate,
DATE_FORMAT(edate, '%Y.%m.%d %h:%i:%s'), edate
FROM test;
    

