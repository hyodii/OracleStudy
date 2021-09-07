SELECT USER
FROM DUAL;
--==>> SCOTT

--���� JOIN(����) ����--
-- �������� ���忡�� ���� �߿��Ѱ� ����!

-- �Ѵ� �˾Ƶ־���!!
-- 1. SQL 1992 CODE
SELECT COUNT(*)
FROM EMP,DEPT;
--> ���п��� ���ϴ� ��ī��Ʈ��(Catersian Product)
--  �� ���̺��� ��ģ(������) ��� ����� �� 
--  EMP���� 14�� DEPT���� 4�� ������ ��
--  �̷� ������ �� �Ⱦ�!!!(����Ǽ��� �� ����� COUNT �Ҷ��� ��)

-- 2. SQL 1999 CODE
SELECT COUNT(*)
FROM EMP,DEPT;

-- Equi Join : ���� ��Ȯ�� ��ġ�ϴ� �����͵鳢�� �����Ű�� ����
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
--==>>
/*
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT		    81/11/17	5000		    10	10	ACCOUNTING	NEW YORK
7934	MILLER	CLERK	    7782	82/01/23	1300		    10	10	ACCOUNTING	NEW YORK
7566	JONES	MANAGER	    7839	81/04/02	2975		    20	20	RESEARCH	DALLAS
7902	FORD	ANALYST	    7566	81/12/03	3000		    20	20	RESEARCH	DALLAS
7876	ADAMS	CLERK	    7788	87/07/13	1100		    20	20	RESEARCH	DALLAS
7369	SMITH	CLERK	    7902	80/12/17	800		        20	20	RESEARCH	DALLAS
7788	SCOTT	ANALYST	    7566	87/07/13	3000		    20	20	RESEARCH	DALLAS
7521	WARD	SALESMAN	7698	81/02/22	1250	    500	30	30	SALES	CHICAGO
7844	TURNER	SALESMAN	7698	81/09/08	1500	    0	30	30	SALES	CHICAGO
7499	ALLEN	SALESMAN	7698	81/02/20	1600	    300	30	30	SALES	CHICAGO
7900	JAMES	CLERK	    7698	81/12/03	950		        30	30	SALES	CHICAGO
7698	BLAKE	MANAGER	    7839	81/05/01	2850		    30	30	SALES	CHICAGO
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30	30	SALES	CHICAGO
*/

-- ���̺� ��Ī�� ���ϼ��� ����!
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>>
/*
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10	10	ACCOUNTING	NEW YORK
7839	KING	PRESIDENT		    81/11/17	5000		    10	10	ACCOUNTING	NEW YORK
7934	MILLER	CLERK	    7782	82/01/23	1300		    10	10	ACCOUNTING	NEW YORK
7566	JONES	MANAGER	    7839	81/04/02	2975		    20	20	RESEARCH	DALLAS
7902	FORD	ANALYST	    7566	81/12/03	3000		    20	20	RESEARCH	DALLAS
7876	ADAMS	CLERK	    7788	87/07/13	1100		    20	20	RESEARCH	DALLAS
7369	SMITH	CLERK	    7902	80/12/17	800		        20	20	RESEARCH	DALLAS
7788	SCOTT	ANALYST	    7566	87/07/13	3000		    20	20	RESEARCH	DALLAS
7521	WARD	SALESMAN	7698	81/02/22	1250	    500	30	30	SALES	CHICAGO
7844	TURNER	SALESMAN	7698	81/09/08	1500	    0	30	30	SALES	CHICAGO
7499	ALLEN	SALESMAN	7698	81/02/20	1600	    300	30	30	SALES	CHICAGO
7900	JAMES	CLERK	    7698	81/12/03	950		        30	30	SALES	CHICAGO
7698	BLAKE	MANAGER	    7839	81/05/01	2850		    30	30	SALES	CHICAGO
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30	30	SALES	CHICAGO
*/

-- Non Equi Join : ���� �ȿ� ������ �����͵鳢�� �����Ű�� ����
-- �ΰ� ����Ƽ� �����ϸ� ���ǰ��2������ ���ϸ鼭 ��������!
SELECT *
FROM SALGRADE;
SELECT *
FROM EMP;

-- �̰� Non Equi Join!
SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- Equi Join �� ��(+)�� �� Ȱ���� ���� ���
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� 14���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ���ȣ�� ���� ���� �����(5)�� ��� ����~!!!

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

-- + Ȱ��!! (+)�� �������� ���ΰ�!!!)
-- +�������ʿ� ���̺��� �޸𸮿� �ٿ÷�! �׸��� �ű⿡ + �ִ� �ֵ��� ���ս�����! 
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--> �� 19���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ���ȣ�� ���� ���� ����鵵 ��� ��ȸ�� ��Ȳ

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--> �� 16���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ��� �Ҽӵ� ����� �ƹ��� ���� �μ��� ��� ��ȸ�� ��Ȳ

