SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	     8750       -- �μ���ȣ�� 10���� ������� �޿���
20	    10875       -- �μ���ȣ�� 20���� ������� �޿���
30	     9400       -- �μ���ȣ�� 30���� ������� �޿���
(NULL)	 8000       -- �μ���ȣ�� �������� �ʴ� �����(NULL)�� �޿���
(NULL)  37025       -- ��� �μ��� ������� �޿���
*/


--�� ������ ��ȸ�� ������
/*
10	       8750       -- �μ���ȣ�� 10���� ������� �޿���
20	      10875       -- �μ���ȣ�� 20���� ������� �޿���
30	       9400       -- �μ���ȣ�� 30���� ������� �޿���
����	   8000       -- �μ���ȣ�� �������� �ʴ� �����(NULL)�� �޿���
���μ�  37025       -- ��� �μ��� ������� �޿���
*/
-- �̿Ͱ��� ��ȸ�ϰ��� �Ѵ�.

SELECT CASE DEPTNO WHEN NULL 
                    THEN '����' 
                    ELSE  DEPTNO
        END "�μ���ȣ"
FROM TBL_EMP;
--==>> ���� �߻�(�ڷ����� �ȸ¾Ƽ�)
/*
ORA-00932: inconsistent datatypes: expected CHAR got NUMBER
00932. 00000 -  "inconsistent datatypes: expected %s got %s"
*Cause:    
*Action:
30��, 31������ ���� �߻�
*/

SELECT CASE DEPTNO WHEN NULL 
                   THEN '����' 
                   ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
FROM TBL_EMP;
--==>> ���� �����̶�� �ٲ������� ������� ó���� ����!
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
(NULL)
(NULL)
(NULL)
(NULL)
(NULL)
*/

SELECT CASE WHEN DEPTNO IS NULL 
            THEN '����' 
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
FROM TBL_EMP;
--==>> IS NULL ������� �������� ����!
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
����
����
����
����
����
*/

SELECT CASE WHEN DEPTNO IS NULL 
            THEN '����' 
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>> �Ѵ� ������ �ǹ���
/*
10	     8750
20	    10875
30	     9400
����	 8000
����	37025
*/

--�� GROUPING()
SELECT DEPTNO "�μ���ȣ", SUM(SAL)"�޿���", GROUPING(DEPTNO)
FROM TBL_EMP
GROUP BY DEPTNO;
--==>>
/*
30	     9400	0
(NULL)	 8000	0
20	    10875	0
10	     8750	0
*/

SELECT DEPTNO "�μ���ȣ", SUM(SAL)"�޿���", GROUPING(DEPTNO)
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	     8750	0
20	    10875	0
30	     9400	0
(NULL)	 8000	0
(NULL)	37025	1
*/
-- GROUPING ������ �Լ��� 1����!!(�׸�����)


/*
10	       8750       -- �μ���ȣ�� 10���� ������� �޿���
20	      10875       -- �μ���ȣ�� 20���� ������� �޿���
30	       9400       -- �μ���ȣ�� 30���� ������� �޿���
����	   8000       -- �μ���ȣ�� �������� �ʴ� �����(NULL)�� �޿���
���μ�  37025       -- ��� �μ��� ������� �޿���
*/


SELECT CASE WHEN (DEPTNO IS NULL) AND (GROUPING(DEPTNO) = 0)
            THEN '����' 
            WHEN GROUPING(DEPTNO) = 1
            THEN '���μ�'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	         8750
20	        10875
30	         9400
����	     8000
���μ�	37025
*/

--Ǯ��
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN TO_CHAR(DEPTNO)
            ELSE '���μ�'
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	        8750
20	        10875
30	        9400
(NULL)	    8000
���μ�	37025
*/
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'����')
            ELSE '���μ�'
        END "�μ���ȣ"
      , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	        8750
20	        10875
30	        9400
����	    8000
���μ�	37025
*/

--�� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ���
--   �������� �����Ѵ�.
/*
-----------------------------------
    ����      �޿���
-----------------------------------
    ��         XXXX
    ��         XXXX
    �����  XXXXX
-----------------------------------
*/
--���� Ǭ Ǯ��..ING-------------------------------------------------
SELECT T.����, T.�޿���
FROM
(
SELECT CASE SUBSTR(JUBUN,7,1) WHEN '1'THEN '��' 
                              WHEN '3'THEN '��'
                              WHEN '2'THEN '��'
                              WHEN '4'THEN '��'
                              ELSE '���� Ȯ�� �Ұ�'
        END "����"
     , SUM(SAL) "�޿���"
FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);


