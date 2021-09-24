SELECT USER
FROM DUAL;
--==>> HR

--�� ������
CREATE TABLE ADMINISTRATOR
( ADMIN_ID  VARCHAR2(30)
, ADMIN_PW  VARCHAR2(30) 
, CONSTRAINT ADMINISTRATOR_ADMIN_ID_PK PRIMARY KEY(ADMIN_ID)
);

ALTER TABLE ADMINISTRATOR
MODIFY
( ADMIN_PW CONSTRAINT ADMINISTRATOR_ADMIN_PW_NN NOT NULL );


--�� ������
CREATE TABLE PROFESSORS
( PRO_ID     VARCHAR2(30)                               -- �����ڹ�ȣ
, PRO_NAME   VARCHAR2(10)                               -- �����ڸ�
, PRO_PW     VARCHAR2(30)                               -- ������ ��й�ȣ(�ʱⰪ�� �ֹι�ȣ ���ڸ�)
, PRO_SSN    CHAR(14)                                   -- ������ �ֹι�ȣ
, CONSTRAINT PROFESSORS_PRO_ID_PK PRIMARY KEY(PRO_ID)
, CONSTRAINT PROFESSORS_PRO_SSN_UK UNIQUE(PRO_SSN)
);

-- NOT NULL �������� ����
ALTER TABLE PROFESSORS
MODIFY
( PRO_NAME CONSTRAINT PROFESSORS_PRO_NAME_NN NOT NULL
, PRO_PW CONSTRAINT PROFESSORS_PRO_PW_NN NOT NULL
, PRO_SSN CONSTRAINT PROFESSORS_PRO_SSN_NN NOT NULL
);


--�� �л�
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


--�� ����
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


--�� ����
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


--�� ��������
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


--�� ����
CREATE TABLE TEST
(
 TEST_ID          VARCHAR2(30)
,EST_SUB_ID       VARCHAR2(30)
,TEST_DATE        DATE
,CONSTRAINT TEST_TEST_ID_PK PRIMARY KEY(TEST_ID)
,CONSTRAINT TEST_EST_SUB_ID_FK FOREIGN KEY(EST_SUB_ID) REFERENCES ESTABLISHED_SUB(EST_SUB_ID)
);


--�� ������û
CREATE TABLE ENROLL
( E_ID          VARCHAR2(30)
, ST_ID         VARCHAR2(30)
, COURSE_ID     VARCHAR2(30)
, E_DATE        DATE    DEFAULT SYSDATE
, CONSTRAINT ENROLL_E_ID_PK PRIMARY KEY(E_ID)
, CONSTRAINT ENROLL_ST_ID_FK FOREIGN KEY(ST_ID) 
                                       REFERENCES STUDENTS(ST_ID)
, CONSTRAINT ENROLL_COURSE_ID_FK FOREIGN KEY(COURSE_ID) 
                                       REFERENCES COURSE(COURSE_ID)
);

--������û �������� ����
ALTER TABLE ENROLL
MODIFY
(E_DATE   CONSTRAINT ENROLL_E_DATE_NN NOT NULL);


--�� ����
CREATE TABLE SCORE
( SCORE_ID              VARCHAR2(30) 
, ENROLL_ID             VARCHAR2(30)
, EST_SUB_ID            VARCHAR2(30)
, ATTEND_SCORE          NUMBER(3)
, PRACTICAL_SCORE       NUMBER(3)
, WRITING_SCORE         NUMBER(3)
, CONSTRAINT SOCRE_ID_PK PRIMARY KEY(SCORE_ID)
, CONSTRAINT SCORE_ENROLL_ID_FK FOREIGN KEY(ENROLL_ID)
             REFERENCES ENROLL(E_ID)
, CONSTRAINT SCORE_ESTABLISHED_SUB_ID_FK FOREIGN KEY(EST_SUB_ID)
             REFERENCES ESTABLISHED_SUB(EST_SUB_ID)
, CONSTRAINT SCORE_ATTEND_SCORE_CK CHECK(ATTEND_SCORE BETWEEN 0 AND 100)            
, CONSTRAINT SCORE_PRACTICAL_SCORE_CK CHECK(PRACTICAL_SCORE BETWEEN 0 AND 100)            
, CONSTRAINT SCOREWRITING_SCORE_CK CHECK(WRITING_SCORE BETWEEN 0 AND 100)

);


--�� �ߵ�����
CREATE TABLE MID_DROP
( DROP_ID       VARCHAR2(30)
, ENROLL_ID     VARCHAR2(30)
, DROP_DATE     DATE           NOT NULL
, CONSTRAINT MID_DPOP_ID_PK PRIMARY KEY(DROP_ID)
, CONSTRAINT MID_DPOP_ENROLL_ID_FK FOREIGN KEY(ENROLL_ID)
             REFERENCES ENROLL(E_ID)
-- ����Ϻ��� �ߵ����� ��¥�� �ڿ��� �Ѵٴ� ��������
);


