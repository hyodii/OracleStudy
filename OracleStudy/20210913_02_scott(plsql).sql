SELECT USER
FROM DUAL;
--==>> SCOTT

-- PL/SQL�� �巡���ؼ� �����ؾ��� ������!!
-- PL/SQL ������(plsql)��� ������ ����!




--���� PL/SQL ����--

-- 1. PL/SQL(Procedural Language extension to SQL)��
--   ���α׷��� ����� Ư���� ������ SQL�� Ȯ���̸�,
--   ������ ���۰� ���� ������ PL/SQL �� ������ �ڵ� �ȿ� ���Եȴ�.
--   ���� PL/SQL�� ����Ͽ� SQL �� �� �� ���� ������ �۾��� �����ϴ�.
--   ���⿡�� �����������̶�� �ܾ ������ �ǹ̴�
--   � ���� � ������ ���� ��� �Ϸ�Ǵ���
--   �� ����� ��Ȯ�ϰ� �ڵ忡 ����Ѵٴ� ���� �ǹ��Ѵ�.

-- 2. PL/SQL �� ���������� ǥ���ϱ� ����
--   ������ ������ �� �ִ� ���,
--   ���� ������ ������ �� �ִ� ���,
--   ���� �帧�� ��Ʈ���� �� �ִ� ��� ���� �����Ѵ�.

-- 3. PL/SQL �� �� ������ �Ǿ� ������
--   ���� ���� �κ�, ����κ�, ���� ó�� �κ���
--   �� �κ����� �����Ǿ� �ִ�.
--   ����, �ݵ�� ���� �κ��� �����ؾ� �ϸ�, ������ ������ ����.

-- 4. ���� �� ����
-- DECLARE �� BIGIN ���̰� ����
-- BEGIN �� END ���̰� ���๮
-- �ͼ��ʰ� ���� ���̰� ����ó����
/*
[DECLARE]
    -- ����(declarations)
BEGIN
    -- ���๮(statements)
    [EXCEPTION]
        -- ���� ó����(exception handlers)
END;
*/

-- 5. ���� ����
/*
DECLARE                                           <�ʱ�ȭ �ϴ¹�>
    -- �ڷ��� ������;         int num; �� X                int num = 10;
    ������ �ڷ���;            COL1 NUMBER(3); �� ��        COL1 NUMBER(3) := 10;
    ������ �ڷ��� := �ʱⰪ;(=:�� ����!)
BEGIN
    PL/SQL ����;
END;
*/



SET SERVEROUTPUT ON;
--==>> ��ũ��Ʈ ��¿� �۾��� �Ϸ�Ǿ����ϴ�.
-- ��DBMS_OUTPUT.PUT_LINE()���� ����
-- ȭ�鿡 ����� ����ϱ� ���� ȯ�溯���� ����


--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
-- PL/SQL�� STATEMENT�� ���� ������ ;�����ش�! �׷��� ����Ƽ� CTRL + ENTER / F5 ����� �Ѵ�!!
DECLARE
    -- �����
    V1 NUMBER := 10;
    V2 VARCHAR2(30) := 'HELLO';
    V3 VARCHAR2(20) := 'Oracle';
BEGIN
    -- �����
    --SYSTEM.OUT.PRINTLN(V1);
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.(ó������ �̷��Ը� ����! �׷��� ���� SET���� �������!!)
/*
10
HELLO
Oracle


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ������ ������ ���� �����ϰ� ����ϴ� PL/SQL ���� �ۼ�
DECLARE
    -- �����
    V1 NUMBER := 10;
    V2 VARCHAR2(30) := 'HELLO';
    V3 VARCHAR2(30) := 'Oracle';
    
BEGIN
    -- �����
    V1 := V1 * 10;          -- V1 *= 10;
    V2 := V2 || ' ����';     -- V2 += " ����"; 
    V3 := V3 || ' World';
    
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
    
END;
--==>>
/*
100
HELLO ����
Oracle World


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� IF��(���ǹ�)
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL �� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--    ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--    TRUE �̸� THEN �� ELSE ������ ������ �����ϰ�
--    FALSE �� NULL �̸� ELSE �� END IF ������ ������ �����ϰ� �ȴ�.

-- 2. ���� �� ����
-- IF �� THEN �� �ִµ� ELSE�� ����!!
/*
IF ����
    THEN ó������;
ELSIF ����
    THEN ó������;
ELSIF ����
    THEN ó������;
ELSE
    ó������;
END IF;
*/


--�� ������ ����ִ� ���� ����...
--   Excellent , Good, Fail �� �����Ͽ�
--   ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
DECLARE
    GRADE CHAR; -- 1�ڸ� ����
BEGIN
    GRADE := 'C';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Fail


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR; -- 1�ڸ� ����
BEGIN
    GRADE := 'B';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Good


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR; -- 1�ڸ� ����
BEGIN
    GRADE := 'A';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Excellent


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� CASE�� (���ǹ�)
-- CASE ~WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
    WHEN ��1
        THEN ���๮;
    WHEN ��2
        THEN ���๮;
    ELSE
        ���๮;
    
