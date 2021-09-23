SELECT USER
FROM DUAL;
--==>> SCOTT


-- ���� BEFORE ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��

--�� TRIGGER �ۼ�(TRG_TEST2_DELETE)
CREATE OR REPLACE TRIGGER TRG_TES2_DELETE
        BEFORE
        DELETE ON TBL_TEST2 --������� ���� STATEMENT TRIGGER
        FOR EACH ROW
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE=:OLD.CODE;    -- �ð��� ���缭 �̽ð��� �������� �����Ǳ� ������ �ڵ�!
END;
--==>> Trigger TRG_TES2_DELETE��(��) �����ϵǾ����ϴ�.


--�� ��:OLD��
-- ���� �� ���� ��
-- (INSERT : �Է��ϱ� ���� �ڷ�, DELETE : �����ϱ� ���� �ڷ�, ������ �ڷ�)

--�� UPDATE �� DELETE �׸��� INSERT �� ���յ� ����
--             �� �������� UPDATE �ϱ� ������ �ڷ�� :OLD
--             �� �������� UPDATE �� ���� �ڷ�� :NEW




-- ���� AFTER ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���̺� ���� Ʈ����� ó��

-- TBL_��ǰ, TBL_�԰�, TBL_��� Ȱ��

--�� TBL_�԰� ���̺��� ������ �Է� ��(�԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� ������ ���� Ʈ���� �ۼ�(TRG_IBGO)
CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_�԰�
        FOR EACH ROW
BEGIN
     IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + �����԰�Ǵ� �԰����
             WHERE ��ǰ�ڵ� = ���� �԰�Ǵ� ��ǰ�ڵ�;
     END IF;    
END;
----------------------------------------------------------------

CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_�԰�
        FOR EACH ROW
BEGIN
     IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
     END IF;    
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.

-- Ʈ���� ������ : DROP TRIGGER TRG_IBGO;



--�� TBL_��ǰ, TBL_�԰�, TBL_����� ���迡��
--   �԰����, �������� Ʈ����� ó���� �̷���� �� �ֵ���
--   TRG_IBGO Ʈ���Ÿ� �籸���Ѵ�.

---- ��))����ó�� ���ص� ��!!
CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT OR DELETE OR UPDATE ON TBL_�԰�
        FOR EACH ROW

BEGIN          
     IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
     ELSIF (UPDATING)
        THEN UPDATE TBL_��ǰ
             SET ������ = (������ - :OLD.�԰����) + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
     ELSIF (DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ - :OLD.�԰����
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
     END IF;
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.

-----------------------------------------------------
-- ����ó���� ��
CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT OR DELETE OR UPDATE ON TBL_�԰�
        FOR EACH ROW
DECLARE
    V_������  TBL_��ǰ.������%TYPE;
    
BEGIN
     IF (DELETING OR UPDATING)
        THEN SELECT ������ INTO V_������
             FROM TBL_��ǰ
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
     END IF;
     
     IF( (DELETING AND V_������ - :OLD.�԰����<0) OR (UPDATING AND ((V_������ - :OLD.�԰����) + :NEW.�԰����)<0) )
        THEN RAISE_APPLICATION_ERROR(-20002,'��� �����մϴ�.');
     END IF;
     
          
     IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
     ELSIF (UPDATING)
        THEN UPDATE TBL_��ǰ
             SET ������ = (������ - :OLD.�԰����) + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
     ELSIF (DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ - :OLD.�԰����
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
     END IF;
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------
--�� TBL_��ǰ, TBL_�԰�, TBL_��� �� ���迡��
--   ������, �������� Ʈ����� ó���� �̷�� �� �� �ֵ���
--   TRG_CHULGO Ʈ���� �ۼ��Ѵ�.

-- ��))����ó�� ���ص� ��!!
CREATE OR REPLACE TRIGGER TRG_CHULGO
        AFTER
        INSERT OR DELETE OR UPDATE ON TBL_���
        FOR EACH ROW
