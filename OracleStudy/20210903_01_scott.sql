SELECT USER
FROM DUAL;
--==>> SCOTT

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ����
--   TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�Ѵ�.
--   �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
--  , ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

--  ��, ���糪�̴� �ѱ����� ������ ���� ������ �����Ѵ�.
--  ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��(����)��
--  �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
--  �׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
--  �� ����� ���� �޿� ���� 30% ����,
--  2000�� �̻� �ٹ��� �����
--  �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.
SELECT *
FROM TBL_SAWON;

--���� Ǭ Ǯ��
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE SUBSTR(JUBUN,7,1) WHEN '2' THEN '��'
                              WHEN '4' THEN '��'
            ELSE '��' 
            END "����"
     , EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1 "���糪��"
     , HIREDATE "�Ի���"
     , TO_CHAR(ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1))*12),'YYYY')
     ||'-' || TO_CHAR(HIREDATE,'MM-DD') "����������"
     , TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') 
     || SUBSTR(JUBUN,1,2)) + 1))*12),'YYYY')||'-'||TO_CHAR(HIREDATE,'MM-DD'),'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
     ,SAL "�޿�"
     , CASE WHEN TRUNC(SYSDATE - HIREDATE) >=2000 THEN SAL * 0.5 
            WHEN TRUNC(SYSDATE - HIREDATE) >=1000 THEN SAL * 0.3
            ELSE 0
            END "���ʽ�"
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	����	29	2001-01-03	2052-01-03	7548	11078	3000	900
1002	�̴ٿ�	    9510272234567	����	27	2010-11-05	2054-11-05	3955	12115	2000	0
1003	������	    0909014234567	����	13	2012-08-16	2068-08-16	3305	17148	1000	0
1004	�մ���	    9406032234567	����	28	1999-02-02	2053-02-02	8249	11474	4000	2000
1005	������	    0406034234567	����	18	2013-07-15	2063-07-15	2972	15289	1000	0
1006	���̰�	    0202023234567	����	20	2011-08-17	2061-08-17	3670	14592	2000	0
1007	���̳�	    8012122234567	����	42	1999-11-11	2039-11-11	7967	6642	3000	900
1008	������	    8105042234567	����	41	1999-11-11	2040-11-11	7967	7008	3000	900
1009	������	    7209301234567	����	50	1995-11-11	2031-11-11	9428	3720	3000	1500
1010	������	7001022234567	����	52	1995-10-10	2029-10-10	9460	2958	3000	1500
1011	���켱	    9001022234567	����	32	2001-10-10	2049-10-10	7268	10263	2000	600
1012	����	    8009011234567	����	42	1998-02-13	2039-02-13	8603	6371	4000	2000
1013	������	    8203051234567	����	40	2002-02-13	2041-02-13	7142	7102	3000	900
1014	������	    9208091234567	����	30	2002-02-13	2051-02-13	7142	10754	3000	900
1015	�賲��	    0202023234567	����	20	2015-01-10	2061-01-10	2428	14373	2000	0
*/

--����
SELECT CASE SUBSTR(JUBUN,7,1) WHEN '2' THEN '��'
                              WHEN '4' THEN '��'
            ELSE '��' 
            END "����"
FROM TBL_SAWON;

--����
SELECT TO_CHAR(SUBSTR(JUBUN,1,6),'YY-MM-DD')
FROM TBL_SAWON;
--==>> ����

-- ��....�ƴѰŰ���..
SELECT (TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE('1994-12-31','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24))/365 + 1 "��"
FROM DUAL;

--==>> 27.69315068493150684931506849315068493151

--��.....�𸣰�..
SELECT TO_DATE(SUBSTR(JUBUN,1,6),'YYMMDD')
FROM TBL_SAWON;
--==>> 2093-07-30


SELECT EXTRACT(YEAR FROM SYSDATE)
FROM TBL_SAWON;
--==>> 2021

SELECT DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)
FROM TBL_SAWON;
--==>>
/*
1993
1995
2009
1994
  :
  :
*/

-- ���� ���ϱ� �ϼ�
SELECT EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1
FROM TBL_SAWON;
/*
29
27
13
28
 :
 :
*/
--�� DECODE()
-- DECODE(�÷�, ����1, ���1, ����2, ���2, ����3, ���3..........) 
SELECT DECODE(5-2,1,'5-2=1',2, '5-2=2',3,'5-2=3','5-2�� �����')"��� Ȯ��"
FROM DUAL;
--==>> 5-2=3

--�� EXTRACT()
-- SYSDATE�ڸ����� ��¥Ÿ���̱⸸ �ϸ��!
SELECT TO_CHAR(SYSDATE,'YYYY') "1"      --2021      �� ������ �����Ͽ� ���� Ÿ������...
     , TO_CHAR(SYSDATE, 'MM') "2"       --09        �� ���� �����Ͽ� ���� Ÿ������... 
     , TO_CHAR(SYSDATE, 'D') "3"        --5         �� ���� �����Ͽ� ���� Ÿ������...
     , EXTRACT(YEAR FROM SYSDATE) "4"   --2021      �� ������ �����Ͽ� ���� Ÿ������...
     , EXTRACT(MONTH FROM SYSDATE) "5"  --9	        �� ���� �����Ͽ� ���� Ÿ������...
     , EXTRACT(DAY FROM SYSDATE) "6"    --2         �� ���� �����Ͽ� ���� Ÿ������...
FROM DUAL;
--> ��, ��, �� ���� �ٸ� ���� �Ұ�(��, ��, ��)

-- �ٹ��ϼ� �ϼ�
SELECT TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ� �ϼ�1"
     , TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) "�ٹ��ϼ� �ϼ�2"
