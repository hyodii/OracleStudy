SELECT USER
FROM DUAL;
--==>> SCOTT

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
( -- �Ű����� ����
  V_NAME        IN TBL_INSA.NAME%TYPE
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
    -- INSERT ������ ���࿡ �ʿ��� ���� �߰� ����
    V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
    -- ������ ������ �� ��Ƴ���(������ �Ⱦ����� �̰� ���� ��!)
    SELECT MAX(NUM)+1 INTO V_NUM
    FROM TBL_INSA;
    
    
    -- INSERT ������(������ �Է��̴ϱ�)
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM,V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- COMMIT
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.


--------------------------------------------------------------------------------

--�� TBL_��ǰ, TBL_�԰� ���̺��� �������...
--   TBL_�԰� ���̺� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �Բ� ������ �� �ִ� ����� ����
--   ���ν����� �ۼ��Ѵ�.
--   ��, �� �������� �԰��ȣ�� �ڵ� ���� ó���Ѵ�.(������ ��� ����)
--   TBL_�԰� ���̺� ���� �÷�
--   �� �԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�
--   ���ν��� �� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰����, �԰�ܰ�)

-- [��Ʈ] ������ �ľ� SELECT
-- , ������ ������ UPDATE�̰� �����ִ� ���� �Էµ� �԰������ ���ؾ���!
-- , �԰����̺� INSERT

--�� TBL_�԰� ���̺� �԰� �̺�Ʈ �߻� ��...
--   ���� ���̺��� ����Ǿ�� �ϴ� ����
--   0. SELECT �� TBL_�԰�
--      SELECT NVL(MAX(�԰��ȣ),0)
--      FROM TBL_�԰�;
--   1. INSERT �� TBL_�԰�
--      INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
--      VALUES(1,'C001', SYSDATE, 30, 1000);
--   2. UPDATE �� TBL_��ǰ
--      UPDATE TBL_��ǰ
--      SET ������ = �⺻������ + 30(�� �԰����)
--      WHERE ��ǰ�ڵ� = 'C001';
-- ���� Ǯ��(�ذ���� Ǯ������)---------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�  IN TBL_�԰�.��ǰ�ڵ�%TYPE               
, V_�԰����  IN TBL_�԰�.�԰����%TYPE
, V_�԰�ܰ�  IN TBL_�԰�.�԰�ܰ�%TYPE
)
IS 
    -- ������, ������ ����
    V_NUM       TBL_�԰�.�԰��ȣ%TYPE;
    V_������  TBL_��ǰ.������%TYPE;
BEGIN
    -- �԰��ȣ ������Ű��
    SELECT MAX(�԰��ȣ)+1 INTO V_NUM
    FROM TBL_�԰�;
    
    -- ������ ����
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� =(SELECT ��ǰ�ڵ�
                     FROM TBL_�԰�);
    
    -- �԰� ������ �Է�
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
    VALUES(V_NUM, V_��ǰ�ڵ�,SYSDATE, V_�԰����,V_�԰�ܰ�);
    
    -- ��ǰ�� ������ ������Ʈ
    UPDATE TBL_��ǰ
    SET ������ = V_������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
                     
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.

-- Ǯ�� ------------------------------------------------------------------------
-- 1 �� 2 �� 0 ������ ��������(���� ���� 1 2 0 ����)
CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�  IN TBL_��ǰ.��ǰ�ڵ�%TYPE           -- CHECK~!!! 
, V_�԰����  IN TBL_�԰�.�԰����%TYPE
, V_�԰�ܰ�  IN TBL_�԰�.�԰�ܰ�%TYPE
)
IS
    -- �Ʒ��� �������� �����ϱ� ���� �ʿ��� ������ ������ ����
    V_�԰��ȣ  TBL_�԰�.�԰��ȣ%TYPE;
BEGIN
    -- 0.������ ������ �� ��Ƴ���
    SELECT NVL(MAX(�԰��ȣ),0) INTO V_�԰��ȣ     -- �԰��ȣ�� ������ NULL�̶�!! ����ȴ�!!!
    FROM TBL_�԰�;                                  -- INTO CHECK~!!!
    
    -- ����Ǿ�� �ϴ� ������
    -- 1. INSERT TBL_�԰�
    -- �԰�¥�� ����Ʈ���� ������!
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�)      
    VALUES((V_�԰��ȣ+1), V_��ǰ�ڵ�, V_�԰����,V_�԰�ܰ�);
    
    -- 2. UPDATE �� TBL_��ǰ
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- Ŀ��
    COMMIT;
    
    -- �ϳ��� ���ν������� �ΰ��� DML������ ����! �� ������ ������
    -- ���� ������ü ����ó�� INSERT�ǰ� UPDATE�ȵǰų� �ݴ���� ����! �׷���!
    -- ����ó��(�ٸ� ��򰡿��� ���ܰ� �߻��ϸ� �ѹ��ض� �μ�Ʈ�� �ȴ�°�!)
    -- BEGIN �κ� ��ü�� TRY-CATCH �� ���� �ɷ� �����ϸ� �ɱ��?? OK

    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
    
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.


