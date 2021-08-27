--�� ���ӵ� ����� ��ȸ
SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

--�� ���̺��� ��ȸ�ϴ� �������� �� �÷��� ��Ī(ALIAS)�� �ο��� �� �ִ�.
--   ��Ī�� �ο����� ������ EMPNO�� �̸��� �״�� �����Ѵ�! AS, "" ���� ������~! 
--   �׷��� ""�� �������� ��� ���⳪ �ٿ����⸦ �ν����� ����
SELECT EMPNO AS "�����ȣ", ENAME "�����",JOB ����, SAL "��  ��", DEPTNO"�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20;

--�� ���̺� ��ȸ �� ����ϴ� ��Ī�� �⺻ ������ ��AS "��Ī��"���� ���·� �ۼ��Ǹ�
--   �� ��, ��AS���� ������ �����ϴ�.
--   ���� ��""���� ���� �����ϴ�.
--   ������, ��""���� ������ ��� ��Ī�� ����� ����� �� ����.
--   ������ �ش� �÷��� ������ �ǹ��ϹǷ� ��Ī�� �̸� ���ο� ������ ����� ���
--   ��""���� ����Ͽ� ��Ī�� �ο��� �� �ֵ��� ó���ؾ� �Ѵ�.


--�� EMP ���̺��� �μ���ȣ�� 20���� 30�� �������� ���� ��      -- �� : ��OR��
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
--   ��, ��Ī(ALIAS)�� ����Ѵ�.
/* Ʋ�� ��� ����!
SELECT �����ȣ, �����, ������, �޿�, �μ���ȣ
FROM EMP
WHERE �μ���ȣ�� 20���� 30��;
*/
SELECT EMPNO "�����ȣ", ENAME �����, JOB"����", SAL �޿�, DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20 || DEPTNO =  30;
--==>> ���� �߻�


SELECT EMPNO "�����ȣ", ENAME �����, JOB"����", SAL �޿�, DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO =  30;
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/

-- IN ������
SELECT EMPNO "�����ȣ", ENAME �����, JOB"����", SAL �޿�, DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO IN (20, 30);
--> IN �����ڸ� Ȱ���Ͽ� �̿� ���� ó���� ���� ������
--  ���� ������ ���� ����� ��ȯ�ϰ� �ȴ�.


--�� EMP ���̺��� ������ CLERK �� ������� ������ ��� ��ȸ�Ѵ�.
SELECT *
FROM EMP
WHERE JOB = CLERK;  --X

SELECT *
FROM EMP
WHERE JOB = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	80/12/17	800		    20
7876	ADAMS	CLERK	7788	87/07/13	1100		20
7900	JAMES	CLERK	7698	81/12/03	950		    30
7934	MILLER	CLERK	7782	82/01/23	1300		10
*/

SeleCT *
froM EMP
WHere jOB = 'CLERK';


SeleCT *
froM EMP
WHere jOB = 'clerk';
--==>> �÷��������� �ƹ��͵� ��ȸ���� ����!

--�� ����Ŭ����... �Էµ� ������(��) ��ŭ��
--   ��.��.��. ��ҹ��� ������ �Ѵ�.�ڡڡ�


--�� EMP ���̺��� ������ CLERK �� ����� ��
--   20�� �μ��� �ٹ��ϴ� �������
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT EMPNO"�����ȣ", ENAME"�����", JOB"������", DEPTNO"�μ���ȣ"
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	20
7876	ADAMS	CLERK	20
*/

-- WHERE JOB = 'CLERK' AND DEPTNO = '20';   
-- �� �̷��� ��ȸ�� �Ǵµ� �̰� ����Ŭ�� �ڵ�����ȯ�� ���ذ����� ������ �ȵ�!!!
DESC EMP;
-- �̰��ؼ� ���� DEPTNO�� ��������

--�� EMP ���̺��� 10�� �μ��� �ٹ��ϴ� ������ ��
--   �޿��� 2500 �̻��� ��������
--   �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT �����, ������, �޿�, �μ���ȣ
FROM EMP
WHERE 10�� �μ��� �ٹ��ϰ� �޿��� 2500 �̻��� ����;

SELECT ENAME"�����", JOB"������", SAL"�޿�", DEPTNO"�μ���ȣ"
FROM EMP
WHERE DEPTNO = 10 AND SAL >=2500;
--==>>
/*
KING	PRESIDENT	5000	10
*/


--�� ���̺� ����
-->  ���������� ��� ���̺� �ȿ� �ִ� ������ ���븸 �����ϴ� ����

--�� EMP ���̺��� �����͸� Ȯ���Ͽ�
--   �̿� �Ȱ��� �����Ͱ� ����ִ� EMPCOPY ���̺��� �����Ѵ�. (������...)
SELECT *
FROM EMP;
--==>> 14���� �����Ͱ� ����

CREATE TABLE ���̺��
( �׸�1       ������Ÿ��
, �׸�2       ������Ÿ��
);

CREATE TABLE EMPCOPY
(EMPNO NUMBER(4)
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2)
);

