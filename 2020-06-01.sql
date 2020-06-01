#ename 칼럼수를 반환

SELECT COUNT(ename)
FROM emp;

#comm 캄럼수를 검색 주의 null칼럼은 카운트 하지 않음
SELECT COUNT(comm)
FROM emp;

#모든 컬럼을 검색
SELECT COUNT(*)
FROM emp;

SELECT COUNT(empno)
FROM emp;

#sal총합을 구함
SELECT SUM(sal)
FROM emp;

#comm 총합을 구함. 주의) 총합으구하는 sum()함수는 null이 있더라도 총합을 구해줌
SELECT SUM(comm)
FROM emp;

#칼럼끼리 더하면 null값이 있어도 값을계산하는데 문제가 되지 않음
SELECT sal, comm, sal+ifnull(comm,0)
FROM emp;

#null값이 있을때는 평균값이 달라지기 때문에 null 값을 0으로 전환해줘야한다.
SELECT AVG(sal), AVG(comm)
FROM emp;

SELECT comm
FROM emp;

#null값을 포함x와 포함o는 값이 다르다.
SELECT avg(sal), AVG(comm), AVG(IFNULL(comm,0)),
SUM(comm)/COUNT(comm)
FROM emp;

#가장 큰 값
SELECT MAX(sal)
FROM emp;

#가장 작은 값
SELECT MIN(sal)
FROM emp;

#부서별 급여의 총합을 출력하라
SELECT deptno, sal
FROM emp
ORDER BY deptno ASC;

#부서별 인원수, 월급의 평균, 월급합을 검색
#그룹함수를 쓰게되면 특정부서의 평균, 값등을 구할수 있다.
SELECT deptno, COUNT(deptno), round(AVG(sal),1), SUM(sal)
FROM emp
GROUP BY deptno;

#직업별 최대급여를 구하시오
SELECT job, MAX(sal)
FROM emp
GROUP BY deptno
order BY job asc;

SELECT *
FROM emp;

#급여가 1000 이상인 사월들의 부서별 평균 급여의 반올림 값을 출력해 보세요
SELECT deptno, round(avg(sal))
FROM emp
WHERE sal >= 1000
GROUP BY deptno
ORDER BY deptno DESC;

#급여가 2000이상인 사원들의 부서별 평균 급여의 반올림 값을 평균급여의
#반올림 값으로 오름차순 정렬해서 출력
SELECT deptno, ROUND(AVG(sal)) avgsal
FROM emp
WHERE sal >= 2000
GROUP BY deptno
ORDER BY avgsal ASC;


#각 부서별 같은 직업(job)를 하는 사람의 인원수를 구해서 부서번호,
#직업(job), 인원수를 부서번호에 대해서 오름차순 정렬해서 출력
SELECT deptno, job, COUNT(*) jobcount
FROM emp
GROUP BY deptno, job
ORDER BY deptno ASC, jobcount desc;


#급여가 1000이상인 사원들의 부서별 평균 급여를 출력해보세요
#단, 부서별 평균 급여가 2000이상인 부서만 출력하세요.
SELECT deptno, AVG(sal) avgsal
FROM emp
WHERE sal >= 1000 
GROUP BY deptno
HAVING avgsal >= 2000
ORDER BY deptno asc;


#limit a,b : a는 시작위치, b는 길이
#linit 0, 10 : 처음부터 10개를 가져옴
#limit 10, 20 : 11번째부터 20개를 가져옴
SELECT empno, ename, job
FROM emp
ORDER by hiredate DESC
LIMIT 0,15;


SELECT empno, ename, dname
FROM emp e, dept d
WHERE d.deptno = e.deptno;

#조건이 primary key 일때 바로 검색가능 but primary key가 아니면 
# 전체 검색이됨
SELECT deptno, dname, loc
FROM dept
WHERE deptno = 10;

SELECT *
FROM emp, dept;


#뒤emp.deptno가 상수로 변환, 변수가 두개 존재할수 없다.
SELECT ename, emp.DEPTNO, loc
FROM emp, dept
WHERE dept.DEPTNO = emp.DEPTNO;


SELECT ename, dept.DEPTNO, dname
FROM emp, dept
WHERE dept.deptno = emp.DEPTNO;

#테이블에 alias를 추가하는 경우
SELECT ename, d.deptno, dname
FROM emp e, dept d
WHERE d.DEPTNO =  e.DEPTNO;


#join ~ in 표현식을 사용하는 경우
SELECT ename, d.DEPTNO, dname
FROM emp e JOIN dept d
ON d.deptno = e.deptno;

#ansi join : join ~ using
SELECT ename, d.deptno, dname
FROM emp e JOIN dept d
USING(deptno);