--------------------------------------------------------------------------------
--���� ���ν��� �������� ���� ó�� ����--

--�� TBL_MEMBER ���̺��� �����͸� �Է��ϴ� ���ν��� �ۼ�
--   ��, �� ���ν����� ���� �����͸� �Է��� ���
--   CITY(����) �׸� '����', '��õ', '���' �� �Է��� �����ϵ��� �����Ѵ�.
--   ���� ���� ���� ������ ���ν��� ȣ���� ���� �Է��Ϸ��� �ϴ� ���
--   ���� ó���� �Ϸ��� �Ѵ�.
--   ���ν��� �� : PRC_MEMBER_INSERT(�̸�, ��ȭ��ȣ, ����)

-- ���ν��� ����
CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    --���� ������ ������ ������ ���� �ʿ��� ���� ����
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- ����� ���� ���ܿ� ���� ���� ����  CHECK~!!!
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ���������� �ƴ��� ���θ�
    -- ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF (V_CITY NOT IN('����', '��õ', '���'))
        -- ���� �߻�
        --THEN USER_DEFINE_ERROR �� �߻���Ű�ڴ�.
        THEN RAISE USER_DEFINE_ERROR;       -- �ڹٿ����� THROW
    END IF;
    
    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_MEMBER;

    -- ������ ����
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1),V_NAME,V_TEL,V_CITY);
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó�� ���� 
    -- (��������ǿ����� �Ϲ������� 20001������ ����� ���ھտ� -�� ORA- �Ҷ� -)
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'����,��õ,��⸸ �Է��� �����մϴ�.');
                 ROLLBACK;      -- ������ ���� ���� �ƴ϶� ROLLBACK��~!!!
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_MEMBER_INSERT��(��) �����ϵǾ����ϴ�.




--------------------------------------------------------------------------------

--�� TBL_��� ���̺� ������ �Է½�(��, ��� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �����Ǵ� ���ν����� �ۼ��Ѵ�.
--   ��, ����ȣ�� �԰��ȣ�� ���������� �ڵ� ����.
--   ����, �������� ���������� ���� ���...
--   ��� �׼��� ����� �� �ֵ��� ó���Ѵ�.(��� �̷������ �ʵ���...)
--   ���ν��� �� : PRC_���_INSERT(��ǰ�ڵ�, ������, ���ܰ�)
-- ���� Ǯ��-----------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�    IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_������    IN TBL_���.������%TYPE
, V_���ܰ�    IN TBL_���.���ܰ�%TYPE
)
IS
    -- ����ȣ ������ų ����
    V_NUM   TBL_���.����ȣ%TYPE;
    
    --������ ����
    V_������ TBL_��ǰ.������%TYPE;
                  
    -- ��������� ���ܿ� ���� ���� ����
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    -- ��� ��ȣ ���� ����
    SELECT NVL(MAX(����ȣ),0) INTO V_NUM
    FROM TBL_���;
    
    -- ������
    SELECT NVL(������,0) INTO V_������
    FROM TBL_��ǰ;
    
    --�������� ���������� ���� ��� ��� �׼��� ���
    IF (NVL(V_������,0) > V_������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ��� ������ INSERT
    INSERT  INTO TBL_���(����ȣ,��ǰ�ڵ�, ������, ���ܰ�)
    VALUES ((V_NUM+1),V_��ǰ�ڵ�, V_������, V_���ܰ�);
    
    -- ��������� ��ǰ���̺��� ������ ������
    UPDATE TBL_��ǰ
    SET ������ = NVL(������,0) - NVL(V_������,0)
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    --Ŀ��
    COMMIT;
    
    -- ����ó�� ����
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'�������� �����մϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.

-- ���� Ǯ��-----------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�    IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_������    IN TBL_���.������%TYPE
, V_���ܰ�    IN TBL_���.���ܰ�%TYPE
)
IS
    -- �ֿ� ���� ����
    V_����ȣ TBL_���.����ȣ%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
    USER_DEFINE_ERROR EXCEPTION;        -- ����� ���� ����
    
