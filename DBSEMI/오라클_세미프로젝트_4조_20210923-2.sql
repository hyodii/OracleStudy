SELECT USER
FROM DUAL;
--==>> HR
/*
[���̺� ���� ����]
1. ������
2. ����
3. �л�
4. ����
5. ����
6. ��������
7. ����
8. ������û
9. ����
10. �ߵ�����
--> ���������� �� �������߸� �ϴ� ���� �ƴմϴ�.

��������, �л����� �н����� -  ������ �Է� ���� �ۼ� �ÿ� SSN���� 
                               �ֹι�ȣ ���ڸ��� ���ڿ� �����ؼ� ����
                               
SCORE ���̺� - SCORE���̺��� ���, �Ǳ�, �ʱ� ������ ���� 100������ �Է��ϵ� 
               ���߿� �������� ���̺��� ������ �����ͼ� ���â�� 100�� �������� 
               ǥ���ϴ� ����� ����? �������� ������ ���� �ѹ� �����غý��ϴ�. 
               �켱 �� �������ǵ� �����ϰ� ���̺� �����߽��ϴ�.
               
MID_DROP - ���̺�.�÷��� �� ����� ���̺� ������ �� �ν��� ���ϴ� �� ���ƿ�! 
           �̰͵� �Ƹ� ���ν��� ������ ���߿� ����ó���ϴ� ������� �ϴ� �� 
           ��� �����غð� �켱 �� �������� �����ϰ� ���̺� �����߽��ϴ�.
*/

/*
[�� ��]
1. ���� ���׵� ����
2. ������ ���� ���̺� �������� ����
3. ���� + ��ǥ(����) �� �ʿ��� ���ν���, Ʈ���� �� �����ϱ�(�ڱⰡ ���� ���̺� ���ַ�)
4. ������ ������ ���ν���, Ʈ���� �� � �κ��� �ʿ����� ��ǥ
5. �ڵ� 
6. ���� ������ ����
*/
--�� ����
CREATE TABLE ADMINISTRATOR
( ADMIN_ID  VARCHAR2(30)
, ADMIN_PW  VARCHAR2(30) 
, CONSTRAINT ADMINISTRATOR_ADMIN_ID_PK PRIMARY KEY(ADMIN_ID)
);

ALTER TABLE ADMINISTRATOR
MODIFY
( ADMIN_PW CONSTRAINT ADMINISTRATOR_ADMIN_PW_NN NOT NULL );



CREATE TABLE ESTABLISHED_SUB
( EST_SUB_ID        VARCHAR2(30)
, PRO_ID            VARCHAR2(30)
, COURSE_ID         VARCHAR2(30)
, SUB_ID            VARCHAR2(30)
, ATTEND_PER        NUMBER(3)
, PRACTICAL_PER     NUMBER(3)
, WRITING_PER       NUMBER(3)
, CONSTRAINT EST_SUB_EST_SUB_ID_PK PRIMARY KEY(EST_SUB_ID)
, CONSTRAINT EST_SUB_PRO_ID_FK FOREIGN KEY(PRO_ID) 
                                       REFERENCES PROFESSORS(PRO_ID)
, CONSTRAINT SUBJECTS_COURSE_ID_FK FOREIGN KEY(COURSE_ID) 
                                       REFERENCES COURSE(COURSE_ID)
, CONSTRAINT EST_SUB_SUB_ID_FK FOREIGN KEY(SUB_ID) 
                                       REFERENCES SUBJECTS(SUB_ID)
, CONSTRAINT EST_SUB_ATTEND_PER_CK CHECK(ATTEND_PER BETWEEN 0 AND 100)
, CONSTRAINT EST_SUB_PRACTICAL_PER_CK CHECK(PRACTICAL_PER BETWEEN 0 AND 100)
, CONSTRAINT EST_SUB_WRITING_PER_CK CHECK(WRITING_PER BETWEEN 0 AND 100)
, CONSTRAINT EST_SUB_TOTAL_PER_CK CHECK( (ATTEND_PER + PRACTICAL_PER + WRITING_PER) = 100 )
);


--�� �±�
CREATE TABLE COURSE
( COURSE_ID     VARCHAR2(30)  
, COURSE_NAME   VARCHAR2(30)
, PRO_ID        VARCHAR2(30)
, C_START       DATE
, C_END         DATE
, CLASSROOM     VARCHAR2(30)
, CONSTRAINT COURSE_COURSE_ID_PK PRIMARY KEY(COURSE_ID)
, CONSTRAINT COURSE_COURSE_NAME_FK FOREIGN KEY(PRO_ID)
                                            REFERENCES PROFESSORS(PRO_ID)
, CONSTRAINT COURSE_C_START_CK CHECK(C_START < C_END)
);

CREATE TABLE TEST
(
 TEST_ID      VARCHAR2(30)
,SUB_ID       VARCHAR2(30)
,TEST_DATE      DATE
,CONSTRAINT TEST_TEST_ID_PK PRIMARY KEY(TEST_ID)
,CONSTRAINT TEST_SUB_ID_FK FOREIGN KEY(SUB_ID) REFERENCES SUBJECTS(SUB_ID)
);