FROM TBL_SAWON;

--���������� ������
--  ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��(����)��
--  �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
SELECT 60 - ������ ����
FROM TBL_SAWON;

SELECT 60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1)
FROM TBL_SAWON;

--���������� �ϼ�
--??���������Ͽ��� �� ���� ó�� ���� -> OK
SELECT HIREDATE 
     , TO_CHAR(ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1))*12),'YYYY')
     ||'-' || TO_CHAR(HIREDATE,'MM-DD')
FROM TBL_SAWON;

--�������� ���� �ϼ� �ϼ�--Ʋ��
SELECT ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1))*12) - SYSDATE
FROM TBL_SAWON;

--�������� ���� �ϼ� ((���� ��)))
SELECT HIREDATE
     , JUBUN
     , CASE WHEN SUBSTR(JUBUN,7,1)=1 OR SUBSTR(JUBUN,7,1)=2 
        THEN TRUNC(TO_DATE((TO_CHAR(TO_CHAR(SYSDATE,'YYYY')+ 60 -(TO_CHAR(SYSDATE, 'YYYY')-(1900+SUBSTR(JUBUN,1,2)) + 1))||'-'||SUBSTR(HIREDATE,6,2)||'-'||SUBSTR(HIREDATE,9,2)),'YYYY-MM-DD')- SYSDATE)
        ELSE TRUNC(TO_DATE((TO_CHAR(TO_CHAR(SYSDATE,'YYYY') + 60-(TO_CHAR(SYSDATE, 'YYYY')- (2000+SUBSTR(JUBUN,1,2)) + 1))||'-'||SUBSTR(HIREDATE,6,2)||'-'||SUBSTR(HIREDATE,9,2)),'YYYY-MM-DD')- SYSDATE)
       END "�����ϼ�" --
FROM TBL_SAWON;
--==>>
/*
2021-09-03	9307302234567	11322
2010-11-05	9510272234567	12115
2012-08-16	0909014234567	17148
1999-02-02	9406032234567	11474
2013-07-15	0406034234567	15289
2011-08-17	0202023234567	14592
1999-11-11	8012122234567	6642
1999-11-11	8105042234567	7008
1995-11-11	7209301234567	3720
1995-10-10	7001022234567	2958
2001-10-10	9001022234567	10263
1998-02-13	8009011234567	6371
2002-02-13	8203051234567	7102
2002-02-13	9208091234567	10754
2015-01-10	0202023234567	14373
*/


--  �׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
--  �� ����� ���� �޿� ���� 30% ����,
--  2000�� �̻� �ٹ��� �����
--  �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.

-- ���ʽ� �ϼ�1
SELECT TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) "�ٹ��ϼ�"
       , SAL
       , CASE WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) >=2000 THEN SAL * 0.5 
              WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) >=1000 THEN SAL * 0.3 
              WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) <2000 THEN SAL * 0.3 
              ELSE SAL * 0
              END "���ʽ�"
FROM TBL_SAWON;

--���ʽ� �ϼ�2
SELECT TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
     , SAL "�޿�"
     , CASE WHEN TRUNC(SYSDATE - HIREDATE) >=2000 THEN SAL * 0.5 
            WHEN TRUNC(SYSDATE - HIREDATE) >=1000 THEN SAL * 0.3
            ELSE 0
            END "���ʽ�"
FROM TBL_SAWON;

--�־ȴ�¡..?
SELECT DECODE(TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24)
            ,(TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24 )>= 1000 AND TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) < 2000)
            ,SAL*0.3,SAL*0.5)
FROM TBL_SAWON;


------�Բ� Ǭ Ǯ��----------------------------------------------------------

-- TBL_SAWON ���̺� �����ϴ� ������� 
-- �Ի���(HIREDATE) �÷����� ��, �ϸ� ��ȸ�ϱ�
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE,'MM-DD') "����"
FROM TBL_SAWON;
--==>>
/*
��ҿ�	    2001-01-03	01-03
�̴ٿ�	    2010-11-05	11-05
������	    2012-08-16	08-16
�մ���	    1999-02-02	02-02
������	    2013-07-15	07-15
���̰�	    2011-08-17	08-17
���̳�	    1999-11-11	11-11
������	    1999-11-11	11-11
������	    1995-11-11	11-11
������	1995-10-10	10-10
���켱	    2001-10-10	10-10
����	    1998-02-13	02-13
������	    2002-02-13	02-13
������	    2002-02-13	02-13
�賲��	    2015-01-10	01-10
*/

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE,'MM') "��", TO_CHAR(HIREDATE,'DD') "��"
FROM TBL_SAWON;
--==>>
/*
��ҿ�	    2001-01-03	01	03
�̴ٿ�	    2010-11-05	11	05
������	    2012-08-16	08	16
�մ���	    1999-02-02	02	02
������	    2013-07-15	07	15
���̰�	    2011-08-17	08	17
���̳�	    1999-11-11	11	11
������	    1999-11-11	11	11
������	    1995-11-11	11	11
������	1995-10-10	10	10
���켱	    2001-10-10	10	10
����	    1998-02-13	02	13
������	    2002-02-13	02	13
������	    2002-02-13	02	13
�賲��	    2015-01-10	01	10
*/

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE,'MM') ||'-'|| TO_CHAR(HIREDATE,'DD') "����"
FROM TBL_SAWON;
--==>>
/*
��ҿ�	    2001-01-03	01-03
�̴ٿ�	    2010-11-05	11-05
������	    2012-08-16	08-16
�մ���	    1999-02-02	02-02
������	    2013-07-15	07-15
���̰�	    2011-08-17	08-17
���̳�	    1999-11-11	11-11
������	    1999-11-11	11-11
������	    1995-11-11	11-11
������	1995-10-10	10-10
���켱	    2001-10-10	10-10
����	    1998-02-13	02-13
������	    2002-02-13	02-13
������	    2002-02-13	02-13
�賲��	    2015-01-10	01-10
*/