BEGIN
-- �������� ���� ���� ������� ������!!!

    -- ������ ���� ������ ���� ���� ���� Ȯ�� �� ���� ��� Ȯ�� �� �������� ��
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

    -- ��� ���������� ������ �� ������ �ƴ����� ���� ���� Ȯ��
    -- (��, ����Ϸ��� ������ �ľ��� ���������� ������... ���� �߻�)
    IF (V_������ > V_������)
        -- ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(����ȣ),0) INTO V_����ȣ
    FROM TBL_���;

    -- ������ ����(INSERT �� TBL_���)
    INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
    VALUES((V_����ȣ+1), V_��ǰ�ڵ�, V_������, V_���ܰ�);
    
    -- ������ ����(UPDATE �� TBL_��ǰ)
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- Ŀ��
    COMMIT;
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '������~!!!');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.


--------------------------------------------------------------------------------

--�� TBL_��� ���̺��� ��� ������ ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_���_UPDATE(����ȣ, ������������);
-- ����ȣ�� ���ؼ� 2�� ����ȣ�� Ȩ�����̱��� ��°� ���� �˾ƾ���
-- ������ ��� ���� : ��������Ϸ��� ��� - ��������� + ������� 
-- 70   30��40   60
-- ���� Ǯ��-----------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( V_����ȣ          TBL_���.����ȣ%TYPE
, V_������������    TBL_���.������%TYPE   
)
IS
    --�ֿ� ���� ����
    V_��ǰ�ڵ� TBL_���.��ǰ�ڵ�%TYPE;
    V_������ TBL_���.������%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
    V_��ǰ�ڵ� TBL_���.��ǰ�ڵ�%TYPE;
    USER_DEFINE_ERROR EXCEPTION;        -- ����� ���� ����
    
BEGIN
    SELECT ������ INTO V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    SELECT ������ INTO V_������
    FROM TBL��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF (V_������������ > V_������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE TBL_���
    SET ������ = ������ - V_������������
    WHERE ����ȣ = V_����ȣ;
    
    UPDATE TBL_��ǰ
    SET ������ = ������ + (V_������ - V_������������)
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003,"����� �����մϴ�!");
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
        
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.



-- ���� Ǯ��-----------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
(   -- 1. �Ű����� ����(IN!!!!)
    V_����ȣ  IN TBL_���.����ȣ%TYPE
,   V_������  IN TBL_���.������%TYPE   
)
IS
    -- 3. �ֿ� ���� ����
    V_��ǰ�ڵ�  TBL_��ǰ.��ǰ�ڵ�%TYPE;
    
    -- 5. �ֿ� ���� �߰� ����
    V_����������    TBL_���.������%TYPE;
    
    -- 7. �ֿ� ���� �߰� ����
    V_������  TBL_��ǰ.������%TYPE;
    
    -- 9. �ֿ� ����(����� ���� ����) �߰� ����
    USER_DEFINE_ERROR EXCEPTION;    
    
BEGIN

    -- 4. ��ǰ �ڵ�� ���������� �ľ��� ���� ���� ������ ��� ���� Ȯ��
    /*
    SELECT ��ǰ�ڵ� INTO V_��ǰ�ڵ�
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    SELECT ������ INTO V_����������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    */
    -- ���� �ΰ� ��������
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_����������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    
    -- 6. ��� ���������� ������������ �����Ǵ� �ʿ�
    -- ���� ������ ������ �� ���� ��� ���� Ȯ���ؾ� �����Ҽ� �־ ��ġ ����!!
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- 8. �ľ��� �������� ���� ������ ���� �ǽ� ���� �Ǵ�
    --    (�������� + ���������� < �������������� ��Ȳ�̶��...����� ���� ���� �߻�)
    IF ((V_������ + V_����������) < V_������)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 2. �����ؾ� �� ������ ����(UPDATE �� TBL_��� / UPDATE �� TBL_��ǰ)
    UPDATE TBL_���
    SET ������ = V_������       -- CHECK~!!!
    WHERE ����ȣ = V_����ȣ;
    
    -- TBL_��ǰ ������Ʈ (���⼭���� �ʿ��� ���� ����!)
    UPDATE TBL_��ǰ
    --SET ������ = ������+����������-������������
    --SET ������ = ������ + ���������� - V_������ (����������)
    SET ������ = ������ + V_���������� - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- 10. Ŀ��
    COMMIT;
    
    -- 11. ����ó��(�� ���� �������� �������!!���̽��� ���⶧����!!)
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'��� ����~!!!');   -- ���ܰ� ���������� ��ȣ ����!! �ȿ����ڴ� �޶������� ���배�� �����ϴ°��� ����!!
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
    
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.


