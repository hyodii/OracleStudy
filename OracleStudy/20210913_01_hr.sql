SELECT USER
FROM DUAL;
--==>>HR


--�� EMPLOYEES ���̺��� SALARY��
--   �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
--   Finance �� 10%
--   Executive �� 15%
--   Accounting �� 20%
--   (������ ���� �� ��� Ȯ�� �� ROLLBACK)

--   ���Ӵ� �� 0%

SELECT *
FROM DEPARTMENTS;
SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY =  CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Finance') 
                               THEN SARARY*1.1
             CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Executive') 
                               THEN SALARY*1.15
            CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Accounting') 
                               THEN SALARY*1.2
                               ELSE SALARY END "�λ�ȱ޿�";

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';

--Ǯ��-------------------------------------------------------------------------
-- �ڰ��� �����ϴ��� �ǽ��� ����! �ٽ��غ���!
-- �޸𸮴� �̷��� �ϴ°� �� �Ƴ��� ����!
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'�� �μ����̵�) 
                                 THEN SALARY * 1.1 
                                 WHEN ('Executive'�� �μ����̵�) 
                                 THEN SALARY * 1.15 
                                 WHEN ('Accounting'�� �μ����̵�) 
                                 THEN SALARY * 1.2 
                                 ELSE SALARY 
              END 
WHERE DEPARTMENT_ID IN ('Finance'�� �μ����̵�,'Executive'�� �μ����̵�, 'Accounting'�� �μ����̵�);

--WHERE�� ���� �Ȱ��� ����!
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID_ID WHEN ('Finance'�� �μ����̵�) 
                                 THEN SALARY * 1.1 
                                 WHEN ('Executive'�� �μ����̵�) 
                                 THEN SALARY * 1.15 
                                 WHEN ('Accounting'�� �μ����̵�) 
                                 THEN SALARY * 1.2 
                                 ELSE SALARY 
              END;


-- ('Finance'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';
--==>> 100

-- ('Executive'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';
--==>> 90

-- ('Accounting'�� �μ����̵�)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';
--==>> 110


-- �־��ֱ�!
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'�� �μ����̵�) 
                                 THEN SALARY * 1.1 
                                 WHEN ('Executive'�� �μ����̵�) 
                                 THEN SALARY * 1.15 
                                 WHEN ('Accounting'�� �μ����̵�) 
                                 THEN SALARY * 1.2 
                                 ELSE SALARY 
              END 
WHERE DEPARTMENT_ID IN ('Finance'�� �μ����̵�,'Executive'�� �μ����̵�, 'Accounting'�� �μ����̵�);
--==>> 11�� ���� ������Ʈ�Ǿ����ϴ�. ���;��� IN �ȿ� ��ȣ�� ���������!

ROLLBACK;


--WHERE�� ����!
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Finance') 
                                 THEN SALARY * 1.1 
                                 WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Executive') 
                                 THEN SALARY * 1.15 
                                 WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Accounting') 
                                 THEN SALARY * 1.2 
                                 ELSE SALARY 
              END; 
--==>> 107�� ������Ʈ �Ǿ����!

ROLLBACK;



-- WHERE �� �� ���̱�!
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Finance') 
                                 THEN SALARY * 1.1 
                                 WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Executive') 
                                 THEN SALARY * 1.15 
                                 WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Accounting') 
                                 THEN SALARY * 1.2 
                                 ELSE SALARY 
              END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME IN('Finance','Executive','Accounting'));
--==>>11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.


--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴ� �� ����ϴ� ����.

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������]; --������ ����ϰ� SELECT�� Ȯ���Ѵ����� ������!

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 198	Donald	OConnell	DOCONNEL	650.507.9833	07/06/21	SH_CLERK	2600		124	50

DELETE
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� EMPLOYEES ���̺��� �������� ������ �����Ѵ�.
--   ��, �μ����� 'IT'�� ���� �����Ѵ�.

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�����ϰ��� �ϴ� ���)
--   �ٸ� ���̺�(Ȥ�� �ڱ� �ڽ� ���̺�)�� ���� �������ϴ� ���
--   �������� ������ �� �ִٴ� ����� �����ؾ� �ϸ�...
--   �׿� ���� ������ �˾ƾ� �Ѵ�.

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'IT');
--==>>
/*
���� ���� -
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/

SELECT *
FROM DEPARTMENTS;

--Ǯ��--------------------------------------------------------------------------
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = ('IT'�� �μ���ȣ);

--('IT'�� �μ���ȣ)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS 
WHERE DEPARTMENT_NAME = 'IT';
--==>> 60

-- �־��ֱ�
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS 
                        WHERE DEPARTMENT_NAME = 'IT');
--==>>
/*
103	Alexander	Hunold	AHUNOLD	590.423.4567	06/01/03	IT_PROG	9000		    102	60
104	Bruce	Ernst	BERNST	590.423.4568	07/05/21	IT_PROG	6000		        103	60
105	David	Austin	DAUSTIN	590.423.4569	05/06/25	IT_PROG	4800		        103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	06/02/05	IT_PROG	4800		103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	07/02/07	IT_PROG	4200		    103	60
*/

--�������ֱ�
DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS 
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> ���� �߻�
/*
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/

--���� ��(VIEW) ����--

-- 1. ��(VIEW)�� �̹� Ư���� �����ͺ��̽� ���� �����ϴ�
--    �ϳ� �̻��� ���̺��� ��밡�� ��� ���ϴ� �����͵鸸��
--    ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ �÷��鸸 ��Ƽ�
--    �������� ������ ���̺�� ���Ǽ� �� ���ȿ� ������ �ִ�.

--    ������ ���̺��̶� �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
--    �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ ���� �ִ� ����̸�
--    �� ������ �����س��� SQL �����̶�� �� �� �ִٴ� ���̴�.

-- 2. ���� �� ����
-- CREATE [OR REPLACE] VIEW ���̸�
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- ��������(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY];


--�� ��(VIEW) ����
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
--==>> View VIEW_EMPLOYEES��(��) �����Ǿ����ϴ�.

--�� ��(VIEW) ��ȸ
SELECT *
FROM VIEW_EMPLOYEES;

--��� ���̺� ��ȸ�ϴ� ��ó�� ����Ȯ�ε� �ȴ�!
--�� ��(VIEW) ���� Ȯ��
DESC VIEW_EMPLOYEES;
--==>>
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/

-- ������ ���!
--�� ��(VIEW) �ҽ� Ȯ��       -- CHECK~!!!
SELECT VIEW_NAME, TEXT                  -- TECXT
FROM USER_VIEWS                         -- USER_VIEWS
WHERE VIEW_NAME = 'VIEW_EMPLOYEES';

-- TEXT���� ���� �ٿ��ֱ�
-- ��ҽ� Ȯ���� �� ����!!
/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+)"
*/


-- ������� SQL�� ����!
--------------------------------------------------------------------------------



























