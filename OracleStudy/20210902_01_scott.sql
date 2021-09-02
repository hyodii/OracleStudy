SELECT USER
FROM DUAL;
--==>> SCOTT

/*

  ���Ϲ�ȣ ���ϸ�                                                                                                 
---------- ------------------------------------------
         1 C:\AAA\BBB\CCC\SALES.DOC                                                                            
         2 C:\AAA\PANMAE.XXLS                                                                                  
         3 D:\RESEARCH.PPT                                                                                     
         4 C:\DOCUMENTS\STUDY.HWP                                                                              
         5 C:\DOCUMENTS\TEMP\SQL.TXT                                                                           
         6 D:\SHARE\F\TEST.PNG                                                                                 
         7 C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG                                                           
         8 C:\ORACLESTUDY\20210901_01_SCOTT.SQL    
*/
--�� TBL_FILES ���̺��� ������� ���� ���� ��ȸ�� �� �ֵ���
--   �������� �����Ѵ�.
SELECT FILENO "���Ϲ�ȣ", FILENAME "������� ���ϸ�", SUBSTR(FILENAME,16,9) "���ϸ�"
FROM TBL_FILES
WHERE FILENO=1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO "���Ϲ�ȣ", FILENAME "������� ���ϸ�", SUBSTR(FILENAME,16,9) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC
2	C:\AAA\PANMAE.XXLS	XLS
3	D:\RESEARCH.PPT	
4	C:\DOCUMENTS\STUDY.HWP	UDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT	MP\SQL.TX
6	D:\SHARE\F\TEST.PNG	.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG	G\PICTURE
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL	20210901_
*/

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�", REVERSE(FILENAME) "�Ųٷ�"
FROM TBL_FILES;
/*
COD.SELAS               \CCC\BBB\AAA\:C
SLXX.EAMNAP             \AAA\:C
TPP.HCRAESER            \:D
PWH.YDUTS               \STNEMUCOD\:C
TXT.LQS                 \PMET\STNEMUCOD\:C
GNP.TSET                \F\ERAHS\:D
GPJ.GNIRPS              \OTOHP\ERUTCIP\GNODLIUG\RESU\:C
LQS.TTOCS_10_10901202   \YDUTSELCARO\:C
*/

-- �������� ������ �������� �ڸ��� �ٽ� �������� ��!
SELECT REVERSE(FILENAME) ,INSTR(REVERSE(FILENAME),'\',1,1), SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1,1)-1)
    , REVERSE(SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1,1)-1))
FROM TBL_FILES;
--==>> Ǯ����..1
/*
COD.SELAS\CCC\BBB\AAA\:C	                10	COD.SELAS	                SALES.DOC
SLXX.EAMNAP\AAA\:C	                        12	SLXX.EAMNAP	                PANMAE.XXLS
TPP.HCRAESER\:D	                            13	TPP.HCRAESER	            RESEARCH.PPT
PWH.YDUTS\STNEMUCOD\:C	                    10	PWH.YDUTS	                STUDY.HWP
TXT.LQS\PMET\STNEMUCOD\:C	                8	TXT.LQS	                    SQL.TXT
GNP.TSET\F\ERAHS\:D	                        9	GNP.TSET	                TEST.PNG
GPJ.GNIRPS\OTOHP\ERUTCIP\GNODLIUG\RESU\:C	11	GPJ.GNIRPS	                SPRING.JPG
LQS.TTOCS_10_10901202\YDUTSELCARO\:C	    22	LQS.TTOCS_10_10901202	    20210901_01_SCOTT.SQL
*/

SELECT FILENO "���Ϲ�ȣ", REVERSE(SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1,1)-1))
FROM TBL_FILES;
--==>> Ǯ����..2
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210901_01_SCOTT.SQL
*/


