SELECT USER
FROM DUAL;
--==>> HR


--���� ���� �ǽ� ���� ����--

-- HR ���� ��Ű�� ERD �� �̿��� ���̺� �籸��~!!!

-- ������.. HR ��Ű���� �ִ� �⺻ ���̺� (7��)
-- COUNTRIES / DEPARTMENTS / EMPLOYEES / JOBS / JOB_HISTORY / LOCATIONS / REGIONS
-- �� ��~~~���� ���� �����Ѵ�.

-- ��, �����ϴ� ���̺��� �̸��� �����̺��+����ȣ��
-- ex) 1���� ���...
-- COUNTRIES04 / DEPARTMENTS04 / EMPLOYEES04 / JOBS04 / JOB_HISTORY04 / LOCATIONS04 / REGIONS04
-- .....
-- �� ���� �����Ѵ�.

-- 1. ���� ���̺��� ���� ����
-- 2. ���̺� ����(�÷� �̸�, �ڷ���, DEFAULT ǥ����, NOT NULL ��....)
--    �������� ����(PK,UK,FK,CK,...NN)
-- 3. �ۼ� �� ������ �Է�
-- 4. ���� �׸�
--    20210909_02_hr_�����ǽ�����_4��.sql
--    �ı�_4��.txt(��Ե� ��)

SELECT *
FROM TAB;

SELECT *
FROM COUNTRIES;
--25��
SELECT *
FROM DEPARTMENTS;
--27��
SELECT *
FROM EMPLOYEES;
--107��
SELECT *
FROM JOBS;
--19��
SELECT *
FROM JOB_HISTORY;
--10��
SELECT *
FROM LOCATIONS;
--23��
SELECT *
FROM REGIONS;
--4��

DESC COUNTRIES;
--�±�
DESC DEPARTMENTS;
--��ȭ
DESC JOBS;
--ȿ��
DESC JOB_HISTORY;
--����
DESC REGIONS;
--����

-- �÷��̶� �������� �׸��� ���̺��� ¥���ϴ������� �����ϰ� ����!
-- 1. �� ���̺��� �÷�, �������� Ȯ��
-- 2. Ȯ�ε� �ڷ� �������� ���̺� ������ �ۼ�

--�� �������� Ȯ��
SELECT *
FROM USER_CONSTRAINTS;

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

--JOBS �������� Ȯ��!
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'JOBS';
--==>>
/*
HR	JOB_TITLE_NN	JOBS	C	JOB_TITLE	"JOB_TITLE" IS NOT NULL	
HR	JOB_ID_PK	    JOBS	P	JOB_ID		
*/
DESC JOBS;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
JOB_ID     NOT NULL VARCHAR2(10) 
JOB_TITLE  NOT NULL VARCHAR2(35) 
MIN_SALARY          NUMBER(6)    
MAX_SALARY          NUMBER(6)   
*/


--����� ������
/*
DROP TABLE JOBS04;
PURGE RECYCLEBIN;
*/

-- JOBS04 ���̺� ����
CREATE TABLE JOBS04
( JOB_ID        VARCHAR2(10)
, JOB_TITLE     VARCHAR2(35)    
, MIN_SALARY    NUMBER(6)
, MAX_SALARY    NUMBER(6)
, CONSTRAINT JOBS04_JOB_ID_PK PRIMARY KEY(JOB_ID)
--, CONSTRAINT JOBS04_JOB_TITLE_NN CHECK(JOB_TITLE IS NOT NULL)
);
--==>> Table JOBS04��(��) �����Ǿ����ϴ�.

ALTER TABLE JOBS04 MODIFY JOB_TITLE NOT NULL;



--JOBS04 �������� Ȯ��!
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'JOBS04';
--==>>
/*
HR	JOBS04_JOB_ID_PK	    JOBS04	    P	JOB_ID		
HR	SYS_C007100	            JOBS04	    C	JOB_TITLE	"JOB_TITLE" IS NOT NULL		
*/
DESC JOBS04;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
JOB_ID     NOT NULL VARCHAR2(10) 
JOB_TITLE  NOT NULL VARCHAR2(35) 
MIN_SALARY          NUMBER(6)    
MAX_SALARY          NUMBER(6)   
*/

