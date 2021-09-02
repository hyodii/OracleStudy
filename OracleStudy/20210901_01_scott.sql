SELECT USER
FROM DUAL;
--==>> SCOTT

--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�� ����
--   1981�� 9�� 28�� ���̿� �Ի��� ��������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. �ش��� ����)
SELECT ENAME "�����",JOB "������",HIREDATE  "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD')
    AND HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� BETWEEN A AND B ����ص� �ȴ�!
SELECT ENAME "�����",JOB "������",HIREDATE  "�Ի���"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD') AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/


SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 1600 AND 3000;
--==>>
/*
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		20
7902	FORD	ANALYST	    7566	1981-12-03	3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
--==>>
/*
7566	JONES	MANAGER	        7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	    7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	        7839    1981-06-09	2450		    10
7839	KING	PRESIDENT		        1981-11-17	5000		    10
7900	JAMES	CLERK	        7698	1981-12-03	950		        30
7902	FORD	ANALYST	        7566	1981-12-03	3000		    20
7934	MILLER	CLERK	        7782	1982-01-23	1300		    10
*/

--> SMITH �� SCOTT �� ����� �ȵ�!?! 
--  BETWEEN �������� ��¥�� ���� ��� ���� �����ؼ� ��ȸ������ '����'�� �տ� ���ڴ� �����ε� �ڿ� ���ڴ� �������̴�!?
--  ��� �̸� �߿� 'S'�� ��������� ����!!
--  ��--------------�� ---
--  'C'            'S'

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
--==>> �ҹ��� s�ϸ� SMITH �� SCOTT�� ����! ������ �迭�̶� ����!
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		        20
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	    30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	    0	30
7900	JAMES	CLERK	    7698	1981-12-03	950		        30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/

--�� ASCII()
SELECT ASCII('A'), ASCII('B'), ASCII('a'), ASCII('b')
FROM DUAL;
--==>> 65	66	97	98

--�� BETWEEN A AND B �� ��¥��, ������, ������ ������ ��ο� ����ȴ�.
--   ��, ���ڿ��� ��� �ƽ�Ű�ڵ� ������ ������ ������
--   �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--   ����,  BETWEEN A AND B �� �������� ����Ǵ� ��������
--   ����Ŭ ���������� �ε�ȣ �������� ���·� �ٲ�� ������ ó���ȴ�.
--   (�ε�ȣ����  BETWEEN A AND B ���� ���� ������ �ʿ� ����!)


--�� TBL_EMP ���̺��� ������ SALESMAN �� CLERK �� �����
--   �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
    OR JOB = 'CLERK';

SELECT ENAME "�����",JOB "������",SAL "�޿�"
FROM TBL_EMP
WHERE JOB IN ( 'SALESMAN', 'CLERK' );
--> IN() ()�ȿ� ����ִ� ��ŵ� ��ȸ�Ѵ�.

SELECT ENAME"�����",JOB"������",SAL"�޿�"
FROM TBL_EMP
WHERE JOB = ANY('SALESMAN','CLERK');                    --- cf. ��=ALL�� �̰Ŵ� ()�ȿ� ��� �¾ƾ� ��ȸ
-- �����ִ�  ���� �ƹ��ų� ��ġ�ϸ� ��ȸ�Ѵ�. IN�� ���� �ǹ�
--==>>
/*
SMITH	CLERK	    800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	    950
MILLER	CLERK	    1300
*/

--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--   ������, �� ���� �������� ���� ������ ó���ȴ�.
--   ����, �޸𸮿� ���� ������ �ƴ϶� CPU �� ���� �����̱� ������
--   �� �κб��� �����Ͽ� �������� ������ �����ϴ� ���� ���� �ʴ�.
--   �� ��IN�� �� ��=ANY�� �� ���� ������ ȿ���� ������.
--   ��� ���������δ� ��OR�������� ����Ǿ� ���� ó���ȴ�.

--------------------------------------------------------------------------------
DROP TABLE TBL_
PURGE RECYCLEBIN; 