SELECT FILENO "���Ϲ�ȣ", SUBSTR( FILENAME, INSTR(FILENAME,'\',-1)+1)
FROM TBL_FILES;
--==>> Ǯ����..3
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210901_01_SCOTT.SQL
*/

SELECT *
FROM TBL_FILES;

------------------------Ǯ��--------------------------
SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�", REVERSE(FILENAME) "�Ųٷ�"
FROM TBL_FILES;
/*
1	C:\AAA\BBB\CCC\SALES.DOC	                COD.SELAS\CCC\BBB\AAA\:C
2	C:\AAA\PANMAE.XXLS	                        SLXX.EAMNAP\AAA\:C
3	D:\RESEARCH.PPT	                            TPP.HCRAESER\:D
4	C:\DOCUMENTS\STUDY.HWP	                    PWH.YDUTS\STNEMUCOD\:C
5	C:\DOCUMENTS\TEMP\SQL.TXT	                TXT.LQS\PMET\STNEMUCOD\:C
6	D:\SHARE\F\TEST.PNG	                        GNP.TSET\F\ERAHS\:D
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG	GPJ.GNIRPS\OTOHP\ERUTCIP\GNODLIUG\RESU\:C
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL	    LQS.TTOCS_10_10901202\YDUTSELCARO\:C
*/
SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, ���� '\'�� �����ϴ� ��ġ -1) "�Ųٷε� ���ϸ�"
FROM TBL_FILES;

-- ���� '\'�� �����ϴ� ��ġ
INSTR(REVERSE(FILENAME),'\',1)      -- ������ �Ű����� 1 ����  
     
SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME),'\',1) -1) "�Ųٷε� ���ϸ�"
FROM TBL_FILES;     
/*
 ���Ϲ�ȣ ����������ϸ�                                     �Ųٷε� ���ϸ�                                                                                            
---------- ------------------------------------------------- ------------------------
         1 C:\AAA\BBB\CCC\SALES.DOC                          COD.SELAS                                                                                           
         2 C:\AAA\PANMAE.XXLS                                SLXX.EAMNAP                                                                                         
         3 D:\RESEARCH.PPT                                   TPP.HCRAESER                                                                                        
         4 C:\DOCUMENTS\STUDY.HWP                            PWH.YDUTS                                                                                           
         5 C:\DOCUMENTS\TEMP\SQL.TXT                         TXT.LQS                                                                                             
         6 D:\SHARE\F\TEST.PNG                               GNP.TSET                                                                                            
         7 C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG         GPJ.GNIRPS                                                                                          
         8 C:\ORACLESTUDY\20210901_01_SCOTT.SQL              LQS.TTOCS_10_10901202    
*/     
SELECT FILENO "���Ϲ�ȣ"--, FILENAME "����������ϸ�"
     ,REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME),'\',1) -1)) "���ϸ�"
FROM TBL_FILES;      
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210901_01_SCOTT.SQL
*/   

     
     
--�� LPAD()     
--> Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
-- ���Լ��� ������ �׻� �� ��° �Ķ���͸� ���� ����!
SELECT 'ORCAL' "1"
      , LPAD('ORACLE',10,'*') "2"
FROM DUAL;
--==>> ORCAL	****ORACLE
--> 1. 10Byte ������ Ȯ���Ѵ�.                 �� �� ��° �Ķ���� ���� ����...
--  2. Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�. �� ù ��° �Ķ���� ���� ����...
--  3. �����ִ� Byte ������ ���ʺ��� �� ��° �Ķ���� ������ ä���.
--  4. �̷��� ������ ���� ������� ��ȯ�Ѵ�.

--�� RPAD()       
--> Byte ������ Ȯ���Ͽ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORCAL' "1"
      , RPAD('ORACLE',10,'*') "2"
FROM DUAL;
--==>> ORCAL	ORACLE****
--> 1. 10Byte ������ Ȯ���Ѵ�.                 �� �� ��° �Ķ���� ���� ����...
--  2. Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�. �� ù ��° �Ķ���� ���� ����...
--  3. �����ִ� Byte ������ �����ʺ��� �� ��° �Ķ���� ������ ä���.
--  4. �̷��� ������ ���� ������� ��ȯ�Ѵ�.     
     
--�� TRIM() �ڹٿ����� �������
-- ����Ŭ������ LTRIM() / RTRIM()
--> �����ϰ� ó���ϴ°� ������ ������ �Լ�

--�� LTRIM()
SELECT 'ORAORAORACLEORACLE' "1"     -- ���� ���� ����Ŭ ����Ŭ
     , LTRIM('ORAORAORACLEORACLE', 'ORA') "2"
     , LTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"
     , LTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
     , LTRIM('ORA ORAORACLEORACLE', 'ORA') "5"
     , LTRIM('          ORAORAORACLEORACLE', ' ') "6"
     , LTRIM('                      ORACLE') "7"    -- ���� ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;   
--==>> 
/*
ORAORAORACLEORACLE	CLEORACLE	CLEORACLE	oRAORACLEORACLE	 ORAORACLEORACLE	ORAORAORACLEORACLE	ORACLE
*/
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  ���ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.

--ORA �����̷� �ڸ��°� �ƴ�
--�ϳ��� 'ORA' Ȯ���ؼ� O �ϳ� R �ϳ� A �ϳ� �̷������� ��� Ȯ���ؼ� �������ó�� �ڸ�
--��ҹ��� �����Ѵ�!
--���鵵 �Ϲݹ��ڿ� �Ȱ��� ó��!  �߰��� �ִ� ������ ������!(�ڹٿ����� ��������)

SELECT LTRIM('�̱���̱�����̽Žű��̽Ž��̱����̽Ź��̱��', '�̱��') "TEST"
FROM DUAL;
--==>> ���̱��

--�� RTRIM()     
SELECT 'ORAORAORACLEORACLE' "1"     -- ���� ���� ����Ŭ ����Ŭ
     , RTRIM('ORAORAORACLEORACLE', 'ORA') "2"
     , RTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"
     , RTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
     , RTRIM('ORA ORAORACLEORACLE', 'ORA') "5"
     , RTRIM('          ORAORAORACLEORACLE', ' ') "6"
     , RTRIM('ORACLE                      ') "7"    -- ������ ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;      
--==>>
/*
ORAORAORACLEORACLE	ORAORAORACLEORACLE	AAAORAORAORACLEORACLE	ORAoRAORACLEORACLE	ORA ORAORACLEORACLE	          ORAORAORACLEORACLE	ORACLE
*/
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
--  �����ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�.     
     
--�� TRANSLATE()     
--> 1:1 �� �ٲپ� �ش�.     

SELECT TRANSLATE('MY ORACLE SERVER'
               , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
               , 'abcdefghijklmnopqrstuvwxyz') "RESULT"
FROM DUAL;
--==>> my oracle server
     
SELECT TRANSLATE('010-8743-7042'
                ,'0123456789'
                ,'�����̻�����ĥ�ȱ�') "RESULT"
FROM DUAL;    
--==>> ���Ͽ�-��ĥ���-ĥ������     
     
--�� REPLAECE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '����')
FROM DUAL;
--==>> MY ����CLE ����HOME     