--�� ���� ����
--   TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�Ѵ�.
--   �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
--  , ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

--  ��, ���糪�̴� �ѱ����� ������ ���� ������ �����Ѵ�.
--  ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��(����)��
--  �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
--  �׸���, ���ʽ��� 4000�� �̻� 8000�� �̸� �ٹ��� �����
--  �� ����� ���� �޿� ���� 30% ����,
--  8000�� �̻� �ٹ��� �����
--  �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.

-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿�
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN �ֹι�ȣ 7��°�ڸ� 1���� '1' �Ǵ� '3' THEN '����'
            WHEN �ֹι�ȣ 7��°�ڸ� 1�Ⱑ '2' �Ǵ� '4' THEN '����'
            ELSE '����Ȯ�κҰ�' 
       END"����"
FROM TBL_SAWON;
------------------------------------------------------------------------
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�' 
       END"����"
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	����
1002	�̴ٿ�	    9510272234567	����
1003	������	    0909014234567	����
1004	�մ���	    9406032234567	����
1005	������	    0406034234567	����
1006	���̰�	    0202023234567	����
1007	���̳�	    8012122234567	����
1008	������	    8105042234567	����
1009	������	    7209301234567	����
1010	������	7001022234567	����
1011	���켱	    9001022234567	����
1012	����	    8009011234567	����
1013	������	    8203051234567	����
1014	������	    9208091234567	����
1015	�賲��	    0202023234567	����
*/


SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�' 
       END"����"
    -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
    , CASE WHEN 1900��� ���̶��.. 
           THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899) 
           WHEN 2000��� ���̶��...
           THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
           ELSE -1
      END "���糪��" 
FROM TBL_SAWON;
-----------------------------------------------------------------------------
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�' 
       END"����"
    -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
    , CASE WHEN �ֹι�ȣ 7��°�ڸ� 1���� '1' �Ǵ� '2'
           THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899) 
           WHEN �ֹι�ȣ 7��°�ڸ� 1���� '3' �Ǵ� '4'
           THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
           ELSE -1
      END "���糪��" 
FROM TBL_SAWON;
-----------------------------------------------------------------------------
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�' 
       END"����"
    -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
    , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
           --                                           -----------------
           --                                   ���ڿ��̱� ������ +����
           WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
           THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
           ELSE -1
      END "���糪��"
    , HIREDATE "�Ի���"
    , SAL "�޿�"
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	����	29	2001-01-03	3000
1002	�̴ٿ�	    9510272234567	����	27	2010-11-05	2000
1003	������	    0909014234567	����	13	2012-08-16	1000
1004	�մ���	    9406032234567	����	28	1999-02-02	4000
1005	������	    0406034234567	����	18	2013-07-15	1000
1006	���̰�	    0202023234567	����	20	2011-08-17	2000
1007	���̳�	    8012122234567	����	42	1999-11-11	3000
1008	������	    8105042234567	����	41	1999-11-11	3000
1009	������	    7209301234567	����	50	1995-11-11	3000
1010	������	7001022234567	����	52	1995-10-10	3000
1011	���켱	    9001022234567	����	32	2001-10-10	2000
1012	����	    8009011234567	����	42	1998-02-13	4000
1013	������	    8203051234567	����	40	2002-02-13	3000
1014	������	    9208091234567	����	30	2002-02-13	3000
1015	�賲��	    0202023234567	����	20	2015-01-10	2000
*/
-----------------------------------------------------------------
--��������
--; ��ġ ����
SELECT T.�����ȣ, T.����
FROM
(
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�", SAL*12 "����"
FROM TBL_SAWON
)T;


--���� �̷��� ��ȸ�ȴ°�
SELECT TBL_SAWON.SANO
FROM TBL_SAWON;

SELECT T.SANO
FROM TBL_SAWON T;


SELECT A.SANO
FROM
(
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
) A;
--==>> ���� �߻�
-- �����ȣ��� �÷��� ���������� SANO��� �÷��� ����!

SELECT A.�����ȣ, A.�����
FROM
(
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�"
FROM TBL_SAWON
) A;


SELECT A.�����ȣ, A.�����,A.����, A.����*2 "�ι迬��"
FROM
(                                                                       --            
SELECT SANO "�����ȣ", SANAME "�����", SAL "�޿�", SAL*12 "����"  --    |    �� �̸�ŭ �ζ��κ��� ��!
FROM TBL_SAWON                                                      --     |
) A;                                                                     --    


-- �ζ��κ�ȿ����� ����*2 "�ι迬��" �̰� �Ҽ����µ� (�Ľ̼���������)
-- �������������� ������~!!