--�� ���̺��� ��������
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME IN('COUNTRIES','DEPARTMENTS', 'EMPLOYEES','JOBS','JOB_HISTORY','LOCATIONS','REGIONS');
--==>>
/*
HR	COUNTRY_ID_NN	            COUNTRIES	C	COUNTRY_ID	        "COUNTRY_ID" IS NOT NULL	
HR	COUNTRY_C_ID_PK	            COUNTRIES	P	COUNTRY_ID		
HR	COUNTR_REG_FK	            COUNTRIES	R	REGION_ID		                                    NO ACTION
HR	DEPT_NAME_NN	            DEPARTMENTS	C	DEPARTMENT_NAME	    "DEPARTMENT_NAME" IS NOT NULL	
HR	DEPT_ID_PK	                DEPARTMENTS	P	DEPARTMENT_ID		
HR	DEPT_LOC_FK	                DEPARTMENTS	R	LOCATION_ID		                                    NO ACTION
HR	DEPT_MGR_FK	                DEPARTMENTS	R	MANAGER_ID		                                    NO ACTION
HR	EMP_LAST_NAME_NN	        EMPLOYEES	C	LAST_NAME	        "LAST_NAME" IS NOT NULL	
HR	EMP_EMAIL_NN	            EMPLOYEES	C	EMAIL	            "EMAIL" IS NOT NULL	
HR	EMP_HIRE_DATE_NN	        EMPLOYEES	C	HIRE_DATE	        "HIRE_DATE" IS NOT NULL	
HR	EMP_JOB_NN	                EMPLOYEES	C	JOB_ID	            "JOB_ID" IS NOT NULL	
HR	EMP_SALARY_MIN	            EMPLOYEES	C	SALARY	            salary > 0	
HR	EMP_EMAIL_UK	            EMPLOYEES	U	EMAIL		
HR	EMP_EMP_ID_PK	            EMPLOYEES	P	EMPLOYEE_ID		
HR	EMP_DEPT_FK	                EMPLOYEES	R	DEPARTMENT_ID		                                NO ACTION
HR	EMP_JOB_FK	                EMPLOYEES	R	JOB_ID		                                        NO ACTION
HR	EMP_MANAGER_FK	            EMPLOYEES	R	MANAGER_ID		                                    NO ACTION
HR	JHIST_EMPLOYEE_NN	        JOB_HISTORY	C	EMPLOYEE_ID	        "EMPLOYEE_ID" IS NOT NULL	
HR	JHIST_START_DATE_NN	        JOB_HISTORY	C	START_DATE	        "START_DATE" IS NOT NULL	
HR	JHIST_END_DATE_NN	        JOB_HISTORY	C	END_DATE	        "END_DATE" IS NOT NULL	
HR	JHIST_JOB_NN	            JOB_HISTORY	C	JOB_ID	            "JOB_ID" IS NOT NULL	
HR	JHIST_DATE_INTERVAL	        JOB_HISTORY	C	START_DATE	        end_date > start_date	
HR	JHIST_DATE_INTERVAL	        JOB_HISTORY	C	END_DATE	        end_date > start_date	
HR	JHIST_EMP_ID_ST_DATE_PK	    JOB_HISTORY	P	EMPLOYEE_ID		
HR	JHIST_EMP_ID_ST_DATE_PK	    JOB_HISTORY	P	START_DATE		
HR	JHIST_JOB_FK	            JOB_HISTORY	R	JOB_ID		                                        NO ACTION
HR	JHIST_EMP_FK	            JOB_HISTORY	R	EMPLOYEE_ID		                                    NO ACTION
HR	JHIST_DEPT_FK	            JOB_HISTORY	R	DEPARTMENT_ID		                                NO ACTION
HR	JOB_TITLE_NN	            JOBS	    C	JOB_TITLE	        "JOB_TITLE" IS NOT NULL	
HR	JOB_ID_PK	                JOBS	    P	JOB_ID		
HR	LOC_CITY_NN	                LOCATIONS	C	CITY	            "CITY" IS NOT NULL	
HR	LOC_ID_PK	                LOCATIONS	P	LOCATION_ID		
HR	LOC_C_ID_FK	                LOCATIONS	R	COUNTRY_ID		                                    NO ACTION
HR	REGION_ID_NN	            REGIONS	    C	REGION_ID	        "REGION_ID" IS NOT NULL	
HR	REG_ID_PK	                REGIONS	    P	REGION_ID		
*/


--LOCATIONS �������� Ȯ��!
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'LOCATIONS';
--==>>
/*
HR	LOC_CITY_NN	LOCATIONS	C	CITY	        "CITY" IS NOT NULL	
HR	LOC_ID_PK	LOCATIONS	P	LOCATION_ID		
HR	LOC_C_ID_FK	LOCATIONS	R	COUNTRY_ID		                        NO ACTION
*/
DESC LOCATIONS;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
LOCATION_ID    NOT NULL NUMBER(4)    
STREET_ADDRESS          VARCHAR2(40) 
POSTAL_CODE             VARCHAR2(12) 
CITY           NOT NULL VARCHAR2(30) 
STATE_PROVINCE          VARCHAR2(25) 
COUNTRY_ID              CHAR(2)  
*/
-- LOCATIONS04 ���̺� ����
CREATE TABLE LOCATIONS04
( LOCATION_ID           NUMBER(4)       NOT NULL
, STREET_ADDRESS        VARCHAR2(40)    
, POSTAL_CODE           VARCHAR2(12)
, CITY                  VARCHAR2(30) 
, STATE_PROVINCE        VARCHAR2(25)
, COUNTRY_ID            CHAR(2) 
, CONSTRAINT LOCATIONS04_LOC_ID_PK PRIMARY KEY(LOCATION_ID)
, CONSTRAINT LOCATIONS04_LOC_C_ID_FK FOREIGN KEY(COUNTRY_ID)
             REFERENCES COUNTRIES04(COUNTRY_ID)
, CONSTRAINT LOCATIONS04_LOC_CITY_NN CHECK(CITY IS NOT NULL)
);

ALTER TABLE LOCATIONS04 MODIFY CITY NOT NULL;

--�굵 ������ �������Ǹ� + ""



/*
--���������� �̸� ����
ALTER TABLE TBL_PANMAE
RENAME CONSTRAINT TBL_PANAME_PDCODE_FK TO
                  TBL_PANMAE_PDCODE_FK;


-- �̰Ŵ� �÷��� �����ϴ� ��
ALTER TABLE JOBS04 TB_DEPT RENAME TO TB_DEPARTMENT;
*/




-- ��� ���̺�,�� ��ȸ
SELECT *
FROM TAB;

-- ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
-- �÷� ������ Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS;