--------------------------------------------------------------------------------
     
--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "1"
     , ROUND(48.678,2) "2"      -- �Ҽ��� ���� ��°�ڸ����� ǥ��(�� ��° �ڸ����� �ݿø�)
     , ROUND(48.674,2) "3"
     , ROUND(48.674,1) "4"
     , ROUND(48.674,0) "5"      -- ������ ǥ��
     , ROUND(48.674) "6"        -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
     , ROUND(48.674,-1) "7"     -- 10�� �ڸ����� ǥ��
     , ROUND(48.674,-2) "8"     -- 100�� �ڸ����� ��ȿ�ϰ� ǥ��
     , ROUND(48.674,-3) "9"     -- 1000�� �ڸ����� ��ȿ�ϰ� ǥ��
FROM DUAL;
--==>> 48.678	48.68	48.67	48.7	49	49	50	0	0     
     
--�� TRUNC()  ������ ó�����ִ� �Լ�   
SELECT 48.678 "1"
     , TRUNC(48.678,2) "2"      -- �Ҽ��� ���� ��°�ڸ����� ǥ��(�� ��° �ڸ����� �ݿø�)
     , TRUNC(48.674,2) "3"
     , TRUNC(48.674,1) "4"
     , TRUNC(48.674,0) "5"      -- ������ ǥ��
     , TRUNC(48.674) "6"        -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
     , TRUNC(48.674,-1) "7"     -- 10�� �ڸ����� ǥ��
     , TRUNC(48.674,-2) "8"     -- 100�� �ڸ����� ��ȿ�ϰ� ǥ��
     , TRUNC(48.674,-3) "9"     -- 1000�� �ڸ����� ��ȿ�ϰ� ǥ��
FROM DUAL;     
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0     

--�� MOD() �������� ��ȯ�ϴ� �Լ� %      
SELECT MOD(5,2) "RESULT"
FROM DUAL;     
--==>> 1
--> 5�� 2�� ���� ������ ����� ��ȯ

--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�.
SELECT POWER(5,3) "RESULT"
FROM DUAL;
--==>> 125
--> 5�� 3���� ��������� ��ȯ

--�� SQRT() ��Ʈ ����� ��ȯ�ϴ� �Լ�
SELECT SQRT(2)
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2�� ���� ����� ��ȯ

--�� LOG �α� �Լ�
--  (�� ����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α�, �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10,100), LOG(10,20)
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677

--�� �ﰢ�Լ�
--  ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/

--�� �ﰢ�Լ��� ���Լ� ���� : -1 ~ 1)
--   �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>> 
/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805	
0.4636476090008061162142562314612144020295
*/

-- ��������� DB���� ������ ���ξ�����
-- �̰� ������
--�� SIGN()      ����, ��ȣ, Ư¡
--> ���� ������� ����̸� 1, 0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-8)
FROM DUAL;
--==>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� �ַ� ����Ѵ�.

--�� ASCII(), CHR()  �� ���� �����ϴ� ������ �Լ�
SELECT ASCII('A') "RESULT1", CHR(65) "RESULT2"
FROM DUAL;
--==>> 65	A
--> ASCII() : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
--  CHR()   : �Ű������� �Ѱܹ��� ���ڸ� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�.