---Ǯ��---------------------------------------------------------------
SELECT CASE GROUPING(T.����) WHEN 0 THEN T.����
            ELSE '�����'
        END "����"
     , SUM(T.�޿�) "�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN('1','3') THEN '��'
                WHEN SUBSTR(JUBUN,7,1) IN('2','4') THEN '��'
                ELSE '���� Ȯ�� �Ұ�'
            END "����"
         , SAL "�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	        17000
��	        24000
�����	41000
*/

--�� TBL_SAWON ���̺��� ������ ���� ���ɴ뺰 �ο��� ���·�
--   ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
--------------------------------------------
    ���ɴ�         �ο���
--------------------------------------------
      10               X
      20               X            
      30               X
      40               X
      50               X
     ��ü             XX
--------------------------------------------
*/

--���� Ǯ��------------------------------------------------
SELECT CASE GROUPING(T1.���ɴ�) WHEN 0 THEN T1.���ɴ�
            ELSE '��ü'
        END "���ɴ�"
     , COUNT(T1.���ɴ�) "�ο���"
FROM
(
    SELECT CASE SUBSTR(T.���糪��,1,1) WHEN '1'  THEN '10'
                                        WHEN '2' THEN '20'
                                        WHEN '3' THEN '30'
                                        WHEN '4' THEN '40'
                                        WHEN '5' THEN '50'
                                        ELSE '0'
            END "���ɴ�"
            --, COUNT();
    FROM
    (
        SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) 
                    ELSE -1 
                END "���糪��"
        FROM TBL_SAWON
    )T
)T1
GROUP BY ROLLUP(T1.���ɴ�);
--==>>
/*
����        �ο���
------  ----------
10              2
20              5
30              2
40              4
50              2
��ü           15
*/

-- DECODE ���
SELECT CASE GROUPING(T1.���ɴ�) WHEN 0 THEN T1.���ɴ�
            ELSE '��ü'
        END "���ɴ�"
     , COUNT(T1.���ɴ�) "�ο���"
FROM
(
    SELECT DECODE(SUBSTR(T.���糪��,1,1),'1','10','2','20','3','30','4','40','5','50','0') "���ɴ�"
            --, COUNT();
    FROM
    (
        SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) 
                    ELSE -1 
                END "���糪��"
        FROM TBL_SAWON
    )T
)T1
GROUP BY ROLLUP(T1.���ɴ�);

--�ѹ��� ���� �� �ñ�
--�Բ� Ǭ Ǯ��--------------------------------------------------------------

--��� 1.(INLINE VIEW �� �� �� ��ø~!!!)
--"���� ��" ��ȸ�ϴ°� �ñ��ؼ� ���� ������ ���ɴ�
SELECT CASE GROUPING(Q."���� ��") WHEN 0 THEN TO_CHAR(Q."���� ��")
            ELSE '��ü'
        END "���� ��"
     , COUNT(Q."���� ��") "�ο���"
FROM
(
    SELECT CASE WHEN T.���� >= 50 THEN 50
                WHEN T.���� >= 40 THEN 40
                WHEN T.���� >= 30 THEN 30
                WHEN T.���� >= 20 THEN 20
                WHEN T.���� >= 10 THEN 10
                ELSE 0
            END "���� ��"
            --, COUNT();
    FROM
    (
        -- ����
        SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --(1900 - 1)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --(2000 - 1) 
                    ELSE 0 
                END "����"
        FROM TBL_SAWON
    )T
)Q
GROUP BY ROLLUP(Q."���� ��");
--==>>
/*
10	     2
20	     5
30	     2
40	     4
50	     2
��ü	15
*/


--��� 2.(INLINE VIEW �� �� ���� ��ø~!!!)

SELECT TRUNC(����,-1) "���ɴ�"

CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --(1900 - 1)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --(2000 - 1) 
                    ELSE 0 END
FROM TBL_SAWON;

--------���̿� ���̽��� �ֱ�!
-- �̰� �̿��ؼ� COUNT�ؼ� ���غ���!!...ING
SELECT TRUNC(CASE WHEN SUBSTR(JUBUN,7,1) IN('1','2') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --(1900 - 1)
                    WHEN SUBSTR(JUBUN,7,1) IN('3','4') 
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --(2000 - 1) 
                    ELSE 0 END,-1) "���ɴ�"

FROM TBL_SAWON;




--�� ROLLUP Ȱ�� �� CUBE
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	    CLERK	     1300   -- 10�� �μ��ȿ��� CLERK���� ������
10	    MANAGER	     2450
10	    PRESIDENT	 5000
10	    (NULL)	     8750   -- 10�� �μ� ��� ������ �޿���
20	    ANALYST	     6000
20	    CLERK	     1900
20	    MANAGER	     2975
20	    (NULL)	    10875   -- 20�� �μ� ��� ������ �޿���
30	    CLERK	      950
30	    MANAGER	     2850
30	    SALESMAN	 5600
30	    (NULL)	     9400   -- 30�� �μ� ��� ������ �޿���
(NULL)	(NULL)	    29025   -- ��� �μ� ��� ������ �޿���
*/