-- �׳� ������
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
--> to_date('17-12-1980','dd-mm-yyyy') ��ȣ!! �� ����!!!

-- �̰� ���䰰��
INSERT INTO EMPCOPY (SELECT * FROM EMP);

SELECT *
FROM EMPCOPY;

CREATE TABLE EMPCOPY2
AS
SELECT *
FROM EMP;

SELECT *
FROM EMPCOPY;
----------�ǵ��Ͻ� Ǯ��-----------------
DESC EMP;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/
CREATE TABLE EMPCOPY
(EMPNO NUMBER(4)        NUMBER(4)
, ENAME VARCHAR2(10)    VARCHAR2(10) 
, JOB VARCHAR2(9)       VARCHAR2(9)
, MGR NUMBER(4)         NUMBER(4)
, HIREDATE DATE         DATE 
, SAL NUMBER(7,2)       NUMBER(7,2) 
, COMM NUMBER(7,2)      NUMBER(7,2) 
, DEPTNO NUMBER(2)      NUMBER(2)
);

INSERT INTO EMPCOPY(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7369,'SMITH','CLERK',7902,'17-12-1980',800,NULL,20);
--�̷����ؼ� 14�� �־��ָ� ��!

CREATE TABLE EMPCOPY
AS      --������ ����~
SELECT *
FROM EMP;
--> EMP��ü ��ȸ�Ѱſ� ���� EMPCOPY���̺��� ����ڴ�~ ��� ��!
--  ������ ������ ����

-- EMP�� ������ ���ο� EMP2 ���̺� ����
CREATE TABLE EMP2
AS
SELECT *
FROM EMP;
--==>> Table EMP2��(��) �����Ǿ����ϴ�.

DESC EMP2;
-- ������ ���� ������ �����̱� ������ ��? �� ���� �ȵ�!

--�� ������ ���̺� Ȯ��
SELECT *
FROM EMP2;

--�� ��¥ ���� ������ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

-- ���̺� ���ְ� ���� ��
DROP TABLE EMPCOPY;
--==>> Table EMPCOPY��(��) �����Ǿ����ϴ�.

DELETE 
FROM EMP2;
--==>> 14�� �� ��(��) �����Ǿ����ϴ�.
-- �̰Ŵ� ���̺��� ����

DROP TABLE EMP2;
--==>> Table EMP2��(��) �����Ǿ����ϴ�.



--�� ���̺� ����
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� Ȯ��
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;


--�� ���̺��� Ŀ��Ʈ ���� Ȯ��
--   Ŀ��Ʈ == �ּ�
SELECT *
FROM USER_TAB_COMMENTS;
-- �� ���̺��� � �ǵ��� ������� ���̺��̶�°� �˼� ����!(��Ȱ���� ��)

--�� ���̺��� Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '�������';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	�������
TBL_DEPT	    TABLE	
EMPCOPY2	    TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է�(TBL_DEPT �� �μ�����)
COMMENT ON TABLE TBL_DEPT IS '�μ�����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	�������
TBL_DEPT	    TABLE	�μ�����
EMPCOPY2	    TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--�� �÷� ������ Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS;


--�� ������ ����(DROP �ؼ� ����� �� ���������� ��) BIN ���� ������ �ֵ� �� ������!
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

-- �Ʊ� ������ ���� EMPCOPY2������
DROP TABLE EMPCOPY2;
PURGE RECYCLEBIN;

-- TBL_DEPT ���̺��� Ŀ��Ʈ�� ��ȸ(���ǽ� �̷��� Ȱ������!)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--�� ���̺� �Ҽӵ�(���Ե�) �÷� ������ Ŀ��Ʈ ���� �Է�(����)
/*
�Ʊ�� ���̺� Ŀ��Ʈ�̴ϱ� COMMENT ON TABLE ���̺��
������ �÷� Ŀ��Ʈ�̴ϱ�   COMMENT ON COLUMN �÷���
���̺��� ���������̱� ������ � ���̺��� �÷����ε� ������־�� �Ѵ�.
COMMENT ON COLUMN ����.��ȿ��
*/
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ���ȣ';
--==>> Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ���';
--==>. Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ���ġ';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� �÷� ������ Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	�μ���ȣ
TBL_DEPT	DNAME	�μ���
TBL_DEPT	LOC	    �μ���ġ
*/

DESC TBL_EMP;
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)       -- �����ȣ
ENAME       VARCHAR2(10)    -- �����
JOB         VARCHAR2(9)     -- ������
MGR         NUMBER(4)       -- ������ �����ȣ
HIREDATE    DATE            -- �Ի���
SAL         NUMBER(7,2)     -- �޿�
COMM        NUMBER(7,2)     -- ����
DEPTNO      NUMBER(2)       --�μ���ȣ
*/

--�� TBL_EMP ���̺� �Ҽӵ�(���Ե�)
--   �÷��� ���� Ŀ��Ʈ ���� �Է�(����)
COMMENT ON COLUMN TBL_EMP.EMPNO IS '�����ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME IS '�����';
COMMENT ON COLUMN TBL_EMP.JOB IS '������';
COMMENT ON COLUMN TBL_EMP.MGR IS '������ �����ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ���ȣ';
--==>> Comment��(��) �����Ǿ����ϴ�. * 8