-- ���� ���� Ÿ��
--------------------------------------------------------------------------------
-- ��¥���� Ÿ��

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥������ �⺻ ������ DAY(�ϼ�)�̴�~!!! CHECK~!!!
SELECT SYSDATE "1", SYSDATE+1 "2", SYSDATE-2 "3", SYSDATE+3"4"
FROM DUAL;
--==>> 
/*
2021-09-02 10:35:54	        -- ����
2021-09-03 10:35:54	        -- 1�� ��
2021-08-31 10:35:54	        -- 2�� ��
2021-09-05 10:35:54         -- 3�� ��
*/

--�� �ð� ���� ����
SELECT SYSDATE "1", SYSDATE + 1/24 "2", SYSDATE - 2/24 "3"
FROM DUAL;
-==>>
/*
2021-09-02 10:38:09	        -- ����	
2021-09-02 11:38:09	        -- �ѽð� ��	
2021-09-02 08:38:09	        -- 2�ð� ��
*/

--�� ���� �ð���... ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.

/*
---------------------------------------------------------------
        ����ð�                ���� �� �ð�
---------------------------------------------------------------
    2021-09-02 10:40:13      2021-09-03 12:43:17
---------------------------------------------------------------
*/
-- ���� Ǯ�� ��~!
SELECT SYSDATE "����ð�", SYSDATE +1 +2/24 + 3/24/60 + 4/24/60/3600 "���� �� �ð�"
FROM DUAL;
--==>>
/*
����ð�                ���� �� �ð�            
------------------- -------------------
2021-09-02 10:45:01	2021-09-03 12:48:01
*/

-- ���1. (�ϴ��� ���)
SELECT SYSDATE "����ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "���� �� �ð�"
FROM DUAL;
--==>>
/*
2021-09-02 11:04:11	
2021-09-03 13:07:15
*/

-- ���2. (�ʴ��� ���)
SELECT SYSDATE "����ð�"
     , SYSDATE + ((24*60*60) + (2*60*60 ) + (3*60) + 4) / (24*60*60) "���� �� �ð�"
     --              1��         2�ð�        3��    4��     
FROM DUAL;
--==>>
/*
2021-09-02 11:07:13	
2021-09-03 13:10:17
*/
--> ���1,2 �Ѵ� �� �� �˾ƾ���!

--�� ��¥ - ��¥ = �ϼ� 
-- ex) (2021-12-28) - (2021-09-02)
--         ������          ������
SELECT TO_DATE('2021-12-28','YYYY-MM-DD') - TO_DATE('2021-09-02','YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 117


--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2021-09-02','YYYY-MM-DD') "���"      -- ��¥ �������� ��ȯ
FROM DUAL;
--==>> 2021-09-02 00:00:00

SELECT TO_DATE('2021-13-02','YYYY-MM-DD') "���"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month"
*Cause:    
*Action:
*/

SELECT TO_DATE('2021-09-31','YYYY-MM-DD') "���"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01839: date not valid for month specified
01839. 00000 -  "date not valid for month specified"
*Cause:    
*Action:
*/
SELECT TO_DATE('2021-02-29','YYYY-MM-DD') "���"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01839: date not valid for month specified
01839. 00000 -  "date not valid for month specified"
*Cause:    
*Action:
*/
SELECT TO_DATE('2020-02-29','YYYY-MM-DD') "���"
FROM DUAL;
--==>> 2020-02-29 00:00:00

--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ ��
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������~!!!


--�� ADD MONTHS() ���� ���� �����ִ� �Լ�
SELECT SYSDATE "1"
     , ADD_MONTHS(SYSDATE,2) "2"
     , ADD_MONTHS(SYSDATE,3) "3"
     , ADD_MONTHS(SYSDATE,-2) "4"
     , ADD_MONTHS(SYSDATE,-3) "5"
FROM DUAL;
--==>>
/*
2021-09-02 11:18:44	 �� ����
2021-11-02 11:18:44	 �� 2���� ��
2021-12-02 11:18:44	 �� 3���� ��
2021-07-02 11:18:44	 �� 2���� ��
2021-06-02 11:18:44	 �� 3���� ��
*/
--> ���� ���ϰ� ����


--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� MONTHS_BETWEEN()
--   ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31','YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--==>> 231.079820788530465949820788530465949821
-- �ð��� �帣�� �����ϱ� ��ȸ�Ҷ����� �Ҽ��� ���� �ٲ�

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--�� ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
--   ù ��° ���ڰ��� �ش��ϴ� ��¥����
--   �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ�� �� �� �ִ�.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2021-12-28','YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--==>> -3.82334528076463560334528076463560334528
--> �������� �����Ϻ��� �̷�

--�� NEXT_DAY()
--   ù ��° ���ڰ��� �������� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE, '��') "���1", NEXT_DAY(SYSDATE,'��') "���2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06


