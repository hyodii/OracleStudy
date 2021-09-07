SELECT USER
FROM DUAL;
--==>> SCOTT

-- ���� UNION / UNION ALL ����--

--�� �ǽ� ���̺� ����(TBL_JUMUN)
CREATE TABLE TBL_JUMUN                   -- �ֹ� ���̺� ����
( JUNO      NUMBER                      -- �ֹ� ��ȣ
, JECODE    VARCHAR2(30)                -- ��ǰ �ڵ�
, JUSU      NUMBER                      -- ���� ����
, JUDAY     DATE DEFAULT SYSDATE        -- �ֹ� ����
);
--==>> Table TBL_JUMUN��(��) �����Ǿ����ϴ�.
--  ���� �ֹ��� �߻����� ��� �ֹ� ���뿡 ���� �����Ͱ� �Էµ� �� �ִ� ���̺�

--�� ������ �Է� �� ���� �ֹ� �߻� / ����
INSERT INTO TBL_JUMUN VALUES
(1, 'Ȩ����',20, TO_DATE('2001-11-01 09:00:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(2, '������',10, TO_DATE('2001-11-01 09:23:15', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(3, '������',30, TO_DATE('2001-11-02 12:00:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(4, '��Ĩ',10, TO_DATE('2001-11-02 15:16:17', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(5, '������',50, TO_DATE('2001-11-03 10:22:33', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(6, 'Ȩ����',50, TO_DATE('2001-11-04 11:11:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(7, '��Ĩ',20, TO_DATE('2001-11-06 19:10:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(8, '��īĨ',40, TO_DATE('2001-11-13 09:07:09', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(9, 'Ģ��',30, TO_DATE('2001-11-15 10:23:24', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(10, '�����',20, TO_DATE('2001-11-16 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>>1 �� ��(��) ���ԵǾ����ϴ�. * 10
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	Ȩ����	20	2001-11-01 09:00:10
2	������	10	2001-11-01 09:23:15
3	������	30	2001-11-02 12:00:11
4	��Ĩ	10	2001-11-02 15:16:17
5	������	50	2001-11-03 10:22:33
6	Ȩ����	50	2001-11-04 11:11:11
7	��Ĩ	20	2001-11-06 19:10:10
8	��īĨ	40	2001-11-13 09:07:09
9	Ģ��	30	2001-11-15 10:23:24
10	�����	20	2001-11-16 14:20:00
*/
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==> Session��(��) ����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

ROLLBACK;

--�� ������ �߰� �Է� �� 2001�� ���� ���۵� �ֹ���... ����(2021��)���� ��� �߻�~!!!
INSERT INTO TBL_JUMUN VALUES(98785,'Ȩ����',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98786,'������',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98787,'Ȩ����',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98788,'�����',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98789,'��Ĩ',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98790,'��Ĩ',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98791,'����Ĩ',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98792,'�Ǻ���',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98793,'Ȩ����',30,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98794,'Ȩ����',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	Ȩ����	20	2001-11-01 09:00:10
2	������	10	2001-11-01 09:23:15
3	������	30	2001-11-02 12:00:11
4	��Ĩ	10	2001-11-02 15:16:17
5	������	50	2001-11-03 10:22:33
6	Ȩ����	50	2001-11-04 11:11:11
7	��Ĩ	20	2001-11-06 19:10:10
8	��īĨ	40	2001-11-13 09:07:09
9	Ģ��	30	2001-11-15 10:23:24
10	�����	20	2001-11-16 14:20:00

                 :
                 
98785	Ȩ����	10	2021-09-07 14:25:57
98786	������	20	2021-09-07 14:26:00
98787	Ȩ����	20	2021-09-07 14:26:03
98788	�����	20	2021-09-07 14:26:08
98789	��Ĩ	10	2021-09-07 14:26:12
98790	��Ĩ	20	2021-09-07 14:26:20
98791	����Ĩ	20	2021-09-07 14:27:28
98792	�Ǻ���	10	2021-09-07 14:27:50
98793	Ȩ����	30	2021-09-07 14:29:13
98794	Ȩ����	10	2021-09-07 14:29:15
*/
--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���ϰ� ���� ���θ� ���...
--   TBL_JUMUN ���̺��� �ʹ� ���ſ��� ��Ȳ
--   ���ø����̼ǰ��� �������� ���� �ֹ������� �ٸ� ���̺� ����� �� �ֵ���
--   �ٽ� �����ϴ� ���� �Ұ����� ��Ȳ
--   ������ ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ
--   �� ���������... ������� ������ �ֹ� �����͵� ��
--   ���� �߻��� �ֹ� ������ �����ϰ� �������� �ٸ� ���̺�(TBL_JUMUNBACKUP)��
--   ������ �̰��� ������ ��ȹ
SELECT *
FROM TBL_JUMUN
WHERE ���� �ֹ��� �ƴ� ��;

SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') = '2021-09-07';

SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') = TO_CHAR(SYSDATE,'YYYY-MM-DD');

SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--==>>
/*
1	Ȩ����	20	01/11/01
2	������	10	01/11/01
3	������	30	01/11/02
4	��Ĩ	10	01/11/02
5	������	50	01/11/03
6	Ȩ����	50	01/11/04
7	��Ĩ	20	01/11/06
8	��īĨ	40	01/11/13
9	Ģ��	30	01/11/15
10	�����	20	01/11/16
*/

--�� ���� ��ȸ ����� TBL_JUMUNBACKUP ���̺� ����
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP��(��) �����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	Ȩ����	20	01/11/01
2	������	10	01/11/01
3	������	30	01/11/02
4	��Ĩ	10	01/11/02
5	������	50	01/11/03
6	Ȩ����	50	01/11/04
7	��Ĩ	20	01/11/06
8	��īĨ	40	01/11/13
9	Ģ��	30	01/11/15
10	�����	20	01/11/16
*/
--> TBL_JUMUN ���̺��� �����͵� ��
-- ���� �ֹ����� �̿��� �����ʹ� ��� TBL_JUMUNBACKUP ���̺� ����� ��ģ ����.

--�� TBL_JUMUN ���̺��� �����͵� ��
--   ����� ��ģ �����͵� �輼 �� ���� �ֹ��� �ƴ� �����͵��� ����
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--==>> 10�� �� ��(��) �����Ǿ����ϴ�. �� 98784 ���� ������ �����Ǿ����� ����...

-- ���� ��ǰ �߼��� �Ϸ���� ���� ���� �ֹ� �����͸� �����ϰ�
-- ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
-- ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>>
/*
98785	Ȩ����	10	21/09/07
98786	������	20	21/09/07
98787	Ȩ����	20	21/09/07
98788	�����	20	21/09/07
98789	��Ĩ	10	21/09/07
98790	��Ĩ	20	21/09/07
98791	����Ĩ	20	21/09/07
98792	�Ǻ���	10	21/09/07
98793	Ȩ����	30	21/09/07
98794	Ȩ����	10	21/09/07
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- �׷���, ���ݱ��� �ֹ����� ������ ���� ������
-- ��ǰ�� �� �ֹ������� ��Ÿ���� �� ��Ȳ�� �߻��ϰ� �Ǿ���.
-- �׷��ٸ�... TBL_JUMUNBACKUP ���̺��� ���ڵ�(��)��
-- TBL_JUMUN ���̺��� ���ڵ�(��)�� ���ļ� �ϳ��� ���̺���
-- ��ȸ�ϴ� �Ͱ� ���� ����� Ȯ���� �� �ֵ��� �ؾ� �Ѵ�.

-- �÷��� �÷��� ���踦 ����Ͽ� ���̺��� �����ϰ��� �ϴ� ���
-- JOIN �� ���O������
-- ���ڵ�(��)�� ���ڵ�(��)�� �����ϰ��� �ϴ� ���
-- UNION / UNION ALL �� ����� �� �ִ�.

SELECT *
FROM TBL_JUMUNBACKUP;
SELECT*
FROM TBL_JUMUN;

-- UNION �����ϰ���� ���̺� ���̿� UNION�� ���⸸ �ϸ��!
SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT*
FROM TBL_JUMUN;
-- UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT*
FROM TBL_JUMUN;


-- �ٸ��� ����
-- UNION 
SELECT *
FROM TBL_JUMUN
UNION
SELECT*
FROM TBL_JUMUNBACKUP;
-- UNION ALL
SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT*
FROM TBL_JUMUNBACKUP;

--�� UNION �� �׻� ������� ù ��° �÷��� ��������
--   �������� ������ �����Ѵ�.
--   UNION ALL�� ���յ� ������� ��ȸ�� ����� ��ȯ�Ѵ�.(���� ����)
--   �̷� ���� ���� ����� �����ϰ� �ִ� UNION�� ���ϰ� �� ũ��.
--   ����, UNION �� ��������� �ߺ��� ���� ������ ���
--   �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�Ѵ�.
-- UNION�� ���ϰ� �� ���ϴٴ� ��! / UNION ALL �� ������ �� ����!

--�� ���ݱ��� �ֹ����� ��� �����͸� ����
--   ��ǰ�� �� �ֹ����� ��ȸ�ϴ� �������� �����Ѵ�.
/*
-------------------------------
    ��ǰ�ڵ�    �� �ֹ���
-------------------------------
      ...           XX
      ...           XX

-------------------------------  
*/
SELECT JECODE "��ǰ�ڵ�", SUM(JUSU) "�� �ֹ���"
FROM 
(   SELECT JECODE, JUSU
    FROM TBL_JUMUN
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
)
GROUP BY JECODE
ORDER BY 2;
--==>>
/*
�Ǻ���	10
������	10
����Ĩ	20
Ģ��	30
�����	40
��īĨ	40
������	50
������	50
��Ĩ	60
Ȩ����	140
*/
-- ��ü���� ��ȸ
SELECT CASE WHEN GROUPING(JECODE) = 0 THEN JECODE 
            ELSE '��ü'
        END  "��ǰ�ڵ�"
     , SUM(JUSU) "�� �ֹ���"
FROM 
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
)
GROUP BY ROLLUP(JECODE);
--==>>
/*
������	10
����Ĩ	20
������	50
������	50
�Ǻ���	10
�����	40
Ģ��	30
��Ĩ	60
��īĨ	40
Ȩ����	140
��ü	450
*/

-- �� ������ �ذ��ϴ� �������� UNION �� ����ؼ��� �ȵȴ�. 
-- �ֹ������� ��ǰ�ڵ尡 ���� �ߺ����� �����ϴ� ��Ȳ�� �߻��ϱ� ����~!!!
SELECT JECODE "��ǰ�ڵ�", SUM(JUSU) "�� �ֹ���"
FROM 
(   SELECT JECODE, JUSU
    FROM TBL_JUMUN
    UNION
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
)
GROUP BY JECODE;
--==>>
/*
��Ĩ	30
����Ĩ	20
������	10
�����	20
�Ǻ���	10
Ģ��	30
��īĨ	40
������	50
������	50
Ȩ����	110
*/

--> �̹������� ���� Ʋ���κ�
SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT*
FROM TBL_JUMUNBACKUP;
-- �̰� �ƴ϶� �̰ſ�����!!!!!!!!! CHECK~!!!
SELECT JECODE, JUSU
FROM TBL_JUMUN
UNION ALL
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP;

--�� INTERSECT / MINUS (�� ������ / ������)
--  TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
--  ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� �ุ �����ϰ��� �Ѵ�.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP;
SELECT JECODE, JUSU
FROM TBL_JUMUN;

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
�����	20
��Ĩ	10
��Ĩ	20
Ȩ����	20
*/

--�� TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
--   ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸��� ��ȸ�Ѵ�.
--  (��ٷο� ����) ��(?), �ζ��κ�, ��������, ���ͼ�, ���Ͽ¿� �پ���!
SELECT T1.*
FROM
(
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP    
)T1
,
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T2
WHERE T1.JECODE = T2.JECODE
  AND T1.JUSU = T2.JUSU;
--==>>
/*
98787	Ȩ����	20	21/09/07
98788	�����	20	21/09/07
98789	��Ĩ	10	21/09/07
98790	��Ĩ	20	21/09/07
1	    Ȩ����	20	01/11/01
4	    ��Ĩ	10	01/11/02
7	    ��Ĩ	20	01/11/06
10	    �����	20	01/11/16
*/

-- ��� 1.

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
-==>>
/*
�����	20
��Ĩ	10
��Ĩ	20
Ȩ����	20
*/

SELECT JUNO,JECODE, JUSU,JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JUNO,JECODE, JUSU,JUDAY
FROM TBL_JUMUN;
--==>> ��ȸ��� ����


SELECT T2.JUNO "�ֹ���ȣ",T1.JECODE "��ǰ�ڵ�",T1.JUSU "�ֹ�����",T2.JUDAY "�ֹ�����"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN
(
    SELECT JUNO,JECODE, JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE, JUSU,JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE
AND T1.JUSU = T2.JUSU;
--==>>
/*
1	    Ȩ����	20	2001-11-01 09:00:10
4	    ��Ĩ	10	2001-11-02 15:16:17
7	    ��Ĩ	20	2001-11-06 19:10:10
10	    �����	20	2001-11-16 14:20:00
98787	Ȩ����	20	2021-09-07 14:26:03
98788	�����	20	2021-09-07 14:26:08
98789	��Ĩ	10	2021-09-07 14:26:12
98790	��Ĩ	20	2021-09-07 14:26:20
*/

-- ��� 2.
SELECT T.*
FROM
(
    SELECT JUNO,JECODE, JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE, JUSU,JUDAY
    FROM TBL_JUMUN
) T
--WHERE JECODE IN('Ȩ����','��Ĩ','�����')
--  AND JUSU IN(10,20);
--> �̷����ϸ� Ȩ����, ��Ĩ, ������� 10, 20�� �ٳ���

WHERE JECODE || JUSU IN('Ȩ����20','��Ĩ10','��Ĩ20','�����20');
--WHERE CONCAT(JECODE,JUSU) IN('Ȩ����20','��Ĩ10','��Ĩ20','�����20');
--WHERE CONCAT(JECODE,JUSU) =ANY('Ȩ����20','��Ĩ10','��Ĩ20','�����20');
-- �ٰ���!
--==>>
/*
1	    Ȩ����	20	2001-11-01 09:00:10
4	    ��Ĩ	10	2001-11-02 15:16:17
7	    ��Ĩ	20	2001-11-06 19:10:10
10	    �����	20	2001-11-16 14:20:00
98787	Ȩ����	20	2021-09-07 14:26:03
98788	�����	20	2021-09-07 14:26:08
98789	��Ĩ	10	2021-09-07 14:26:12
98790	��Ĩ	20	2021-09-07 14:26:20
*/




SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
�����	20
��Ĩ	10
��Ĩ	20
Ȩ����	20
*/

SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;
--==>>
/*
�����20
��Ĩ10
��Ĩ20
Ȩ����20
*/

-- 'Ȩ����20','��Ĩ10','��Ĩ20','�����20'�̰Ŵ� ���� �ڵ�� ��ȯ
-- �ڵ� ����� ����
SELECT T.*
FROM
(
    SELECT JUNO,JECODE, JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE, JUSU,JUDAY
    FROM TBL_JUMUN
) T
WHERE JECODE || JUSU IN(SELECT CONCAT(JECODE, JUSU)
                        FROM TBL_JUMUNBACKUP
                        INTERSECT
                        SELECT CONCAT(JECODE, JUSU)
                        FROM TBL_JUMUN);
--==>>
/*
1	    Ȩ����	20	2001-11-01 09:00:10
4	    ��Ĩ	10	2001-11-02 15:16:17
7	    ��Ĩ	20	2001-11-06 19:10:10
10	    �����	20	2001-11-16 14:20:00
98787	Ȩ����	20	2021-09-07 14:26:03
98788	�����	20	2021-09-07 14:26:08
98789	��Ĩ	10	2021-09-07 14:26:12
98790	��Ĩ	20	2021-09-07 14:26:20
*/


-- MINUS : ������
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> ��ġ�� �κ��� ������ �������� ��ȸ
/*
������	10
������	50
������	30
Ģ��	30
��īĨ	40
Ȩ����	50
*/

/*
    A = {10, 20, 30, 40, 50}
    B = {10, 20, 30}
    
    A - B = {40, 50}
*/

-- ������̺� ����ִ��� ������ذ� �� ����Ŭ�� ������� ����
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- CHECK~!!! �̷��� �ᵵ ��ȸ�Ǵ� ������ ����!!!
-- NATURAL JOIN :  ���̺���� �ڿ������� ����
-- �������ο����� �̰� ��� �ִ°Ŵ� ��������� �ʾƵ� ��!
-- ��ſ� �׷��� �ٶ����� ������ �ƴ�! �̷��� �ֱ��� ������ �˾Ƶ���!
-- ���Ҷ� ��񾲴¿� �� �츮�����ڰ� ����Ŭ�� ���� ������!
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;


-- ������ �̷��� �� ����������!
SELECT DEPT.DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

-- �׷���!! USGING ���� ��� ���̺���� ����ϸ� ��þ��ص���!
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING(DEPTNO);