END CASE;
*/



--�� ������ ����ִ� ���� ����...
--   Excellent, Good, Fail �� �����Ͽ�
--   ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
--   ��, CASE �� Ȱ���Ͽ� �ۼ��Ѵ�.
DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    
    CASE GRADE
        WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;
--==>>
/*
Excellent


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    CASE GRADE
        WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;
--==>>
/*
Good


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'E';
    
    CASE GRADE
        WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;
--==>>
/*
Fail


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/



--�� �ܺ� �Է� ó��

-- ACCEPT ��
-- ACCEPT ������ PROMPT '�޼���';
-- �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
-- ��&�ܺκ����� ���·� �����ϰ� �ȴ�.

--�� ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--   �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���';
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���';
-- �����ϸ� ���ε�â�� �� ù ����� 10 �� ��°�� 20 �Է�!

DECLARE
    -- �ֿ� ���� ���� �� �ʱ�ȭ
    NUM1    NUMBER := &N1;
    NUM2    NUMBER := &N2;
    TOTAL   NUMBER := 0;
BEGIN
    -- ���� �� ó��
    TOTAL := NUM1 + NUM2;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || TOTAL);
END;
--==>>
/*
10 + 20 = 30


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ�� ������ ����ϴ� ���α׷��� �ۼ��Ѵ�.
--   ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� �ݾ� �Է� : [  890]

�Է¹��� �ݾ� �Ѿ� : 890��
ȭ����� : ����� 1, ��� 3, ���ʿ� 1, �ʿ� 4
*/

--���� Ǯ��...(�ذ����)
/*
ACCEPT N1 PROMPT '�ݾ� �Է�';

DECLARE
    NUM1    NUMBER := &N1;
    NUM2    NUMBER := 0;
    NUM3    NUMBER := 0;
    NUM4    NUMBER := 0;
    NUM5    NUMBER := 0;
BEGIN
    -- ���� �� ó��
    IF NUM1>500
        THEN NUM2 := NUM1/500;
    ELSIF NUM1<500
        THEN NUM3 := NUM1/100;
    ELSIF NUM1>100 AND NUM1>50
        THEN NUM4 := NUM1;
    ELSE
        THEN NUM5 := NUM1/50;
        
    END IF;
    -- ��°��
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� ' || NUM2 || ', ��� ' || NUM3 ||', ���ʿ� ' ||NUM4||', �ʿ� '||NUM5);
END;
*/



--Ǯ��--------------------------------------------------------------------------
ACCEPT INPUT PROMPT '�ݾ� �Է�';

DECLARE
    --�� �ֿ� ���� ���� �� �ʱ�ȭ
    MONEY   NUMBER := &INPUT;     -- ������ ���� ��Ƶ� ����
    MONEY2  NUMBER := &INPUT;     -- ����� ���� ��Ƶ� ����(���� �������� ���� ���ϱ� ������...)
    M500    NUMBER;               -- 500�� ¥�� ������ ��Ƶ� ����
    M100    NUMBER;               -- 100�� ¥�� ������ ��Ƶ� ����
    M50     NUMBER;               --  50�� ¥�� ������ ��Ƶ� ����
    M10     NUMBER;               --  10�� ¥�� ������ ��Ƶ� ����
BEGIN
    --�� ���� �� ó��
    -- MONEY �� 500���� ������ ���� ���ϰ� �������� ������. �� 500���� ����
    M500 := TRUNC(MONEY/500);
    -- MONEY �� 500���� ������ ���� ������ �������� ���Ѵ���
    -- �� ����� �ٽ� MONEY�� ��Ƴ���.(500���� ���� ������ �ܵ�)
    MONEY := MOD(MONEY,500);
    -- MONEY �� 100���� ������ ���� ���ϰ� �������� ������. �� 100���� ����
    M100 := TRUNC(MONEY/100);
    -- MONEY �� 100���� ������ ���� ������ �������� ���Ѵ���
    -- �� ����� �ٽ� MONEY�� ��Ƴ���.(100���� ���� ������ �ܵ�)
    MONEY := MOD(MONEY,100);
    -- MONEY �� 50���� ������ ���� ���ϰ� �������� ������. �� 50���� ����
    M50 := TRUNC(MONEY/50);
    -- MONEY �� 50���� ������ ���� ������ �������� ���Ѵ���
    -- �� ����� �ٽ� MONEY�� ��Ƴ���.(50���� ���� ������ �ܵ�)
    MONEY := MOD(MONEY,50);
    -- MONEY �� 10���� ������ ���� ���ϰ� �������� ������. �� 10���� ����
    M10 := TRUNC(MONEY/10);
    
    --�� ��� ���
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� : ' || MONEY2 || '��');
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� ' || M500 || ', ��� ' || M100 ||
                        ', ���ʿ� ' ||M50||', �ʿ� '||M10);
    