--�� CUBE() �� ROLLUP() ���� �ڼ��� �����  ��ȯ���� �� �ִ�.   
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    (NULL)	    8750   -- 10�� �μ� ��� ������ �޿���
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    (NULL)	   10875   -- 20�� �μ� ��� ������ �޿���
30	    CLERK	     950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    (NULL)	    9400   -- 30�� �μ� ��� ������ �޿���
(NULL)	ANALYST	    6000   -- ��� �μ� ANALYST ������ �޿���
(NULL)	CLERK	    4150   -- ��� �μ� CLERK ������ �޿���
(NULL)	MANAGER	    8275   -- ��� �μ� MANAGER ������ �޿���
(NULL)	PRESIDENT	5000   -- ��� �μ� PRESIDENT ������ �޿���
(NULL)	SALESMAN	5600   -- ��� �μ� SALESMAN ������ �޿���
(NULL)	(NULL)	   29025   -- ��� �μ� ��� ������ �޿���
*/

--�� ROLLUP() �� CUBE() ��
--   �׷��� �����ִ� ����� �ٸ���.

-- ROLLUP(A, B, C)
-- �� (A, B, C) / (A, B) / (A) / ()

-- CUBE(A, B, C)
-- �� (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()

--==>> ���� ó�� ������ �ʹ� ���� ������� ��µǱ� ������
--     ������ ���� ���¸� �� ���� ����Ѵ�.
--     ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸 ��GROUPING SETS����
--     �̿��Ͽ� �����ִ� ����̴�.
SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�' 
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����' 
        END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY 1,2;
--==>>
/*
10	        CLERK	1300
10	        MANAGER	2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	6000
20	        CLERK	1900
20	        MANAGER	2975
20	        ��ü����	10875
30	        CLERK	950
30	        MANAGER	2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	2500
����	    SALESMAN	5500
����	    ��ü����	8000
��ü�μ�	��ü����	37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�' 
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����' 
        END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY 1,2;
--==>>
/*
10	        CLERK	1300
10	        MANAGER	2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	6000
20	        CLERK	1900
20	        MANAGER	2975
20	        ��ü����	10875
30	        CLERK	950
30	        MANAGER	2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	2500
����	    SALESMAN	5500
����	    ��ü����	8000
��ü�μ�	ANALYST	6000
��ü�μ�	CLERK	6650
��ü�μ�	MANAGER	8275
��ü�μ�	PRESIDENT	5000
��ü�μ�	SALESMAN	11100
��ü�μ�	��ü����	37025
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�' 
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����' 
        END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO,JOB), (DEPTNO),())     -- ROLLUP() �� ���� ���
ORDER BY 1,2;
/*
10	        CLERK	1300
10	        MANAGER	2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	6000
20	        CLERK	1900
20	        MANAGER	2975
20	        ��ü����	10875
30	        CLERK	950
30	        MANAGER	2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	2500
����	    SALESMAN	5500
����	    ��ü����	8000
��ü�μ�	��ü����	37025
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�' 
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB 
            ELSE '��ü����' 
        END "����"
     , SUM(SAL) "�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO,JOB), (DEPTNO),(JOB),())     -- CUBE() �� ���� ���
ORDER BY 1,2;
--==>>
/*
10	        CLERK	1300
10	        MANAGER	2450
10	        PRESIDENT	5000
10	        ��ü����	8750
20	        ANALYST	6000
20	        CLERK	1900
20	        MANAGER	2975
20	        ��ü����	10875
30	        CLERK	950
30	        MANAGER	2850
30	        SALESMAN	5600
30	        ��ü����	9400
����	    CLERK	2500
����	    SALESMAN	5500
����	    ��ü����	8000
��ü�μ�	ANALYST	6000
��ü�μ�	CLERK	6650
��ü�μ�	MANAGER	8275
��ü�μ�	PRESIDENT	5000
��ü�μ�	SALESMAN	11100
��ü�μ�	��ü����	37025
*/


--�� TBL_EMP ���̺��� �Ի�⵵�� �ο����� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;
/*
--------------------------
    �Ի�⵵    �ο���
--------------------------
      1980          1
      1981         10
      1982          1
      1987          2
      2021          5
      ��ü         19
--------------------------      
*/
---------------���� Ǯ��----------------------------------------------
SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0 THEN TO_CHAR(EXTRACT(YEAR FROM HIREDATE))
            ELSE '��ü' 
        END "�Ի�⵵" 
     , COUNT(HIREDATE)
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
�Ի�⵵       COUNT(HIREDATE)
-------------- ---------------
1980                         1
1981                        10
1982                         1
1987                         2
2021                         5
��ü                        19
*/
SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0 THEN TO_CHAR(EXTRACT(YEAR FROM HIREDATE))
            ELSE '��ü' 
        END "�Ի�⵵" 
     , COUNT(HIREDATE)
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
�Ի�⵵       COUNT(HIREDATE)
-------------- ---------------
1980                         1
1981                        10
1982                         1
1987                         2
2021                         5
��ü                        19
*/
SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE)) WHEN 0 THEN TO_CHAR(EXTRACT(YEAR FROM HIREDATE))
            ELSE '��ü' 
        END "�Ի�⵵" 
     , COUNT(HIREDATE)