--�� Ŀ��Ʈ ������ �Էµ� ���̺��� �÷� ������ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	    �����ȣ
TBL_EMP	ENAME	    �����
TBL_EMP	JOB	        ������
TBL_EMP	MGR	        ������ �����ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL	        �޿�
TBL_EMP	COMM	    ����
TBL_EMP	DEPTNO	    �μ���ȣ
*/

-- ���� �÷� ������ �߰� �� ���� ����--
SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ ������ ���� �� �ִ� �÷� �߰�
--   �������� ������ �ϱ����ؼ��� ALTER    
--   INSERT �� CREATE�ƴ�
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);       --�ֹι�ȣ�� �׻� 13�ڸ� �����̴ϱ� CHAR~
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.
--�� �� �տ� 0�� ���� ���ɼ��� �ִ� ���ڰ� ���յ� �����Ͷ��
--   �������� �ƴ� ���������� ������Ÿ���� ó���ؾ� �Ѵ�.      CHECK~!!!

SELECT 9501052234567
FROM DUAL;
--==>> 9501052234567

SELECT 0501052234567
FROM DUAL;
--==>> 501052234567

SELECT '0501052234567'
FROM DUAL;
--==>> 0501052234567

SELECT 01044342587
FROM DUAL;
--==>> 1044342587

SELECT '01044342587'
FROM DUAL;
--==>> 01044342587

------ �̰� ���ؼ� �˼��ִ� �� : ���� �տ� 0�� ���� �ȳ����ϱ� ��ȭ��ȣ�� �ֹι�ȣ�� '���ڿ�'��!!

DESC TBL_EMP;
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13) 
*/
--> SSN �÷��� ���������� �߰��� ��Ȳ���� Ȯ�� 

SELECT *
FROM TBL_EMP;
--==>> SSN�ְ��Ȱ� Ȯ��!
--     ���̺� ������ �÷��� ������ ���������� �ǹ� ����. ��ȸ�Ҷ� ���� ���ϴ� �÷� ���� ��� ��ȸ�ϸ� �׸�
SELECT EMPNO, ENAME, SSN, HIREDATE, SAL, COMM
FROM TBL_EMP;
--     �̷�������!

--�� TBL_EMP ���̺��� �߰��� SSN(�ֹε�Ϲ�ȣ) �÷� ����
--   �ֹι�ȣ�ȿ� �����͸� ����� DELETE
--   �ֹι�ȣ�ȿ� ������ ���ַ��� DROP
--   ����� ������ �����ϴ°Ŵϱ� ALTER
--   ���鶧�� ������Ÿ���� ��������� �����Ҷ��� ������Ÿ�� ��� ���ص���!
--   ADD�Ҷ��� COLUMN�Ⱥٿ�����!! BUT DROP�Ҷ��� �ٸ��͵��� �������� �����Ƿ� COLUMN�� ���ﲨ�� ����ؾ���!
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ���ŵǾ����� Ȯ��.


--DELETE ����� ��! ���߿� ��� �Ұ��� �׳� �׷������� �˾Ƶα�~
/*
SELECT *
FROM TBL_EMP
WHERE ENAME = 'SMITH';
---���⿡�� SELECT * �� ����Ƽ� �� DELETE�κ����ϸ� ������
DELETE *
FROM TBL_EMP
WHERE ENAME = 'SMITH';
--- �̷������� ����ϸ� DELETE �Ǽ� ���� �� ����!
*/

DELETE TBL_EMP;  -- �������� ����!!!!

DELETE
FROM TBL_EMP;    -- ����

--�� ���̺��� ���������� ����(�������� ���� �� �ƴ϶�... ���̺� ��ü�� ����)
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_EMP;
--==>> ���� �߻�
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
497��, 6������ ���� �߻�
*/

--�� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

--- ���̺��� ��ȸ�Ҷ��� �Ʒ� ���ٸ� �巡���ؼ� ���� ��ȸ�� ����
/*
SELECT *
FROM EMP;
*/
--- ���� �����Ϸ��� ���̺��� �³� Ȯ���ϰ�! ��ü ����!


-- ������� ���� ����!
--------------------------------------------------------------------------------

--�� NULL �� ó��

SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 2	12	    8	20	    5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2, 10+NULL, 10-NULL, 10*NULL, 10/NULL
FROM DUAL;
--==>> ���� �߻����� �ʰ� ������� NULL�� ���´�.
--==>> (NULL)(NULL)(NULL)(NULL)(NULL)(NULL)(NULL)(NULL)(NULL)(NULL)

--�� ���� ���
--   NULL �� ������ ���� �ǹ��ϸ�, ���� �������� �ʴ� ���̱� ������
--   �� NULL �� ���꿡 ���Ե� ���... �� ����� ������ NULL�̴�.