END;
--==>>
/*
�Է¹��� �ݾ� �Ѿ� : 870��
ȭ����� : ����� 1, ��� 3, ���ʿ� 1, �ʿ� 2


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

-- 1. ������ ���ǰ� ������� ������ �ݺ��ϴ� ����.

-- 2. ���� �� ����
/*
LOOP
    -- ���๮;
    
    [EXIT WHEN ����]      -- ������ ���� ��� �ݺ����� ����������.
    
END LOOP;
*/

--�� 1 ���� 10������ �� ���(LOOP Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        EXIT WHEN N>=10;
        N := N+1;                   -- N++; N+=1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE �� ���� �Ϸ��� ������ �ݺ��ϱ� ����
--    WHILE LOOP ������ ����ϰ� �ȴ�.
--    ������ �ݺ��� ���۵� �� üũ�ϰ� �Ǿ�
--    LOOP ���� ������ �� ���� ������� ���� ���� �ִ�.
--    LOOP �� ������ �� ������ FALSE �̸� �ݺ� ������ Ż���ϰ� �ȴ�.

-- 2. ���� �� ����
/*
WHILE ���� LOOP       -- ������ ���� ��� �ݺ� ����(������ ������ ���� ��� ���������� ��!)
    -- ���๮;
END LOOP;
*/

--�� 1 ���� 10������ �� ���(WHILE LOOP Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    N := 1;
        WHILE N<=10 LOOP
            DBMS_OUTPUT.PUT_LINE(N);
            N := N+1;
        END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--Ǯ��-----------------------------------------------
DECLARE
    N   NUMBER;
BEGIN
    N := 0;
        WHILE N<10 LOOP
            N := N+1;
            DBMS_OUTPUT.PUT_LINE(N);
        END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� FOR �ݺ���
-- FOR LOOP ~ END LOOP;

-- 1. ������ �������� 1�� �����Ͽ�
--    ������ ������ �� �� ���� �ݺ� �����Ѵ�.

-- 2. ���� �� ����
/*
FOR ī���� in [REVERSE] ���ۼ� .. ������ LOOP
    -- ���๮;
END LOOP;
*/

--�� 1 ���� 10 ������ �� ���(FOR LOOP Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    N   NUMBER;
BEGIN
    FOR N IN REVERSE 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
10
9
8
7
6
5
4
3
2
1


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/




--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
--   �ش� �ܼ��� �������� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� ���� �Է��ϼ��� : [   2]

2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
    :
2 * 9 = 18
*/

-- 1. LOOP���� ���
ACCEPT N PROMPT '���� �Է��ϼ��� : ';

DECLARE
    NUM1 NUMBER := &N;
    NUM2 NUMBER := 1;
    RES  NUMBER := 1;
BEGIN
    LOOP
        RES := NUM1 * NUM2;
        EXIT WHEN NUM2=10;
        DBMS_OUTPUT.PUT_LINE(NUM1 || ' * '|| NUM2||' = '|| RES);
        NUM2 := NUM2 +1;
    END LOOP;
END;
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

-- 2. WHILE LOOP ���� ���
SET SERVEROUTPUT ON;

ACCEPT N PROMPT '���� �Է��ϼ��� : ';

DECLARE
    NUM1 NUMBER := &N;
    NUM2 NUMBER := 1;
    RES  NUMBER := 1;
BEGIN
    WHILE NUM2<10 LOOP
        RES := NUM1 * NUM2;
        DBMS_OUTPUT.PUT_LINE(NUM1 || ' * '|| NUM2||' = '|| RES);
        NUM2 := NUM2 +1;
    END LOOP;
END;
--==>>
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

-- 3. FOR LOOP ���� ���
ACCEPT N PROMPT '���� �Է��ϼ��� : ';

DECLARE
    NUM1 NUMBER := &N;
    NUM2 NUMBER := 1;
    RES  NUMBER := 1;
BEGIN
    FOR NUM2 IN 1 .. 9 LOOP
        RES := NUM1 * NUM2;
        DBMS_OUTPUT.PUT_LINE(NUM1 || ' * '|| NUM2||' = '|| RES);
        NUM2 := NUM2 +1;        
    END LOOP;
END;


-- Ǯ��-----------------------------------------------------------
-- 1. LOOP���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
 
BEGIN
    N :=1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(DAN||' * '||N||' = '||(DAN*N));
        EXIT WHEN N>=9;
        N := N + 1;
    END LOOP;
END;
--==>>
/*
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


-- 2. WHILE LOOP ���� ���
SET SERVEROUTPUT ON;
ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
 
BEGIN
    N := 0;
    WHILE N<9 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
    END LOOP;
END;
--==>>
/*
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


-- 3. FOR LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN NUMBER := &NUM;
    N   NUMBER;
BEGIN
    FOR N IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
    END LOOP;
END;
--==>>
/*
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

























