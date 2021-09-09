SELECT USER
FROM DUAL;
--==>> HR

--���� PRIMARY KEY ����--

-- 1. ���̺� ���� �⺻ Ű�� �����Ѵ�.

-- 2. ���̺��� �� ���� �����ϰ� �ĺ��ϴ� �÷�(���� �����̸Ӹ�Ű) �Ǵ� �÷��� ����(���������̸Ӹ�Ű)�̴�.
--    �⺻ Ű�� ���̺� �� �ִ� �ϳ��� �����Ѵ�.
--    �׷��� �ݵ�� �ϳ��� �÷����θ� �����Ǵ� ���� �ƴϴ�.
--    NULL�� �� ����, �̹� ���̺� �����ϰ� �ִ� �����͸�
--    �ٽ� �Է��� �� ������ ó���ȴ�.
--    UNIQUE INDEX �� �ڵ����� �����ȴ�.(����Ŭ�� ��ü������ �����.)


-- 3. ���� �� ���� ([] ���������ϴٴ� ǥ��)
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT��] PRIMARY KEY[(�÷���, ...)]

-- �� ���̺� ������ ���� (����!!)
-- �÷��� ������ Ÿ��
-- , �÷��� ������ Ÿ��
-- , CONSTRAINT CONSTRAINT�� PRIMARY KEY(�÷���[,...])

-- 4. CONSTRAINT �߰� �� CONSTRAINT ���� �����ϸ�
--    ����Ŭ ������ �ڵ������� CONSTRAINT ���� �ο��ϰ� �ȴ�.
--    (������ �������� ����! ��������!)
--    �Ϲ������� CONSTRAINT ���� �����̺��_�÷���_CONSTRAINT��
--    �������� ����Ѵ�.



--�� PK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST1
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR2(30)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.


-- INSERT ���� ����� ��
--INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1,'TSET');        -- ����!!
--INSERT INTO TBL_TEST1 VALUES(1,'TEST');                   -- ������ �־���� �� �ƴϸ� ����X
--INSERT INTO TBL_TESL1(COL1) VALUES(4);                    -- COL2�� NULL�� �ְڴ�!
--INSERT INTO TBL_TEST1(COL2,COL1) VALUES('ABCD',2);        -- �ٲ㼭 �ִ°͵� ����!   

-- ������ �Է�
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1,'TSET');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(3,'NULL');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1) VALUES(4); 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2,'ABCD');      --> ���� �߻� (���� 2������ �ȵǴ� ��!)
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2,'KKKK');      --> ���� �߻�
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(5,'ABCD');  --�������� ���� ��!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(NULL,NULL);     --> ���� �߻� (NULL �ȵȴ�!)
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(NULL, 'STUDY');  --> ���� �߻�
INSERT INTO TBL_TEST1(COL2) VALUES('STUDY');             --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TSET
2	ABCD
3	NULL
4	
5	ABCD
*/

DESC TBL_TEST1;
--==>> DESC�� ���ؼ� PRIMARY ���������� Ȯ���� �� ����! NOT NULL�� Ȯ�� ����!
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)     �� PK ���� Ȯ�� �Ұ�    
COL2          VARCHAR2(30) 
*/

--�� �������� Ȯ��
SELECT *
FROM USER_CONSTRAINTS;

--TBL_TEST1�� ����
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>>
/*
HR	SYS_C007057	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			21/09/09	HR	SYS_C007057		
*/

--�� ���������� ������ �÷� Ȯ��(��ȸ)    
SELECT *
FROM USER_CONS_COLUMNS;             -- CONS �� ���!
--==>>
/*
HR	REGION_ID_NN	REGIONS	    REGION_ID	
HR	REG_ID_PK	    REGIONS 	REGION_ID	1
HR	COUNTRY_ID_NN	COUNTRIES	COUNTRY_ID	
HR	COUNTRY_C_ID_PK	COUNTRIES	COUNTRY_ID	1
HR	COUNTR_REG_FK	COUNTRIES	REGION_ID	1
HR	LOC_ID_PK	    LOCATIONS	LOCATION_ID	1
HR	LOC_CITY_NN	    LOCATIONS	CITY	
HR	LOC_C_ID_FK	    LOCATIONS	COUNTRY_ID	1
HR	DEPT_ID_PK	    DEPARTMENTS	DEPARTMENT_ID	1
HR	DEPT_NAME_NN	DEPARTMENTS	DEPARTMENT_NAME	
HR	DEPT_MGR_FK	DEPARTMENTS	MANAGER_ID	1
HR	DEPT_LOC_FK	DEPARTMENTS	LOCATION_ID	1
HR	JOB_ID_PK	JOBS	JOB_ID	1
HR	JOB_TITLE_NN	JOBS	JOB_TITLE	
HR	EMP_EMP_ID_PK	EMPLOYEES	EMPLOYEE_ID	1
HR	EMP_LAST_NAME_NN	EMPLOYEES	LAST_NAME	
HR	EMP_EMAIL_NN	EMPLOYEES	EMAIL	
HR	EMP_EMAIL_UK	EMPLOYEES	EMAIL	1
HR	EMP_HIRE_DATE_NN	EMPLOYEES	HIRE_DATE	
HR	EMP_JOB_NN	EMPLOYEES	JOB_ID	
HR	EMP_JOB_FK	EMPLOYEES	JOB_ID	1
HR	EMP_SALARY_MIN	EMPLOYEES	SALARY	
HR	EMP_MANAGER_FK	EMPLOYEES	MANAGER_ID	1
HR	EMP_DEPT_FK	EMPLOYEES	DEPARTMENT_ID	1
HR	JHIST_EMPLOYEE_NN	JOB_HISTORY	EMPLOYEE_ID	
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_EMP_FK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_START_DATE_NN	JOB_HISTORY	START_DATE	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	START_DATE	
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	START_DATE	2
HR	JHIST_END_DATE_NN	JOB_HISTORY	END_DATE	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	END_DATE	
HR	JHIST_JOB_NN	JOB_HISTORY	JOB_ID	
HR	JHIST_JOB_FK	JOB_HISTORY	JOB_ID	1
HR	JHIST_DEPT_FK	JOB_HISTORY	DEPARTMENT_ID	1
HR	SYS_C007057	TBL_TEST1	COL1	1
*/
SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>>
/*
HR	SYS_C007057	TBL_TEST1	COL1	1
*/