FROM TBL_EMP
GROUP BY GROUPING SETS(EXTRACT(YEAR FROM HIREDATE),())
ORDER BY 1;
--==>>
/*
�Ի�⵵       COUNT(HIREDATE)
-------------- ---------------
1980                         1
1981                        10
1982                         1
1987                         2
2021                         5
*/
-- GROUPING SETS ()�ڿ� �־���
/*
�Ի�⵵       COUNT(HIREDATE)
-------------- ---------------
1980                         1
1981                        10
1982                         1
1987                         2
2021                         5
��ü                        19
*/


---------------�Բ� Ǭ Ǯ��----------------------------------------------
SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
1980	 1
1981	10
1982	 1
1987	 2
2021	 5
(NULL)	19
*/

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE))
ORDER BY 1;
--==>>
/*
1980	 1
1981	10
1982	 1
1987	 2
2021	 5
(NULL)	19
*/

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY GROUPING SETS(EXTRACT(YEAR FROM HIREDATE),())
ORDER BY 1;
/*
1980	 1
1981	10
1982	 1
1987	 2
2021	 5
(NULL)	19
*/


SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE,'YYYY'))       -- '1980' '1981' '1982'...
ORDER BY 1;
--==>> ���� �߻�
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
711��, 26������ ���� �߻�
*/

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE,'YYYY'))       -- '1980' '1981' '1982'...
ORDER BY 1;
--==>> ���� �߻�
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
725��, 26������ ���� �߻�
*/

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY GROUPING SETS(TO_CHAR(HIREDATE,'YYYY'),())       -- '1980' '1981' '1982'...
ORDER BY 1;
--==>> �����߻�
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
739��, 26������ ���� �߻�
*/

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY')      -- '1980' '1981' '1982'...
ORDER BY 1;
--==>> �����߻�
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
754��, 26������ ���� �߻�
*/

-- �׷���̷� ������ ���̶� SELECT ��ȸ���� ���̶� ������Ÿ���� �޶� �׷���!
SELECT TO_CHAR(HIREDATE,'YYYY') "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY')      -- '1980' '1981' '1982'...
ORDER BY 1;
--==>>
/*
1980	 1
1981	10
1982	 1
1987	 2
2021	 5
*/

SELECT EXTRACT(YEAR FROM HIREDATE) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_NUMBER(TO_CHAR(HIREDATE,'YYYY'))     -- '1980' '1981' '1982'...
ORDER BY 1;
--==>> ���� �߻�
/*
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
782��, 26������ ���� �߻�
*/
-- TO_CHAR(HIREDATE,'YYYY')�̰Ÿ� TO_NUMBER�� �ٲ㼭 ������ Ÿ���� SELECT�� ���絵 �ȵ�!
-- SELECT �� �׷������ ������ �¾ƾ���!
-- �Ľ̼����� GROUP BY �Ȱ� SELECT���ֱ� ������ ���ĵ� �Ȱ��� �÷������!!

SELECT TO_NUMBER(TO_CHAR(HIREDATE,'YYYY')) "�Ի�⵵"
     , COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_NUMBER(TO_CHAR(HIREDATE,'YYYY'))     -- '1980' '1981' '1982'...
ORDER BY 1;
--==>>
/*
1980	 1
1981	10
1982	 1
1987	 2
2021	 5
*/

--------------------------------------------------------------------------------

--���� HAVING ����--
/*
SELECT �÷���          --5
FROM ���̺��          --1
WHERE ������           --2
GROUP BY ��            --3
HAVING ������          --4
ORDER BY ��            --6
*/
-- HAVING �� ������!!!!!!!!!
-- GROUP �� ���� ����!

--�� EMP ���̺��� �μ���ȣ�� 20, 30�� �μ��� �������
--   �μ��� �� �޿��� 10000 ���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.
-- (HAVING �� ������� ������ � ������ �߻��ϴ��� ����!)
SELECT DEPTNO "�μ���ȣ"
     , SUM(SAL) "�ѱ޿�"