--���ڴ� �������� ���ڴ� ��������
DESC TBL_SAWON;
-------------------------------------------------------------------------------
-- �ٽ� �̰��̿��ؼ� ����
-- �Ʊ��� ����������


--   �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
--  , ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

SELECT T.�����ȣ,T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
    -- ����������
    -- ���������⵵ �� �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��
    -- ���� ���̰�... 58��...2�� ��     2021 �� 2023
    -- ���� ���̰�... 35��...25�� ��     2021 �� 2046
    -- ADD_MONTHS(SYSDATE, ������� * 12)
    --                      -------
    --                      (60 - ���糪��)
    -- ADD_MONTHS(SYSDATE, (60 - ���糪��) *12) �� �� ������� �������� �⵵�� �ʿ�
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��) *12),'YYYY') �� �������� �⵵�� ����
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��) *12),'YYYY') || '-' || TO_CHAR(HIREDATE,''MM-DD')
    
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') || '-' || TO_CHAR(T.�Ի���,'MM-DD') "����������"
     
    -- �ٹ��ϼ� = ���糯¥ - �Ի���  �� �Ϸ縦 �� ä���� ���Ѱ� ��������!   --> ���������� �ִ°� �� ����!
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
     
    -- �����ϼ� = ������ - �Ի���
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') 
       || '-' || TO_CHAR(T.�Ի���,'MM-DD'),'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
       
    -- �޿�
     , T.�޿�
     
    -- ���ʽ�
    -- �ٹ��ϼ��� 4000�� �̻� 8000�� �̸� �� ���� �޿��� 30%
    -- �ٹ��ϼ��� 8000�� �̻� �� ���� �޿��� 50%
    -- �������� 0
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 8000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 4000 THEN T.�޿� * 0.3
            ELSE 0
       END "���ʽ�"
FROM
(
-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿�
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
                ELSE '����Ȯ�κҰ�' 
           END"����"
        -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
        , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
               --                                           -----------------
               --                                   ���ڿ��̱� ������ +����
               WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
               ELSE -1
          END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
    FROM TBL_SAWON
) T;

--------------------------------------------------------------------------------
-- �ּ�ó���� ������

--   �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
--  , ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�
SELECT T.�����ȣ,T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') || '-' || TO_CHAR(T.�Ի���,'MM-DD') "����������"
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') 
       || '-' || TO_CHAR(T.�Ի���,'MM-DD'),'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
     , T.�޿�
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 8000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 4000 THEN T.�޿� * 0.3
            ELSE 0
       END "���ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
                ELSE '����Ȯ�κҰ�' 
           END"����"
        , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
               WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
               ELSE -1
          END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
    FROM TBL_SAWON
) T;
--------------------------------------------------------------------------------
-- 1. ���ŷο� ���̱�����
-- 2. ���ȼ��� ����

--�� ��� ���뿡��... Ư�� �ٹ��ϼ��� ����� Ȯ���ؾ� �Ѵٰų�...
--   Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 ���� �� �ִ�.
--   �̿� ���� ���... �ش� �������� �ٽ� �����ϴ� ���ŷο��� ���� �� �ֵ���
--   ��(VIEW)�� ����� ������ �� �� �ִ�.

CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.�����ȣ,T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') || '-' || TO_CHAR(T.�Ի���,'MM-DD') "����������"
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') 
       || '-' || TO_CHAR(T.�Ի���,'MM-DD'),'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
     , T.�޿�
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 8000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 4000 THEN T.�޿� * 0.3
            ELSE 0
       END "���ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
                ELSE '����Ȯ�κҰ�' 
           END"����"
        , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
               WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
               ELSE -1
          END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>> ���� �߻�
/*
ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/
--> ������ ������Ͽ� �߻��ϴ� ����
-- SYS���׼� ���ѹ޾ƿ���(20210903_02_sys.sql)

--�� SYS �κ��� VIEW�� ������ �� �ִ� ������ �ο����� ��
--   �ٽ� ��(VIEW) ����
CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.�����ȣ,T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') || '-' || TO_CHAR(T.�Ի���,'MM-DD') "����������"
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) *12),'YYYY') 
       || '-' || TO_CHAR(T.�Ի���,'MM-DD'),'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
     , T.�޿�
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 8000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 4000 THEN T.�޿� * 0.3
            ELSE 0
       END "���ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
                ELSE '����Ȯ�κҰ�' 
           END"����"
        , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
               WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
               THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
               ELSE -1
          END "���糪��"
        , HIREDATE "�Ի���"
        , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_SAWON;

COMMIT;


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM VIEW_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	����	29	2001-01-03	2052-01-03	7548	11078	3000	900
1002	�̴ٿ�	    9510272234567	����	27	2010-11-05	2054-11-05	3955	12115	2000	0
1003	������	    0909014234567	����	13	2012-08-16	2068-08-16	3305	17148	1000	0
1004	�մ���	    9406032234567	����	28	1999-02-02	2053-02-02	8249	11474	4000	2000
1005	������	    0406034234567	����	18	2013-07-15	2063-07-15	2972	15289	1000	0
1006	���̰�	    0202023234567	����	20	2011-08-17	2061-08-17	3670	14592	2000	0
1007	���̳�	    8012122234567	����	42	1999-11-11	2039-11-11	7967	6642	3000	900
1008	������	    8105042234567	����	41	1999-11-11	2040-11-11	7967	7008	3000	900
1009	������	    7209301234567	����	50	1995-11-11	2031-11-11	9428	3720	3000	1500
1010	������	7001022234567	����	52	1995-10-10	2029-10-10	9460	2958	3000	1500
1011	���켱	    9001022234567	����	32	2001-10-10	2049-10-10	7268	10263	2000	600
1012	����	    8009011234567	����	42	1998-02-13	2039-02-13	8603	6371	4000	2000
1013	������	    8203051234567	����	40	2002-02-13	2041-02-13	7142	7102	3000	900
1014	������	    9208091234567	����	30	2002-02-13	2051-02-13	7142	10754	3000	900
1015	�賲��	    0202023234567	����	20	2015-01-10	2061-01-10	2428	14373	2000	0
*/