--�� ��ȭ
CREATE TABLE MID_DROP
( DROP_ID       VARCHAR2(30)
, ENROLL_ID     VARCHAR2(30)
, DROP_DATE     DATE           NOT NULL
, CONSTRAINT MID_DPOP_ID_PK PRIMARY KEY(DROP_ID)
, CONSTRAINT MID_DPOP_ENROLL_ID_FK FOREIGN KEY(ENROLL_ID)
             REFERENCES ENROLL(ENROLL_ID)
-- ����Ϻ��� �ߵ����� ��¥�� �ڿ��� �Ѵٴ� ��������
);

-- E_ID�� ����
ALTER TABLE MID_DROP RENAME COLUMN ENROLL_ID TO E_ID;

SELECT *
FROM MID_DROP;

CREATE TABLE SCORE
( SCORE_ID              VARCHAR2(30) 
, ENROLL_ID             VARCHAR2(30)
, EST_SUB_ID            VARCHAR2(30)
, ATTEND_SCORE          NUMBER(3)
, PRACTICAL_SCORE       NUMBER(3)
, WRITING_SCORE         NUMBER(3)
, CONSTRAINT SOCRE_ID_PK PRIMARY KEY(SCORE_ID)
, CONSTRAINT SCORE_ENROLL_ID_FK FOREIGN KEY(ENROLL_ID)
             REFERENCES ENROLL(ENROLL_ID)
, CONSTRAINT SCORE_ESTABLISHED_SUB_ID_FK FOREIGN KEY(EST_SUB_ID)
             REFERENCES ESTABLISHED_SUB(EST_SUB_ID)
, CONSTRAINT SCORE_ATTEND_SCORE_CK CHECK(ATTEND_SCORE BETWEEN 0 AND 100)            
, CONSTRAINT SCORE_PRACTICAL_SCORE_CK CHECK(PRACTICAL_SCORE BETWEEN 0 AND 100)            
, CONSTRAINT SCOREWRITING_SCORE_CK CHECK(WRITING_SCORE BETWEEN 0 AND 100)

);
-- E_ID�� ����
ALTER TABLE SCORE RENAME COLUMN ENROLL_ID TO E_ID;

--�� ȿ��
-- �������� ���̺�
CREATE TABLE PROFESSORS
( PRO_ID     VARCHAR2(30)                               -- �����ڹ�ȣ
, PRO_NAME   VARCHAR2(10)                               -- �����ڸ�
, PRO_PW     VARCHAR2(30)                               -- ������ ��й�ȣ(�ʱⰪ�� �ֹι�ȣ ���ڸ�)
, PRO_SSN    CHAR(14)                                   -- ������ �ֹι�ȣ
, CONSTRAINT PROFESSORS_PRO_ID_PK PRIMARY KEY(PRO_ID)
);

-- NOT NULL �������� ����
ALTER TABLE PROFESSORS
MODIFY
( PRO_NAME CONSTRAINT PROFESSORS_PRO_NAME_NN NOT NULL
, PRO_PW CONSTRAINT PROFESSORS_PRO_PW_NN NOT NULL
, PRO_SSN CONSTRAINT PROFESSORS_PRO_SSN_NN NOT NULL
);
-- ����ũ �������� �߰�
ALTER TABLE PROFESSORS
ADD CONSTRAINT PROFESSORS_PRO_SSN_UK UNIQUE(PRO_SSN);


-- ���� ���̺�
CREATE TABLE SUBJECTS
( SUB_ID            VARCHAR2(30)        -- �����ڵ�
, SUB_NAME            VARCHAR2(30)
, S_START           DATE                -- ������
, S_END             DATE                -- ������
, CLASSROOM         VARCHAR2(30)        -- ���ǽ�
, BOOK_NAME         VARCHAR2(30)        -- å�̸�
, CONSTRAINT SUBJECTS_SUB_ID_PK PRIMARY KEY(SUB_ID)
, CONSTRAINT SUBJECTS_S_START_CK CHECK(S_START < S_END)
);


-- �̺�Ʈ�α�(PRO_EVENTLOG) ���̺� ����
CREATE TABLE PRO_EVENTLOG
( PRO_ID    VARCHAR2(30)
, MEMO      VARCHAR2(200)
, ILJA      DATE DEFAULT SYSDATE
, CONSTRAINT PRO_EVENTLOG_PRO_ID_FK FOREIGN KEY(PRO_ID)
                REFERENCES PROFESSORS(PRO_ID)
);

--�� ����
--�л�����
CREATE TABLE STUDENTS
( ST_ID     VARCHAR2(30) 
, ST_PW     VARCHAR2(30)         -- ���ʱⰪ �ֹι�ȣ ���ڸ�
, ST_NAME   VARCHAR2(10)  
, ST_SSN    CHAR(14)     UNIQUE
, ST_DATE   DATE         DEFAULT SYSDATE
, CONSTRAINT STUDENTS_ST_ID_PK PRIMARY KEY(ST_ID)
);

-- �������� ����
ALTER TABLE STUDENTS
MODIFY
( ST_ID CONSTRAINT STUDENTS_STUDENT_ID_NN NOT NULL
, ST_NAME CONSTRAINT STUDENTS_STUDENT_NAME_NN NOT NULL
, ST_PW CONSTRAINT STUDENTS_STUDENT_PASSWORD_NN NOT NULL
, ST_SSN CONSTRAINT STUDENTS_STUDENT_SSN_NN NOT NULL
, ST_DATE CONSTRAINT STUDENTS_STUDENT_DATE_NN NOT NULL
);