--�� TBL_EMP ���̺��� Ŀ�̼�(COMM, ����)�� NULL �� ������ 
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT �����, ������, �޿�, Ŀ�̼�
FROM TBL_EMP
WHERE Ŀ�̼��� NULL;

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼� "
FROM TBL_EMP
WHERE COMM = NULL;
--==>> ���� �߻��ϱ� �ʰ� ��ȸ ��� ����.

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼� "
FROM TBL_EMP
WHERE COMM = (NULL);
--==>> ���� �߻��ϱ� �ʰ� ��ȸ ��� ����.

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼� "
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> ���� �߻�
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/
DESC TBL_EMP;
-- COMM �÷��� ������ ������ Ÿ���� ���ϰ� ������ Ȯ��
-- �� NUMBER �����͸� ���� ���ֱ� ������ ���ڿ�ã���� ������!

--�� NULL �� ���� �������� �ʴ� ���̱� ������ �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����.
--   ��, ������� �� ������ ������ �� ���ٴ� �ǹ��̴�.
--   NULL �� ������� ����� �� ���� �����ڵ�...
--   >=, <=, >, <, !=, ^=, <> (!=, ^=, <> �� ���� �ʴ�)

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼� "
FROM TBL_EMP
WHERE COMM IS NULL;
-- ���� ������ IS �� ����Ѵ�.
--==>>
/*
SMITH	CLERK	    800	
JONES	MANAGER	    2975	
BLAKE	MANAGER	    2850	
CLARK	MANAGER	    2450	
SCOTT	ANALYST	    3000	
KING	PRESIDENT	5000	
ADAMS	CLERK	    1100	
JAMES	CLERK	    950	
FORD	ANALYST	    3000	
MILLER	CLERK	    1300	
*/

--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� �������� 
--   �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO <> 20;

SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO != 20;

SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP
WHERE DEPTNO ^= 20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

--�� TBL_EMP ���̺��� Ŀ�̼��� NULL�� �ƴ� ��������
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
-- ���� ������ IS NOT �� ����Ѵ�.
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--- �̷��� �����!

--�� TBL_EMP ���̺��� ��� �������
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--   ��, �޿�(SAL)�� �ſ� �����Ѵ�. (�� 1ȸ/��)
--   ����, ����(COMM)�� �ų� �����Ѵ�. (�� 1ȸ/��)
SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE  SAL �ſ� ���� OR COMM �ų� ����;
--- ��� ����鿡 ���� ���̱� ������ WHERE �� �Ȼ��!!!!!!

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�",  SAL*12+COMM "����"      -- ���� �ָ�!
FROM TBL_EMP;
--==>>
/*
SMITH	CLERK	    800		
ALLEN	SALESMAN	1600	300	    19500
WARD	SALESMAN	1250	500	    15500
JONES	MANAGER	2975		
MARTIN	SALESMAN	1250	1400	16400
BLAKE	MANAGER	    2850		
CLARK	MANAGER	    2450		
SCOTT	ANALYST	    3000		
KING	PRESIDENT	5000		
TURNER	SALESMAN	1500	   0	 18000
ADAMS	CLERK	    1100		
JAMES	CLERK	    950		
FORD	ANALYST	    3000		
MILLER	CLERK	    1300		
*/
-- �ٵ� �޿��� �ִ� ����� ������ NULL�� �ǹ��� ������� ����!
--  ��? Ŀ�̼��� NULL �� ����� �ֱ� ������!  �׷��� �Լ��� �����!

SELECT *
FROM TBL_EMP;

SELECT 1600*12+300
FROM DUAL;

-- �� �Լ��� �ٷ�~~!! NVL()
SELECT NULL "1", NVL(NULL, 10) "2", NVL(10, 20) "3"
FROM DUAL;
--==>> (NULL)   10  10
--> ù ��° �Ķ���� ���� NULL �̸�, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.
--  ù ��° �Ķ���� ���� NULL �� �ƴϸ�, �� ��(ù ��° �Ķ����)�� �״�� ��ȯ�Ѵ�.
-- NVL(10, 20) ���� ��� ù ��° ���� NULL�� �ƴϴϱ� �״�� ��ȯ���� ��!


-- ����
SELECT *
FROM EMP
WHERE EMPNO = 7369;
--==>> 7369	SMITH	CLERK	7902	1980-12-17	800	    (NULL)	20

SELECT ENAME, COMM
FROM EMP
WHERE EMPNO = 7369;
--==>>SMITH	(NULL)

SELECT ENAME, NVL(COMM, 0)
FROM EMP
WHERE EMPNO = 7369;
--==>> SMITH	0

SELECT ENAME "�����", COMM "����", NVL(COMM, -1) "�Լ�ȣ����"
FROM TBL_EMP
--==>>
/*
SMITH	(NULL)   -1
ALLEN	300	    300
WARD	500	    500
JONES	(NULL)	 -1
MARTIN	1400   1400
BLAKE	(NULL)	 -1
CLARK	(NULL)	 -1
SCOTT	(NULL)	 -1
KING	(NULL)	 -1
TURNER	0	      0
ADAMS	(NULL)	 -1
JAMES	(NULL)	 -1
FORD	(NULL)	 -1
MILLER	(NULL)	 -1
*/