--�� ������ �̺�Ʈ�α� ���̺�
CREATE TABLE PRO_EVENTLOG
( PRO_ID    VARCHAR2(30)
, MEMO      VARCHAR2(200)
, ILJA      DATE DEFAULT SYSDATE
, CONSTRAINT PRO_EVENTLOG_PRO_ID_FK FOREIGN KEY(PRO_ID)
                REFERENCES PROFESSORS(PRO_ID)
);
--==>> Table PRO_EVENTLOG��(��) �����Ǿ����ϴ�.


--�� �л� �̺�Ʈ�α� ���̺�
CREATE TABLE STD_EVENTLOG
( ST_ID         VARCHAR2(30)
, ILJA          DATE DEFAULT SYSDATE
, MEMO          VARCHAR2(200)
, CONSTRAINT TBL_EVENTLOG_ST_ID_FK FOREIGN KEY(ST_ID) 
                                       REFERENCES STUDENTS(ST_ID)
);
--==>> Table STD_EVENTLOG��(��) �����Ǿ����ϴ�.


DROP TABLE ADMINISTRATOR;
DROP TABLE PROFESSORS;
DROP TABLE STUDENTS;
DROP TABLE SUBJECTS;
DROP TABLE COURSE;
DROP TABLE ESTABLISHED_SUB;
DROP TABLE TEST;
DROP TABLE ENROLL;
DROP TABLE SCORE;
DROP TABLE MID_DROP;


--------------------------------------------------------------------------------
--PLSQL
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
,   V_USERPW IN PROFESSORS.PRO_PW%TYPE
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
--==>> Procedure PRC_LOGIN��(��) �����ϵǾ����ϴ�.


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
(
  V_ST_ID   IN STUDENTS.ST_ID%TYPE
, V_ST_NAME IN STUDENTS.ST_NAME%TYPE
, V_ST_SSN  IN STUDENTS.ST_SSN%TYPE
)
IS
    NONEXIST_ERROR  EXCEPTION;
BEGIN
    UPDATE STUDENTS
    SET ST_NAME = V_ST_NAME, ST_SSN = V_ST_SSN
    WHERE ST_ID = V_ST_ID;
    
    IF SQL%NOTFOUND
        THEN RAISE NONEXIST_ERROR;
    END IF;
       
    COMMIT;
    
    EXCEPTION
        WHEN NONEXIST_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006,'��ġ�ϴ� �����Ͱ� �����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_STUDENT_UPDATE��(��) �����ϵǾ����ϴ�.


--�� STUDENT_DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENT_DELETE 
(
    V_ST_ID      STUDENTS.ST_ID%TYPE          
  , V_ST_PW      STUDENTS.ST_PW%TYPE      
  , V_ST_NAME    STUDENTS.ST_NAME%TYPE      
  , V_ST_SSN     STUDENTS.ST_SSN%TYPE      -- �л� �ֹι�ȣ ���ڸ�
)
IS
BEGIN
        DELETE      
            FROM STUDENTS      
            WHERE ST_ID = V_ST_ID             -- �л� ���̵� üũ
                  AND ST_PW = V_ST_PW          -- �л� ��й�ȣ üũ
                  AND ST_NAME = V_ST_NAME      -- �л� �̸� üũ
                  AND ST_SSN = V_ST_SSN;         -- �л� �ֹι�ȣ ���ڸ� üũ
        COMMIT;

        EXCEPTION
            WHEN OTHERS
                THEN RAISE_APPLICATION_ERROR(-20003,'�ٽ� �Է����ּ���');
                     ROLLBACK; 
END;
--==>> Procedure PRC_STUDENT_DELETE��(��) �����ϵǾ����ϴ�.


--�� �л� ���̺� �̺�Ʈ�α� Ʈ����
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


--�� ������û INSERT ���ν���
-- �Ʒ��� ������ Ȯ�� �� �����͸� �Է��Ѵ�.
-- 1) ��������ϰ� ������
-- 2) ������ ���� ��û ����
-- 3) ���� ��¥ �ߺ�
CREATE OR REPLACE PROCEDURE PRC_ENROLL_INSERT
( V_E_ID       IN ENROLL.E_ID%TYPE
, V_ST_ID      IN ENROLL.ST_ID%TYPE
, V_COURSE_ID  IN ENROLL.COURSE_ID%TYPE
, V_E_DATE     IN ENROLL.E_DATE%TYPE
)