--�� (+)�� ���� �� ���̺��� �����͸� ��� �޸𸮿� ������ ��
--   (+)�� �ִ� �� ���̺��� �����͸� �ϳ��ϳ� Ȯ���Ͽ� ���ѽ�Ű�� ����
--   JOIN �� �̷������.

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO(+);
--> ���Ͱ��� ������... �̷��� ������ JOIN ������ �������� �ʴ´�.
-- �̰� ���̾ȵǴ� ������! ���� ������ �� �ִ� �����Ͱ� ����!���ΰ��̾���!

-----------------��������� 1992 CODE

-- 2. SQL 1999 CODE �� ��JOIN�� Ű���� ���� �� JOIN ���� ���
--                      ���� ������  ��WHERE�� ��� ��ON�� ���
-- �̰� ���������� ���� ũ�� �ٲ� ��!

-- CROSS JOIN (�տ�92���� ��ī��Ʈ��(Catersian Product)�ϴ��� �̷��� �θ�����ߴ�!)
SELECT *
FROM EMP CROSS JOIN DEPT;

-- INNER JOIN (Equi ����/NON Equi ���� �� �ٲ��������� ������ �̰Ŵ� ��� �Ҽ�����)
-- FROM ���� , ��� INNERJOIN���� ���� WHERE ��� ON
SELECT *
FROM TBL_EMP E INNER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--�� INNER JOIN �� INNER �� ���� ����!
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- (+) ������ (+)������ �پ��ִ¾ֵ��� �� ���ΰ����Ƽ� �򰥷�!
-- �׷��� ���ΰ��� �������� ��������! �̰� �ƿ�������

-- OUTER JOIN
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

--�� ������ ������ �� ���̺�(�� LEFT / RIGHT)�� �����͸� ��� �޸𸮿� ������ ��
--   ������ �������� ���� �� ���̺��� �����͸� ���� Ȯ���Ͽ� ���ս�Ű�� ���·�
--   JOIN �� �̷�� ����.
SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

--> SQL 1992 CODE ������ �Ѵ� (+) �ϴ°� �ȉ�µ� OUTER JOIN ������ FULL JOIN ���� ����!
--�� OUTER JOIN ���� OUTER�� ���� ����!
--   �׷��� INNER�� ���������ѵ� ���ɱ�����? -> LEFT / RIGHT ������ OUTER!
SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D      -- OUTER JOIN
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D     -- OUTER JOIN
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D      -- OUTER JOIN
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D           -- INNER JOIN
ON E.DEPTNO = D.DEPTNO;

------------------------------------------------------------------------
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-- �� �������... ������ CLERK �� ����鸸 ��ȸ...

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
AND JOB = 'CLERK';
-- �̷��� �������� �����ص� ��ȸ�ϴ� ���� ������ ����.

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'CLERK';
-- ������, �̿� ���� �����Ͽ� ��ȸ�� �� �ֵ��� �����Ѵ�.


--1992 �ڵ忡���� ������ �������� ���ڵ�(AND)���̴�!
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND JOB = 'CLERK';

------------------------------------------------------------------------


--�� EMP ���̺�� DEPT ���̺��� �������
--   ������ MANAGER�� CLERK �� ����鸸
--   �μ���ȣ, �μ���, �����, ������, �޿� �׸��� ��ȸ�Ѵ�. (10:32)
--   -------    ----    -----   ----    ---
--    DEPTNO   DNAME    ENAME   JOB     SAL
--     E,D       D        E      E       E
SELECT DEPTNO "�μ���ȣ", DNAME "�μ���", ENAME "�����", JOB "������",SAL "�޿�"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> ���� �߻�
/*
ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"
*Cause:    
*Action:
216��, 8������ ���� �߻�
*/
--> �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺���
--  �������(����� ���) �Ѵ�.

SELECT DNAME "�μ���", ENAME "�����", JOB "������",SAL "�޿�"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--> DEPTNO�� �� ���̺� �ߺ��Ǵ� �÷��� �������� ���� ��ȸ ������
--   ���� �߻����� �ʴ´�.
--==>>
/*
ACCOUNTING	CLARK	MANAGER	    2450
ACCOUNTING	KING	PRESIDENT	5000
ACCOUNTING	MILLER	CLERK	    1300
RESEARCH	JONES	MANAGER	    2975
RESEARCH	FORD	ANALYST 	3000
RESEARCH	ADAMS	CLERK	    1100
RESEARCH	SMITH	CLERK	    800
RESEARCH	SCOTT	ANALYST	    3000
SALES	    WARD	SALESMAN	1250
SALES	    TURNER	SALESMAN	1500
SALES	    ALLEN	SALESMAN	1600
SALES	    JAMES	CLERK	    950
SALES	    BLAKE	MANAGER	    2850
SALES	    MARTIN	SALESMAN	1250
*/