--�� ���������� ������ ������, �������Ǹ�, ���̺��, ������������, �÷��� �׸� ��ȸ
--(���� ��ȸ�� �� ���̺��� ���ϴ� ���� ��������!)
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007057	TBL_TEST1	P	COL1



--�� PK ���� �ǽ�(�� ���̺� ������ ����)      �� �̰ɷ� ����ϴ� �� �ͼ��ϰ��ϸ� 1�� ����� �׳��Ҽ�����!
-- ���̺� ����
CREATE TABLE TBL_TEST2
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1)    -- TBL_TEST2 �� �ƴ϶�!! TEST2!!
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1,'TSET');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(3,NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1) VALUES(4);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2,'ABCD');      --> ���� �߻� (���� 2������ �ȵǴ� ��!)
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2,'KKKK');      --> ���� �߻�
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(5,'ABCD');  --�������� ���� ��!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(NULL,NULL);     --> ���� �߻� (NULL �ȵȴ�!)
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(NULL, 'STUDY');  --> ���� �߻�
INSERT INTO TBL_TEST2(COL2) VALUES('STUDY');             --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	TSET
2	ABCD
3	
5	ABCD
4	
*/

--�� ���������� ������ ������, �������Ǹ�, ���̺��, ������������, �÷��� �׸� ��ȸ
--(���� ��ȸ�� �� ���̺��� ���ϴ� ���� ��������!)
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST2';
--==>>
/*
HR	TEST2_COL1_PK	TBL_TEST2	P	COL1
*/


--�� PK ���� �ǽ�(�� ���� �÷� PK���� �� ���� �����̸Ӹ� Ű)
-- ���̺� ����
/*
CREATE TABLE TBL_TEST3
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST3_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST3_COL2_PK PRIMARY KEY(COL2)
);
*/
--(X)�̷��� �ϸ� �ȴ��! �̰Ŵ� ���������� �ΰ� ����ڴٴ� ��!
--      �� ���̺� ���������� �ϳ��� �����ϴ�! 


CREATE TABLE TBL_TEST3
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1,COL2)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.

--? ���� �����̸Ӹ� Ű �Է��ϴ� ���� �÷����� �������� �����ϴ� �͵� ���������� �ٶ������� ���ϴ�!



-- ������ �Է�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1,'TEST');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);          --> ���� �߻�
INSERT INTO TBL_TEST3(COL1) VALUES(4);                      --> ���� �߻�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3,'ABCD');         -- CHCECK~!!!(���� PK�̱� ������ ����!)
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2,'TEST');         -- CHCECK~!!!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1,'KKKK');         -- CHCECK~!!!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, NULL);       --> ���� �߻�      
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, 'STUDY');    --> ���� �߻�
INSERT INTO TBL_TEST3(COL2) VALUES('TEST');                 --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	KKKK
1	TEST
2	ABCD
2	TEST
3	ABCD
*/


--�� PK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� �� PK ����)
-- ���̺� ����
CREATE TABLE TBL_TEST4
( COL1  NUMBER(5)
, COL2 VARCHAR2(30)
);
--==>> Table TBL_TEST4��(��) �����Ǿ����ϴ�.

-- �׷��� ���̺� ���� ���� PK�߰��Ϸ��� �ϴµ� �̹� �������ǿ� ����Ǵ� ���� ������ ���Ŀ� PK������ �� ����!
-- ���� ��� �̹� �÷� ���� NULL �� �ְų� �ߺ��� ������ �ȵ�!!

--�� �̹� ������� �ִ� ���̺�
--   �����Ϸ��� ���������� ������ �����Ͱ� ���ԵǾ� ���� ���
--   �ش� ���̺� ���������� �߰��ϴ� ���� �Ұ����ϴ�.