-- �߰�++ �ǹ����� NEXT_DAY�� �ߴµ� ��������!? ������ ����� �Ǿ����� ���ɼ� ����!
--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ������ ������ �� ���� �������� �ٽ� �� �� ��ȸ
SELECT NEXT_DAY(SYSDATE, '��') "���1", NEXT_DAY(SYSDATE,'��') "���2"
FROM DUAL;
--==>> �����߻�
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT') "���1", NEXT_DAY(SYSDATE,'MON') "���2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06

--�� �߰� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� LAST_DAY()
-- �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
SELECT LAST_DAY(SYSDATE) "���Ȯ��"
FROM DUAL;
--==>> 2021-09-30

SELECT LAST_DAY(TO_DATE('2020-02-05','YYYY-MM-DD')) "��� Ȯ��"
FROM DUAL;
--==>> 2020-02-29

SELECT LAST_DAY(TO_DATE('2021-02-05','YYYY-MM-DD')) "��� Ȯ��"
FROM DUAL;
--==>> 2021-02-28

SELECT LAST_DAY(SYSDATE + 45) "���Ȯ��"
FROM DUAL;
--==>> 2021-10-31


--�� ���úη�... ����ȣ ��... ���뿡 �� ����(?)����.
--   ���� �Ⱑ�� 22������ �Ѵ�.

--  1. ���� ���ڸ� ���Ѵ�.
--  2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �ؾ��Ѵٰ� �����Ѵٸ�
--     ��ȣ�� �� ���� �Ծ�� ���� �����ٱ�.

SELECT SYSDATE "���� ��¥"
     , ADD_MONTHS(SYSDATE,22) "22���� �� ������"
     , (ADD_MONTHS(SYSDATE,22) - SYSDATE)* 3 "TO_DATE �Ȼ��"
     , 3 * ( TO_DATE(ADD_MONTHS(SYSDATE,22),'YYYY-MM-DD') - TO_DATE(SYSDATE,'YYYY-MM-DD') ) "�� ��?" 
FROM DUAL;
--==>> 2021-09-02	2023-07-02	2004	2004
/*
���� ��¥   22���� �� ������  TO_DATE �Ȼ��  �� ��?
---------- ------------------ --------------  ------
2021-09-02 2023-07-02                  2004    2004
*/


--�� ���� ��¥ �� �ð����κ���... ������(2021-12-28 18:00:00) ����
--   ���� �Ⱓ��... ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
--------------------------------------------------------------------------------
����ð�               | ������               | ��  | �ð� | �� |  ��
--------------------------------------------------------------------------------
2021-09-02 12:08:23    | 2021-12-28 18:00:00 | 116 | 15   |  2 |  37  
--------------------------------------------------------------------------------
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

-- ���� Ǭ Ǯ��1
SELECT SYSDATE "����ð�"
     , TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) "��" 
     , TRUNC(MOD((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24,24)) "�ð�"
     , TRUNC(MOD(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) *24*60),60)) "��"
     , TRUNC(MOD((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60),60)) "��"
FROM DUAL;
--==>> 2021-09-02 14:57:55	2021-12-28 18:00:00	117	3	2	4


-- ���� Ǭ Ǯ��2

-- �ð� ������
SELECT TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 117.133344907407407407407407407407407407
SELECT TRUNC(TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE)
FROM DUAL;
--==>> 117
SELECT TRUNC((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE
     - TRUNC(TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE)) *24) "�ð�"
FROM DUAL;
--==>> 3

-- �� ������
SELECT (TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE
     - TRUNC(TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE)) *24 * 60
FROM DUAL;



SELECT SYSDATE "����ð�"
     , TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') "������"
     , TRUNC(TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) "��"
     , TRUNC((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE
     - TRUNC(TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE))*24) "�ð�"
FROM DUAL;



-- �Բ� Ǭ Ǯ��
-- ��1�� 2�ð� 3�� 4�ʡ��� ���ʡ��� ȯ���ϸ�...
SELECT (1��) + (2�ð�) + (3��) + (4��)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>> 93784

-- 61�� �� 1�� 1��
-- �ʱ��ϱ� ������ �������¾ֵ��� �ö󰡰� �ƴѾֵ��� ��!
SELECT MOD(61,60)
FROM DUAL;


-- ��93784���ʸ� �ٽ� ��, �ð�, ��, �ʷ� ȯ���ϸ�...
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60),24)
     , MOD(TRUNC(93784/60),60)
     , MOD(93784,60)
FROM DUAL;
--==>> 1	2	3	4

--==>> 3��      3��
--==>> 1563��	4��

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : �ϼ�

SELECT �������� - �������� "�����Ⱓ"
FROM DUAL;