FROM EMP
WHERE DEPTNO IN(20,30)
GROUP BY DEPTNO;
--==>>
/*
30	 9400
20	10875
*/

SELECT DEPTNO "�μ���ȣ"
     , SUM(SAL) "�ѱ޿�"
FROM EMP
WHERE DEPTNO IN(20,30)
  AND SUM(SAL)<10000
GROUP BY DEPTNO;
--==>> �̷���  AND SUM(SAL)<10000 ������ ��ȸ�Ϸ��� �ϴϱ� ���� �߻�!
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
*Cause:    
*Action:
839��, 20������ ���� �߻�
*/

SELECT DEPTNO "�μ���ȣ"
     , SUM(SAL) "�ѱ޿�"
FROM EMP
WHERE DEPTNO IN(20,30)
GROUP BY DEPTNO
HAVING SUM(SAL)<10000;
--==>>
/*
30	9400
*/

SELECT DEPTNO "�μ���ȣ"
     , SUM(SAL) "�ѱ޿�"
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO IN(20,30)
   AND SUM(SAL)<10000;
--==>> �̷��� �ص� ó���� ������, �ڿ� WHERE�ִ� ���� �� ����! 
--> ����Ʈ���� �Ľ̼������� WHERE�� �ִ� �͸� �÷����� �ؿ��� ó���ϴ� ���� ��� �÷����� ó���ϴ°� ���� ���ҽ� �Ҹ� ����!
/*
30	9400
*/

--------------------------------------------------------------------------------

--���� ��ø �׷��Լ� / �м��Լ� ����--
-- �Լ����� �Լ� ��ø�Ҷ��� ������������ ����!!
-- �׷� �Լ� 2 LEVEL ���� ��ø�ؼ� ����� �� �ִ�.
-- �̸�����...MSSQL �� �Ұ����ϴ�.
SELECT SUM(SAL) 
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
 9400
10875
 8750
*/

SELECT MAX(SUM(SAL)) 
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

-- RANK()
-- DENSE_RANK()
--> ORACLE 9i ���� ����... MSSQL 2005 ���� ����...

--�� ���� ���������� RANK() �� DENSE_RANK() �� ����� �� ���� ������
--   �̸� ��ü�Ͽ� ������ ������ �� �ִ� ����� �����ؾ� �Ѵ�.

-- ���� ���, �޿��� ������ ���ϰ��� �Ѵٸ�...
-- �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� ��
-- Ȯ���� ���ڿ� +1 �� �߰� �������ָ� �װ��� �� ����� �ȴ�.

-- 50�� �������� ����
-- 80 90 10 50   ��  2 + 1 �� 3
--          --

SELECT ENAME, SAL,1
FROM EMP;

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL>800;
--==>> 14 �� SMITH �� �޿� ���

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL>1600;
--==>> 7 �� ALLER �� �޿� ���

SELECT ENAME, SAL, RANK() OVER(ORDER BY SAL DESC)
FROM EMP;
--> �̷��� �������� �ϱ� ����!


--�� ���� ��� ����(��� ���� ����)
--   ���� ������ �ִ� ���̺��� �÷���
--   ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
--   �츮�� �� �������� ���� ��� ���� ��� �θ���.

SELECT ENAME "�����", SAL "�޿�", 1 "�޿����"
FROM EMP;

SELECT ENAME "�����", SAL "�޿�", (SELECT COUNT(*) +1
                                    FROM EMP 
                                    WHERE SAL>800) "�޿����"
FROM EMP ;
--> ������ FROM ������ ����ϴ� ���̾ƴ϶� �÷��� ����� �� ���ִ�!
--  ���� ���� ��� ������ �ƴϴ�

-- ���� ��� ����!
SELECT ENAME "�����", SAL "�޿�", 1 "�޿����"
FROM EMP;

SELECT E1.ENAME "�����", E1.SAL "�޿�", (SELECT COUNT(*) +1
                                    FROM EMP E2
                                    WHERE E2.SAL>E1.SAL) "�޿����"
FROM EMP E1;
--==>>
/*
SMITH	 800	14
ALLEN	1600	 7
WARD	1250	10
JONES	2975	 4
MARTIN	1250	10
BLAKE	2850	 5
CLARK	2450	 6
SCOTT	3000	 2
KING	5000	 1
TURNER	1500	 8
ADAMS	1100	12
JAMES	 950	13
FORD	3000	 2
MILLER	1300	 9
*/

--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK() �Լ��� ������� �ʰ�, ��� ���� ������ Ȱ���� �� �ֵ��� �Ѵ�.