--������û
CREATE TABLE ENROLL
( ENROLL_ID     VARCHAR2(30)
, ST_ID         VARCHAR2(30)
, COURSE_ID     VARCHAR2(30)
, ENROLL_DATE   DATE    DEFAULT SYSDATE
, CONSTRAINT ENROLL_ENROLL_ID_PK PRIMARY KEY(ENROLL_ID)
, CONSTRAINT ENROLL_ST_ID_FK FOREIGN KEY(ST_ID) 
                                       REFERENCES STUDENTS(ST_ID)
, CONSTRAINT ENROLL_COURSE_ID_FK FOREIGN KEY(COURSE_ID) 
                                       REFERENCES COURSE(COURSE_ID)
);



-- �������� ����
ALTER TABLE ENROLL
MODIFY
( ENROLL_ID     CONSTRAINT ENROLL_ENROLL_ID_NN NOT NULL --
, ENROLL_DATE   CONSTRAINT ENROLL_ENROLL_DATE_NN NOT NULL
);

-- E_ID�� ����
ALTER TABLE ENROLL RENAME COLUMN ENROLL_ID TO E_ID;

--E_DATE�� ����
ALTER TABLE ENROLL RENAME COLUMN ENROLL_DATE TO E_DATE;

--------------------------------------------------------------------------------
--PLSQL
--�� STUDENT_INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
(
   V_ST_ID IN STUDENTS.ST_ID%TYPE
 , V_ST_NAME IN STUDENTS.ST_NAME%TYPE
 , V_ST_SSN IN STUDENTS.ST_SSN%TYPE
)
IS
BEGIN

    INSERT INTO STUDENTS(ST_ID, ST_PW, ST_NAME, ST_SSN)
    VALUES(V_ST_ID,SUBSTR(V_ST_SSN,8),V_ST_NAME,V_ST_SSN);

    COMMIT;
END;
--==>> Procedure PRC_STUDENT_INSERT��(��) �����ϵǾ����ϴ�.


--�� STUDENT_UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( V_ST_SSN    IN STUDENTS.ST_SSN%TYPE            -- �ֹι�ȣ�� �޴� �Ķ����
, V_ST_NAME   IN STUDENTS.ST_NAME%TYPE           -- �ٲ��̸�
, V2_ST_NAME  IN STUDENTS.ST_NAME%TYPE           -- �ٲ��̸� Ȯ��
)
IS
    USER_DEFINE_ERROR   EXCEPTION; -- �̸� Ȯ�ο� ��������
BEGIN  

    IF V_ST_NAME != V2_ST_NAME               -- �ٲ��̸��� Ȯ�ο� �Ķ���� ����ġ
        THEN RAISE USER_DEFINE_ERROR;            
    END IF;


    UPDATE STUDENTS
    SET  ST_NAME = V_ST_NAME
    WHERE SUBSTR(ST_SSN,8,7) = SUBSTR(V_ST_SSN,8,7); 

    COMMIT;

    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '�̸� ����ġ');
END;
--==>> Procedure PRC_STUDENT_UPDATE��(��) �����ϵǾ����ϴ�.


--�� STUDENT_DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENT_DELETE 
(
    V_ST_ID      STUDENTS.ST_ID%TYPE          
  , V_ST_PW      STUDENTS.ST_PW%TYPE      
  , V_ST_NAME    STUDENTS.ST_NAME%TYPE      
  , V_ST_SSN     STUDENTS.ST_SSN%TYPE      -- �л� �ֹι�ȣ
)
IS
BEGIN
        DELETE      
            FROM STUDENTS      
            WHERE ST_ID = V_ST_ID             -- �л� ���̵� üũ
                  AND ST_PW = V_ST_PW          -- �л� ��й�ȣ üũ
                  AND ST_NAME = V_ST_NAME      -- �л� �̸� üũ
                  --AND ST_SSN = V_ST_SSN; 
                  AND SUBSTR(ST_SSN,8,7) = SUBSTR(V_ST_SSN,8,7);         -- �л� �ֹι�ȣ ���ڸ� üũ--�ڼ���
        COMMIT;

        EXCEPTION
            WHEN OTHERS
                THEN RAISE_APPLICATION_ERROR(-20003,'�ٽ� �Է����ּ���');
                     ROLLBACK; 
END;
--==>> Procedure PRC_STUDENT_DELETE��(��) �����ϵǾ����ϴ�.



-- �� ���� �Ⱓ ���� Ʈ����

    
--�� Ʈ���� ���� BEFORE STATEMENT TRIGGER(TRG_STUDENTS_DELETE)---�ʿ����??
CREATE OR REPLACE TRIGGER TRG_STUDENTS_DELETE
        BEFORE
        DELETE ON STUDENTS
        FOR EACH ROW
        
BEGIN
    DELETE
    FROM STUDENTS
    WHERE ST_ID=:OLD.ST_ID; 
    
END;
--==>> Trigger TRG_STUDENTS_DELETE��(��) �����ϵǾ����ϴ�.