-- ��������
SELECT TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 2021-12-28 18:00:00 �� ��¥ ����

-- ��������
SELECT SYSDATE
FROM DUAL;
--==>> 2021-09-02 15:19:45 �� ��¥ ����

SELECT TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE "�����Ⱓ"
FROM DUAL;
--==>> 117.110277777777777777777777777777777778 �� ���� : �ϼ� �� ���� ����
--> �����ϱ��� ���� �ϼ�

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : ��
SELECT TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE * (�Ϸ縦 �����Ѵ� ��ü ��)
FROM DUAL;


SELECT ((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))
FROM DUAL;
--==>> 10118160.99999999999999999999999999999996    �� ���� : �ʡ� ���� ����
--> �����ϱ��� ���� ��

-- 93784 ��� ((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))�̰� �ٿ��ֱ�
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60),24)
     , MOD(TRUNC(93784/60),60)
     , MOD(93784,60)
FROM DUAL;

SELECT TRUNC(TRUNC(TRUNC(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60)/60),24) "�ð�"
     , MOD(TRUNC(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60),60) "��"
     , TRUNC(MOD(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)),60)) "��"
FROM DUAL;

-- �ϼ�
SELECT SYSDATE "����ð�"
     , TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') "��������"
     , TRUNC(TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) "�����Ⱓ"
     , TRUNC(TRUNC(TRUNC(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60)/60),24) "�ð�"
     , MOD(TRUNC(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60))/60),60) "��"
     , TRUNC(MOD(((TO_DATE('2021-12-28 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)),60)) "��"
FROM DUAL;
--==>>
/*
����ð�                ��������                      �����Ⱓ          ��         �ð�          ��          ��
------------------- ------------------- ---------- ---------- ---------- ---------- ----------
2021-09-02 15:32:28 2021-12-28 18:00:00        117        117          2         27         32

*/

--�� ����
-- ������ �¾�� �������...
-- �󸶸�ŭ�� ��, �ð�, ��, �ʸ� ��Ҵ���...(����ִ���...)
-- ��ȸ�ϴ� �������� �����Ѵ�.
/*
-------------------------------------------------------------------
���� �ð�           | �¾ �ð�         |  ��  |  �ð� | �� | ��
-------------------------------------------------------------------
2021-09-02 15:33:20 | 1994-12-31 14:03:00 | XXXX|      XX| XX | XX
-------------------------------------------------------------------
*/
-- �¾ ������ �󸶳� ��Ҵ��� Ȯ��(��¥ ����) �� ���� : ��
SELECT ((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))
FROM DUAL;

SELECT TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60),24) "��"
     , MOD(TRUNC(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60),60) "��"
     , MOD(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)),60) "��"
FROM DUAL;

SELECT SYSDATE "���� �ð�"
     , TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS') "�¾ �ð�"
     , TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) "��"
     , MOD(TRUNC(TRUNC(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60),24) "��"
     , MOD(TRUNC(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60),60) "��"
     , MOD(((SYSDATE - TO_DATE('1994-12-31 14:03:00','YYYY-MM-DD HH24:MI:SS')) * (24*60*60)),60) "��"
FROM DUAL;
--==>>
/*
���� �ð�               �¾ �ð�           ��          ��          ��          ��
------------------- ------------------- ---------- ---------- ---------- ----------
2021-09-02 15:40:56 1994-12-31 14:03:00       9742          1         37         56
*/




ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "1"                  -- 2021-09-02  �� �⺻ ���� ��¥
     , ROUND(SYSDATE, 'YEAR') "2"   -- 2022-01-01  �� �⵵���� ��ȿ�� ������(��ݱ�, �Ϲݱ� ���) ���� �Ϲݱ�ϱ� �ø�!
     , ROUND(SYSDATE, 'MONTH') "3"  -- 2021-09-01  �� ������ ��ȿ�� ������(15�� ����)    2���̴ϱ� ����!
     , ROUND(SYSDATE, 'DD') "4"     -- 2021-09-03  �� ��¥���� ��ȿ�� ������(���� ����) 12���Ĵϱ� 3���� �ø�!
     , ROUND(SYSDATE, 'DAY') "5"    -- 2021-09-05  �� ��¥���� ��ȿ�� ������(������ ����) ������̴ϱ� ���� �Ͽ��� �����������̸� ���� �Ͽ���
FROM DUAL;

--�� ��¥ ����(�ø��� ����� �߻����� ����!)
SELECT SYSDATE "1"                  -- 2021-09-02  �� �⺻ ���� ��¥
     , TRUNC(SYSDATE, 'YEAR') "2"   -- 2021-01-01  �� �⵵���� ��ȿ�� ������ �ڴ� �� �о�� ����
     , TRUNC(SYSDATE, 'MONTH') "3"  -- 2021-09-01  �� ������ ��ȿ�� ������ �ڴ� �� �о�� ����
     , TRUNC(SYSDATE, 'DD') "4"     -- 2021-09-02  �� ��¥���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'DAY') "5"    -- 2021-08-29  �� ��¥���� ��ȿ�� ������(�����̴ϱ� ������ ���� �� �Ͽ���)