SELECT E1.ENAME "�����", E1.SAL "�޿�", E1.DEPTNO "�μ���ȣ"
     , (SELECT COUNT(*) + 1 
        FROM EMP E2
        WHERE E2.SAL>E1.SAL AND E2.DEPTNO = E1.DEPTNO) "�μ����޿����"
     , (SELECT COUNT(*) + 1 
        FROM EMP E2
        WHERE E2.SAL>E1.SAL) "��ü�޿����"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.SAL DESC;
--==>>
/*
KING	5000	10	1	1
CLARK	2450	10	2	6
MILLER	1300	10	3	9
SCOTT	3000	20	1	2
FORD	3000	20	1	2
JONES	2975	20	3	4
ADAMS	1100	20	4	12
SMITH	 800	20	5	14
BLAKE	2850	30	1	5
ALLEN	1600	30	2	7
TURNER	1500	30	3	8
MARTIN	1250	30	4	10
WARD	1250	30	4	10
JAMES	 950	30	6	13
*/


SELECT COUNT(*) + 1 
FROM EMP 
WHERE SAL> 1600 AND DEPTNO = 30
ORDER BY DEPTNO;

SELECT ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO;


--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
----------------------------------------------------------------------
    ����� �μ���ȣ    �Ի���     �޿�      �μ����Ի纰�޿�����
----------------------------------------------------------------------
    CLERK   10       1981-06-09   2450          2450
    KING    10       1981-11-17   5000          7450
    MILLER  10       1982-01-23   1300          8750
    SMITH   20       1980-12-17    800           800
                            :
                            :
----------------------------------------------------------------------
*/
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM EMP;

SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (SELECT SUM(SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO
          AND E2.HIREDATE <= E1.HIREDATE) "�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY DEPTNO,HIREDATE;
--==>>
/*
CLARK	10	1981-06-09	2450	2450
KING	10	1981-11-17	5000	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	 800	800
JONES	20	1981-04-02	2975	3775
FORD	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875   -- �Ի����� ���� ������
ADAMS	20	1987-07-13	1100	10875   -- �ΰ��� ������ 4100�� �������� ����!
ALLEN	30	1981-02-20	1600	1600
WARD	30	1981-02-22	1250	2850
BLAKE	30	1981-05-01	2850	5700
TURNER	30	1981-09-08	1500	7200
MARTIN	30	1981-09-28	1250	8450
JAMES	30	1981-12-03	 950	9400
*/


SELECT E1.ENAME "�����", E1.DEPTNO "�μ���ȣ", E1.HIREDATE "�Ի���", E1.SAL "�޿�"
     , (SELECT SUM(SAL)
        FROM EMP E2
        WHERE E2.HIREDATE <= E1.HIREDATE) "��ü�޿�����"
FROM EMP E1
ORDER BY HIREDATE;
/*
SMITH	20	1980-12-17	 800	800
ALLEN	30	1981-02-20	1600	2400
WARD	30	1981-02-22	1250	3650
JONES	20	1981-04-02	2975	6625
BLAKE	30	1981-05-01	2850	9475
CLARK	10	1981-06-09	2450	11925
TURNER	30	1981-09-08	1500	13425
MARTIN	30	1981-09-28	1250	14675
KING	10	1981-11-17	5000	19675
JAMES	30	1981-12-03	 950	23625
FORD	20	1981-12-03	3000	23625
MILLER	10	1982-01-23	1300	24925
SCOTT	20	1987-07-13	3000	29025
ADAMS	20	1987-07-13	1100	29025
*/


--�� TBL_EMP ���̺��� �Ի��� ����� ���� ���� ������ ����
--   �Ի����� �ο����� ��ȸ�� �� �ִ� �������� �����Ѵ�.
/*
----------------------------------------
    �Ի���        �ο���
----------------------------------------
    2021-09            5
----------------------------------------
*/

-- ���� Ǯ��--------------------------------------------
SELECT E1.HIREDATE
     , (SELECT COUNT(*) 
        FROM TBL_EMP E2
        WHERE MAX(EXTRACT(HIREDATE,'YYYY-MM'))
FROM TBL_EMP E1
ORDER BY HIREDATE;

-- Ǯ��--------------------------------------------------
SELECT TO_CHAR(HIREDATE,'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM TBL_EMP 
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM')
HAVING COUNT(*) = (5);
--==>> 2021-09	5
/*
-- HAVING ������ �ֱ� ��
2021-09	5
1981-05	1
1981-12	2
1982-01	1
1981-09	2
1981-02	2
1981-11	1
1980-12	1
1981-04	1
1987-07	2
1981-06	1
*/

-- �Ի����� �ο����� ���� ū ��
SELECT MAX(COUNT(*))
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');


-- (5) �� ���� ���Ѱ� �������ָ� ��!
SELECT TO_CHAR(HIREDATE,'YYYY-MM') "�Ի���"
     , COUNT(*) "�ο���"
FROM TBL_EMP 
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                    FROM TBL_EMP
                    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>> 2021-09	5

--------------------------------------------------------------------------------

--���� ROW_NUBER() ����--
-- ���ȣó�� �ٰԲ� ������ ��
SELECT ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
FROM EMP;

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "�׽�Ʈ"
    , ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
FROM EMP;
--==>>
/*
�׽�Ʈ ����� �޿� �Ի���       
--- ------- ------- ---------- 
1	KING	5000	1981-11-17
2	FORD	3000	1981-12-03
3	SCOTT	3000	1987-07-13
4	JONES	2975	1981-04-02
5	BLAKE	2850	1981-05-01
6	CLARK	2450	1981-06-09
7	ALLEN	1600	1981-02-20
8	TURNER	1500	1981-09-08
9	MILLER	1300	1982-01-23
10	WARD	1250	1981-02-22
11	MARTIN	1250	1981-09-28
12	ADAMS	1100	1987-07-13
13	JAMES	 950	1981-12-03
14	SMITH	 800	1980-12-17
*/

--�� �Խ����� �Խù� ��ȣ�� SEQUENCE �� IDENTITY �� ����ϰ� �Ǹ�
--   �Խù��� �������� ���, ������ �Խù��� �ڸ��� ���� ��ȣ�� ����
--   �Խù��� ��ϵǴ� ��Ȳ�� �߻��ϰ� �ȴ�.
--   �̴� ���� ���鿡����... �̰����� ���鿡����... �ٶ������� ���� ��Ȳ�� �� �ֱ� ������
--   ROW_NUMBER() �� ����� ����� �� �� �ִ�.
--   ������ �������� ����� ������ SEQUENCE �� IDENTITY �� ���������
--   �ܼ��� �Խù��� ���ȭ�Ͽ� ����ڿ��� ����Ʈ �������� ������ ������
--   ������� �ʴ� ���� ����.

-->(ĸ�ı׸�) ������ ���̵�Ƽ ���� ����
-- ������ �������� SEQUENCE ���!



--�� ����
CREATE TABLE TBL_AAA
(NO         NUMBER  
,NAME       VARCHAR2(30)
,GRADE      CHAR(10)
);
--==>> Table TBL_AAA��(��) �����Ǿ����ϴ�.

INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(1,'�չ���', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(2,'���ش�', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(3,'������', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(4,'�ּ���', 'D');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(5,'���±�', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(6,'����ȭ', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(7,'�չ���', 'A');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7

SELECT *
FROM TBL_AAA;
--==>>
/*
1	�չ���	A         
2	���ش�	B         
3	������	A         
4	�ּ���	D         
5	���±�	A         
6	����ȭ	A         
7	�չ���	A         
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

UPDATE TBL_AAA
SET GRADE='A'
WHERE NAME = '�ּ���';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
SELECT *
FROM TBL_AAA;
--==>>
/*
1	�չ���	A         
2	���ش�	B         
3	������	A         
4	�ּ���	A         
5	���±�	A         
6	����ȭ	A         
7	�չ���	A         
*/


UPDATE TBL_AAA
SET NAME = '���ش�'
WHERE GRADE = 'A';


UPDATE TBL_AAA
SET GRADE = 'A'
WHERE NAME = '�չ���';

-- ���� �ΰ��� �Ϸ��� �ϸ� �Ҽ����⶧���� �տ� NO�� �־����!!�װԹٷ� ������

--�� SEQUENCE(�ù��� : �ֹ���ȣ) ����
--   �� �������� �ǹ� : 1.(�Ϸ���) �������� ��ǵ� 2.(���, �ൿ ����) ����

CREATE SEQUENCE SEQ_BOARD   -- �ù��� ���� �⺻ ����(MSSQL �� IDENTITY �� ������ ����)
START WITH 1                -- ���۰�(�������� 1������ ���۰��� ��ٵ�)
INCREMENT BY 1              -- ������(1�������ϰ� �ϰڴ�)
NOMAXVALUE                  -- �ִ밪 ���� ����
NOCACHE;                    -- ĳ�� ��� ����(����)
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.
-- 1���� �����ؼ� �ִ밪 ���� ���� ĳ�� ������� �ʰ� �ϳ��� �����ϴ� �������� �������

-- ������ ĳ�ø� �����ϴ°� ��ǹ�?
--> ���࿡�� �ټ��� ��ȣǥ �̴µ� ��ȣǥ�� 10�徿 �̾Ƴ��� �����ִ� ��� == ĳ��
-- �����ڼ��� Ʈ������ ���������� ����������, �������� ���������� ������

--�� ���̺� ����(TBL_BOARD)
CREATE TABLE TBL_BOARD                  -- TBL_BOARD �̸��� ���̺� ���� �� �Խ���
( NO            NUMBER                  -- �Խù� ��ȣ       -- X(�����ۼ� ����)
, TITLE         VARCHAR2(50)            -- �Խù� ����       -- O
, CONTENTS      VARCHAR2(2000)          -- �Խù� ����       -- O
, NAME          VARCHAR2(20)            -- �Խù� �ۼ���     -- ��(����°ſ� ���� �ٸ�)
, PW            VARCHAR2(20)            -- �Խù� �н�����   -- ��(����°ſ� ���� �ٸ�)
, CREATED       DATE DEFAULT SYSDATE    -- �Խù� �ۼ���     -- X
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� ������ �Է� �� �Խ��ǿ� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ѽ�~1��', '���� 1��������','����ȣ','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ǰ�����', '�ٵ� �ǰ� ì��ô�','������','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���� �� ����','�մ���','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���ڱ� �� ����','������','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ϰ������', '�ڲ� ������','��ȿ��','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����', '������� ��F�� �ϳ���','������','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����', '������ �����','��ȿ��','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ѽ�~1��	    ���� 1��������	        ����ȣ	JAVA006$	2021-09-06
2	�ǰ�����	    �ٵ� �ǰ� ì��ô�	    ������	JAVA006$	2021-09-06
3	������	        ���� �� ����	        �մ���	JAVA006$	2021-09-06
4	������	        ���ڱ� �� ����	    ������	JAVA006$	2021-09-06
5	�����ϰ������	�ڲ� ������	            ��ȿ��	JAVA006$	2021-09-06
6	����	        ������� ��F�� �ϳ���	������	JAVA006$	2021-09-06
7	����	        ������ �����	    ��ȿ��	JAVA006$	2021-09-06
*/


COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=5;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '�� �׳� �߷���','������','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
/*
1	�ѽ�~1��	���� 1��������	        ����ȣ	JAVA006$	2021-09-06
3	������	    ���� �� ����	        �մ���	JAVA006$	2021-09-06
4	������	    ���ڱ� �� ����	    ������	JAVA006$	2021-09-06
6	����	    ������� ��F�� �ϳ���	������	JAVA006$	2021-09-06
7	����	    ������ �����	    ��ȿ��	JAVA006$	2021-09-06
8	������	    �� �׳� �߷���	        ������	JAVA006$	2021-09-06
*/
--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=7;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=8;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ѽ�~1��	���� 1��������	        ����ȣ	JAVA006$	2021-09-06
3	������	    ���� �� ����	        �մ���	JAVA006$	2021-09-06
4	������	    ���ڱ� �� ����	    ������	JAVA006$	2021-09-06
6	����	    ������� ��F�� �ϳ���	������	JAVA006$	2021-09-06
*/

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���¿�', '�� ������ �־��','������','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

-- ��F�� ��Ÿ ��Է� ��ħ
UPDATE TBL_BOARD
SET CONTENTS = '������� ��� �ϳ���'
WHERE NAME = '������';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� Ȯ��
SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�ѽ�~1��	���� 1��������	    ����ȣ	JAVA006$	2021-09-06
3	������	���� �� ����	        �մ���	JAVA006$	2021-09-06
4	������	���ڱ� �� ����	    ������	JAVA006$	2021-09-06
6	����	������� ��� �ϳ���	������	JAVA006$	2021-09-06
9	���¿�	�� ������ �־��	    ������	JAVA006$	2021-09-06
*/

-- �̷��� �Խù� ��ȣ�� ������ �ȵ�! �׷��� ROW_NUMBER()�� ���!!

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
5	���¿�	    ������	2021-09-06
4	����	    ������	2021-09-06
3	������	    ������	2021-09-06
2	������	    �մ���	2021-09-06
1	�ѽ�~1��	����ȣ	2021-09-06
*/

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���� ����','����ȣ','JAVA006$',SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
6	������	����ȣ	2021-09-06
5	���¿�	������	2021-09-06
4	����	������	2021-09-06
3	������	������	2021-09-06
2	������	�մ���	2021-09-06
1	�ѽ�~1��	����ȣ	2021-09-06
*/

DELETE
FROM TBL_BOARD
WHERE NO=3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
     , TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
5	������	    ����ȣ	2021-09-06
4	���¿�	    ������	2021-09-06
3	����	    ������	2021-09-06
2	������	    ������	2021-09-06
1	�ѽ�~1��	����ȣ	2021-09-06
*/