--�� ���̺� ���� �ʿ�(LOG)--�������� ���̺�� ��������(üũ �ʿ�) -- üũ �Ϸ�
CREATE TABLE STD_EVENTLOG
( ST_ID         VARCHAR2(30)
, ILJA          DATE DEFAULT SYSDATE
, MEMO          VARCHAR2(200)
, CONSTRAINT TBL_EVENTLOG_ST_ID_FK FOREIGN KEY(ST_ID) 
                                       REFERENCES STUDENTS(ST_ID)
);
--==>> Table STD_EVENTLOG��(��) �����Ǿ����ϴ�.


--�� Ʈ���� ���� AFTER STATEMENT TRIGGER(TRG_EVENTLOG)
CREATE OR REPLACE TRIGGER TRG_STD_EVENTLOG
            AFTER
            INSERT OR UPDATE ON STUDENTS
DECLARE
    V_ST_ID    STD_EVENTLOG.ST_ID%TYPE;
BEGIN

    IF(INSERTING)
        THEN INSERT INTO STD_EVENTLOG(ST_ID, MEMO) 
            VALUES(V_ST_ID,'�л� ���� �߰� �Ϸ�');    
    ELSIF(UPDATING)
        THEN INSERT INTO STD_EVENTLOG(ST_ID, MEMO) 
            VALUES(V_ST_ID,'�л� ���� ������Ʈ �Ϸ�');
            
    END IF; 
END;
--==>> Trigger TRG_STD_EVENTLOG��(��) �����ϵǾ����ϴ�.


--�� ������û �Ұ� ���ν���

-- �ߵ����� INSERT ���ν���
--> �ߵ����� ���ڵ带 �Է� ��, "���� ������ < �ߵ������� < ����������"�� �´��� Ȯ���ϴ� ���ν���
CREATE OR REPLACE PROCEDURE PRC_MID_DROP_INSERT
( V_DROP_ID     IN MID_DROP.DROP_ID%TYPE
, V_ENROLL_ID   IN MID_DROP.ENROLL_ID%TYPE
, V_DROP_DATE   IN MID_DROP.DROP_DATE%TYPE
)
IS
    V_COURSE_ID         COURSE.COURSE_ID%TYPE;
    V_C_START           COURSE.C_START%TYPE;
    V_C_END             COURSE.C_END%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;

BEGIN
    -- ������ �� ���
    SELECT COURSE_ID INTO V_COURSE_ID
    FROM ENROLL
    WHERE ENROLL_ID = V_ENROLL_ID;  
    
    SELECT C_START, C_END INTO V_C_START, V_C_END
    FROM COURSE
    WHERE COURSE_ID = V_COURSE_ID;
    
    -- ���� ó�� : "���� ������ < �ߵ������� < ����������"�� �ƴ� ���
    IF (V_DROP_DATE < V_C_START OR V_DROP_DATE > V_C_END)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- INSERT
    INSERT INTO MID_DROP(DROP_ID, ENROLL_ID, DROP_DATE)
    VALUES (V_DROP_ID, V_ENROLL_ID, V_DROP_DATE);
    
    -- Ŀ��
    COMMIT;
    
    -- ���� �߻�
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '�ߵ����� ��¥�� �߸� �ԷµǾ����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_MID_DROP_INSERT��(��) �����ϵǾ����ϴ�.


-- <PRC_PRO_PW_INSERT> ���� �ʱ� ��й�ȣ ������ �Է� ���ν���(�ϼ�)
CREATE OR REPLACE PROCEDURE PRC_PRO_PW_INSERT
( V_PRO_ID      IN PROFESSORS.PRO_ID%TYPE
, V_PRO_NAME    IN PROFESSORS.PRO_NAME%TYPE
, V_PRO_SSN     IN PROFESSORS.PRO_SSN%TYPE
)
IS
BEGIN
    -- INSERT ������
    INSERT INTO PROFESSORS(PRO_ID, PRO_NAME, PRO_PW, PRO_SSN)
    VALUES(V_PRO_ID, V_PRO_NAME, SUBSTR(V_PRO_SSN,8), V_PRO_SSN);
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_PRO_PW_INSERT��(��) �����ϵǾ����ϴ�.


-- <TRG_PRO_EVENTLOG> ���� �̺�Ʈ�α� Ʈ���� ����-AFTER STATEMENT TRIGGER ���(�ϼ�)
CREATE OR REPLACE TRIGGER TRG_PRO_EVENTLOG
            AFTER
            INSERT OR UPDATE ON PROFESSORS
DECLARE
    V_PRO_ID    PRO_EVENTLOG.PRO_ID%TYPE;
BEGIN

    IF (INSERTING)
        THEN INSERT INTO PRO_EVENTLOG(PRO_ID,MEMO)
            VALUES(V_PRO_ID,'�������� INSERT �������� ����Ǿ����ϴ�.');
    ELSIF (UPDATING)
        THEN INSERT INTO PRO_EVENTLOG(PRO_ID,MEMO)
            VALUES(V_PRO_ID,'�������� UPDATE �������� ����Ǿ����ϴ�.');
    END IF;
END;
--==>> Trigger TRG_PRO_EVENTLOG��(��) �����ϵǾ����ϴ�.

-- ���ν���PRO_ID
SELECT *
FROM PRO_EVENTLOG;

