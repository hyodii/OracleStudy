SELECT USER
FROM DUAL;
--==>> HR

--���� DEFUALT ǥ���� ����--

-- 1. INSERT �� UPDATE ������
--    ����ڰ� �����ϴ� Ư�� ���� �ƴ�
--    �⺻ ���� �Է��ϵ��� ó��(����)�� �� �ִ�.

-- 2. ���� �� ����
-- �÷� �� ������Ÿ�� DEFAULT �⺻��

-- 3. INSERT ��� �� �ش� �÷��� �Էµ� ���� �Ҵ����� �ʰų�,
--    DEFAULT Ű���带 Ȱ���Ͽ� �⺻ ���� �Է��ϵ��� �� �� �ִ�.

-- 4. DAFUALT Ű����� �ٸ� ����(NOT NULL ��) ǥ�Ⱑ ���� ���Ǵ� ���
--    DEFUALT Ű���带 ���� ǥ��(�ۼ�)�� ���� �����Ѵ�.


--�� DEFAULT ǥ���� �ǽ�
-- ���̺� ����
CREATE TABLE TBL_BOARD                      --�Խ��� ���̺� ����
( SID       NUMBER          PRIMARY KEY     --�Խù� ��ȣ �� �ĺ���(�ڵ� ����)
, NAME      VARCHAR2(30)                    -- �Խù� �ۼ���
, CONTENTS  VARCHAR2(2000)                  -- �Խù� ����
, WRITEDAY  DATE    DEFAULT SYSDATE         -- �Խù� �ۼ���(���� ��¥ �ڵ� �Է�)
, COMMENTS  NUMBER  DEFAULT 0               -- �Խù� ��� ����(�⺻�� 0)
, COUNTS    NUMBER  DEFAULT 0               -- �Խù��� ��ȸ��
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.


--�� SID �� �ڵ� ���� ������ ��Ϸ��� ������ ��ü�� �ʿ��ϴ�.
--   �ڵ����� �ԷµǴ� �÷��� ����ڰ� �Է��ؾ� �ϴ� �׸񿡼�
--   ���ܽ�ų �� �ִ�.

-- ������ ����
CREATE SEQUENCE SEQ_BOARD
NOCACHE;
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.


-- ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

-- �Խù� �ۼ�
INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL,'�մ���', '����Ŭ���� DEFAULT ǥ������ �ǽ����Դϴ�.'
, TO_DATE('2021-08-30 14:26:26','YYYY-MM-DD HH24:MI:SS'),0,0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '������', '��� �׽�Ʈ���Դϴ�.', SYSDATE, 0, 0);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, 'ä����', '���� �׽�Ʈ���Դϴ�.', DEFAULT, DEFAULT, DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS)          --���� CHECK~!!
VALUES(SEQ_BOARD.NEXTVAL, '������', '�׽�Ʈ ������');--�̷��� �־ ����Ʈ�� ��� ��!
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_BOARD;
--==>>
/*
1	�մ���	����Ŭ���� DEFAULT ǥ������ �ǽ����Դϴ�.	2021-08-30 14:26:26	0	0
2	������	��� �׽�Ʈ���Դϴ�.	                    2021-09-10 14:28:37	0	0
3	ä����	���� �׽�Ʈ���Դϴ�.	                    2021-09-10 14:32:06	0	0
4	������	�׽�Ʈ ������	                            2021-09-10 14:34:47	0	0
*/


--�� DEFAULT ǥ���� Ȯ��(��ȸ)
SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'TBL_BOARD';
--==>>
/*
TBL_BOARD	SID	        NUMBER			22			N	1		
TBL_BOARD	NAME	    VARCHAR2		30			Y	2		
TBL_BOARD	CONTENTS	VARCHAR2	  2000			Y	3		
TBL_BOARD	WRITEDAY	DATE			7			Y	4	68	"SYSDATE         -- �Խù� �ۼ���(���� ��¥ �ڵ� �Է�)
TBL_BOARD	COMMENTS	NUMBER			22			Y	5	56	"0               -- �Խù� ��� ����(�⺻�� 0)
TBL_BOARD	COUNTS  	NUMBER			22			Y	6	42	"0               -- �Խù��� ��ȸ��
"
*/

--�� ���̺� ���� ���� DEFAULT ǥ���� �߰� / ����   -- CHECK~!!!
--  ����Ʈ ǥ������ ADD / DROP ����!! 
ALTER TABLE ���̺��
MODIFY �÷���[�ڷ���] DEFAULT �⺻��;

--�� ������ DEFAULT ǥ���� ����(����)              -- CHECK~!!!
ALTER TABLE ���̺��
MODIFY �÷���[�ڷ���] DEFAULT NULL;
































