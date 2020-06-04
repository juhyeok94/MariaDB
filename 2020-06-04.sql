SELECT * FROM emp;

INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8002, 'KIM', 'SALESMAN', 7900, CURDATE(), 1000, NULL, 40);

UPDATE emp 
SET ename = 'KIM1', job = 'CLERK', mgr = '7782', hiredate = CURDATE(), sal = 1001,
comm = 10, deptno = 30
WHERE empno = 8002;

DELETE from emp 
WHERE empno = 8002;

SELECT empno, ename, job, mgr, date_format(hiredate,'%Y.%m.%d'), sal, comm, deptno
FROM emp                       #date_format => 문자열로 바꾸기
ORDER BY empno DESC #내림차순
LIMIT 0, 10; #11번째부터 10개 

SELECT empno, ename, job, mgr, date_format(hiredate,'%Y.%m.%d'), sal, comm, deptno
FROM emp
WHERE empno = 8001;

SELECT * FROM member;

START TRANSACTION;

INSERT INTO dept(deptno, dname, loc) VALUES(50,'A1','B1');
INSERT INTO dept(deptno, dname, loc) VALUES(60,'A2','B2');
INSERT INTO dept(deptno, dname, loc) VALUES(70,'A3','B3');
INSERT INTO dept(deptno, dname, loc) VALUES(80,'A4','B4');

rollback;
COMMIT;

SELECT * FROM dept;