-- <TRG_PROFESSORS_DELETE> �������� ���� Ʈ���� - BEFORE ROW TRIGGER���
-- ������ �� ������ �����ϰ� ���� ������ �ٷ� �����ϵ��� �ϸ� �ǰ� 
-- �����̳� �������� �̷� ���̺� �����ϰ� �ִ� ������ ������ ������ �� ������ �ִ� ���� ��� NULL������ ó��
-- �����ڰ� ���(?)�ؼ� ������ ��� �� ���ο� �����ڰ� ������ �ΰ��Ͽ� ���� ... �Ѵٴ� ������ ����
CREATE OR REPLACE TRIGGER TRG_PROFESSORS_DELETE
        AFTER
        DELETE ON PROFESSORS
        FOR EACH ROW
BEGIN
    UPDATE COURSE
    SET PRO_ID = NULL
    WHERE PRO_ID = :OLD.PRO_ID;

    UPDATE ESTABLISHED_SUB
    SET PRO_ID = NULL
    WHERE PRO_ID = :OLD.PRO_ID;
END;
--==>> Trigger TRG_PROFESSORS_DELETE��(��) �����ϵǾ����ϴ�.

SELECT *
FROM PROFESSORS;

SELECT *
FROM COURSE;

SELECT *
FROM ESTABLISHED_SUB;

DELETE
FROM PROFESSORS
WHERE PRO_ID = 'PRO1';
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


-- <PRC_PRO_UPDATE> ���� ���� ���� ���ν���
-- ������ ������ ��ü�� ���� �Է��ؼ� �����ϱ�!
CREATE OR REPLACE PROCEDURE PRC_PRO_CHANGE
( V_COURSE_ID   IN COURSE.COURSE_ID%TYPE
, V_PRO_ID      IN PROFESSORS.PRO_ID%TYPE
)
IS
BEGIN
    -- COURSE(�������̺�) �����ڵ� ������Ʈ
    UPDATE COURSE
    SET PRO_ID = V_PRO_ID
    WHERE COURSE_ID = V_COURSE_ID;
    
    -- CREATE TABLE ESTABLISHED_SUB(�����������̺�) �����ڵ� ������Ʈ
    UPDATE ESTABLISHED_SUB
    SET PRO_ID = V_PRO_ID
    WHERE COURSE_ID = V_COURSE_ID;

END;
--==>> Procedure PRC_PRO_CHANGE��(��) �����ϵǾ����ϴ�.

EXEC PRC_PRO_CHANGE('CO1','PRO4');



-- ���������� ���� ��Ű���� ���� (����)
/*
-- 1. ���� �ۼ�
CREATE OR REPLACE PACKAGE PRO_PACK
IS
    PROCEDURE PRC_PRO_CHANGE;
    TRIGGER TRG_PROFESSORS_DELETE;
END PRO_PACK;

-- 2. ��ü�� �ۼ�
CREATE OR REPLACE PACK BODY PRO_PACK
IS
    PROCEDURE PRC_PRO_CHANGE
    ( V_COURSE_ID   IN COURSE.COURSE_ID%TYPE
    , V_PRO_ID      IN PROFESSORS.PRO_ID%TYPE
    )
    IS
    BEGIN
    -- COURSE(�������̺�) �����ڵ� ������Ʈ
    UPDATE COURSE
    SET PRO_ID = V_PRO_ID
    WHERE COURSE_ID = V_COURSE_ID;
    
    -- CREATE TABLE ESTABLISHED_SUB(�����������̺�) �����ڵ� ������Ʈ
    UPDATE ESTABLISHED_SUB
    SET PRO_ID = V_PRO_ID
    WHERE COURSE_ID = V_COURSE_ID;

    END;
    
    
    TRIGGER TRG_PROFESSORS_DELETE
        AFTER
        DELETE ON PROFESSORS
        FOR EACH ROW
    BEGIN
        UPDATE COURSE
        SET PRO_ID = NULL
        WHERE PRO_ID = :OLD.PRO_ID;
    
        UPDATE ESTABLISHED_SUB
        SET PRO_ID = NULL
        WHERE PRO_ID = :OLD.PRO_ID;
    END;
    
END PRO_PACK;
*/

--���л� �α��� ���ν��� ����
CREATE OR REPLACE PROCEDURE PRC_LOGIN_ST 
(
    V_USERID IN STUDENTS.ST_ID%TYPE
,   V_USERPW IN STUDENTS.ST_PW%TYPE
)
IS
    V_COUNT            NUMBER;
BEGIN
    SELECT COUNT(ST_ID) INTO V_COUNT FROM STUDENTS
    WHERE ST_ID=V_USERID AND ST_PW=V_USERPW;
 
    IF(V_COUNT > 0) THEN
        DBMS_OUTPUT.PUT_LINE(V_USERID||'�� �α��� �Ǿ����ϴ�.');  
    ELSE
        DBMS_OUTPUT.PUT_LINE('���̵� �Ǵ� ��й�ȣ�� �߸��Ǿ����ϴ�.');
    END IF;
 
END;
--==>> Procedure PRC_LOGIN_ST��(��) �����ϵǾ����ϴ�.