IS
   V_ST_DATE           STUDENTS.ST_DATE%TYPE;
   V_C_START           COURSE.C_START%TYPE;     -- ����Ϸ��� ������ ������
   V_C_END             COURSE.C_END%TYPE;       -- ����Ϸ��� ������ ������
   nCNT                NUMBER;
   USER_DEFINE_ERROR   EXCEPTION;
   SAME_COURSE         EXCEPTION;
   SAME_DATE           EXCEPTION;

BEGIN
    -- ���� ó�� 1. ��������ϰ� ������
    -- ������û���� ��������Ϻ��� �����ų�, �����Ϻ��� �����ų� ���� �� ����.
    SELECT ST_DATE INTO V_ST_DATE
    FROM STUDENTS
    WHERE ST_ID = V_ST_ID;
    
    SELECT C_START, C_END INTO V_C_START, V_C_END
    FROM COURSE
    WHERE COURSE_ID = V_COURSE_ID;    

    IF (V_E_DATE < V_ST_DATE OR V_E_DATE >= V_C_START)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    -- ���� ó�� 2. ������ ���� ��û ����
    -- �� �л��� ���� ������ ��û�� �� ����.
    SELECT COUNT(*) INTO nCNT
    FROM ENROLL
    WHERE ST_ID = V_ST_ID AND COURSE_ID = V_COURSE_ID;    
    
    IF (nCNT > 0)
        THEN RAISE SAME_COURSE;
    END IF;

    
    -- ���� ó�� 3. ���� ��¥ �ߺ�
    -- �� �л��� ������ ������ ������ ��¥��, ���� �����Ϸ��� ������ ��¥�� ��ĥ �� ����.
    SELECT COUNT(*) INTO nCNT
    FROM ENROLL E JOIN COURSE C
      ON E.COURSE_ID = C.COURSE_ID      
    WHERE E.ST_ID = V_ST_ID
      AND ( V_C_START > C.C_START AND V_C_START < C.C_END     -- ����Ϸ��� ������ ���� ��¥ ���� Ȯ��
       OR   V_C_END > C.C_START AND V_C_END < C.C_END );      -- ����Ϸ��� ������ ���� ��¥ ���� Ȯ��

    IF (nCNT > 0)
        THEN RAISE SAME_DATE;
    END IF; 


    -- INSERT
    INSERT INTO ENROLL(E_ID, ST_ID, COURSE_ID, E_DATE)
    VALUES (V_E_ID, V_ST_ID, V_COURSE_ID, V_E_DATE);

    -- Ŀ��
    COMMIT;
        
    -- ���� �߻�
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '���� ��û�� �Ұ����մϴ�.');
                 ROLLBACK;
        WHEN SAME_COURSE
            THEN RAISE_APPLICATION_ERROR(-20003, '�̹� ��û�� �����Դϴ�.');
                 ROLLBACK;
        WHEN SAME_DATE
            THEN RAISE_APPLICATION_ERROR(-20004, '��¥�� �ߺ��Ǵ� �����Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;            
END;
--==>> Procedure PRC_ENROLL_INSERT��(��) �����ϵǾ����ϴ�.


--�� �ߵ����� INSERT ���ν���
--> �ߵ����� ���ڵ带 �Է� ��, "���� ������ < �ߵ������� < ����������"�� �´��� Ȯ���ϴ� ���ν���
CREATE OR REPLACE PROCEDURE PRC_MID_DROP_INSERT
( V_DROP_ID     IN MID_DROP.DROP_ID%TYPE
, V_ENROLL_ID   IN MID_DROP.E_ID%TYPE
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
    WHERE E_ID = V_ENROLL_ID;  
    
    SELECT C_START, C_END INTO V_C_START, V_C_END
    FROM COURSE
    WHERE COURSE_ID = V_COURSE_ID;
    
    -- ���� ó�� : "���� ������ < �ߵ������� < ����������"�� �ƴ� ���
    IF (V_DROP_DATE < V_C_START OR V_DROP_DATE > V_C_END)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- INSERT
    INSERT INTO MID_DROP(DROP_ID, E_ID, DROP_DATE)
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


--�� ���� INSERT ���ν���
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


--�� ���� �̺�Ʈ�α� Ʈ���� ����
CREATE OR REPLACE TRIGGER TRG_PRO_EVENTLOG
            AFTER
            INSERT OR UPDATE ON PROFESSORS
DECLARE
    V_PRO_ID    PRO_EVENTLOG.PRO_ID%TYPE;
BEGIN
    IF (INSERTING)
        THEN INSERT INTO PRO_EVENTLOG(PRO_ID,MEMO)
            VALUES(PRO_ID,'�������� INSERT �������� ����Ǿ����ϴ�.');
    ELSIF (UPDATING)
        THEN INSERT INTO PRO_EVENTLOG(PRO_ID,MEMO)
            VALUES(PRO_ID,'�������� UPDATE �������� ����Ǿ����ϴ�.');
    END IF;
END;
--==>> Trigger TRG_PRO_EVENTLOG��(��) �����ϵǾ����ϴ�.



--�� �������� ���� Ʈ����
-- ������ �� ������ �����ϰ� ���� ������ �ٷ� �����ϵ��� �ϸ� �ǰ� 
-- �����̳� �������� �̷� ���̺� �����ϰ� �ִ� ������ ������ ������ �� ������ �ִ� ���� ��� NULL������ ó��
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

--�� ������ ���� ��ü�ϴ� ���ν���
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


--�� ���� ���� ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_PRO_UPDATE
( V_PRO_ID      IN PROFESSORS.PRO_ID%TYPE
, V_PRO_NAME    IN PROFESSORS.PRO_NAME%TYPE
, V_PRO_PW     IN PROFESSORS.PRO_PW%TYPE
)
IS
BEGIN
    -- PROFESSORS(�������̺�) �̸�, ��й�ȣ ������Ʈ
    UPDATE PROFESSORS
    SET PRO_NAME = V_PRO_NAME, PRO_PW = V_PRO_PW
    WHERE PRO_ID = V_PRO_ID;
END;
--==>> Procedure PRC_PRO_UPDATE��(��) �����ϵǾ����ϴ�.



--�� �������� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_ESTABLISHED_SUB
( V_EST_SUB_ID      IN ESTABLISHED_SUB.EST_SUB_ID%TYPE
, V_PRO_ID          IN ESTABLISHED_SUB.PRO_ID%TYPE
, V_COURSE_ID       IN ESTABLISHED_SUB.COURSE_ID%TYPE
, V_SUB_ID          IN ESTABLISHED_SUB.SUB_ID%TYPE
, V_ATTEND_PER      IN ESTABLISHED_SUB.ATTEND_PER%TYPE
, V_PRACTICAL_PER   IN ESTABLISHED_SUB.PRACTICAL_PER%TYPE
, V_WRITING_PER     IN ESTABLISHED_SUB.WRITING_PER%TYPE
)
IS
    V_C_START           COURSE.C_START%TYPE;
    V_C_END             COURSE.C_END%TYPE;
    V_S_START           SUBJECTS.S_START%TYPE;
    V_S_END             SUBJECTS.S_END%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;

BEGIN
    -- ������ �� ���
    SELECT C_START, C_END INTO V_C_START, V_C_END
    FROM COURSE
    WHERE COURSE_ID = V_COURSE_ID;
    
    SELECT S_START, S_END INTO V_S_START, V_S_END
    FROM SUBJECTS
    WHERE SUB_ID = V_SUB_ID;
    
    IF (V_C_START > V_S_START OR V_S_END > V_C_END) --���� �������� ���� �����Ϻ��� �ڰų� ���� �������� ���� �����Ϻ��� �ڸ� �����߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- INSERT
    INSERT INTO ESTABLISHED_SUB(EST_SUB_ID,PRO_ID,COURSE_ID,SUB_ID,ATTEND_PER,PRACTICAL_PER,WRITING_PER)
    VALUES (V_EST_SUB_ID, V_PRO_ID,V_COURSE_ID,V_SUB_ID,V_ATTEND_PER,V_PRACTICAL_PER,V_WRITING_PER);
    
    -- Ŀ��
    COMMIT;
    
    -- ���� �߻�
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '���� ���� ��¥�� �߸� �ԷµǾ����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_ESTABLISHED_SUB��(��) �����ϵǾ����ϴ�.


--�� �Ŀ����� ���ư��� �ʾƿ�!!!!(����)
--�� ���� ���� Ʈ����
--> ������û ���̺�, �������� ���̺����� ���� ����
CREATE OR REPLACE TRIGGER DEL_COURSE
        AFTER
        DELETE ON COURSE
        FOR EACH ROW
BEGIN
    DELETE
    FROM ENROLL
    WHERE COURSE_ID=:OLD.COURSE_ID;
    
    DELETE
    FROM ESTABLISHED_SUB
    WHERE COURSE_ID=:OLD.COURSE_ID;
    
END;


--�ڽ��� ������ ���� ���� ����
--�л��̸�, ������, �����, �����Ⱓ, �����, ���,�Ǳ�,�ʱ�, ����, SELECT STU.ST_ID"�л��̸�", CO.COURSE_NAME"������", SUB.SUB_NAME "�����", SUB.S_START || ' - ' || SUB.S_END "���� �Ⱓ", SUB.BOOK_NAME "�����"
     , SC.ATTEND_SCORE "�������", SC.PRACTICAL_SCORE "�Ǳ�����", SC.WRITING_SCORE "�ʱ�����"
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
                    ON E.E_ID = MID.E_ID
                        LEFT JOIN COURSE CO
                        ON EST.COURSE_ID = CO.COURSE_ID; 


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