--> �並 ���� ������ ���ȼ��� ���Ǽ�

--�� TBL_SAWON ���̺��� ��ҿ� ����� �Ի��� �� �޿� ������ ����(�� ���� �Ŀ� ����)
--   ���� TABLE ���� : 1001	��ҿ�	9307302234567	2001-01-03	3000
--   ���� VIEW ����  : 1001	��ҿ�	9307302234567	����	29	2001-01-03	2052-01-03	7548	11078	3000	900

SELECT *
FROM TBL_SAWON;

UPDATE TBL_SAWON
SET HIREDATE = SYSDATE, SAL = 5000
WHERE SANO = 1001;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON
WHERE SANO = 1001;
--==>> 1001	��ҿ�	9307302234567	2021-09-03	5000

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM VIEW_SAWON;
--> �丸��� �� �� �� �����ߴµ� ��ȸ�ص� ����� ������ ��ȸ��!!
SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺��� ��ҿ� ����� �Ի��� �� �޿� ������ ���� ���� �ٽ� Ȯ��
--   ���� TABLE ���� : 1001	��ҿ�	9307302234567	2001-01-03	3000
--   ���� �� ����    : 1001	��ҿ�	9307302234567	2021-09-03	5000
--   ���� VIEW ����  : 1001	��ҿ�	9307302234567	����	29	2001-01-03	2052-01-03	7548	11078	3000	900
--   ���� �� ����    : 1001	��ҿ�	9307302234567	����	29	2021-09-03	2052-09-03	   0	11322	5000	  0

--�� ����
--   ���������� Ȱ���Ͽ� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
-----------------------------------------------------------
    �����  ����  ���糪��  �޿�  ���̺��ʽ�
-----------------------------------------------------------

��, ���̺��ʽ��� ���� ���̰� 40�� �̻��̸� �޿��� 70%
    30�� �̻� 40�� �̸��̸� �޿��� 50%
    20�� �̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�.
    
����, �ϼ��� ��ȸ ������ �������
VIEW_SAWON2 ��� �̸��� ��(VIEW)�� �����Ѵ�.
*/

--���� Ǭ��
/*
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.�����, T.����, T.���糪��, T.�޿�
     , CASE WHEN T.���糪��>=40 THEN T.�޿�*0.7 
            WHEN T.���糪��>=30 THEN T.�޿�*0.5
            WHEN T.���糪��>=20 THEN T.�޿�*0.3
            ELSE 0
            END "���̺��ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ",HIREDATE "�Ի���", SAL "�޿�"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1) IN('2','4') THEN '����' 
                ELSE '����Ȯ�κҰ�'
           END "����"
        , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
                   THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
                   WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
                   THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
                   ELSE -1  -- �׳� ����1�� �ð������� ó��
              END "���糪��"
    FROM TBL_SAWON
) T;

-- ���� ���̱��ϱ� ����
SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
            WHEN SUBSTR(JUBUN,7,1) IN ('3','4') THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
            ELSE -1
       END "���糪��"
FROM TBL_SAWON;
*/

-- Ǯ��


SELECT T.*
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7 
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
            ELSE 0
        END "���̺��ʽ�"
FROM
(
    SELECT SANAME "�����"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1) IN('2','4') THEN '����'
                ELSE 'Ȯ�κҰ�'
            END "����"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
            --  ELSE 'Ȯ�κҰ�' �̷����ϸ� �ڷ����� �ȸ��� ������ ���� �������ε� �길 �������̶� ������!
                ELSE -1
            END "���糪��"
           , SAL "�޿�"
    FROM TBL_SAWON
) T;

-- �ζ��κ�(FROM �� �ȿ� �ִ� ��������)�� �巡���ؼ� ����������� ������ �Ǿ�� ��!!

CREATE USER ������;
CREATE TABLE ���̺��;
CREATE INDEX �ε�����;
CREATE VIEW ���;              -- ���� ���� �ϴµ� ����
CREATE OR REPLACE VIEW ���;   -- OR REPLACE �̰ź��̴� ������?! �����ߴ��� �ǽ����ϸ� �������ϱ�!
                               -- OR REPLACE �̰� ������ �ٽ� �����ص� ������!!


CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.*
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7 
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
            ELSE 0
        END "���̺��ʽ�"
FROM
(
    SELECT SANAME "�����"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN('1','3') THEN '����'
                WHEN SUBSTR(JUBUN,7,1) IN('2','4') THEN '����'
                ELSE 'Ȯ�κҰ�'
            END "����"
         , CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) 
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999)
            --  ELSE 'Ȯ�κҰ�' �̷����ϸ� �ڷ����� �ȸ��� ������ ���� �������ε� �길 �������̶� ������!
                ELSE -1
            END "���糪��"
           , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON2��(��) �����Ǿ����ϴ�.