--�۰����� �α��� ���ν��� ����
CREATE OR REPLACE PROCEDURE PRC_LOGIN_AD 
(
    V_USERID IN ADMINISTRATOR.ADMIN_ID%TYPE
,   V_USERPW IN ADMINISTRATOR.ADMIN_PW%TYPE
)
IS
    V_COUNT            NUMBER;
BEGIN
    SELECT COUNT(ADMIN_ID) INTO V_COUNT FROM ADMINISTRATOR
    WHERE ADMIN_ID=V_USERID AND ADMIN_PW=V_USERPW;
    
    IF(V_COUNT > 0) THEN
        DBMS_OUTPUT.PUT_LINE(V_USERID||'�� �α��� �Ǿ����ϴ�.');  
    ELSE
        DBMS_OUTPUT.PUT_LINE('���̵� �Ǵ� ��й�ȣ�� �߸��Ǿ����ϴ�.');
    END IF;
END;
--==>> Procedure PRC_LOGIN_AD��(��) �����ϵǾ����ϴ�.

--�۱��� �α��� ���ν��� ����
CREATE OR REPLACE PROCEDURE PRC_LOGIN_PRO 
(
    V_USERID IN PROFESSORS.PRO_ID%TYPE
,   V_USERPW IN PROFESSORS.PRO_PW%TYPE
)
IS
    V_COUNT            NUMBER;
BEGIN
    SELECT COUNT(PRO_ID) INTO V_COUNT FROM PROFESSORS
    WHERE PRO_ID=V_USERID AND PRO_PW=V_USERPW;
 
    IF(V_COUNT > 0) THEN
        DBMS_OUTPUT.PUT_LINE(V_USERID||'�� �α��� �Ǿ����ϴ�.');  
    ELSE
        DBMS_OUTPUT.PUT_LINE('���̵� �Ǵ� ��й�ȣ�� �߸��Ǿ����ϴ�.');    
    END IF;
  
END;
--==>> Procedure PRC_LOGIN_PR��(��) �����ϵǾ����ϴ�.


--�۷α��� ���ν��� ����
CREATE OR REPLACE PROCEDURE PRC_LOGIN
(
    V_USER    IN NUMBER    
,   V_USERID  IN PROFESSORS.PRO_ID%TYPE
,   V_USERPW  IN PROFESSORS.PRO_PW%TYPE
)
IS
    INPUT_ERROR    EXCEPTION;
    V_COUNT        NUMBER;
BEGIN
    IF(V_USER = 1) -- ������
        THEN PRC_LOGIN_AD(V_USERID, V_USERPW);
      
    ELSIF(V_USER = 2) -- ����
        THEN PRC_LOGIN_PRO(V_USERID, V_USERPW);
  
      
    ELSIF(V_USER = 3) -- �л�
        THEN PRC_LOGIN_ST(V_USERID, V_USERPW);  
    ELSIF (V_USER != 1 AND V_USER != 2 AND V_USER != 3)
        THEN RAISE INPUT_ERROR;
    END IF; 
    
    EXCEPTION
    WHEN INPUT_ERROR
        THEN RAISE_APPLICATION_ERROR(-20005, '�ش��ϴ� ����ڸ� �����ϼ���. (1.������, 2.����, 3.�л�)');
             ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;
 
END;

--------------------------------------------------------------------------------
--�䱸�м��� ���� ������ �κ� �����帳�ϴ�.
--�� ������ �䱸 �м�
-- 3-5~6. ��� �������� ������ ���
-- �����ڸ�, �����, ����Ⱓ(����), ����Ⱓ(��), �����, ���ǽ�, �������࿩��(���� ����, ���� ��, ��������)
SELECT P.PRO_NAME "�����ڸ�", S.SUB_NAME "�����", S.S_START "���� ������", S.S_END "���� ������"
     , S.BOOK_NAME "�����", S.CLASSROOM "���ǽ�"
     , CASE WHEN SYSDATE < S.S_START THEN '���� ����'
            WHEN S.S_END < SYSDATE THEN '���� ����'
            ELSE '���� ��'
       END "�������࿩��"
FROM PROFESSORS P JOIN ESTABLISHED_SUB E
     ON P.PRO_ID = E.PRO_ID
                 JOIN SUBJECTS S
                 ON E.SUB_ID = S.SUB_ID;
                 
                 
-- 4-4~5. ��� ������ ������ ���
-- ������, ���ǽ�, ����Ⱓ(����), ����Ⱓ(��), �����, �����ڸ�
SELECT C.COURSE_NAME "������", C.CLASSROOM "���� ���ǽ�"
     , S.SUB_NAME "�����", S.CLASSROOM "���� ���ǽ�", S.S_START "���� ������", S.S_END "���� ������"
     , S.BOOK_NAME "�����", P.PRO_NAME "�����ڸ�"
FROM COURSE C JOIN PROFESSORS P
     ON C.PRO_ID = P.PRO_ID
             JOIN ESTABLISHED_SUB E
             ON C.COURSE_ID = E.COURSE_ID
                    JOIN SUBJECTS S
                    ON E.SUB_ID = S.SUB_ID;


-- 3. ������ �������� ���� ��� ��� ����
--������ �ڽ��� ������ ���� ���� ����
-- �����, ����Ⱓ, �����, �л���, ���, �Ǳ�, �ʱ�, ����, ���
-- ���� �ߵ�Ż�� ��: ������ ���� ���� ���, �ߵ�Ż�� ���� ���

/* �Ʒ��� �ߵ�Ż������ ���� ����
SELECT S.SUB_NAME "�����", S.S_START "���������",S.S_END "����������", S.BOOK_NAME "�����"
     , ST.ST_NAME "�л���", SC.ATTEND_SCORE "���",SC.PRACTICAL_SCORE "�Ǳ�", SC.WRITING_SCORE "�ʱ�"
     , (NVL(SC.ATTEND_SCORE,0) + NVL(SC.PRACTICAL_SCORE,0) + NVL(SC.WRITING_SCORE,0)) "����"
     , RANK() OVER(ORDER BY (NVL(SC.ATTEND_SCORE,0) + NVL(SC.PRACTICAL_SCORE,0) + NVL(SC.WRITING_SCORE,0)) DESC) "���"
     --, DECODE(M.E_ID,NULL,'N','Y')"�ߵ�Ż�� ����"
     , (CASE  WHEN M.DROP_DATE BETWEEN S.S_START AND S.S_END 
              THEN'�ߵ�Ż��'
              ELSE '����'
        END) "�ߵ�Ż�� ����"
FROM STUDENTS ST JOIN ENROLL E
ON ST.ST_ID = E.ST_ID
    LEFT JOIN SCORE SC
    ON E.E_ID = SC.E_ID
        LEFT JOIN ESTABLISHED_SUB ES
        ON SC.EST_SUB_ID = ES.EST_SUB_ID
            LEFT JOIN SUBJECTS S
            ON ES.SUB_ID = S.SUB_ID
                LEFT JOIN MID_DROP M
                ON E.E_ID = M.E_ID
WHERE PRO_ID IN ('PRO1', 'PRO2');-- WHERE���� �ش�Ǵ� ���� �ڵ� �Է�
*/

-- ++ ���� �߰�
INSERT INTO SUBJECTS(SUB_ID, SUB_NAME, S_START, S_END, CLASSROOM, BOOK_NAME)
VALUES('SUB3', '���̽���',  TO_DATE('2020-10-2', 'YYYY-MM-DD'),  TO_DATE('2020-10-29', 'YYYY-MM-DD'), '���̽㰭�ǽ�B1', '������̽㸶����');


SELECT SUB.SUB_NAME "�����", SUB.S_START "���� ������", SUB.S_END "���� ������", SUB.BOOK_NAME "�����"
     , STU.ST_NAME "�л���", SC.ATTEND_SCORE "�������", SC.PRACTICAL_SCORE "�Ǳ�����", SC.WRITING_SCORE "�ʱ�����"
     , (NVL(SC.ATTEND_SCORE, 0) + NVL(SC.PRACTICAL_SCORE, 0) + NVL(SC.WRITING_SCORE, 0)) "����"
     , RANK() OVER(ORDER BY (NVL(SC.ATTEND_SCORE, 0) + NVL(SC.PRACTICAL_SCORE, 0) + NVL(SC.WRITING_SCORE, 0)) DESC) "���"
     , CASE WHEN MID.E_ID IS NOT NULL THEN 'Y'
            ELSE 'N'
       END "�ߵ�����"
FROM STUDENTS STU LEFT JOIN ENROLL E
    ON STU.ST_ID = E.ST_ID
        LEFT JOIN SCORE SC
        ON E.E_ID = SC.E_ID
            LEFT JOIN ESTABLISHED_SUB EST
            ON SC.EST_SUB_ID = EST.EST_SUB_ID
                LEFT JOIN SUBJECTS SUB
                ON EST.SUB_ID = SUB.SUB_ID
                    LEFT JOIN MID_DROP MID
                    ON E.E_ID = MID.E_ID;                   
WHERE PRO_ID IN ('PRO1', 'PRO2');-- WHERE���� �ش�Ǵ� ���� �ڵ� �Է�

SELECT *
FROM ENROLL;

SELECT *
FROM SUBJECTS;


SELECT *
FROM TEST;
--------------------------------------------------------------------------------
-- ���õ�����
-- 1. ������
INSERT INTO ADMINISTRATOR(ADMIN_ID, ADMIN_PW) VALUES('AD1', 'QWER1234');
INSERT INTO ADMINISTRATOR(ADMIN_ID, ADMIN_PW) VALUES('AD2', 'ASDF1234');

-- 2. ����
INSERT INTO PROFESSORS(PRO_ID, PRO_NAME, PRO_PW, PRO_SSN)
VALUES('PRO1', '���� ��', 'QWER1234', '840218-2813239');

INSERT INTO PROFESSORS(PRO_ID, PRO_NAME, PRO_PW, PRO_SSN)
VALUES('PRO2', '������', 'ASDF1234', '111111-1111111');

-- 3. �л�
INSERT INTO STUDENTS(ST_ID, ST_PW, ST_NAME, ST_SSN, ST_DATE)
VALUES('STU1', 'QWER1234', '��ȸ��', '111111-3111111', TO_DATE('2020-09-24', 'YYYY-MM-DD'));

INSERT INTO STUDENTS(ST_ID, ST_PW, ST_NAME, ST_SSN, ST_DATE)
VALUES('STU2', 'ASDF1234', '���ʿ�', '111111-4111111', TO_DATE('2020-09-24', 'YYYY-MM-DD'));

