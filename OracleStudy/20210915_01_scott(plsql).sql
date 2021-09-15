SELECT USER
FROM DUAL;
--==>> SCOTT

-- ���� FUNCTION(�Լ�) ����--

-- 1. �Լ��� �ϳ� �̻��� PL/SQL ������ ������ �����ƾ����
--    �ڵ带 �ٽ� ����� �� �ֵ��� ĸ��ȭ �ϴµ� ���ȴ�.(���� �ǹ��� ĸ��ȭ)
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�
--    ���� ������ �Լ��� ���� �� �ִ�. (�� ����� ���� �Լ�)
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
--    ���� ���ν���ó�� EXECUTE ���� ���� ������ �� �ִ�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���
[(
    �Ű�����1 �ڷ���
  , �Ű�����2 �ڷ���
)]
RETURN ������Ÿ��            -- �Լ��� �ݵ�� RETURN�� �־����!
IS
    -- �ֿ� ���� ����(��������)
BEGIN
    -- ���๮
    ...
    RETURN(��);
    
    [EXCEPTION]
        -- ���� ó�� ����;
END;
*/

--�� ����� ���� �Լ�(������ �Լ�)��
--   IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�,
--   FUNCTION �� �ݵ�� ���� ���� ��ȯ�Ѵ�.

--�� TBL_INSA ���̺��� �ֹε�Ϲ�ȣ�� ������ ������ ��ȸ�Ѵ�.

SELECT *
FROM TBL_INSA;

SELECT NAME, SSN, DECODE(SUBSTR(SSN,8,1),'1','����','2','����','Ȯ�κҰ�')"����"
FROM TBL_INSA;
/*
             �� �ֹε�Ϲ�ȣ
            \  /
       -----   ---------
       |               |
       ------------  ---
                  /  \
                   �� ����

*/

--�� FUNCTION ����
-- �Լ��� : FN_GENDER()
--                      SSN(�ֹε�Ϲ�ȣ) �� 'YYMMDD-NNNNNNN'

CREATE OR REPLACE FUNCTION FN_GENDER
( VSSN  VARCHAR2    -- �Ű����� : �ڸ���(����) ���� ����
)
RETURN VARCHAR2     -- RETURN �� ����! ��ȯ �ڷ��� : �ڸ���(����) ���� ����!
IS
    -- �ֿ� ���� ����
    VRESULT VARCHAR2(20);
BEGIN
    -- ���� �� ó��
    IF ( SUBSTR(VSSN,8,1) IN ('1','3') )
        THEN VRESULT := '����';
    ELSIF ( SUBSTR(VSSN,8,1) IN ('2','4') )
        THEN VRESULT := '����';
    ELSE
        VRESULT := '����Ȯ�κҰ�';
    END IF;
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.



--�� ������ ���� �� ���� �Ű�����(�Է� �Ķ����)�� �Ѱܹ޾�
--   A �� B ���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--   �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_POW(10,3)
FROM DUAL;
--==>> 1000
*/
CREATE OR REPLACE FUNCTION FN_POW
( A NUMBER
, B NUMBER
)
RETURN NUMBER
IS
    -- �ֿ� ���� ����
    VRESULT NUMBER
BEGIN
    IF A>0 AND B>0
        THEN VRESULT := POWER(A,B);
    ELSE
        VRESULT := 0;
    END IF;
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> ����
-- POWER �Լ� ����ϴ� �� �ƴ�!! �ݺ��� ���!!

-- ���� Ǯ��-------------------------------------------
CREATE OR REPLACE FUNCTION FN_POW
( A NUMBER
, B NUMBER
)
RETURN NUMBER
IS
    -- �ֿ� ���� ����
    VRESULT NUMBER :=1;
    VCOUNT  NUMBER :=0;
BEGIN
    -- FOR LOOP ��
    FOR VCOUNT IN 1 .. B LOOP
    VRESULT := VRESULT * A;
    END LOOP;
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.


-- ���� Ǯ��-------------------------------------------
CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;        -- ���� ���� ���� ������ 0 ���� 1�� �ʱ�ȭ
    V_NUM       NUMBER;
BEGIN
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;
    END LOOP;
    
    -- CHECK~!!!
    RETURN V_RESULT;
    
END;
--------------------------------------------------------------------------------
--�� ����1 (ī�信 �ø���)
-- TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
-- �޿��� ��(�⺻��*12)+���硻�� ������� ������ �����Ѵ�.
-- �Լ��� : FN_PAY(�⺻��, ����)
CREATE OR REPLACE FUNCTION FN_PAY
( BASIC NUMBER
, SU NUMBER)
RETURN  NUMBER
IS 
    V_RESULT    NUMBER :=0;
    
BEGIN
    V_RESULT := (BASIC * 12) + SU;
    
    RETURN V_RESULT;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.