FROM DUAL;

--------------------------------------------------------------------------------

-- ���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ� 
-- TO_DATE()    : ���ڵ�����(��¥ ����)�� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER    : ���ڵ�����(���� ����)�� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���
--   ���� �������� ���� ������ ������ �� �ִ�.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

-- CURRENCY : ��ȭ, ȭ��
ALTER SESSION SET NLS_CURRENCY = '\';   --��(��)
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

-- ��¥�� ���ڷ� �ٲٴ� ��
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD')    -- 2021-09-02           ��¥ó�� ���������� ��� ���� Ÿ��
     , TO_CHAR(SYSDATE,'YYYY')          -- 2021                 ���ڰ� �ƴ϶� �̰�����
     , TO_CHAR(SYSDATE,'YEAR')          -- TWENTY TWENTY-ONE	
     , TO_CHAR(SYSDATE,'MONTH')         -- 09	                
     , TO_CHAR(SYSDATE,'MM')            -- 9�� 	                
     , TO_CHAR(SYSDATE,'MON')           -- 9�� 	                
     , TO_CHAR(SYSDATE,'DD')            -- 02	                DD��  ��¥         
     , TO_CHAR(SYSDATE,'DAY')           -- �����	            DAY�� ����   
     , TO_CHAR(SYSDATE,'DY')            -- ��	                
     , TO_CHAR(SYSDATE,'HH24')          -- 16	                    
     , TO_CHAR(SYSDATE,'HH')            -- 04	                
     , TO_CHAR(SYSDATE,'HH AM')         -- 04 ����	            AM�� ���� PM �� ���� ���ķ� ����    
     , TO_CHAR(SYSDATE,'HH PM')         -- 04 ����	                
     , TO_CHAR(SYSDATE,'MI')            -- 23	                    
     , TO_CHAR(SYSDATE,'SS')            -- 12	                        
     , TO_CHAR(SYSDATE,'SSSSS')         -- 58992	            �� ���� �귯�� ��ü ��(���� �ð��� �ʷ�)            
     , TO_CHAR(SYSDATE,'Q')             -- 3                    �� �б�(����)  123 / 456 / 789 / 101112                        
     
FROM DUAL;
--> ���� ���� ���� �� ���ڶ�� ��!


--���ڴ� �������� ���ڴ� ��������
SELECT 2021 "1", '2021' "2"
FROM DUAL;
/* 
        1  2   
---------- ----
      2021 2021
*/

SELECT '23' "1", TO_NUMBER('23') "2"
FROM DUAL;
/*
1           2
-- ----------
23         23
*/

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

--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "1"
     , TO_CHAR(60000) "2"
     , TO_CHAR(60000,'99,999') "3"
     , TO_CHAR(60000,'$99,999') "4"
     , TO_CHAR(60000, 'L99,999') "5"
     , LTRIM(TO_CHAR(60000, 'L99,999')) "6"
FROM DUAL;
/*
--���ڴ� �������� ���ڴ� ��������
        1 2     3       4        5                
---------- ----- ------- -------- ------------------------
     60000 60000  60,000  $60,000           \60,000         �� ��(�������� ��ȭ��ȣ ������ ������ܼ� LTRIM()�� �Բ� ���δ�!
*/

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.



--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4���ĸ� ��ȸ�Ѵ�.

SELECT SYSDATE "���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1��2�ð�3��4�� ��"
FROM DUAL;
--==>>
/*
2021-09-02 17:02:27
2021-09-03 19:05:31
*/

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
--   TO_YMINTERVAL(), TO_DSINTERVAL()
--      ���            ���� ��
SELECT SYSDATE "���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "������"
FROM DUAL;
--==>> '���ڿ�'�� ���·� �Ѱ�����ϰ� - YM�� �ְ� DS�� ����!
/*
2021-09-02 17:05:44	
2022-11-05 21:10:50
*/

-------------------------------------------------------------------------------