--�� ������ �� ��ȸ(Ȯ��)
SELECT *
FROM VIEW_SAWON2;
--==>>
/*
��ҿ�	    ����	29	5000	1500
�̴ٿ�	    ����	27	2000	600
������	    ����	13	1000	0
�մ���	    ����	28	4000	1200
������	    ����	18	1000	0
���̰�	    ����	20	2000	600
���̳�	    ����	42	3000	2100
������	    ����	41	3000	2100
������	    ����	50	3000	2100
������	����	52	3000	2100
���켱	    ����	32	2000	1000
����	    ����	42	4000	2800
������	    ����	40	3000	2100
������	    ����	30	3000	1500
�賲��	    ����	20	2000	600
*/

-- ������� ��������
--------------------------------------------------------------------------------

--�� RANK()  ���(����)�� ��ȯ�ϴ� �Լ�
-- ������ Ư���ϴ� ����!!
-- ������ ������ ��� ���� ������ �ο��� ���� ������ ������ �ǳ� �ٴ� ������ ���ڸ� �ο���
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP;
--==>>
/*
7839	KING	10	5000	 1
7902	FORD	20	3000 	 2
7788	SCOTT	20	3000 	 2
7566	JONES	20	2975	 4
7698	BLAKE	30	2850	 5
7782	CLARK	10	2450	 6
7499	ALLEN	30	1600	 7
7844	TURNER	30	1500	 8
7934	MILLER	10	1300	 9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	 950	13
7369	SMITH	20	 800	14
*/

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"        -- PARTITION BY ������ ������ �μ��� �������� ������ ����
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1	1
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7698	BLAKE	30	2850	1	5
7782	CLARK	10	2450	2	6
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7934	MILLER	10	1300	3	9
7521	WARD	30	1250	4	10
7654	MARTIN	30	1250	4	10
7876	ADAMS	20	1100	4	12
7900	JAMES	30	950	    6	13
7369	SMITH	20	800	    5	14
*/

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"        -- PARTITION BY ������ ������ �μ��� �������� ������ ����
     , RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP
ORDER BY 3,4 DESC;
--==>> �̷��� ���� ���� ����
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	6
7934	MILLER	10	1300	3	9
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7876	ADAMS	20	1100	4	12
7369	SMITH	20	 800	5	14
7698	BLAKE	30	2850	1	5
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7654	MARTIN	30	1250	4	10
7521	WARD	30	1250	4	10
7900	JAMES	30	 950	6	13
*/

--�� DENSE_RANK()    �� ������ ��ȯ�ϴ� �Լ�
-- ���� ��ȸ�Ѱſ��� �������������ϱ� 1�� 2�� �׸��� �ٷ� 3���!
-- RANK() ��ſ� DENSE_RANK() ����!
-- ������ ������ ��� ���� ������ �ο��ϰ� ���� ������ �����ϴ� �溡
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ��� �޿�����"        -- PARTITION BY ������ ������ �μ��� �������� ������ ����
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "��ü �޿�����"
FROM EMP
ORDER BY 3,4 DESC;
--==>>
/*
7839	KING	10	5000	1	 1
7782	CLARK	10	2450	2	 5
7934	MILLER	10	1300	3	 8
7902	FORD	20	3000	1	 2
7788	SCOTT	20	3000	1	 2
7566	JONES	20	2975	2	 3          --> 2������ ����!!
7876	ADAMS	20	1100	3	10
7369	SMITH	20	 800	4	12
7698	BLAKE	30	2850	1	 4
7499	ALLEN	30	1600	2	 6
7844	TURNER	30	1500	3	 7
7654	MARTIN	30	1250	4	 9
7521	WARD	30	1250	4	 9
7900	JAMES	30	 950	5	11
*/

--�� EMP ���̺��� ��� ������
--   �����, �μ���ȣ, ����, �μ��� ��������, ��ü ���� ���� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", DEPTNO "�μ���ȣ"
     , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "COALESCE ����"
     , SAL*12 + NVL(COMM,0) "NVL ����"
     , NVL2(COMM, SAL*12+COMM, SAL*12) "NVL2 ����"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY COALESCE(SAL*12+COMM, SAL*12, COMM, 0) DESC) "�μ��� ��������"
     , RANK() OVER(ORDER BY COALESCE(SAL*12+COMM, SAL*12, COMM, 0) DESC) "��ü ��������"
     , DENSE_RANK() OVER(ORDER BY COALESCE(SAL*12+COMM, SAL*12, COMM, 0) DESC) "��ü ���� ���� �׸�"
FROM EMP
ORDER BY 2,3 DESC;
--==>>
/*
KING	10	60000	60000	60000	1	1	1
CLARK	10	29400	29400	29400	2	6	5
MILLER	10	15600	15600	15600	3	10	9
FORD	20	36000	36000	36000	1	2	2
SCOTT	20	36000	36000	36000	1	2	2
JONES	20	35700	35700	35700	3	4	3
ADAMS	20	13200	13200	13200	4	12	11
SMITH	20	 9600	9600	9600	5	14	13
BLAKE	30	34200	34200	34200	1	5	4
ALLEN	30	19500	19500	19500	2	7	6
TURNER	30	18000	18000	18000	3	8	7
MARTIN	30	16400	16400	16400	4	9	8
WARD	30	15500	15500	15500	5	11	10
JAMES	30	11400	11400	11400	6	13	12
*/