--�� ����2
-- TBL_INSA ���̺��� �Ի����� ��������
-- ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
-- ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
-- �Լ��� : FN_WORKYEAR(�Ի���)
CREATE OR REPLACE FUNCTION FN_WORKYEAR(IBSA DATE)
RETURN NUMBER
IS
    V_RESULT    NUMBER;
BEGIN
    V_RESULT := TRUNC(MONTHS_BETWEEN(SYSDATE,IBSA)/12,1);
    RETURN V_RESULT;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�.


--------------------------------------------------------------------------------

--�� ����(�ڱ���صα��)

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK �� �ʿ��ϴ�.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

--3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)

-- ���� PL/SQL�� �� DML��, TCL���� ��� �����ϴ�.
-- ���� PL/SQL�� �� DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.

--------------------------------------------------------------------------------
-- PL/SQL �� ��! P�� ���ν���
-- ���� PROCEDURE(��������) ����--


-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����
--   �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--   �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
--   �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó���� �ִ� �����̴�.

-- 2. ���� �� ����
-- RETURN ���� ����!!
-- DBA��� IN OUT �߾˾ƾ���!!
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[(
    �Ű����� IN ������Ÿ��       -- �Է� �Ķ����      -- IN ��� ���ϸ�  INOUT���� ���� ��
  , �Ű����� OUT ������Ÿ��      -- ��� �Ķ����
  , �Ű����� INOUT ������Ÿ��    -- ����� �Ķ����
)]
IS
    -- �ֿ� ���� ����
BEGIN
    -- ���౸��
    ...
    [EXCEPTION]
        -- ���� ó�� ����
END;
*/

--�� FUNCTION �� ������ ��...
--   ��RETURN ��ȯ�ڷ����� �κ��� �������� ������,
--   ��RETURN���� ��ü�� �������� ������,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN, OUT, INOUT ���� ���еȴ�.

-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν�����[(�μ�1, �μ�2, ...)];
*/


--�� INSERT ���� ������ ���ν����� �ۼ�( �� INSERT ���ν��� )

-- SQL��~


-- ���ν��� ����(�ۼ�)
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE      -- �� ���̺� �ִ� ID������Ÿ�԰� ���ƾ� �ϴϱ�!
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
    -- �ֿ� ���� ���� ������ �ʿ� ����!! ������ ��ƿ��� ��!
BEGIN
    -- TBL_IDPW ���̺� ������ �Է�
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS ���̺� ������ �Է�
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_STUDENTS_INSERT��(��) �����ϵǾ����ϴ�.
--------------------------------------------------------------------------------


--�� TBL_SUNGJUK ���̺� ������ �Է� ��
--   Ư�� �׸��� ������(�й�, �̸�, ��������, ��������, ��������)�� �Է��ϸ�
--   ���������� ����, ���, ��� �׸��� �Բ� �Է� ó���� �� �ֵ��� �ϴ�
--   ���ν����� �����Ѵ�.
--   ���ν��� �� : PRC_SUNGJUK_INSERT()
/*
���� ��_
EXEC PRC_SUNGJUK_INSERT(1, '������', 90, 80, 70);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������  ��������  ��������  ����  ���  ���
 1   ������    90        80        70     240    80     B
*/
-- ���� Ǯ��---------------------------------------------------------
CREATE OR REPLACE PROCEDURAL PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
--, V_TOT     IN TBL_SUNGJUK.TOT%TYPE
--, V_AVG     IN TBL_SUNGJUK.AVG%TYPE
--, V_GRADE   IN TBL_SUNGJUK.GRADE%TYPE
)
IS
    -- �ֿ� ���� ����
    V_TOT   NUMBER(3);      -- �̺κ� Ʋ��!
    V_AVG   NUMBER(4,1);
    V_GRADE CHAR;
     
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF V_AVG>=90
        THEN V_GRADE := 'A'; 
    ELSIF V_AVG>=80
        THEN V_GRADE := 'B';
    ELSIF V_AVG>=70
        THEN V_GRADE := 'C';
    ELSIF V_AVG>=60
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- ������ �Է�
    INSERT INTO(HAKBUN,NAME, KOR, ENG, MAT, TOT, AVG, GRADE)                -- �̺κ� Ʋ��! TBL_SUNGJUK �� �ȳ���!!!!
    VALUES(V_HAKBUN,V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- Ŀ��
    COMMIT;
END;

-- ���� Ǯ��--------------------------------------------------------------
--CREATE OR REPLACE PROCEDURAL PRC_SUNGJUK_INSERT
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
     -- �Ʒ��� INSERT �������� �����ϴµ� �ʿ��� �ֿ� ���� ����
    V_TOT   TBL_SUNGJUK.TOT%TYPE;   -- ���⼭�� ���ο��� ����ϴ� ���������̱� ������
    V_AVG   TBL_SUNGJUK.AVG%TYPE;   -- IN �Ƚᵵ ��!    ������ ,�� ���� ����� ;�� ����!        
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �Ʒ��� INSERT �������� �����ϱ� ���ؼ���
    -- ������ ������ �����鿡 ���� ��Ƴ��� �Ѵ�.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG>=90)
        THEN V_GRADE := 'A'; 
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>=60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- ���� �Ϸ��� ����(line 336 ~ 348)�� ���� ��Ƴ� �����
    -- INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(HAKBUN,NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN,V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.
--------------------------------------------------------------------------------




--�� TBL_SUNGJUK ���̺���
--   Ư�� �л��� ����(�й�, ����, ����, ����)
--   ������ ���� �� ����, ���, ��ޱ��� �����ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(2, 100, 100, 100);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������  ��������  ��������  ����  ���  ���
 2   ��ҿ�   100      100        100     300   100     A
*/
-- ���� Ǯ��---------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG>=90)
        THEN V_GRADE := 'A'; 
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>=60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    UPDATE TBL_SUNGJUK      
    SET KOR = V_KOR                 -- := �ƴ�!!
       ,ENG = V_ENG
       ,MAT = V_MAT
       ,TOT = V_TOT
       ,AVG = V_AVG
       ,GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;
    
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.