SELECT EMPNO "�����ȣ", ENAME "�����",  SAL "�޿�", NVL(COMM,0) "Ŀ�̼�",  SAL*12+NVL(COMM,0) "����"      -- ���� �ָ�!
FROM TBL_EMP;
/*
7369	SMITH	800	    0	9600
7499	ALLEN	1600	300	19500
7521	WARD	1250	500	15500
7566	JONES	2975	0	35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	34200
7782	CLARK	2450	0	29400
7788	SCOTT	3000	0	36000
7839	KING	5000	0	60000
7844	TURNER	1500	0	18000
7876	ADAMS	1100	0	13200
7900	JAMES	950	    0	11400
7902	FORD	3000	0	36000
7934	MILLER	1300	0	15600
*/

--�� NVL2()
--> ù ��° �Ķ���� ���� NULL �� �ƴ� ���, �� ��° �Ķ���� ���� ��ȯ�ϰ�
--  ù ��° �Ķ���� ���� NULL �� ���, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.

SELECT ENAME, COMM, NVL2(COMM, '�ξƴϳ�?û��÷�', '���̳�?���÷�') "Ȯ�ο���"
FROM TBL_EMP;
--==>>
/*
SMITH		    ���̳�?���÷�
ALLEN	300	    �ξƴϳ�?û��÷�
WARD	500	    �ξƴϳ�?û��÷�
JONES		    ���̳�?���÷�
MARTIN	1400	�ξƴϳ�?û��÷�
BLAKE		    ���̳�?���÷�
CLARK		    ���̳�?���÷�
SCOTT		    ���̳�?���÷�
KING		    ���̳�?���÷�
TURNER	0	    �ξƴϳ�?û��÷�
ADAMS		    ���̳�?���÷�
JAMES		    ���̳�?���÷�
FORD		    ���̳�?���÷�
MILLER		    ���̳�?���÷�
*/

--�� NVL2()Ȱ��~ ���� ��ȸ
--   COMM �� NULL �� �ƴϸ�... SAL*12+COMM
--   COMM �� NULL �̸�........ SAL*12
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", NVL2(COMM, COMM, 0) "Ŀ�̼�", SAL*12+NVL2(COMM, COMM,0)"����"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800	    0	9600
7499	ALLEN	1600	300	19500
7521	WARD	1250	500	15500
7566	JONES	2975	0	35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	34200
7782	CLARK	2450	0	29400
7788	SCOTT	3000	0	36000
7839	KING	5000	0	60000
7844	TURNER	1500	0	18000
7876	ADAMS	1100	0	13200
7900	JAMES	950	    0	11400
7902	FORD	3000	0	36000
7934	MILLER	1300	0	15600
*/

-- ����!!
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", NVL2(COMM, SAL*12+COMM,SAL*12)"����"
FROM TBL_EMP;
/*
7369	SMITH	800		    9600
7499	ALLEN	1600	300	19500
7521	WARD	1250	500	15500
7566	JONES	2975		35700
7654	MARTIN	1250   1400	16400
7698	BLAKE	2850		34200
7782	CLARK	2450		29400
7788	SCOTT	3000		36000
7839	KING	5000		60000
7844	TURNER	1500	0	18000
7876	ADAMS	1100		13200
7900	JAMES	950		11400
7902	FORD	3000		36000
7934	MILLER	1300		15600
*/

--�� COALESCE() ���� NULL�� ó���� �� �ִ� ������ �Լ��� �ھ˷��� �Լ�
--> �Ű����� ������ ���� ���·� �����ϰ� Ȱ���Ѵ�.
--   �� �տ� �ִ� �Ű��������� ���ʷ� NULL ���� �ƴ��� Ȯ���Ͽ�
--   NULL �� �ƴ� ��� ����(��ȯ, ó��)�ϰ�
--   NULL �� ��쿡�� �� ���� �Ű������� ������ ����(��ȯ, ó��)�Ѵ�.
--   NVL() �� NVL2() �� ���� ��~~~ �� ����� ���� ����Ͽ� ó���� �� �ִ� Ư¡�� ���� �ִ�.

SELECT NULL "�⺻Ȯ��"
     , COALESCE(NULL, NULL, NULL, NULL,30) "�Լ�Ȯ��1"
     , COALESCE(NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100) "�Լ�Ȯ��2"
     , COALESCE(10, NULL, NULL, NULL) "�Լ�Ȯ��3"
     , COALESCE(NULL, NULL, 200, NULL, NULL) "�Լ�Ȯ��4"
FROM DUAL;
--==>> (NULL)   30	100	10	200
-- ���޸��� �տ� ����!

--�� �ǽ��� ���� ������ �߰� �Է�
INSERT INTO TBL_EMP(EMPNO,ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '���ش�', 'SALESMAN', 7839, SYSDATE,10);
--==>>  1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, COMM,DEPTNO)
VALUES(8001, '�̴ٿ�', 'SALESMAN', 7839, SYSDATE, 100, 10);
--==>>  1 �� ��(��) ���ԵǾ����ϴ�.