-- + ORDER BY�� ���� ���
SELECT ENAME "�����", DEPTNO "�μ���ȣ"
     , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "����"
FROM EMP
ORDER BY 3 DESC;
--==>>
/*
KING	10	60000
FORD	20	36000
SCOTT	20	36000
JONES	20	35700
BLAKE	30	34200
CLARK	10	29400
ALLEN	30	19500
TURNER	30	18000
MARTIN	30	16400
MILLER	10	15600
WARD	30	15500
ADAMS	20	13200
JAMES	30	11400
SMITH	20	 9600
*/
-- ++ ROW_NUMBER()
-- ���� �����ص� �ٸ� ������ �ο��ϴ� ���
SELECT ENAME "�����", DEPTNO "�μ���ȣ"
     , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "COALESCE ����"
     , ROW_NUMBER() OVER(ORDER BY COALESCE(SAL*12+COMM, SAL*12, COMM, 0)) "���� ����"
FROM EMP;
--==>>
/*
SMITH	20	9600	1
JAMES	30	11400	2
ADAMS	20	13200	3
WARD	30	15500	4
MILLER	10	15600	5
MARTIN	30	16400	6
TURNER	30	18000	7
ALLEN	30	19500	8
CLARK	10	29400	9
BLAKE	30	34200	10
JONES	20	35700	11
SCOTT	20	36000	12
FORD	20	36000	13
KING	10	60000	14
*/

SELECT T.*
     , RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC) "�μ��� ��������"
     , RANK() OVER(ORDER BY T.���� DESC) "��ü ��������"
FROM
(
SELECT ENAME "�����"
     , DEPTNO "�μ���ȣ"
     , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "����"
FROM EMP
) T
ORDER BY 2,3 DESC;
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
MILLER	10	15600	3	10
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
WARD	30	15500	5	11
JAMES	30	11400	6	13
*/


--�� EMP ���̺��� ��ü ���� ������ 1����� 5�������...
--   �����, �μ���ȣ, ����, ��ü�������� �׸����� ��ȸ�Ѵ�.

------------���� Ǭ Ǯ��---------------------------
SELECT T.*
     --, RANK() OVER(ORDER BY T.���� DESC) "��ü��������"
     --, CASE WHEN (RANK() OVER(ORDER BY T.���� DESC))<= 5 THEN RANK() OVER(ORDER BY T.���� DESC) ELSE 0 END "5�����"
FROM 
(
SELECT ENAME "�����", DEPTNO "�μ���ȣ"
     , SAL*12+NVL(COMM,0) "����"
     ,RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
FROM EMP
) T
WHERE T.��ü�������� <= 5;

-- ���� Ǭ Ǯ�� ù �õ����� �Ѱ� ���λ����� ������Ű���� ��ø �������� �����! �Ʒ��� Ǯ������!

----------------Ǯ��------------------
SELECT �����, �μ���ȣ, ����, ��ü��������
FROM EMP
WHERE ��ü ���� ������ 1����� 5��;


SELECT ENAME "�����", DEPTNO "�μ���ȣ"
     , SAL*12+NVL(COMM,0) "����"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
FROM EMP
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) <= 5;
--==>>
/*
ORA-30483: window  functions are not allowed here
30483. 00000 -  "window  functions are not allowed here"
*Cause:    Window functions are allowed only in the SELECT list of a query.
           And, window function cannot be an argument to another window or group
           function.
*Action:
1,026��, 37������ ���� �߻�
*/
--window  functions == RANK()�Լ�
--�� ���� ������ RANK() OVER() �� WHERE ���������� ����� ����̸�...
--   �� �Լ��� WHERE ���������� ����� �� ���� �Լ��̸�
--   �� ��Ģ�� ���� ������ �߻��ϴ� �����̴�.
--   �� ���... �츮�� INLINE VIEW �� Ȱ���Ͽ� Ǯ���ؾ� �Ѵ�.

SELECT T.*
FROM
(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ"
         , SAL*12+NVL(COMM,0) "����"
         , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü��������"
    FROM EMP
) T
WHERE T.��ü�������� <=5;


--�������� ��ø---------------------------------------
SELECT T2.*
FROM
(
    SELECT T1.*
         , RANK() OVER(ORDER BY T1.���� DESC) "��ü��������"
    FROM
    (
        SELECT ENAME "�����", DEPTNO "�μ���ȣ"
             , SAL*12+NVL(COMM,0) "����"
        FROM EMP
    ) T1
) T2
WHERE T2.��ü�������� <=5;
--==>> ; �̰� ���������Ҷ� ����!!!!!!!!
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/


--�� EMP ���̺��� �� �μ����� ���� ����� 1����� 2�������...
--   �����, �μ���ȣ, ����, �μ����������, ��ü������� �׸��� ��ȸ�� �� �ֵ��� �Ѵ�.

-- RANK() ���------------------------------------------------------------------
SELECT T.*
FROM
(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ"
         , SAL*12+NVL(COMM,0) "����"
         , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "�μ����������"
         , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü�������"
    FROM EMP
) T
WHERE T.�μ���������� <= 2;
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
FORD	20	36000	1	2
SCOTT	20	36000	1	2
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
*/

-- DENSE_RANK() ���------------------------------------------------------------
SELECT T.*
FROM
(
    SELECT ENAME "�����", DEPTNO "�μ���ȣ"
         , SAL*12+NVL(COMM,0) "����"
         , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC) "�μ����������"
         , DENSE_RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) "��ü�������"
    FROM EMP
) T
WHERE T.�μ���������� <= 2;
/*
KING	10	60000	1	1
CLARK	10	29400	2	5
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	2	3
BLAKE	30	34200	1	4
ALLEN	30	19500	2	6
*/