-- 4. ����
INSERT INTO SUBJECTS(SUB_ID, SUB_NAME, S_START, S_END, CLASSROOM, BOOK_NAME)
VALUES('SUB1', '����Ŭ�߱�',  TO_DATE('2020-12-24', 'YYYY-MM-DD'),  TO_DATE('2021-1-19', 'YYYY-MM-DD'), '����Ŭ���ǽ�A1', '����Ŭ������');

INSERT INTO SUBJECTS(SUB_ID, SUB_NAME, S_START, S_END, CLASSROOM, BOOK_NAME)
VALUES('SUB2', '�ڹٰ��',  TO_DATE('2020-7-2', 'YYYY-MM-DD'),  TO_DATE('2020-9-19', 'YYYY-MM-DD'), '�ڹٰ��ǽ�B1', '����ڹٸ�����');

-- ++ ���� �߰�
INSERT INTO SUBJECTS(SUB_ID, SUB_NAME, S_START, S_END, CLASSROOM, BOOK_NAME)
VALUES('SUB3', '���̽���',  TO_DATE('2020-10-2', 'YYYY-MM-DD'),  TO_DATE('2020-10-29', 'YYYY-MM-DD'), '���̽㰭�ǽ�B1', '������̽㸶����');

-- 5. ����
INSERT INTO COURSE(COURSE_ID, COURSE_NAME, PRO_ID, C_START, C_END, CLASSROOM)
VALUES('CO1', '�����ھ缺����', 'PRO1', TO_DATE('2020-11-24', 'YYYY-MM-DD'), TO_DATE('2021-4-18', 'YYYY-MM-DD'), '����Ŭ���ǽ�A1');

INSERT INTO COURSE(COURSE_ID, COURSE_NAME, PRO_ID, C_START, C_END, CLASSROOM)
VALUES('CO2', '����������������', 'PRO2', TO_DATE('2020-6-14', 'YYYY-MM-DD'), TO_DATE('2020-12-30', 'YYYY-MM-DD'), '�ڹٰ��ǽ�B1');


-- 6. ��������
INSERT INTO ESTABLISHED_SUB(EST_SUB_ID, PRO_ID, COURSE_ID, SUB_ID, ATTEND_PER, PRACTICAL_PER, WRITING_PER)
VALUES('ESI1', 'PRO1', 'CO1', 'SUB1', 20, 40, 40);

INSERT INTO ESTABLISHED_SUB(EST_SUB_ID, PRO_ID, COURSE_ID, SUB_ID, ATTEND_PER, PRACTICAL_PER, WRITING_PER)
VALUES('ESI2', 'PRO2', 'CO2', 'SUB2', 20, 20, 60);

-- 7. ����
INSERT INTO TEST(TEST_ID, SUB_ID, TEST_DATE)
VALUES('TEST1', 'SUB1', TO_DATE('2020-12-31', 'YYYY-MM-DD'));

INSERT INTO TEST(TEST_ID, SUB_ID, TEST_DATE)
VALUES('TEST2', 'SUB1', TO_DATE('2021-01-10', 'YYYY-MM-DD'));


-- 8. ������û
INSERT INTO ENROLL(ENROLL_ID, ST_ID, COURSE_ID, ENROLL_DATE)
VALUES('ENROLL1', 'STU1', 'CO1', TO_DATE('2020-10-24', 'YYYY-MM-DD'));

INSERT INTO ENROLL(ENROLL_ID, ST_ID, COURSE_ID, ENROLL_DATE)
VALUES('ENROLL2', 'STU2', 'CO1', TO_DATE('2020-10-25', 'YYYY-MM-DD'));

-- 9. ����
INSERT INTO SCORE(SCORE_ID, ENROLL_ID, EST_SUB_ID, ATTEND_SCORE, PRACTICAL_SCORE, WRITING_SCORE)
VALUES('SCORE1', 'ENROLL1', 'ESI1', 90, 30, 100);

-- 10. �ߵ�����
INSERT INTO MID_DROP(DROP_ID, ENROLL_ID, DROP_DATE)
VALUES('DROP1', 'ENROLL2', TO_DATE('2020-10-29', 'YYYY-MM-DD'));

-- Ŀ��
COMMIT;



-- ���� �߰� �׽�Ʈ!
INSERT INTO PROFESSORS(PRO_ID, PRO_NAME, PRO_PW, PRO_SSN)
VALUES('PRO3', '��ȣ��', 'QWER1234', '850218-1813239');

EXEC PRC_PRO_PW_INSERT('PRO4', '��ȣ��', '550218-1813239');



SELECT *
FROM PROFESSORS;

PURGE RECYCLEBIN;

/*

[���� �׸�]
1. ERD
2. �������� ERD
3. ���̺� ���� SQL���� (���ν��� FUNCTION, TRIGGER)
4. �䱸�м������ ������ ����. SQL
5. ������ �ı�(����������Ʈ �ϸ鼭 ��� �� ����)


TIP. �����ؼ� �� �� �ִ� ���� �÷�ȭ ��Ű�� �ʴ´�.
�� ������ ���簡 ���̺� ��簡 �÷�
��4����ȭ �ϴ�ٷ� ���߸��� ���迡�� �Ļ����̺� �����.

*/