-- �߸��Է��� '��ȿ��', '��ȿ��' ��������!
DELETE 
FROM TBL_EMP
WHERE ENAME = '��ȿ��';

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> Ŀ�� �Ϸ�.



--�� TBL_EMP ���̺��� ��� �������
--   �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--   ��, �޿�(SAL)�� �ſ� �����Ѵ�. (�� 1ȸ/��)
--   ����, ����(COMM)�� �ų� �����Ѵ�. (�� 1ȸ/��)
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
    , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "����"
FROM TBL_EMP;
----------------------------------------������������� �Ѵ� ���̶�� ��!
-- ù ��° �Ķ���Ͱ� NULL �� �ֵ��� �� ��° �Ķ���� ����
-- �� ��° �Ķ���Ͱ� NULL �� �ֵ��� �� ��° �Ķ���� ����
-- .....
--==>>
/*
7369	SMITH	800		         9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	   0	18000
7876	ADAMS	1100		    13200
7900	JAMES	950		        11400
7902	FORD	3000		    36000
7934	MILLER	1300		    15600
8000	���ش�			            0
8001	�̴ٿ�		     100	  100
*/

--------------------------------------------------------------------------------
--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� ��¥ �� �ð��� ��ȯ�ϴ� �Լ� SYSDATE, CURRENT_DATE, LOCALTIMESTAMP  ()�� �̰� �Ⱥ������� �Ѽ�!
--   ���� ���� �Լ� �� SYSDATE
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>> 
/*
2021-08-27 16:33:18	
2021-08-27 16:33:18	
21/08/27 16:33:18.000000000
*/

--�� ��¥�� ���� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2021-08-27

--�� �÷��� �÷��� ����(����)
--   ����Ÿ�԰� ����Ÿ���� ����
--   ��+�� �����ڸ� ���� ���� ������ �Ұ��� �� ��||�� ������ ��� �θ�!

SELECT 1+1
FROM DUAL;

SELECT '���ش�' + '�̴ٿ�'
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT '���ش�', '�̴ٿ�'
FROM DUAL;
--==>> ���ش�	�̴ٿ�

SELECT '���ش�'||'�̴ٿ�'
FROM DUAL;
--==>> ���ش��̴ٿ�

SELECT EMPNO, ENAME
FROM TBL_EMP;

SELECT EMPNO || ENAME
FROM TBL_EMP;
--==>>
/*
7369SMITH
7499ALLEN
7521WARD
7566JONES
7654MARTIN
7698BLAKE
7782CLARK
7788SCOTT
7839KING
7844TURNER
7876ADAMS
7900JAMES
7902FORD
7934MILLER
8000���ش�
8001�̴ٿ�
*/

--      ����Ÿ��  ��¥Ÿ�� ����Ÿ�� ����Ÿ��  ����Ÿ��
--      --------   -------  ------- -----   ----------
SELECT '�ش��̴�', SYSDATE,'�� ����', 500,'���� ���Ѵ�.'
FROM DUAL;
--==>> �ش��̴�	2021-08-27	�� ����	500	���� ���Ѵ�.


--      ����Ÿ��  ��¥Ÿ�� ����Ÿ�� ����Ÿ��  ����Ÿ��
--      --------   -------  ------- -----   ----------
SELECT '�ش��̴�'|| SYSDATE||'�� ����'|| 500||'���� ���Ѵ�.'
FROM DUAL;
--==>> �ش��̴�2021-08-27�� ����500���� ���Ѵ�.

--�� ����Ŭ���� ���� Ÿ���� ���·� �� ��ȯ�ϴ� ������ ���� ����
--   ������ ó���� ����ó�� ��||���� �������ָ� ������ �÷��� �÷���
--   (��, ���� �ٸ� ������ �����͵���) �����ϴ� ���� �����ϴ�.
--   MSSQL ���������� ��� �����͸� ���� Ÿ������ CONVERT �ؾ� �Ѵ�.

--�� TML_EMP ���̺��� ������ Ȱ���Ͽ�
--   ��� �������� �����Ϳ� ���ؼ�
--   ������ ���� ����� ���� �� �ֵ��� �������� �����ϴ�.

--   SMITH �� ���� ������ 9600�ε� ��� ������ 19200�̴�. (���� ������ 2��)
--   ALLER �� ���� ������ 19500�ε� ��� ������ 39000�̴�.
--                          :
DELETE
FROM TBL_EMP
WHERE EMPNO IN (8000,8001);
--==>> 2�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� COALESCE
/* ���1(���� �� ��)
SELECT ENAME || '�� ���� ������ ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0) || '�ε� ��������� ' 
            || COALESCE((SAL*12+COMM)*2, (SAL*12)*2, COMM*2, 0) || '�̴�.'    
FROM TBL_EMP;
*/
-- ���2 (2�� �Ѱ��� �ѹ��� ������ ��)
SELECT ENAME || '�� ���� ������ ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0) || '�ε� ��������� ' 
            || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)*2 || '�̴�.'