--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON (
    SANO      NUMBER(4),
    SANAME    VARCHAR2(30),
    JUBUN     CHAR(13),
    HIREDATE  DATE DEFAULT SYSDATE,
    SAL       NUMBER(10)
);
--==>> Table TBL_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;
--==>> ��ȸ ��� ����

DESC TBL_SAWON;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)
*/

--�� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON (SANO,SANAME,JUBUN,HIREDATE,SAL) 
VALUES (1001,'��ҿ�','9307302234567',TO_DATE('2001-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON (SANO,SANAME,JUBUN,HIREDATE,SAL) 
VALUES (1002,'�̴ٿ�','9510272234567',TO_DATE('2010-11-05', 'YYYY-MM-DD'),2000);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1003,
    '������',
    '0909014234567',
    TO_DATE('2012-08-16', 'YYYY-MM-DD'),
    1000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1004,
    '�մ���',
    '9406032234567',
    TO_DATE('1999-02-02', 'YYYY-MM-DD'),
    4000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1005,
    '������',
    '0406034234567',
    TO_DATE('2013-07-15', 'YYYY-MM-DD'),
    1000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1006,
    '���̰�',
    '0202023234567',
    TO_DATE('2011-08-17', 'YYYY-MM-DD'),
    2000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1007,
    '���̳�',
    '8012122234567',
    TO_DATE('1999-11-11', 'YYYY-MM-DD'),
    3000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1008,
    '������',
    '8105042234567',
    TO_DATE('1999-11-11', 'YYYY-MM-DD'),
    3000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1009,
    '������',
    '7209301234567',
    TO_DATE('1995-11-11', 'YYYY-MM-DD'),
    3000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1010,
    '������',
    '7001022234567',
    TO_DATE('1995-10-10', 'YYYY-MM-DD'),
    3000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1011,
    '���켱',
    '9001022234567',
    TO_DATE('2001-10-10', 'YYYY-MM-DD'),
    2000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1012,
    '����',
    '8009011234567',
    TO_DATE('1998-02-13', 'YYYY-MM-DD'),
    4000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1013,
    '������',
    '8203051234567',
    TO_DATE('2002-02-13', 'YYYY-MM-DD'),
    3000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1014,
    '������',
    '9208091234567',
    TO_DATE('2002-02-13', 'YYYY-MM-DD'),
    3000
);

INSERT INTO TBL_SAWON (
    SANO,
    SANAME,
    JUBUN,
    HIREDATE,
    SAL
) VALUES (
    1015,
    '�賲��',
    '0202023234567',
    TO_DATE('2015-01-10', 'YYYY-MM-DD'),
    2000
);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 15

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	2001-01-03	3000
1002	�̴ٿ�	    9510272234567	2010-11-05	2000
1003	������	    0909014234567	2012-08-16	1000
1004	�մ���	    9406032234567	1999-02-02	4000
1005	������	    0406034234567	2013-07-15	1000
1006	���̰�	    0202023234567	2011-08-17	2000
1007	���̳�	    8012122234567	1999-11-11	3000
1008	������	    8105042234567	1999-11-11	3000
1009	������	    7209301234567	1995-11-11	3000
1010	������	7001022234567	1995-10-10	3000
1011	���켱	    9001022234567	2001-10-10	2000
1012	����	    8009011234567	1998-02-13	4000
1013	������	    8203051234567	2002-02-13	3000
1014	������	    9208091234567	2002-02-13	3000
1015	�賲��	    0202023234567	2015-01-10	2000
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� TBL_SAWON ���̺��� ��ҿ� ����� ������ ��� ��ȸ����.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '��ҿ�';
--==>> 1001	��ҿ�	9307302234567	2001-01-03	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '��ҿ�';
--==>> 1001	��ҿ�	9307302234567	2001-01-03	3000

--�� LIKE : ���� �� �����ϴ�.
--          �λ� �� ~�� ����, ~ó��

--�� WILD CHARACTER �� ��%��
--   ��LIKE�� �� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��ϰ�
--   ��LIKE�� �� �Բ� ���Ǵ� ��_���� �ƹ� ���� 1���� �ǹ��Ѵ�.

--�� TBL_SAWON ���̺��� ������ ���̡����� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME,JUBUN,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��';

--==>> ��ȸ ��� ����(���� �߻����� ����, '��'�� ��ȸ�� ��)

SELECT SANAME,JUBUN,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';

SELECT SANAME,JUBUN,SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_';
--==>> ��ȸ ��� ���� (�̸��� 2������ ����߿� ù���ڰ� '��'�� ���)

SELECT SANAME,JUBUN,SAL
FROM TBL_SAWON
WHERE SANAME '��_';
--==>> ��ȸ ��� ����(�̸��� '��_'�� ���)

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>> ù ���ڰ� '��' �̱⸸ �ϸ��
/*
�̴ٿ�	9510272234567	2000
������	0909014234567	1000
������	0406034234567	1000
���̰�	0202023234567	2000
*/


--�� TBL_SAWON ���̺��� ������ ���������� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>>
/*
������	8203051234567	3000
������	9208091234567	3000
*/
--> ���� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_';
--==>> ����	8009011234567	4000
--> ������, ������ ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__'
   OR SANAME LIKE '��_';
--==>>
/*
����	8009011234567	4000
������	8203051234567	3000
������	9208091234567	3000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>
/*
����	8009011234567	4000
������	8203051234567	3000
������	9208091234567	3000
*/


--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ����������
--   ������ ����� �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--==>>
/*
�̴ٿ�	9510272234567	2010-11-05	2000
������	0909014234567	2012-08-16	1000
*/

SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__��';
--   OR SANAME LIKE '_��';
--==>>
/*
�̴ٿ�	9510272234567	2010-11-05	2000
������	0909014234567	2012-08-16	1000
*/


--�� TBL_SAWON ���̺��� ��� �̸� �ȿ� ���̡���� ���ڰ�
--   �ϳ��� ���ԵǾ� ������ �� �����
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>
/*
1002	�̴ٿ�	2010-11-05	2000
1003	������	2012-08-16	1000
1005	������	2013-07-15	1000
1006	���̰�	2011-08-17	2000
1007	���̳�	1999-11-11	3000
1008	������	1999-11-11	3000
*/

--�� TBL_SAWON ���̺���  ��� �̸� �ȿ� ���̡���� ���ڰ�
--   �� �� ���ԵǾ� ������ �� �����
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';
--==>> 1006	���̰�	2011-08-17	2000 (�̸� �߰��� ���̰� �پ��ִ� �̸�)

SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
--==>>
/*
1005	������	2013-07-15	1000
1006	���̰�	2011-08-17	2000
*/

SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺��� ������ ���������� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--> �Ұ�!! (���� ����, ���� ó�� ���� ���������� ����!)

--�� TBL_SAWON ���̺��� ������ ���������� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--> �Ұ�!!

--�� �����ͺ��̽� ���� �� ���� �̸��� �и��ؼ� ó���ؾ� �� ���� ��ȹ�� �ִٸ�
--   (���� ������ �ƴϴ���...) ���̺��� �� �÷��� �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�.
--   ��[ ] �̸�[    ]  �̷������� 


--�� TBL_SAWON ���̺��� ���������� �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%'
   OR JUBUN LIKE '______4%';
   
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______'
   OR JUBUN LIKE '______4______';
--==>>
/*
��ҿ�	    9307302234567	3000
�̴ٿ�	    9510272234567	2000
������	    0909014234567	1000
�մ���	    9406032234567	4000
������	    0406034234567	1000
���̳�	    8012122234567	3000
������	    8105042234567	3000
������	7001022234567	3000
���켱	    9001022234567	2000
*/

--�� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
(WATCH_NAME     VARCHAR2(20)
,BIGO           VARCHAR2(100)
);
--==>> Table TBL_WATCH��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(TBL_WATCH)
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('�ݽð�','���� 99.99% ������ �ְ�� �ð�');
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('���ð�','�� ������ 99.99���� ȹ���� �ð�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

--�� Ȯ��
SELECT *
FROM TBL_WATCH;
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_WATCH ���̺��� BIGO �÷���
--   ��99.99%����� ���ڰ� ����ִ� ��(���ڵ�)�� ������ ��ȸ�Ѵ�.
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '99.99%';
--==>> ��ȸ ��� ���� (99.99�� �����ϴ� ������)

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99';
--==>> ��ȸ ��� ���� (99.99�� ������ ������)

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';
--==>> %�� �ϳ��� �ΰ��� ������ ��� �ǹ̴� ����
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

-- ESCAPE
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�
--> %�� $�� ���ڷ� ó��! $���� %�� ���ϵ�ī��ƴ�!!       -- ����~!

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

--�� ESCAPE�� ������ ������ ���� �� ���ڴ� ���ϵ�ī�忡�� Ż����Ѷ�...
--   ��ESCAPE '\'��
--   �Ϲ������� ���󵵰� ���� Ư������(Ư����ȣ)�� ����ϰ� �ȴ�.


--------------------------------------------------------------------------------

-- ���� COMMIT / ROLLBACK ����--

DELETE
FROM TBL_DEPT
WHERE DEPTNO = 50;

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ������ �Է�(TBL_DEPT)
INSERT INTO TBL_DEPT(DEPTNO, DNAME, LOC)
VALUES(50,'���ߺ�','����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ�
-- �ϵ��ũ �� ���������� ����Ǿ� ����� ���� �ƴ϶�
-- �޸�(RAM) �� �Էµ� ���̴�.

-- ROLLBACK �� UNDO �ʹ� �ٸ� ����

--�� Ȯ��
SELECT *
FROM TBL_DEPT;

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
--> 50��...���ߺ�...����... �� ���� �����Ͱ�
--  �ҽǵǾ����� Ȯ��(�������� ����)
--  �޸𸮿� ��� ������ �ֹ߽�Ų ����!


--�� �ٽ� �Է�
INSERT INTO TBL_DEPT(DEPTNO, DNAME, LOC)
VALUES(50,'���ߺ�','����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--> �޸� �� �Էµ� �� �����͸� ���� �ϵ��ũ�� ���������� �����ϱ� ���ؼ���
--  COMMIT �� �����ؾ� �Ѵ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� Ŀ�� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ�
--  50��... ���ߺ�... ���� �� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��

--�� COMMIT �� ������ ���� DML ����(INSERT, UPDATE, DELETE) �� ����
--   ����� �����͸� ����� �� �ִ� ���� ��...
--   DML ����� ����� �� COMMIT �� �����ϰ� ���� ROLLBACK �� �����غ���
--   ���� ���·� �ǵ��� �� ����.(�ƹ��� �ҿ��� ����.)

--�� ������ ����(TBL_DEPT)
--   UPDATE / ALTER
--   UPDATE���� SET���� �������� WHERE���� ����!
UPDATE TBL_DEPT
SET DNAME='������', LOC='��õ'
WHERE DEPTNO=50;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	������	��õ
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/
--> ����(UPDATE)�� �����ϱ� ���� ���·� �����Ǿ����� Ȯ��

--�� ������ ����(DELETE)
DELETE
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--�� �ѹ�
ROLLBACK;
--==>>�ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/
--> ����(DELETE) ������ �����ϱ� ���� ���·� �����Ǿ����� Ȯ��

-- �ڽǹ����� �������� COMMIT�� �ٿ� ���� �� ��!��

--------------------------------------------------------------------------------

 --���� ����(ORDER BY) ����--
 
 
SELECT ENAME "�����",DEPTNO "�μ���ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP;
--==>>
/*
SMITH	20	CLERK	    800	    9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
FORD	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/


SELECT ENAME "�����",DEPTNO "�μ���ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP
ORDER BY DEPTNO ASC;        -- �� DEPTNO �� �μ���ȣ ���� ����
                            -- �� ASC    �� �������� ����
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/


SELECT ENAME "�����",DEPTNO "�μ���ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP
ORDER BY DEPTNO;        -- �� ASC �� �������� ���� ����~!!!
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/

SELECT ENAME "�����",DEPTNO "�μ���ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP
ORDER BY DEPTNO DESC;        -- �� DESC �� �������� ���� �� ���� �Ұ�~!!!
--==>>
/*
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	    800	    9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/

-- DESC �ڷ��� Ȯ�� �� �������� Ű���� ����
-- �ϳ��� Ű����� �ΰ��� ��� �� �� ����!

SELECT ENAME "�����",DEPTNO "�μ���ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP
ORDER BY ���� DESC;
--> �̷��� ���� �� �����ϴ�! �ֳĸ� �Ľ̼����� SELECT�� �����Ǳ� ������!
--==>>
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	    1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
SMITH	20	CLERK	    800	    9600
*/
--> ORDER BY ������ SELECT ���� ���� ó���Ǳ� �빮��
--  �÷��� ��� SELECT ������ ����� ALIAS(��Ī)��
--  ORDER BY ������ ����ص� ������ �߻����� �ʴ´�.(�����ϴ�.)

SELECT ENAME "�����",DEPTNO "�μ� ��ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP
ORDER BY �μ� ��ȣ DESC;
--==>> ���� �߻�
/*
ORA-00933: SQL command not properly ended
00933. 00000 -  "SQL command not properly ended"
*Cause:    
*Action:
804��, 121������ ���� �߻�
*/

SELECT ENAME "�����",DEPTNO "�μ� ��ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP
ORDER BY "�μ� ��ȣ" DESC;
--==>>
/*
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	    800	    9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/

SELECT ENAME "�����",DEPTNO "�μ� ��ȣ", JOB "����" , SAL "�޿�"
        , SAL*12+NVL(COMM,0) "����"
FROM TBL_EMP
ORDER BY 2;
-- ���� 2 �� �� ��° �÷�(���� �÷��� �ƴ� SELECT�� �� ��° �÷�)
-- �μ���ȣ�� �������� ����
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/
--> TBL_EMP ���̺��� ���� �ִ� ���̺��� ������ �÷� ������ �ƴ϶�
--  SELECT ó���Ǵ� �� ��° �÷�(��, DEPTNO)�� �������� ���ĵǴ� ���� Ȯ��
--  ASC ������ ���� �� �������� ���ĵǴ� ���� Ȯ��
--  ����, �ε����� 1����...

SELECT *
FROM TBL_EMP;

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2,4;       -- 2 �� DEPTNO ���� 1�� ����, 4 �� SAL ���� 2�� ���� ... ASC
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SMITH	20	CLERK	    800
ADAMS	20	CLERK	    1100
JONES	20	MANAGER	    2975
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
JAMES	30	CLERK	    950
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
TURNER	30	SALESMAN	1500
ALLEN	30	SALESMAN	1600
BLAKE	30	MANAGER	    2850
*/

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 3, 4 DESC;      -- 2 ASC, 3 ASC, 4 DESC
--> �� 2 �� DEPTNO(�μ���ȣ) ���� �������� ����
--  �� 3 �� JOB(������) ���� �������� ����
--  �� 3 �� SAL(�޿�) ���� �������� ����
--  (3�� ���� ����)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	    800
JONES	20	MANAGER	    2975
JAMES	30	CLERK	    950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
*/
--> ��? �ٵ� �� �޿� �������� �ƴѰ�? ��JOB ���� ������ ������ ����!
--  JOB �� ������ ���� �������� ���ĵ�!

--------------------------------------------------------------------------------

--�� CONCAT() �� ���ڿ� ���� �Լ�
SELECT '�չ���' || '����ȣ' "1"
      ,CONCAT('�չ���','����ȣ') "2"
FROM DUAL;
--==>> �չ�������ȣ	�չ�������ȣ

SELECT ENAME || JOB "1"
      ,CONCAT(ENAME,JOB) "2"
FROM TBL_EMP;
--==>>
/*
SMITHCLERK	    SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST	    FORDANALYST
MILLERCLERK	    MILLERCLERK
*/

SELECT ENAME || JOB ||DEPTNO "1"
    , CONCAT(ENAME,JOB,DEPTNO) "2"
FROM TBL_EMP;
--==>>
/*
ORA-00909: invalid number of arguments
00909. 00000 -  "invalid number of arguments"
*Cause:    
*Action:
948��, 7������ ���� �߻�
*/
--> CONCAT() �Լ��� 2���� ���ڿ��� ���ս����ִ�    ����� ���� �Լ�.
--  ������ 2���� ���ս�ų �� �ִ�.

-- ��ø�õ�1
SELECT ENAME || JOB || DEPTNO "1"
    , CONCAT(ENAME,CONCAT(JOB,DEPTNO)) "2"
FROM TBL_EMP;
-- ��ø�õ�2    
SELECT ENAME || JOB || DEPTNO "1"
    , CONCAT(CONCAT(ENAME,JOB),DEPTNO) "2"
FROM TBL_EMP;

--==>>
/*
SMITHCLERK20	    SMITHCLERK20
ALLENSALESMAN30 	ALLENSALESMAN30
WARDSALESMAN30	    WARDSALESMAN30
JONESMANAGER20	    JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	    BLAKEMANAGER30
CLARKMANAGER10	    CLARKMANAGER10
SCOTTANALYST20	    SCOTTANALYST20
KINGPRESIDENT10 	KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	    ADAMSCLERK20
JAMESCLERK30	    JAMESCLERK30
FORDANALYST20	    FORDANALYST20
MILLERCLERK10	    MILLERCLERK10
*/
--> �������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
--  CONCAT() �� ���ڿ��� ���ڿ��� ���ս����ִ� ������ �����ϴ� �Լ�������
--  ���������δ� ���ڳ� ��¥�� ���� Ÿ������ �ٲپ��ִ� ������ ���ԵǾ� �ִ�.

-- JAVA�� String.substring()
/*
    obj.substring()
    ---
     ��
    ���ڿ�.substring(n,m);
                     ----
                     n���� m-1����... ���ڿ� ����(0���� �����ϴ� �ε��� ����)
*/

--�� �罺Ʈ�� SUBSTR() ���� ��� / SUBSTRB() ����Ʈ ��� �� ���ڿ� ���� �Լ�
--   �ڹٶ� ����Ŭ ������ �ٸ�!!!
--   ���� ����ϴϱ� ����ص���!��
SELECT ENAME "1"
    , SUBSTR(ENAME, 1, 2) "2"
    , SUBSTR(ENAME, 2, 2) "3"
    , SUBSTR(ENAME, 2) "5"
--                  -- --
--                  ��  ��
--              �ε���  ����
FROM TBL_EMP;
--> ���ڿ��� �����ϴ� ����� ���� �Լ�
--  ù ��° �Ķ���� ���� ��� ���ڿ�(���ڿ� ������ ���)
--  �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(��, �ε����� 1���� ����)
--  �� ��° �Ķ���� ���� ������ ���ڿ��� ����(���� ��... ������ġ���� ������)
--==>>
/*
SMITH	SM	MI	MITH
ALLEN	AL	LL	LLEN
WARD	WA	AR	ARD
JONES	JO	ON	ONES
MARTIN	MA	AR	ARTIN
BLAKE	BL	LA	LAKE
CLARK	CL	LA	LARK
SCOTT	SC	CO	COTT
KING	KI	IN	ING
TURNER	TU	UR	URNER
ADAMS	AD	DA	DAMS
JAMES	JA	AM	AMES
FORD	FO	OR	ORD
MILLER	MI	IL	ILLER
*/

--�� TBL_SAWON ���̺��� ������ ������ �����
-- �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
-- ��, SUBSTR() �Լ��� ����� �� �ֵ��� �ϸ�
-- �޿� �������� �������� ������ ������ �� �ֵ��� �Ѵ�.
SELECT SANO , SANAME , JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) = '1'   -- ���ڿ� ó���ϴ� �Լ��̱� ������ ''
   OR SUBSTR(JUBUN,7,1) = '3'
ORDER BY SAL DESC;
--==>>
/*
1012	����	8009011234567	4000
1009	������	7209301234567	3000
1013	������	8203051234567	3000
1014	������	9208091234567	3000
1015	�賲��	0202023234567	2000
1006	���̰�	0202023234567	2000
*/

SELECT SANO "�����ȣ", SANAME "�����", JUBUN"�ֹι�ȣ", SAL"�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) IN ('1','3')
ORDER BY �޿� DESC;
-- ORDER BY �������� SAL, �޿�, 4 �� ����!
--==>>
/*
1012	����	8009011234567	4000
1009	������	7209301234567	3000
1013	������	8203051234567	3000
1014	������	9208091234567	3000
1015	�賲��	0202023234567	2000
1006	���̰�	0202023234567	2000
*/

SELECT *
FROM TBL_SAWON;

--�� LENGTH() ���� �� / LENGTHB() ����Ʈ ��
--   ����Ʈ ���� ��ȯ���� ��쿡�� ���ڵ� ��Ŀ� ������ ��~!!!
SELECT ENAME "1"
    , LENGTH(ENAME) "2"
    , LENGTHB(ENAME) "3"
FROM TBL_EMP;
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/

SELECT SANAME "1"
    , LENGTH(SANAME) "2"
    , LENGTHB(SANAME) "3"
FROM TBL_SAWON;
--==>>
/*
��ҿ�	    3	9
�̴ٿ�	    3	9
������	    3	9
�մ���	    3	9
������	    3	9
���̰�	    3	9
���̳�	    3	9
������	    3	9
������	    3	9
������	4	12
���켱	    3	9
����	    2	6
������	    3	9
������	    3	9
�賲��	    3	9
*/

--�� ������ ���̽� �Ķ���� ���� ���� ��ȸ ������ ��ȸ
SELECT *
FROM NLS_DATABASE_PARAMETERS;

--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "1"
     , INSTR('ORACLE ORAHOME BIORA','ORA',1,1) "2"
     , INSTR('ORACLE ORAHOME BIORA','ORA',1,2) "3"
     , INSTR('ORACLE ORAHOME BIORA','ORA',2,1) "4"
     , INSTR('ORACLE ORAHOME BIORA','ORA',2) "5"
     , INSTR('ORACLE ORAHOME BIORA','ORA',2,3) "6"
     , INSTR('ORACLE ORAHOME BIORA','PPP',1,1) "7"
FROM DUAL;
--==>> ORACLE ORAHOME BIORA	1	8	8	8	0	0
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����...(��� ���ڿ�)
--  �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�~!!!
--  �� ��° �Ķ���� ���� ã�� �����ϴ�...(��, ��ĵ�� �����ϴ�) ��ġ
--  �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ����(1�� ���� ����)

SELECT '���ǿ���Ŭ �����ο��� �մϴ�' "1"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�','����',1) "2"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�','����',2) "3"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�','����',10) "4"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�','����',11) "5"
FROM DUAL;
--==>> ���ǿ���Ŭ �����ο��� �մϴ�	3	3	10	0
--> ������ �Ķ����(�� ��° �Ķ����) ���� ������ ���·� ���~!!! �� 1

--�� REVERSE()
SELECT 'ORACLE' "1"
    , REVERSE('ORACLE') "2"
    , REVERSE('����Ŭ') "3"
FROM DUAL;
--==>> ORACLE	ELCARO	???
--> ��� ���ڿ��� �Ųٷ� ��ȯ�Ѵ�.(��, �ѱ��� ����)

--�� �ǽ� ���̺� ����(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>> Table TBL_FILES��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(TBL_FILES)
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20210901_01_SCOTT.SQL');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 8


--�� Ȯ��
SELECT *
FROM TBL_FILES;
--==>>
/*

1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT FILENO "���Ϲ�ȣ", FILENAME "���ϸ�"
FROM TBL_FILES;
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL
*/



/*

  ���Ϲ�ȣ ���ϸ�                                                                                                 
---------- ------------------------------------------
         1 C:\AAA\BBB\CCC\SALES.DOC                                                                            
         2 C:\AAA\PANMAE.XXLS                                                                                  
         3 D:\RESEARCH.PPT                                                                                     
         4 C:\DOCUMENTS\STUDY.HWP                                                                              
         5 C:\DOCUMENTS\TEMP\SQL.TXT                                                                           
         6 D:\SHARE\F\TEST.PNG                                                                                 
         7 C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG                                                           
         8 C:\ORACLESTUDY\20210901_01_SCOTT.SQL    
*/
--�� TBL_FILES ���̺��� ������� ���� ���� ��ȸ�� �� �ֵ���
--   �������� �����Ѵ�.
SELECT FILENO "���Ϲ�ȣ", FILENAME "������� ���ϸ�", SUBSTR(FILENAME,16,9) "���ϸ�"
FROM TBL_FILES
WHERE FILENO=1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO "���Ϲ�ȣ", FILENAME "������� ���ϸ�", SUBSTR(FILENAME,16,9) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC
2	C:\AAA\PANMAE.XXLS	XLS
3	D:\RESEARCH.PPT	
4	C:\DOCUMENTS\STUDY.HWP	UDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT	MP\SQL.TX
6	D:\SHARE\F\TEST.PNG	.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG	G\PICTURE
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL	20210901_
*/

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�", REVERSE(FILENAME) "�Ųٷ�"
FROM TBL_FILES;
/*
COD.SELAS               \CCC\BBB\AAA\:C
SLXX.EAMNAP             \AAA\:C
TPP.HCRAESER            \:D
PWH.YDUTS               \STNEMUCOD\:C
TXT.LQS                 \PMET\STNEMUCOD\:C
GNP.TSET                \F\ERAHS\:D
GPJ.GNIRPS              \OTOHP\ERUTCIP\GNODLIUG\RESU\:C
LQS.TTOCS_10_10901202   \YDUTSELCARO\:C
*/

-- �������� ������ �������� �ڸ��� �ٽ� �������� ��!
SELECT REVERSE(FILENAME) ,INSTR(REVERSE(FILENAME),'\',1,1), SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1,1)-1)
    , REVERSE(SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1,1)-1))
FROM TBL_FILES;
--==>> Ǯ����..1
/*
COD.SELAS\CCC\BBB\AAA\:C	                10	COD.SELAS	                SALES.DOC
SLXX.EAMNAP\AAA\:C	                        12	SLXX.EAMNAP	                PANMAE.XXLS
TPP.HCRAESER\:D	                            13	TPP.HCRAESER	            RESEARCH.PPT
PWH.YDUTS\STNEMUCOD\:C	                    10	PWH.YDUTS	                STUDY.HWP
TXT.LQS\PMET\STNEMUCOD\:C	                8	TXT.LQS	                    SQL.TXT
GNP.TSET\F\ERAHS\:D	                        9	GNP.TSET	                TEST.PNG
GPJ.GNIRPS\OTOHP\ERUTCIP\GNODLIUG\RESU\:C	11	GPJ.GNIRPS	                SPRING.JPG
LQS.TTOCS_10_10901202\YDUTSELCARO\:C	    22	LQS.TTOCS_10_10901202	    20210901_01_SCOTT.SQL
*/

SELECT FILENO "���Ϲ�ȣ", REVERSE(SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1,1)-1))
FROM TBL_FILES;
--==>> Ǯ����..2
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210901_01_SCOTT.SQL
*/


SELECT FILENO "���Ϲ�ȣ", SUBSTR( FILENAME, INSTR(FILENAME,'\',-1)+1)
FROM TBL_FILES;
--==>> Ǯ����..3
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210901_01_SCOTT.SQL
*/

SELECT *
FROM TBL_FILES;



