-- ���� ���� �߰�
/*
ALTER TABLE TBL_TEST4
ADD ���⿡ �ڿ��� �������� ���� �Ȱ���! �߰����ָ� ��!
*/
ALTER TABLE TBL_TEST4
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4��(��) ����Ǿ����ϴ�.


-- ������ �Է�
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(1,'TSET');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(2,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(3,NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST4(COL1) VALUES(4);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(2,'ABCD');      --> ���� �߻� (���� 2������ �ȵǴ� ��!)
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(2,'KKKK');      --> ���� �߻�
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(5,'ABCD');  --�������� ���� ��!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(NULL,NULL);     --> ���� �߻� (NULL �ȵȴ�!)
INSERT INTO TBL_TEST4(COL1,COL2) VALUES(NULL, 'STUDY');  --> ���� �߻�
INSERT INTO TBL_TEST4(COL2) VALUES('STUDY');             --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.
SELECT *
FROM TBL_TEST4;
--==>>
/*
1	TSET
2	ABCD
3	
4	
5	ABCD
*/

-- ���������� �Ź� Ȯ���ϴϱ� �並 �ϳ� ������!
--�� �������� Ȯ�ο� ���� ��(VIEW) ����
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
     , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
     , UC.TABLE_NAME "TABLE_NAME"
     , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
     , UCC.COLUMN_NAME "COLUMN_NAME"
     , UC.SEARCH_CONDITION "SEARCH_CONDITION"
     , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC  JOIN  USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK��(��) �����Ǿ����ϴ�.


--�� ������ ��(VIEW)�� ���� ���� ���� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1		

--------------------------------------------------------------------------------

--���� UNIQUE(UK:U) ����--
-- NULL�� ����ϴ� �� �̿ܿ��� PK�� ����

-- 1. ���̺��� ������ �÷��� �����Ͱ� �ߺ����� �ʰ�
--    ���̺� ������ ������ �� �ֵ��� �����ϴ� ��������.
--    PRIMARY KEY �� ������ �������� ������, NULL �� ����Ѵٴ� ���̰� �ִ�.
--    ���������� PRIMARY KEY �� ���������� UNIQUE INDEX �� �ڵ� �����ȴ�.
--    �ϳ��� ���̺� ������ UNIQUE ���������� ���� �� �����ϴ� ���� �����ϴ�.
--    ��, �ϳ��� ���̺� UNIQUE ���������� ���� �� ����� ����
--    �����ϴٴ� ���̴�.

-- 2. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������ Ÿ�� [CONSTRAINT CONSTRAINT��] UNIQUE

-- �� ���̺� ������ ����
-- �÷��� ������ Ÿ��
--, �÷��� ������ Ÿ��
--, CONSTRAINT CONSTRAINT�� UNIQUE(�÷���, ...)


--�� UK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST5
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR(30)     UNIQUE
);
--==>> Table TBL_TEST5��(��) �����Ǿ����ϴ�.


-- ���� ���� ��ȸ
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST5';
--==>>
/*
HR	SYS_C007061	TBL_TEST5	P	COL1		
HR	SYS_C007062	TBL_TEST5	U	COL2		
*/

-- ������ �Է�
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(1,'TSET');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2,'ABCD');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(3,NULL);        -- CHECK~!! NULL ���!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST5(COL1) VALUES(4);                  -- NULL �� ������ ������ ���� �ʴ´�!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2,'ABCD');      --> ���� �߻� (���� 2������ �ȵǴ� ��!) PK ����
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2,'KKKK');      --> ���� �߻�                           PK ����
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(5,'ABCD');  -- CHECK~!!    --> ���� �߻� --> �������� �̸� �޾ƾ��ϴ� ����!(��𿡼� ���������� Ȯ���ϱ� ���� )
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(NULL,NULL);     --> ���� �߻� (NULL �ȵȴ�!)
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(NULL, 'STUDY');  --> ���� �߻�
INSERT INTO TBL_TEST5(COL2) VALUES('STUDY');             --> ���� �߻�


COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST5;
--==>>
/*
1	TSET
2	ABCD
3	
4	
*/