--�� CASE ����(���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
���̽� �� �� ���� ���� �������� �ϱ�!
*/
SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�� �����' END "���Ȯ��"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=7' ELSE '5+2�� �����' END "���Ȯ��"
FROM DUAL;
--==>> 5+2�� �����


SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=3'
                ELSE '�����'
                END "��� Ȯ��"
FROM DUAL;
--==>> 1+1=2


--�� DECODE()
-- DECODE(�÷�, ����1, ���1, ����2, ���2, ����3, ���3..........) 
SELECT DECODE(5-2,1,'5-2=1',2, '5-2=2',3,'5-2=3','5-2�� �����')"��� Ȯ��"
FROM DUAL;
--==>> 5-2=3

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '�񱳺Ұ�'
            END "��� Ȯ��"
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE '��������'
            END "��� Ȯ��"
FROM DUAL;
--==>> ��������
/*
SELECT CASE WHEN F OR T THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��������'
            ELSE '��������'
            END "��� Ȯ��"
FROM DUAL;
IF, ELSE IF ó��... ù��° WHEN�� TRUE �� ... �� ��° WHEN �� ������� �ʴ� �ǰ���???
����� ������ �ڿ��� ������ϴ�..
*/

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '�ش�����'
           WHEN 5<2 AND 2=3 THEN '��������'
           ELSE '���ϸ���' 
           END "��� Ȯ��"
FROM DUAL;
--==>> �ش�����
/*
                F        F      T       T
SELCT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '�ش�����'      --TRUE
           WHEN 5<2 AND 2=3 THEN '��������'
           ELSE '���ϸ���' 
           END "��� Ȯ��"
FROM DUAL;
*/


SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '�ش�����'
           WHEN 5<2 AND 2=3 THEN '��������'
           ELSE '���ϸ���' 
           END "��� Ȯ��"
FROM DUAL;
--==>> ���ϸ���
/*
                                F
                        F                T                        
                             T
                 F         F     T
SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '�ش�����'
           WHEN 5<2 AND 2=3 THEN '��������'
           ELSE '���ϸ���' 
           END "��� Ȯ��"
FROM DUAL;
*/
--> ��ȣ�� ���� ����!
--������ ���� !! ELSE�������� THEN �� �Ⱥ���!!!

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;

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

--���� Ǭ Ǯ��
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE SUBSTR(JUBUN,7,1) WHEN '2' THEN '��'
                              WHEN '4' THEN '��'
            ELSE '��' 
            END "����"
     , EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1 "���糪��"
     , HIREDATE "�Ի���"
     , ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1))*12) "����������"
     , TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) "�ٹ��ϼ�"
     , ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1))*12) - SYSDATE "�����ϼ�"
     ,SAL "�޿�"
     , CASE WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) >=2000 THEN SAL * 0.5 
              WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) >=1000 THEN SAL * 0.3 
              WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) <2000 THEN SAL * 0.3 
              ELSE SAL * 0
              END "���ʽ�"
FROM TBL_SAWON;
--??���������Ͽ��� �� ���� ó�� ����


--����
SELECT CASE SUBSTR(JUBUN,7,1) WHEN '2' THEN '��'
                              WHEN '4' THEN '��'
            ELSE '��' 
            END "����"
FROM TBL_SAWON;

--����
SELECT TO_CHAR(JUBUN,'YY-MM-DD')
FROM TBL_SAWON;

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
2004
2002
1980
1981
1972
1970
1990
1980
1982
1992
2002
*/

-- ���� ���ϱ� �ϼ�
SELECT EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1
FROM TBL_SAWON;
/*
29
27
13
28
18
20
42
41
50
52
32
42
40
30
20
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
SELECT TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) "�ٹ��ϼ�"
FROM TBL_SAWON;

--���������� ������
--  ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��(����)��
--  �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
SELECT 60 - ������ ����
FROM TBL_SAWON;

SELECT 60-(EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1)
FROM TBL_SAWON;

--���������� �ϼ�
SELECT ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1))*12)
FROM TBL_SAWON;

--�������� ���� �ϼ� �ϼ�
SELECT ADD_MONTHS(SYSDATE,(60 - (EXTRACT(YEAR FROM SYSDATE) - (DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20') || SUBSTR(JUBUN,1,2)) + 1))*12) - SYSDATE
FROM TBL_SAWON;

--  �׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
--  �� ����� ���� �޿� ���� 30% ����,
--  2000�� �̻� �ٹ��� �����
--  �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.

-- ���ʽ� �ϼ�
SELECT TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) "�ٹ��ϼ�"
       , SAL
       , CASE WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) >=2000 THEN SAL * 0.5 
              WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) >=1000 THEN SAL * 0.3 
              WHEN TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) <2000 THEN SAL * 0.3 
              ELSE SAL * 0
              END "���ʽ�"
FROM TBL_SAWON;

--�־ȴ�¡..?
SELECT DECODE(TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24)
            ,(TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24 )>= 1000 AND TRUNC(TRUNC(TRUNC(((SYSDATE - TO_DATE(HIREDATE,'YYYY-MM-DD HH24:MI:SS')) * (24*60*60))/60)/60)/24) < 2000)
            ,SAL*0.3,SAL*0.5)
FROM TBL_SAWON;