FROM TBL_EMP;
--==>>
/*
SMITH�� ���� ������ 9600�ε� ��������� 19200�̴�.
ALLEN�� ���� ������ 19500�ε� ��������� 39000�̴�.
WARD�� ���� ������ 15500�ε� ��������� 31000�̴�.
JONES�� ���� ������ 35700�ε� ��������� 71400�̴�.
MARTIN�� ���� ������ 16400�ε� ��������� 32800�̴�.
BLAKE�� ���� ������ 34200�ε� ��������� 68400�̴�.
CLARK�� ���� ������ 29400�ε� ��������� 58800�̴�.
SCOTT�� ���� ������ 36000�ε� ��������� 72000�̴�.
KING�� ���� ������ 60000�ε� ��������� 120000�̴�.
TURNER�� ���� ������ 18000�ε� ��������� 36000�̴�.
ADAMS�� ���� ������ 13200�ε� ��������� 26400�̴�.
JAMES�� ���� ������ 11400�ε� ��������� 22800�̴�.
FORD�� ���� ������ 36000�ε� ��������� 72000�̴�.
MILLER�� ���� ������ 15600�ε� ��������� 31200�̴�.
*/

--�� NVL()
-- ���1
SELECT ENAME || '�� ���� ������ ' || NVL(SAL*12+COMM, SAL*12) || '�ε� ��������� ' 
            || NVL(SAL*12+COMM, SAL*12)*2 || '�̴�.'
FROM TBL_EMP;

-- ���2 (������ ���� SAL *12 + NVL(COMM,0) �ε� �۵����ؼ� ��ȣ �߰����� (SAL *12 + NVL(COMM,0)) �̷���!)
-- ���̷��� ��ü ��ȣ�� �������? �� ������ �켱���� ����! NVL �� || ������ �浹�� �Ͼ�� ��ȣ�� ������Ѵ�!
SELECT ENAME || '�� ���� ������ ' || (SAL *12 + NVL(COMM,0))
            || '�ε� ��� ������ ' || (SAL *12 + NVL(COMM,0)) *2 || '�̴�.'
FROM TBL_EMP;

/*
SMITH�� ���� ������ 9600�ε� ��������� 19200�̴�.
ALLEN�� ���� ������ 19500�ε� ��������� 39000�̴�.
WARD�� ���� ������ 15500�ε� ��������� 31000�̴�.
JONES�� ���� ������ 35700�ε� ��������� 71400�̴�.
MARTIN�� ���� ������ 16400�ε� ��������� 32800�̴�.
BLAKE�� ���� ������ 34200�ε� ��������� 68400�̴�.
CLARK�� ���� ������ 29400�ε� ��������� 58800�̴�.
SCOTT�� ���� ������ 36000�ε� ��������� 72000�̴�.
KING�� ���� ������ 60000�ε� ��������� 120000�̴�.
TURNER�� ���� ������ 18000�ε� ��������� 36000�̴�.
ADAMS�� ���� ������ 13200�ε� ��������� 26400�̴�.
JAMES�� ���� ������ 11400�ε� ��������� 22800�̴�.
FORD�� ���� ������ 36000�ε� ��������� 72000�̴�.
MILLER�� ���� ������ 15600�ε� ��������� 31200�̴�.
*/

-- ��� ��ȸ
SELECT *
FROM TBL_EMP;

--�� NVL2()
-- ����Ǭ ��
SELECT ENAME || '�� ���� ������ ' || NVL2(COMM, SAL*12+COMM, SAL*12) || '�ε� ��������� ' 
            || NVL2(COMM, (SAL*12+COMM)*2, (SAL*12)*2)|| '�̴�.'
FROM TBL_EMP;

-- ���2 (2�� �Ѱ��� �ѹ��� ������ ��)
SELECT ENAME || '�� ���� ������ ' || NVL2(COMM, SAL*12+COMM, SAL*12) || '�ε� ��������� ' 
            || NVL2(COMM, SAL*12+COMM, SAL*12)*2|| '�̴�.'
FROM TBL_EMP;
/*
SMITH�� ���� ������ 9600�ε� ��������� 19200�̴�.
ALLEN�� ���� ������ 19500�ε� ��������� 39000�̴�.
WARD�� ���� ������ 15500�ε� ��������� 31000�̴�.
JONES�� ���� ������ 35700�ε� ��������� 71400�̴�.
MARTIN�� ���� ������ 16400�ε� ��������� 32800�̴�.
BLAKE�� ���� ������ 34200�ε� ��������� 68400�̴�.
CLARK�� ���� ������ 29400�ε� ��������� 58800�̴�.
SCOTT�� ���� ������ 36000�ε� ��������� 72000�̴�.
KING�� ���� ������ 60000�ε� ��������� 120000�̴�.
TURNER�� ���� ������ 18000�ε� ��������� 36000�̴�.
ADAMS�� ���� ������ 13200�ε� ��������� 26400�̴�.
JAMES�� ���� ������ 11400�ε� ��������� 22800�̴�.
FORD�� ���� ������ 36000�ε� ��������� 72000�̴�.
MILLER�� ���� ������ 15600�ε� ��������� 31200�̴�.
*/