--�� UK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST6
( COL1  NUMBER(5)
, COL2 VARCHAR(30)
, CONSTRAINT TEST6_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
--==>> Table TBL_TEST6��(��) �����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST6';
--==>>
/*
HR	TEST6_COL1_PK	TBL_TEST6	P	COL1		
HR	TEST6_COL2_UK	TBL_TEST6	U	COL2		
*/


--�� UK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_TEST7
( COL1  NUMBER(5)
, COL2 VARCHAR(30)
);
--==>> Table TBL_TEST7��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
--==>> ��ȸ ��� ���� �� ���������� �������� �ʾ���


-- ���� ���� �߰�
ALTER TABLE TBL_TEST7
ADD ( CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST7_COL2_UK UNIQUE(COL2));
--==>> Table TBL_TEST7��(��) ����Ǿ����ϴ�.


-- �������� Ȯ��(��ȸ)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
--==>>
/*
HR	TEST7_COL1_PK	TBL_TEST7	P	COL1		
HR	TEST7_COL2_UK	TBL_TEST7	U	COL2		
*/

--------------------------------------------------------------------------------

--���� CHECK(CK:C) ����--

-- 1. �÷����� ��� ������ �������� ������ ������ �����ϱ� ���� ��������
--    �÷��� �ԷµǴ� �����͸� �˻��Ͽ� ���ǿ� �´� �����͸� �Էµ� �� �ֵ��� ó���ϸ�,
--    �����Ǵ� ������ ���� �˻��Ͽ� ���ǿ� �´� �����ͷ� �����Ǵ� �͸� ����ϴ�
--    ����� �����ϰ� �ȴ�.

--2. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������ Ÿ�� [CONSTRAINT CONSTRAINT��] CHEKC (�÷� ����)

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��
--, �÷��� ������ Ÿ��
--, CONSTRAINT CONSRAINT�� CHECK(�÷� ����)

--  -99999999999999999999999999999999999999 ~ 99999999999999999999999999999999999999

--�� NUMBER(38)        ����...
--   CHAR(2000)        ����...
--   VARCHAR2(4000)    ����...
--   NCHAR(1000)       ����...
--   NVARCHAR2(2000)   ����...
-- �ܿ� �ʿ�� ����!1 �׶��׶� ���� ����ؼ� ���� �˼� ����!!
/*
CREATE TABLE OHOH
( COL1  NUMBER(999999999999999999999999999999999999999999999999999999999999999999999999999)
);
--==>>
ORA-01727: numeric precision specifier is out of range (1 to 38)
01727. 00000 -  "numeric precision specifier is out of range (1 to 38)"
*/


--�� CK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST8
( COL1  NUMBER(5)   PRIMARY KEY
, COL2  VARCHAR2(30)
, COL3  NUMBER(3)   CHECK(COL3 BETWEEN 0 AND 100)       -- �� -999 ~ 999 
);
---==>> Table TBL_TEST8��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(1, '�±�', 100);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(2, '����', 101);   --> �����߻�   
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(3, '����', -1);    --> ���� �߻�
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(4, '����', 80);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST8;
--==>>
/*
1	�±�	100
4	����	80
*/

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST8';
--==>>
/*
HR	SYS_C007067	TBL_TEST8	C	COL3	COL3 BETWEEN 0 AND 100	
HR	SYS_C007068	TBL_TEST8	P	COL1		
*/


--�� CK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST9
( COL1  NUMBER(5)
, COL2  VARCHAR(30)
, COL3  NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_CK CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9��(��) �����Ǿ����ϴ�.


-- ������ �Է�
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(1, '�±�', 100);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(2, '����', 101);   --> �����߻�   
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(3, '����', -1);    --> ���� �߻�
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(4, '����', 80);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_TEST9;
--==>>
/*
1	�±�	100
4	����	80
*/

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST9';
--==>>
/*
HR	TEST9_COL3_CK	TBL_TEST9	C	COL3	COL3 BETWEEN 0 AND 100	
HR	TEST9_COL1_PK	TBL_TEST9	P	COL1		
*/
-- ������ �ٸ����� ���������� �̸��� ��������!!



--�� CK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_TEST10
( COL1  NUMBER(5)
, COL2  VARCHAR(30)
, COL3  NUMBER(3)
);
--==>> Table TBL_TEST10��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>> ��ȸ��� ���� �� ������ �������� ����

--�������� �߰�
ALTER TABLE TBL_TEST10
ADD ( CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST10_COL3_CK CHECK(COL3 BETWEEN 0 AND 100) );
--==>> Table TBL_TEST10��(��) ����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>>
/*
HR	TEST10_COL1_PK	TBL_TEST10	P	COL1		
HR	TEST10_COL3_CK	TBL_TEST10	C	COL3	COL3 BETWEEN 0 AND 100	
*/


--�� �ǽ� ����
-- ������ ���� TBL_TESTMEMBER ���̺��� �����Ͽ�
-- SSN�÷�(�ֹι�ȣ �÷�)����
-- ������ �Է� �� ������ ��ȿ�� �����͸� �Էµ� �� �ֵ���
-- üũ ���������� �߰��� �� �ֵ��� �Ѵ�.
-- �� �ֹι�ȣ Ư�� �ڸ��� �Է� ������ �����ͷ� 1,2,3,4 �� ����
-- ����, SID �÷����� PRIMARY KEY ���������� ������ �� �ֵ��� �Ѵ�.

-- ���̺� ����
CREATE TABLE TBL_TESTMEMBER
( SID   NUMBER
, NAME  VARCHAR(30)         --                      |
, SSN   CHAR(14)            -- �Է� ���� �� 'YYMMDD-NNNNNNN'
, TEL   VARCHAR2(40)
);
--==>> Table TBL_TESTMEMBER��(��) �����Ǿ����ϴ�.

ALTER TABLE TBL_TESTMEMBER
ADD( CONSTRAINT TESTMEMBER_SID_PK PRIMARY KEY(SID)
   , CONSTRAINT TESTMEMBER_SSN_CK CHECK(SUBSTR(SSN,8,1) IN('1','2','3','4')) );      -- OR / IN / =ANY 
--==>> Table TBL_TESTMEMBER��(��) ����Ǿ����ϴ�.

INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(1,'��ȿ��', 451205-7856985,01045457878);
--==>> ���� �߻�
/*
INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) VALUES(1,'��ȿ��', 451205-7856985,01045457878)
���� ���� -
ORA-02290: check constraint (HR.TESTMEMBER_SSN_CK) violated
*/

-- �������� ��ȸ
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMBER';
--==>>
/*
HR	TESTMEMBER_SID_PK	TBL_TESTMEMBER	P	SID		
HR	TESTMEMBER_SSN_CK	TBL_TESTMEMBER	C	SSN	SUBSTR(SSN,8,1) IN(1,2,3,4)	
*/

-- !!!!!!!!!!!!!!!!!!! ���ϰ� ���ϱ� ���ڿ� ' ' �� ����!!!!!!!!!!!!!!!!!
-- ������������ ������ ����!!�� �����ϰ� �ٽ� �������� DROP!

-- ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�;
ALTER TABLE TBL_TESTMEMBER DROP CONSTRAINT TESTMEMBER_SSN_CK;
--==>> Table TBL_TESTMEMBER��(��) ����Ǿ����ϴ�.

-- �ٽ� CHECK �������� �Է�!
ALTER TABLE TBL_TESTMEMBER
ADD(CONSTRAINT TESTMEMBER_SSN_CK CHECK(SUBSTR(SSN,8,1) IN('1','2','3','4')) );
--==>> Table TBL_TESTMEMBER��(��) ����Ǿ����ϴ�.

-- �������� ��ȸ
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMBER';
--==>>
/*
HR	TESTMEMBER_SID_PK	TBL_TESTMEMBER	P	SID		
HR	TESTMEMBER_SSN_CK	TBL_TESTMEMBER	C	SSN	SUBSTR(SSN,8,1) IN('1','2','3','4')	
*/

-- �Է� �׽�Ʈ
INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) 
VALUES(1,'��ȿ��', '980611-2234567','010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TESTMEMBER(SID,NAME,SSN,TEL) 
VALUES(2,'�մ���', '940603-2234567','010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_TESTMEMBER;

COMMIT;
--==>> Ŀ�� �Ϸ�.


INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(3,'����ȣ', '941108-1234567', '010-3333-3333');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(4,'�չ���', '960816-5234567', '010-4444-4444');
--==>> ���� �߻�
/*
NSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(4,'�չ���', '960816-5234567', '010-4444-4444')
���� ���� -
ORA-02290: check constraint (HR.TESTMEMBER_SSN_CK) violated
*/

INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(5,'�̴ٿ�', '951027-9234567', '010-5555-5555');
--==>>
/*
����� 724 �࿡�� �����ϴ� �� ���� �߻� -
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES(5,'�̴ٿ�', '951027-9234567', '010-5555-5555')
���� ���� -
ORA-02290: check constraint (HR.TESTMEMBER_SSN_CK) violated
*/

--3,4 �� �׽�Ʈ �غ���!!

--
SELECT *
FROM TBL_TESTMEMBER;
--==>>
/*
1	��ȿ��	980611-2234567	010-1111-1111
2	�մ���	940603-2234567	010-2222-2222
3	����ȣ	941108-1234567	010-3333-3333
*/

--------------------------------------------------------------------------------
--?? 1����ȭ �ϰ� ���� ���̺� �ɰ����鼭 �ĺ��ڸ� ���� �ؾ��ؼ� PRIMARYŰ�� �����ؾ���!! �˾Ƽ� ����� �� �ƴ�!!


-- ���� FOREIGN KEY(FK:F:R) ����--
-- �ٸ� �������ǰ� ������ ���� �ٸ�!!

-- 1. ���� Ű �Ǵ� �ܷ� Ű(FK)��
--    �� ���̺��� ������ �� ������ �����ϰ�
--    ���� �����Ű�µ� ���Ǵ� ���̴�.
--    �� ���̺��� �⺻ Ű ���� �ִ� ����
--    �ٸ� ���̺� �߰��ϸ� ���̺� �� ������ ������ �� �ִ�.
--    �� ��, �� ��° ���̺� �߰��Ǵ� ���� �ܷ�Ű�� �ȴ�.

-- 2. �θ� ���̺�(�����޴� �÷��� ���Ե� ���̺�)�� ���� ������ ��
--    �ڽ� ���̺�(�����ϴ� �÷��� ���Ե� ���̺�)�� �����Ǿ�� �Ѵ�.
--    �� ��, �ڽ� ���̺� FOREIGN KEY ���������� �����ȴ�.

-- 3. ���� �� ����
-- �� �÷� ������ ����
--   �÷� �� ������ Ÿ�� [CONSTRAINT CONSTRAINT��]
--                       REFERENCES �������̺��(�����÷���)
--                       [ON DELETE CASCADE | ON DELETE SET NULL]

-- �� ���̺� ������ ����
--  �÷��� ������ Ÿ��
-- , �÷��� ������ Ÿ��
-- , CONSTRAINT CONSTRAINT�� FOREIGN KEY(�÷���)
--              REFERENCES �������̺��(�����÷���)
--              [ON DELETE CASCADE | ON DELETE SET NULL]    



--�� FOREIGN KEY ���������� �����ϴ� �ǽ��� �����ϱ� ���ؼ���
--   �������� �ϳ��� ���̺��� �����Ͽ� ó���ϴ� ���� �ƴ϶�
--   �θ� ���̺� ���� �۾��� ���� �����ؾ� �Ѵ�.
--   �׸��� �� ��, �θ� ���̺��� �ݵ�� PK �Ǵ� UK ����������
--   ������ �÷��� �����ؾ� �Ѵ�.


-- ���̺� ����
CREATE TABLE TBL_JOBS
( JIKWI_ID      NUMBER(5)
, JIKWI_NAME    VARCHAR(30)
, CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
);
--==>> Table TBL_JOBS��(��) �����Ǿ����ϴ�.

-- �θ� ���̺� ������ �Է�
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(1,'���');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(2,'�븮');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(3,'����');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(4,'����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� FK ���� �ǽ�(�� �÷� ������ ����)
-- FORIGN�̶�� �ܾ� �������� ����!!
-- ���̺� ����
CREATE TABLE TBL_EMP1
( SID       NUMBER(5)       PRIMARY KEY
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER(5)       REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>> Table TBL_EMP1��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>> 
/*
HR	SYS_C007077	TBL_EMP1	P	SID		
HR	SYS_C007078	TBL_EMP1	R	JIKWI_ID		NO ACTION       -- DELETE_RULE�� NO ACTION �� ����!
*/

-- ������ �Է�
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(1,'������',1);    --�����̰� ����̶�� ��!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(2,'�ּ���',2);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(3,'������',3);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(4,'�̴ٿ�',4);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5,'�չ���',5);    --���� �߻�(����° �÷� ����!! �θ𿡴� 4�����ۿ� ����!)
/*
����� 838 �࿡�� �����ϴ� �� ���� �߻� -
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5,'�չ���',5)
���� ���� -
ORA-02291: integrity constraint (HR.SYS_C007078) violated - parent key not found
*/
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5,'�չ���',1);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME) VALUES(6,'��ȿ��');                    --���Ͽ��� �����ϸ� �̰� �����ϴ�! (��� JIKWI_ID ���������!)
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(7,'�մ���', NULL);    --���� ���� ����!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ּ���	2
3	������	3
4	�̴ٿ�	4
5	�չ���	1
6	��ȿ��	
7	�մ���	
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� FK ���� �Ľ�(�� ���̺� ������ ����)
CREATE TABLE TBL_EMP2
( SID       NUMBER(5)
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER(5)
, CONSTRAINT EMP2_SID_PK PRIMARY KEY(SID)
, CONSTRAINT EMP2_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
             REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>> Table TBL_EMP2��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP2';
--==>>
/*
HR	EMP2_SID_PK	TBL_EMP2	P	SID		
HR	EMP2_JIKWI_ID_FK	TBL_EMP2	R	JIKWI_ID		NO ACTION
*/

--�� FK ���� �Ľ�(�� ���̺� ���� ���� �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_EMP3
( SID       NUMBER(3)
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER(5)
);
--==>> Table TBL_EMP3��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> ���� ��� ���� �� �������� �����Ǿ� ���� ����

-- ���� ���� �߰�
ALTER TABLE TBL_EMP3
ADD( CONSTRAINT EMP3_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID) );
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>>
/*
HR	EMP3_SID_PK	        TBL_EMP3	P	SID		
HR	EMP3_JIKWI_ID_FK	TBL_EMP3	R	JIKWI_ID		NO ACTION
*/

-- 4. FOREIGN KEY ���� �� ���ǻ���
--    �����ϰ��� �ϴ� �θ� ���̺��� ���� �����ؾ� �Ѵ�.
--    �����ϰ��� �ϴ� ���̺��� ��� �÷���
--    PRIMARY KEY �� UNIQUE ���������� �־�� �Ѵ�.
--    ���̺� ���̿� PRIMARY KEY �� FOREIGN KEY �� ���ǵǾ� ������
--    PRIMARY KEY ���������� ������ �÷��� ������ ���� ��
--    FOREIGN KEY �÷��� �� ���� �ԷµǾ� �ִ� ��� �������� �ʴ´�.
--    (��, FK ���� �������� ��ON DELETE CASECADE�� ��
--    ��ON DELETE SET NULL�� �ɼ��� ����Ͽ� ������ ��쿡��
--    ������ �����ϴ�.)
--    �θ� ���̺��� �����ϱ� ���ؼ��� �ڽ� ���̺�� ���� �����ؾ� �Ѵ�.


--�θ� ���̺�
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/

--�ڽ� ���̺�
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ּ���	2
3	������	3
4	�̴ٿ�	4
5	�չ���	1
6	��ȿ��	
7	�մ���	
*/

-- �̴ٿ� ������ ������ ������� ����
UPDATE TBL_EMP1
SET JIKWI_ID=1
WHERE SID = 4;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1
2	�ּ���	2
3	������	3
4	�̴ٿ�	1
5	�չ���	1
6	��ȿ��	
7	�մ���	
*/


-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �θ� ���̺�(TBL_JOBS)�� ���� �����͸� �����ϰ� �ִ�
-- �ڽ� ���̺�(TBL_EMP1)�� �����Ͱ� �������� �ʴ� ��Ȳ.

-- �̿� ���� ��Ȳ���� �θ� ���̺�(TBL_JOBS)��
-- ���� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

--Ȯ��
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
*/

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �θ� ���̺�(TBL_JOBS)�� ��� �����͸� �����ϰ� �ִ�
-- �ڽ� ���̺�(TBL_EMP1)�� �����Ͱ� 3�� �����ϰ� �ִ� ��Ȳ.

-- �̿� ���� ��Ȳ���� �θ� ���̺�(TBL_JOBS)��
--  ��� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID = 1;
--==>> ���� �߻�
/*
����� 1,021 �࿡�� �����ϴ� �� ���� �߻� -
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID = 1
���� ���� -
ORA-02292: integrity constraint (HR.SYS_C007078) violated - child record found
*/

--�׷��� �θ� ���̺�(TBL_JOBS) ����
DROP TABLE TBL_JOBS;
--==>> ���� �߻�
/*
����� 1,035 �࿡�� �����ϴ� �� ���� �߻� -
DROP TABLE TBL_JOBS
���� ���� -
ORA-02449: unique/primary keys in table referenced by foreign keys
02449. 00000 -  "unique/primary keys in table referenced by foreign keys"
*Cause:    An attempt was made to drop a table with unique or
           primary keys referenced by foreign keys in another table.
*Action:   Before performing the above operations the table, drop the
           foreign key constraints in other tables. You can see what
           constraints are referencing a table by issuing the following
           command:
           SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "tabnam";
*/

--�� �θ� ���̺��� �����͸� �����Ӱ� �����ϱ� ���ؼ���
-- ��ON DELETE CASECADE�� �ɼ� ������ �ʿ��ϴ�.

-- TBL_EMP1 ���̺�(�ڽ� ���̺�)���� FK ���������� ������ ��
-- CASCADE �ɼ��� �����Ͽ� �ٽ� FK ���������� �����Ѵ�.

--�� �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	SYS_C007077	TBL_EMP1	P	SID		
HR	SYS_C007078	TBL_EMP1	R	JIKWI_ID		NO ACTION
*/

--�� �������� ����
ALTER TABLE TBL_EMP1
DROP CONSTRAINT SYS_C007078;    -- �̷��� �������Ǹ� ������ִ� ���� ����!
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.

--�� �������� ���� ���� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME =  'TBL_EMP1';
--==>> HR	SYS_C007077	TBL_EMP1	P	SID		


--�� ��ON DELETE CASCADE�� �ɼ��� ���Ե� �������� �������� ������
ALTER TABLE TBL_EMP1
ADD CONSTRAINT EMP1_JIKWIID_FK FOREIGN KEY(JIKWI_ID)
               REFERENCES TBL_JOBS(JIKWI_ID)
               ON DELETE CASCADE;
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.


--�� �������� ������ ���� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	SYS_C007077	        TBL_EMP1	P	SID		
HR	EMP1_JIKWIID_FK	    TBL_EMP1	R	JIKWI_ID		CASCADE     --���������� NO ACTION �̾��µ� CASCADE�� �ٲ�!
*/

--> CASCADE �ɼ��� ������ �Ŀ���
--  �����ް� �ִ� �θ� ���̺��� �����͸�
--  �������� ���Ѿ��� �����ϴ� ���� �����ϴ�.
--  ��, ... ... ... �θ� ���̺��� �����Ͱ� ������ ���
--  �̸� �����ϴ� �ڽ� ���̺��� �����͵� ��~~~~~~�� �Բ� �����ȴ�.
--  CHECK~!!!

-- �θ� ���̺�
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
*/

-- �ڽ� ���̺�
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	������	1     ��
2	�ּ���	2
3	������	3
4	�̴ٿ�	1     ��
5	�չ���	1     ��
6	��ȿ��	
7	�մ���	
*/

--�� TBL_JOBS(�θ� ���̺�)�� ��� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
-- �ڽ��� �ִµ��� ������!! ON DELETE CASCADE!

-- �θ� ���̺�
SELECT *
FROM TBL_JOBS;
--==>>
/*
2	�븮
3	����
*/

-- �ڽ� ���̺�
SELECT *
FROM TBL_EMP1;
--==>>
/*
2	�ּ���	2
3	������	3
6	��ȿ��	
7	�մ���	
*/



-- ������ 3���̾ �׷��� �ǹ������� ȸ����� ��� ��鸸�� �̷��� ū��
-- �׷��� ���� �ʿ��� ���� �����!! ��û ������ �ɼ�!!
--------------------------------------------------------------------------------

-- ���� NOT NULL(NN:CK:C) ����--

-- 1. ���̺��� ������ �÷��� �����Ͱ� NULL �� ���� ���ϵ��� �ϴ� ��������.

-- 2. ���� �� ����           -- NOT NULL �������Ǹ�ŭ�� �÷� ���� ������ �������!!!
-- �� �÷� ������ ����       -- (�ٸ� ���������� ���̺� ��������!)
-- �÷��� ������ Ÿ�� [CONSTRAINT CONSTRAINT��] NOT NULL

-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��
--, �÷��� ������Ÿ��
--, CONSTRAINT CONSTRAINT�� CHECK(�÷��� IS NOT NULL)

-- 3. ������ �����Ǿ� �ִ� ���̺� NOT NULL ���������� �߰��� ���
--    ADD ���� MODIFY ���� �� ���� ���ȴ�.       -- CHECK~!!!

-- ALTER TABLE ���̺��
-- MODIFY �÷��� ������Ÿ�� NOT NULL;

-- 4. ���� ���̺� �����Ͱ� �̹� ������� ���� �÷�(�� NULL �� ����)��
--    NOT NULL ���������� ���Բ� �����ϴ� ��쿡�� ���� �߻��Ѵ�.


--�� NOT NULL ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST11
( COL1      NUMBER(5)       PRIMARY KEY
, COL2      VARCHAR2(30)    NOT NULL
);
--==>> Table TBL_TEST11��(��) �����Ǿ����ϴ�.

--���̺� Ȯ��
SELECT *
FROM TAB;

-- ������ �Է�
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(3, NULL); --> ���� �߻�
INSERT INTO TBL_TEST11(COL1) VALUES(4);             --> ���� �߻�

SELECT *
FROM TBL_TEST11;
--==>>
/*
1	TEST
2	ABCD
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--���� ���� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST11';
--==>>
/*
HR	SYS_C007084	TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007085	TBL_TEST11	P	COL1		
*/

--�� NOT NULL ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST12
( COL1      NUMBER(5)
, COL2      VARCHAR2(30)
, CONSTRAINT TEST12_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST12_COL2_NN CHECK(COL2 IS NOT NULL)
);
--==>> Table TBL_TEST12��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST12';
--==>>
/*
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1		
*/


--�� NOT NULL ���� �ǽ�(�� ���̺� ���� ���� �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_TEST13
( COL1   NUMBER(5)
, COL2  VARCHAR2(30)
);
--==>> Table TBL_TEST13��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>> ��ȸ ��� ���� �� ���������� �������� ����

--���� ���� �߰�
ALTER TABLE TBL_TEST13
ADD( CONSTRAINT TEST13_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST13_COL2_NN CHECK(COL2 IS NOT NULL) );
--==>> Table TBL_TEST13��(��) ����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST13';
--==>> 
/*
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
*/


--�� NOT NULL �������Ǹ� TBL_TEST13 ���̺��� COL2 �� �߰��ϴ� ���
-- ������ ���� ����� �����ϴ�.
ALTER TABLE TBL_TEST13
MODIFY COL2 NOT NULL;
--==>> Table TBL_TEST13��(��) ����Ǿ����ϴ�.




-- TBL_TEST11 / TBL_TEST12 / TBL_TEST13

-- �÷� �������� NOT NULL  ���������� ������ ���̺�
DESC TBL_TEST11;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/
--> DESC �� ���� COL2 �÷���  NOT NULL �� ������ Ȯ�εǴ� ��Ȳ

-- ���̺� �������� NOT NULL  ���������� ������ ���̺�
DESC TBL_TEST12;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2          VARCHAR2(30)      -- ���⿡�� NOT NULL �� �ȳ���!\
*/
--> DESC �� ���� COL2 �÷��� NOT NULL �� ������ Ȯ�ε��� ���� ��Ȳ


-- ���̺� ���� ���� ADD �� ���� NOT NULL ���������� �߰��Ͽ�����
-- ����, MODIFY ���� ���� NOT NULL ���������� �ٽ� �߰��� ���̺�
DESC TBL_TEST13;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/
--> DESC �� ���� COL2 �÷���  NOT NULL �� ������ Ȯ�εǴ� ��Ȳ


-- �������� Ȯ�� ���� ��(VIEW) ��ȸ
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME IN('TBL_TEST11', 'TBL_TEST12', 'TBL_TEST13');
--==>>
/*
HR	SYS_C007084	    TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007085	    TBL_TEST11	P	COL1		
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1		
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
HR	SYS_C007090	    TBL_TEST13	C	COL2	"COL2" IS NOT NULL	
*/
--> �̷��� ��ȸ�Ǵ� ����� �ٸ��� ������ ������ �÷� ������ �Է��ϴ� ���� ����!