BEGIN   
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ - :NEW.������
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (UPDATING)
        THEN UPDATE TBL_��ǰ
             SET ������ = (������ + :OLD.������) - :NEW.������
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    
    ELSIF(DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :OLD.������
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_CHULGO��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------
CREATE OR REPLACE TRIGGER TRG_CHULGO
        AFTER
        INSERT OR DELETE OR UPDATE ON TBL_���
        FOR EACH ROW
DECLARE
    V_������  TBL_��ǰ.������%TYPE;
    
BEGIN
    IF (DELETING OR UPDATING)
        THEN SELECT ������ INTO V_������
             FROM TBL_��ǰ
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
    
    IF ( (DELETING AND V_������ + :OLD.������<0) OR (UPDATING AND V_������ + :OLD.������ - :NEW.������<0))
        THEN RAISE_APPLICATION_ERROR(-20002,'��� �����մϴ�.');
    END IF;
    
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ - :NEW.������
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (UPDATING)
        THEN UPDATE TBL_��ǰ
             SET ������ = (������ + :OLD.������) - :NEW.������
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    
    ELSIF(DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :OLD.������
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_CHULGO��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------


-- ���� PACKAGE(��Ű��) ����--

-- 1. PL/SQL �� ��Ű���� ����Ǵ� Ÿ��, ���α׷� ��ü,
--    ���� ���α׷�(PROCEDURE, FUNCTION ��)�� �ڳ������� ������� �͡�����
--    ����Ŭ���� �����ϴ� ��Ű�� �� �ϳ��� �ٷ� ��DBMS_OUTPUT���̴�.

-- ex) DBMS_OUTPUT.PUT_LINE()���� 
--     ----------- �̸�ŭ�� ��Ű����!

-- 2. ��Ű���� ���� ������ ������ ���Ǵ� ���� ���� ���ν����� �Լ���
--    �ϳ��� ��Ű���� ����� ���������ν� ���� ���������� ���ϰ�
--    ��ü ���α׷��� ���ȭ �� �� �ִ� ������ �ִ�.

-- 3. ��Ű���� ����(PACKAGE SPECIFICATION)��
--    ��ü��(PACKAGE BODY)�� �����Ǿ� ������,
--    �� �κп��� TYPE, CONSTRAINT, VARIABLE, EXCEPTION, CURSOR,
--    SUBPROGRAM �� ����ǰ�
--    ��ü �κп��� �̵��� ���� ������ �����ϰ� �ȴ�.
--    �׸��� ȣ���� ������ ����Ű����.���ν����� ������ ������ �̿��ؾ� �Ѵ�.

-- 4. ���� �� ����(����)
-- ��Ű���ȿ� �̷� ���� �ֱ��� �˰� ���ַ��� ��!
/*
CREATE [OR REPLACE] PACKAGE ��Ű����
IS
    �������� ����;
    Ŀ�� ����;
    ���� ����;
    �Լ� ����;
    ���ν��� ����;
        :
END ��Ű����;
*/

-- 5. ���� �� ����(��ü��)
/*
CREATE [OR RELACE] PACKAGE BODY ��Ű����
IS
    FUNCTION �Լ���[(�μ�, ...)]
    RETURN �ڷ���
    IS
        ��������;
    BEGIN
        �Լ� ��ü ���� �ڵ�;
        RETURN ��;
    END;
    
    PROCEDURE ���ν�����[(�μ�, ...)]
    IS
        ���� ����;
    BEGIN
        ���ν��� ��ü ���� �ڵ�;
    END;
END ��Ű����;
*/


--�� �ֹι�ȣ �Է� �� ������ ��ȯ�ϴ� �Լ�
--   �� �Լ��� ������ҷ� �ϴ� ��Ű�� �ۼ�

-- �Լ� �غ�
CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)
RETURN VARCHAR2
IS
    V_RESULT VARCHAR2(20);
BEGIN
    IF (SUBSTR(V_SSN,8,1) IN ('1','3'))
        THEN V_RESULT := '����';
    ELSIF (SUBSTR(V_SSN,8,1) IN ('2','4'))
        THEN V_RESULT := '����';
    ELSE 
        V_RESULT := 'Ȯ�κҰ�';
    END IF;
    
    RETURN V_RESULT;
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.

-- ��Ű�� ���
-- 1. ���� �ۼ�
CREATE OR REPLACE PACKAGE INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;
    
END INSA_PACK;  -- ��Ű���� �̸��� END ��Ű������ ��Ȯ�� ���ƾ���!!
--==>> Package INSA_PACK��(��) �����ϵǾ����ϴ�.


-- 2. ��ü�� �ۼ�
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS
    -- ���� ������ �Լ� ���ٿ��� CREATE OR REPLACE ���� ��!
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2
    IS
        V_RESULT VARCHAR2(20);
    BEGIN
        IF (SUBSTR(V_SSN,8,1) IN ('1','3'))
            THEN V_RESULT := '����';
        ELSIF (SUBSTR(V_SSN,8,1) IN ('2','4'))
            THEN V_RESULT := '����';
        ELSE 
            V_RESULT := 'Ȯ�κҰ�';
        END IF;
        
        RETURN V_RESULT;
    END;
    
END INSA_PACK;
--==>> Package Body INSA_PACK��(��) �����ϵǾ����ϴ�.