-- SMITH's �Ի����� 1980-12-17�̴�. �׸��� �޿��� 800�̴�.
-- ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.
/*
SELECT ENAME || ''S' || '�Ի�����' || HIREDATE || '�̴�.' ||' �׸��� �޿��� ' || SAL || '�̴�.'
FROM TBL_EMP;
--==>> ���� �߻�

ORA-00923: FROM keyword not found where expected
00923. 00000 -  "FROM keyword not found where expected"
*Cause:    
*Action:
1,078��, 20������ ���� 
*/

SELECT ENAME || '''s' || '�Ի�����' || HIREDATE || '�̴�.' ||' �׸��� �޿��� ' || SAL || '�̴�.'
FROM TBL_EMP;
-- 's �� ����Ϸ��� ''�� �ι��Է��ؾ� �Ѵ�!

--�� ���ڿ��� ��Ÿ���� Ȭ����ǥ ���̿���(���۰� ��)
--   Ȭ����ǥ �ΰ��� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�.
--   ���������...
--   Ȭ����ǥ �ϳ� ��'���� ���ڿ��� ������ ��Ÿ����
--   Ȭ����ǥ �ΰ��� ��''���� ���ڿ� ���� �ȿ��� ���۽�Ʈ���Ǹ� ��Ÿ����
--   �ٽ� �����ϴ� Ȭ����ǥ �ϳ� ��'���� ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.
/*
SMITH's�Ի�����1980-12-17�̴�. �׸��� �޿��� 800�̴�.
ALLEN's�Ի�����1981-02-20�̴�. �׸��� �޿��� 1600�̴�.
WARD's�Ի�����1981-02-22�̴�. �׸��� �޿��� 1250�̴�.
JONES's�Ի�����1981-04-02�̴�. �׸��� �޿��� 2975�̴�.
MARTIN's�Ի�����1981-09-28�̴�. �׸��� �޿��� 1250�̴�.
BLAKE's�Ի�����1981-05-01�̴�. �׸��� �޿��� 2850�̴�.
CLARK's�Ի�����1981-06-09�̴�. �׸��� �޿��� 2450�̴�.
SCOTT's�Ի�����1987-07-13�̴�. �׸��� �޿��� 3000�̴�.
KING's�Ի�����1981-11-17�̴�. �׸��� �޿��� 5000�̴�.
TURNER's�Ի�����1981-09-08�̴�. �׸��� �޿��� 1500�̴�.
ADAMS's�Ի�����1987-07-13�̴�. �׸��� �޿��� 1100�̴�.
JAMES's�Ի�����1981-12-03�̴�. �׸��� �޿��� 950�̴�.
FORD's�Ի�����1981-12-03�̴�. �׸��� �޿��� 3000�̴�.
MILLER's�Ի�����1982-01-23�̴�. �׸��� �޿��� 1300�̴�.
*/

SELECT *
FROM TBL_EMP
WHERE JOB = 'saleman';
--==>> ��ȸ ��� ����
-- ������ ���� ��ҹ��ڸ� ��Ȯ�� �����ϴµ� ����ڴ� �ҹ��ڷ� �Է��� �� ���ڳ�! �׷��� ��ȯ�Լ� ����!

--�� UPPER(), LOWER(), INITCAP()
--   �빮��   �ҹ���   ù���ڸ� �빮��

SELECT 'oRAcLE' "1", UPPER('oRAcLE') "2", LOWER('oRAcLE') "3", INITCAP('oRAcLE') "4"
FROM DUAL;
--==>> oRAcLE	ORACLE	oracle	Oracle
--> UPPER() �� ��� �빮�ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�
--  LOWER() �� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�
--  INITCAP() �� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�

SELECT *
FROM TBL_EMP
WHERE JOB = (�Է°�);

-- �˻��� �� �Է°����� ��ҹ��� ���о��� �� ã������Ҷ� ó���� �������!


SELECT *
FROM TBL_EMP
WHERE JOB = 'sALeSmAn';


SELECT *
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAn');
-- �̷��� ���ڳ���! �� �̰Ŵ� ���̺��� �ȿ� ���� ��� �빮���϶��� ����! �׷���

SELECT *
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAn');

SELECT *
FROM TBL_EMP
WHERE LOWER(JOB) = LOWER('sALeSmAn');

SELECT *
FROM TBL_EMP
WHERE INITCAP(JOB) = INITCAP('sALeSmAn');
-- �Ѵ� UPPER() / LOWER() / INITCAP() ���ָ� ��

COMMIT;
--==>> Ŀ�� �Ϸ�.
-- �������� â�ݴ� ǥ�� ���� �� �׳� Ŀ���Ѵٰ� �ϸ� ������!
-- �ǹ������� ���� �׷��� �ȵǰ� ����ҡ��Ѵ����� COMMIT������ ã�ư��� ã�ƺ��� Ȯ���ϰ� �ؾ���!






