SELECT E.DEPTNO "�μ���ȣ", DNAME "�μ���", ENAME "�����", JOB "������",SAL "�޿�"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT D.DEPTNO "�μ���ȣ", DNAME "�μ���", ENAME "�����", JOB "������",SAL "�޿�"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--> �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--  �μ�(DEPT), ���(EMP) �� � ���̺��� �����ص�
--   ������ ���࿡ ���� ��� ��ȯ�� ������ ����.

-- �� ������...
--    �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--    �θ� ���̺��� �÷��� ������ �� �ֵ��� �ؾ� �Ѵ�.

-- �θ� ã�¹�
-- �� ���̺��� ����� �÷��� ã�´�!
-- ����� �÷�(DEPTNO)���� 10���� 1���ۿ����� 20���� 1���ۿ�����...
-- �����Ͱ� �ߺ����� �ϳ��� ���ִ� ���̺��� �θ�!!
SELECT *
FROM DEPT;  -- �θ� ���̺�
SELECT *
FROM EMP;   -- �ڽ� ���̺�

--�� �θ� �ڽ� ���̺� ���踦 ��Ȯ�� ������ �� �ֵ��� �Ѵ�.
-- �� ���̺� ��� �ϳ��� �����Ѵٸ�, ����� �����ص� �������!

--������ �̰� ����!
SELECT D.DEPTNO "�μ���ȣ", DNAME "�μ���", ENAME "�����", JOB "������",SAL "�޿�"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--�̷��� �ص� ������ �߻����� ������ ������ �÷��� ������ش�!
-- �׷��� ���ʴ� �ȵѷ����� ��ȸ�� �� ����!
SELECT D.DEPTNO "�μ���ȣ", D.DNAME "�μ���", E.ENAME "�����", E.JOB "������",E.SAL "�޿�"
FROM EMP E , DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� ���̺� �� �ߺ��� �÷�(���� �÷�)�� �ƴϴ���...
--  �Ҽ� ���̺��� ����� �� �ֵ��� �����Ѵ�.


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--> �Ѵ� ��ȸ����� ����!

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--> �θ� �������� �� �μ���ȣ�� �߳���
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--> �ڽĲ� �������� ���� �μ���ȣ�� �ȳ���!
-->> �θ𲨸� �����ؾ��ϴ� ����!


--�� SELF JOIN(�ڱ� ����)

-- EMP ���̺��� ������ ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
----------------------------------------------------------------
�����ȣ    ����� ������ �����ڹ�ȣ   �����ڸ�    ������������
 7369       SMITH   CLERK   7902        FORD        ANALYST
                             :
 EMP          EMP   EMP     EMP
 -------------------------------��
                            EMP         EMP         EMP
                            -------------------------------------��

*/
 
 EMPNO  ENAME JOB MGR
                  EMPNO ENAME JOB


SELECT E1.EMPNO"�����ȣ", E1.ENAME"�����", E1.JOB"������", E2.EMPNO "�����ڹ�ȣ"
     , E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;
--==>> 13����(KING �� �����ڹ�ȣ �����ڸ� ������ �������� �����ϱ�!)
SELECT E1.EMPNO"�����ȣ", E1.ENAME"�����", E1.JOB"������", E2.EMPNO "�����ڹ�ȣ"
     , E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;
--==>>
/*
7902	FORD	ANALYST	    7566	JONES	MANAGER
7788	SCOTT	ANALYST	    7566	JONES	MANAGER
7900	JAMES	CLERK	    7698	BLAKE	MANAGER
7844	TURNER	SALESMAN	7698	BLAKE	MANAGER
7654	MARTIN	SALESMAN	7698	BLAKE	MANAGER
7521	WARD	SALESMAN	7698	BLAKE	MANAGER
7499	ALLEN	SALESMAN	7698	BLAKE	MANAGER
7934	MILLER	CLERK	    7782	CLARK	MANAGER
7876	ADAMS	CLERK	    7788	SCOTT	ANALYST
7782	CLARK	MANAGER	    7839	KING	PRESIDENT
7698	BLAKE	MANAGER	    7839	KING	PRESIDENT
7566	JONES	MANAGER	    7839	KING	PRESIDENT
7369	SMITH	CLERK	    7902	FORD	ANALYST
7839	KING	PRESIDENT			
*/











