-- ���� Ǯ��-----------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- UPDATE ���� �� �ʿ��� �����͸� ��Ƴ� �ֿ� ���� ����
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �Ʒ� UPDATE ������ ������ ����
    -- ������ ������ �����鿡 ���� ��Ƴ���
    V_TOT := V_KOR+V_ENG+V_MAT;
    V_AVG := V_TOT / 3;
    IF (V_AVG>=90)
        THEN V_GRADE := 'A'; 
    ELSIF (V_AVG>=80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG>=70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG>=60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- UPDATE ������ ����
    UPDATE TBL_SUNGJUK
    SET KOR=V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT , AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
    --Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------

--�� TBL_STUDENTS ���̺��� 
--   ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�) ���ν����� �ۼ��Ѵ�.
--   ��, ID �� PW�� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �Ѵ�.
-- ���ν��� �� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman','java006$','010-9999-9999','��õ');

���ν��� ȣ��� ó���� ���
superman	�չ���	010-9999-9999	��õ

���̵�� �н����尡 ��ġ���� ������ ���ν��� ���ư��� �ʵ���!
*/
-- ���� Ǯ��-----------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_STUDENTS.ID%TYPE
, V_PW      IN TBL_STUDENTS.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS 
BEGIN
    WHILE ID = V_ID AND PW = V_PW LOOP
        UPDATE TBL_STUDETNS
           SET ID = V_ID, PW = V_PW, TEL=V_TEL, ADDR = V_ADDR
    END  LOOP;
     
    COMMIT;
END;

-- ���� Ǯ��-----------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_STUDENTS.ID%TYPE             
, V_PW      IN TBL_IDPW.PW%TYPE                 --CHECK~!!! TBL_IDPW
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS 
BEGIN
    -- UPDATE ������ ����
    UPDATE(SELECT I.ID, I.PW, S.TEL, S.ADDR
           FROM TBL_IDPW I JOIN TBL_STUDENTS S
           ON I.ID = S.ID) T
    SET T.TEL=V_TEL, T.ADDR=V_ADDR
    WHERE T.ID = V_ID AND T.PW = V_PW;          --CHECK~!!! AND �� ;
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE��(��) �����ϵǾ����ϴ�.


--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
--  NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG  
--  ������ ���� �ִ� ��� ���̺� ������ �Է� ��
--  NUM �÷�(�����ȣ)�� ����
--  ���� �ο��� �����ȣ ������ ��ȣ�� �� ���� ��ȣ�� �ڵ�����
--  �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.
--  ���ν��� �� : PRC_INSA_INSERT(NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG);
--                               ��NUM ��������!!
/*
EXEC PRC_INSA_INSERT('�̴ٿ�', '951027-2234567', SYSDATE, '����', '010-4113-2353', '������', '�븮', 10000000, 2000000); -- õ��, �̹鸸

���ν��� ȣ��� ó���� ���)
1061 �̴ٿ� 951027-2234567 SYSDATE ���� 010-4113-2353 ������ �븮 10000000 2000000
*/
CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSA.NAME%TYPE
, V_SSN         IN TBL_INSA.SSN%TYPE
, V_IBSADATE    IN TBL_INSA.IBSADATE%TYPE
, V_CITY        IN TBL_INSA.CITY%TYPE
, V_TEL         IN TBL_INSA.TEL%TYPE
, V_BUSEO       IN TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSA.SUDANG%TYPE
)
IS
BEGIN
    UPDATE
    SET
    WHERE
END;




















































































