#급여가 3000에서 5000사이의 사원이름과 부서명을 출력해보세요
SELECT ename, dname
FROM emp e, dept d
WHERE sal >= 3000 AND sal <= 5000 and d.DEPTNO = e.DEPTNO;

# =======
SELECT ename, dname
FROM emp e, dept d
WHERE sal between 3000 AND 5000 and d.DEPTNO = e.DEPTNO;


#부서명이 'ACCOUNTING' 인 사원의 이룸, 입사일, 부서번호, 부서명을 출력
SELECT ename, hiredate, d.deptno, dname
FROM emp e , dept d
WHERE d.deptno = e.deptno and dname = 'accounting';
#dname = 'accounting' 부터 가져오면 primary key가 아니기때문에 데이터 전체를 읽고 출력한다
#d.deptno = e.deptno 부터 가져와 primary key가 원하는 정보만 읽게끔 만드는것
#데이터가 적을때는 상관없지만 많이지면 출력속도가 다르게 된다.


#comm이 null이 아닌 사원원의  이름, 입사일, 부서명을 출력
#단 입사일은 2020년 11월 20일 
SELECT ename, date_format(hiredate, '%Y년%m월%d일'), dname
FROM emp e, dept d
WHERE d.deptno = e.DEPTNO AND comm IS NOT NULL;



#부서명이 'ACCOUNTING'인 사원의 이름, 입사일, 부서번호, 부서명을 출력
#단 입사일은 2020년 11월 20일 형식으로 출력
SELECT ename, DATE_FORMAT(hiredate, '%Y년%m월%d일'), e.deptno, dname
FROM emp e, dept d
WHERE d.deptno = e.DEPTNO AND dname = 'accounting';


INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm)
VALUES(8000,'ERIC','CLERK', 7900, '1983-02-25', 500, NULL);


#left join
#사원번호, 부서번호, 부서명을 출력하세요
#단, 사원이 근무하지 않는 부서명도 같이 출력해보세요
SELECT empno, e.deptno, dname
FROM emp e, dept d
WHERE d.DEPTNO = e.DEPTNO;


SELECT empno, e.deptno, dname
FROM emp e LEFT join dept d
ON d.DEPTNO= e.DEPTNO;
#두개의 값이 다르다 
#왼쪽의 값을 그대로 다 가져오는것






#문제======================================================
#emp 테이블과 dept 테이블을 조인하여 부서번호, 부서명, 이름 ,급여를 출력
SELECT d.deptno, dname, ename, sal
FROM emp e, dept d
WHERE d.deptno = e.DEPTNO;

#사원의 이름이 'ALLEN' 인 사원의 부서명을 출력\
SELECT ename, dname
FROM emp e, dept d
WHERE d.deptno = e.deptno AND ename = 'ALLEN';

#모든 사원의 이름, 부서번호, 부서명, 급여를 출력
#단, emp테이블에 없는 부서도 출력
SELECT ename, d.deptno, dname, sal
FROM emp e LEFT join dept d
on d.deptno = e.deptno; 

#사원의 이름과 급여, 급여의 등급을 출력
#emp 테이블과 salgrade 테이블을 조인해야함.
SELECT ename, sal, grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal;
#emp 테이블의 sal 범위가 salgrade 범위 안에 들어가니 범위로 join 시킴
#원리는 emp 테이블의 sal이 범위를 하나씩 뒤져서 true를 찾는것

#사원의 이름과, 부서명, 급여의 등급을 출력
#emp 테이블과 salgrade 테이블을 조인해야함
SELECT ename, d.dname, grade
FROM emp e, dept d, salgrade s
WHERE d.DEPTNO = e.DEPTNO AND sal BETWEEN losal AND hisal;
#emp와 dept를 조인
#emp와 salgrade 조인 
#조인을 두번해야된다.



#'SMITH'가 근무하는 부서명을 서브쿼리를 이용해서 출력
SELECT ename, dname
FROM emp e, dept d
WHERE d.deptno = e.DEPTNO AND ename = 'SMITH';

#'ALLEN'과같은 부서에서 근무하는 사원의 이름과 부서 번호 출력
SELECT ename, d.DEPTNO, dname
FROM emp e, dept d
WHERE d.DEPTNO = e.DEPTNO AND ename = 'ALLEN';

#단일행 서브쿼리
#select 절에 또다른 select 절을 이용해서 만듬
SELECT ename, deptno
from emp
wHERE deptno = (SELECT deptno
FROM emp
WHERE ename = 'ALLEN');


#직업이 'salesman' 사람의 사원번호와 직업을 출력
SELECT empno, job
FROM emp
WHERE job = 'salesman'














