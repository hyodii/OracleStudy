SELECT USER
FROM DUAL;
--==>> HR


-- �������� ���̺�
CREATE TABLE PROFESSORS
( PRO_ID     VARCHAR2(30)                               -- �����ڹ�ȣ
, PRO_NAME   VARCHAR2(10)                               -- �����ڸ�
, PRO_PW     VARCHAR2(30) DEFAULT SUBSTR(PRO_SSN,8,7)   -- ������ ��й�ȣ(�ʱⰪ�� �ֹι�ȣ ���ڸ�)
, PRO_SSN    CHAR(14)                                   -- ������ �ֹι�ȣ
, CONSTRAINT PROFESSORS_PRO_ID_PK PRIMARY KEY(PRO_ID)
);

-- NOT NULL �������� ����
ALTER TABLE PROFESSORS
MODIFY
( PRO_NAME CONSTRAINT PROFESSORS_PRO_NAME_NN NOT NULL
, PRO_SSN CONSTRAINT PROFESSORS_PRO_SSN_NN NOT NULL
);

-- ���� ���̺�
CREATE TABLE SUBJECTS
( SUB_ID            VARCHAR2(30)        -- �����ڵ�
, C_START           DATE                -- ������
, C_END             DATE                -- ������
, CLASSROOM         VARCHAR2(30)        -- ���ǽ�
, BOOK_NAME         VARCHAR2(30)        -- å�̸�
, CONSTRAINT SUBJECTS_SUB_ID_PK PRIMARY KEY(SUB_ID)
, CONSTRAINT SUBJECTS_C_START_CK CHECK(C_DATE < C_END)
);


