-- ��ø �������� ���----------------------------------------------------------
SELECT T1.*
FROM
(
    SELECT T.*
         , RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC) "�μ�����������"
         , RANK() OVER(ORDER BY T.���� DESC) "��ü��������"
    FROM
    (
        SELECT ENAME "�����", DEPTNO "�μ���ȣ"
             , COALESCE(SAL*12+COMM, SAL*12, COMM,0) "����"
        FROM EMP
    )T
) T1
WHERE T1.�μ�����������<=2;
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
FORD	20	36000	1	2
SCOTT	20	36000	1	2
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
*/
--------------------------------------------------------------------------------

--���� �׷� �Լ� ����--

-- SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�,
-- VARIANCE() �л�, STDDEV() ǥ������

--�� �׷��Լ��� ���� ū Ư¡��
--   ó���ؾ� �� �����͵� �� NULL �� �����ϸ�
--   �� NULL �� �����ϰ� ������ �����Ѵٴ� ���̴�.

-- SUM()
-- EMP ���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�.
SELECT SUM(SAL)      -- 800+1600+1250+2975+1250+2850+...+1300
FROM EMP;
--==>> 29025

SELECT SUM(COMM)      -- NULL+300+500+NULL+...+NULL (X)
FROM EMP;             -- 300+500+1400+0             (O)
--==>> 2200
-- NULL�� � ������ �ص� NULL �̾��µ� SUM�� ���� ����!

SELECT COMM
FROM EMP;

-- COUNT()
-- ���� ���� ��ȸ�Ͽ� ����� ��ȯ
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(SAL)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)      -- COMM �÷��� ���� ���� ��ȸ �� -- NULL�� ����~!!!
FROM EMP;
--==>> 4

-- �׷��� �̷��� ���ڸ� ���°� �Ϲ�����
SELECT COUNT(*)
FROM EMP;
--==>> 14

--�� AVG()
-- ��� ��ȯ
SELECT SUM(SAL) / COUNT(SAL) "1", AVG(SAL) "2"
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
2073.214285714285714285714285714285714286
*/

-- ������ ��
SELECT AVG(COMM)
FROM EMP;
--==>> 550

SELECT SUM(COMM) / COUNT(COMM)
FROM EMP;
--==>> 550

-- ������ �̰� ����!!�ο�����ŭ �������ϴµ� SUM, COUNT, AVG�� NULL�� �ݿ��ϴϱ�! 
SELECT SUM(COMM) / 14
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--�׷��� �ùٸ� ��հ� ��ȸ�� �̷���!!!
SELECT SUM(COMM) / COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--�� ǥ�������� ������ �л�
--   �л��� �������� ǥ������
SELECT AVG(SAL), VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
1398313.87362637362637362637362637362637	
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL),2) "�޿�ǥ����������"
     , VARIANCE(SAL) "�޿��л�"
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)) "�޿��л�������"
     , STDDEV(SAL) "�޿�ǥ������"
FROM EMP;
--==>>
/*
1182.503223516271699458653359613061928508	
1182.503223516271699458653359613061928508
*/

-- �л�� ǥ������ ���� ���!!



--�� MAX() / MIN()
--  �ִ밪 / �ּҰ� ��ȯ
SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--==>> 5000	800


--�� ����
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> ���� �߻�
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
1,264��, 8������ ���� �߻�
*/
--  ���ڵ� ���� ��ü�� �ȸ���!!(������) (������) �Ʒ� Ȯ��!

SELECT ENAME, SAL
FROM EMP;
/* (������)
SMITH	800
ALLEN	1600
WARD	1250
JONES	2975
MARTIN	1250
BLAKE	2850
CLARK	2450
SCOTT	3000
KING	5000
TURNER	1500
ADAMS	1100
JAMES	950
FORD	3000
MILLER	1300
*/
SELECT SUM(SAL)
FROM EMP;
--==>> (������) 29025


SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> ���� �߻�
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
1,298��, 8������ ���� �߻�
*/

----�׷��� ���°��� GROUP BY��! �׷��� �׷��Լ�!

--�� �μ��� �޿��� ��ȸ
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>
/*
10	 8750
20	10875
30	 9400
*/

--�� ������ �޿��� ��ȸ
SELECT JOB "������", SUM(SAL) "�޿���"
FROM EMP
GROUP BY JOB;
--==>>
/*
CLERK	    4150
SALESMAN	5600
PRESIDENT	5000
MANAGER	    8275
ANALYST	    6000
*/

--�� ROLLUP
-- ROLLUP�� �����ؼ� ����ϴ� ��찡 �� ����!!!
-- DEPTNO�� ��� ���� ���ߴµ� �̰� ��ü �� �� �ϳ��� �߰�!
SELECT DEPTNO "�μ���ȣ", SUM(SAL) "�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
(NULL)	29025
*/

-------------------------------------------------------------------------------
-- ���⼭���ʹ� TBL_EMP�� ��ȸ!

--�� ������ �Է�
INSERT INTO TBL_EMP VALUES
(8001, '������', 'CLERK',7566, SYSDATE,1500,10,NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8002, '������', 'CLERK',7566, SYSDATE,1000,0,NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_EMP;

SELECT *
FROM EMP;
