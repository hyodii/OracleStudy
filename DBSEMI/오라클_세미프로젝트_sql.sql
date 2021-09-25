SELECT USER
FROM DUAL;
--==>> HR

--�� ������ �䱸 �м�
-- 3. ���� ��� ���
-- �ڽ��� ������ ����, "�����, ���� �Ⱓ(����), ����Ⱓ(��), �����, �л���, ���, �Ǳ�, �ʱ�, ����, ���
-- ���� �ߵ�Ż�� ��: ������ ���� ���� ���, �ߵ�Ż�� ���� ���
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
                    ON E.E_ID = MID.E_ID                    
WHERE PRO_ID IN ('PRO1', 'PRO2'); -- WHERE���� �ش�Ǵ� ���� �ڵ� �Է�


--�� ������ �� �䱸�м�

--������ ���� ���� ��� ����
-- ��� �������� ������ ����Ͽ� �� �� �־�� �Ѵ�.(�����ڸ�, ������ �����, ���� �Ⱓ, ���� ��, ���ǽ�, �������࿩��)
-- ������ ���� ��� NULL���� �� ó��
SELECT P.PRO_NAME "�����ڸ�", S.SUB_NAME "������ �����", S.S_START || ' ~ ' || S.S_END "���� �Ⱓ", S.BOOK_NAME"�����", CLASSROOM "���ǽ�", FN_STATUS(S.S_START, S.S_END) "�������࿩��"
FROM PROFESSORS P LEFT JOIN ESTABLISHED_SUB ES
ON P.PRO_ID = ES.PRO_ID
    LEFT JOIN SUBJECTS S
    ON ES.SUB_ID = S.SUB_ID;
    
    
--���� ���� ��� ����
-- �����ڴ� ��ϵ� ��� ������ ������ ����Ͽ� �� �� �־�� �Ѵ�. (������, ���ǽ�, �����, ���� �Ⱓ, �����, �����ڸ�)
SELECT C.COURSE_NAME "������", C.CLASSROOM "���ǽ�", S.SUB_NAME "�����", S.S_START || ' ~ ' || S.S_END "���� �Ⱓ", S.BOOK_NAME "�����", P.PRO_NAME"�����ڸ�"
FROM COURSE C JOIN ESTABLISHED_SUB ES
ON C.COURSE_ID = ES.COURSE_ID
    JOIN SUBJECTS S
    ON S.SUB_ID = ES.SUB_ID
        JOIN PROFESSORS P
        ON C.PRO_ID = P.PRO_ID;


--�л� ���� ��� ����
-- �����ڴ� ��ϵ� ��� �л��� ������ ����� �� �־�� �Ѵ�. (�л� �̸�, ������, ��������, �������� ����, �ߵ� Ż�� ���)
SELECT STD.ST_NAME "�л� �̸�", C.COURSE_ID "������", S.SUB_NAME "��������", FN_TOTAL_SCORE(STD.ST_ID, ES.SUB_ID) "�������� ����", NVL2(MD.E_ID, '�ߵ�Ż��', '�ߵ�Ż���ƴ�') "�ߵ� Ż�� ���"
FROM STUDENTS STD LEFT JOIN ENROLL E
ON STD.ST_ID = E.ST_ID
    LEFT JOIN COURSE C
    ON E.COURSE_ID = C.COURSE_ID
        LEFT JOIN ESTABLISHED_SUB ES
        ON C.COURSE_ID = ES.COURSE_ID
            LEFT JOIN SUBJECTS S
            ON ES.SUB_ID = S.SUB_ID
                LEFT JOIN MID_DROP MD
                ON E.E_ID = MD.E_ID;


--������
SELECT STU.ST_ID"�л��̸�", E.COURSE_ID "������", SUB.SUB_NAME "�����", SUB.S_START || ' - ' || SUB.S_END "���� �Ⱓ", SUB.BOOK_NAME "�����"
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
WHERE STU.ST_ID IN ('STU1', 'STU2');

SELECT E_ID
FROM SCORE;















--------------------------------------------------------------------------------
--�� �׽�Ʈ

--�� ������ INSERT
INSERT INTO ADMINISTRATOR(ADMIN_ID, ADMIN_PW) VALUES('AD1', 'QWER1234');
INSERT INTO ADMINISTRATOR(ADMIN_ID, ADMIN_PW) VALUES('AD2', 'ASDF1234');

--�� ���� INSERT ���ν��� - PRC_PRO_PW_INSERT
EXEC PRC_PRO_PW_INSERT('PRO1', '���� ��', '840218-2813239');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM PROFESSORS;
--==>> PRO1	���� ��	2813239	840218-2813239

EXEC PRC_PRO_PW_INSERT('PRO2', '������', '111111-1111111');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM PROFESSORS;
--==>> 
/*
PRO1	���� ��	2813239	840218-2813239
PRO2	������	1111111	111111-1111111
*/

--�� �л� INSERT ���ν��� - PRC_STUDENT_INSERT
EXEC PRC_STUDENT_INSERT('STU1', '��ȸ��', '111111-3111111');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

EXEC PRC_STUDENT_INSERT('STU2', '���ʿ�', '111111-4111111');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM STUDENTS;
--==>> 
/*
STU1	3111111	��ȸ��	111111-3111111	2021-09-25
STU2	4111111	���ʿ�	111111-4111111	2021-09-25
*/

--�� ���� �Է� ���ν��� - PRC_COR_INSERT
EXEC PRC_COR_INSERT('�����ھ缺����', TO_DATE('2020-11-24', 'YYYY-MM-DD'), TO_DATE('2021-4-18', 'YYYY-MM-DD'), '����Ŭ���ǽ�A1');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

EXEC PRC_COR_INSERT('����������������', TO_DATE('2020-6-14', 'YYYY-MM-DD'), TO_DATE('2020-12-30', 'YYYY-MM-DD'), '�ڹٰ��ǽ�B1');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM COURSE;
--==>> 
/*
COURSE1	�����ھ缺����		2020-11-24	2021-04-18	����Ŭ���ǽ�A1
COURSE2	����������������		2020-06-14	2020-12-30	�ڹٰ��ǽ�B1
*/


--�� ���� + �������� INSERT - PRC_SUB_INSERT
EXEC PRC_SUB_INSERT('COURSE1', '����Ŭ�߱�', TO_DATE('2020-12-24', 'YYYY-MM-DD'),  TO_DATE('2021-1-19', 'YYYY-MM-DD'), '����Ŭ�� ����', 'PRO1');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

-- ����ó�� Ȯ��!!
EXEC PRC_SUB_INSERT('COURSE1', '����Ŭ�߱�', TO_DATE('2020-10-24', 'YYYY-MM-DD'),  TO_DATE('2021-1-19', 'YYYY-MM-DD'), '����Ŭ�� ����', 'PRO1');
--==>> (����ó���� �ƴ�!! �ٸ� �ȳ��� ����� �ȵ� ��)PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM SUBJECTS;
--==>> SUB1	����Ŭ�߱�	2020-12-24	2021-01-19		����Ŭ�� ����

SELECT *
FROM ESTABLISHED_SUB;
--==>> ESUB1	PRO1	COURSE1	SUB1			

EXEC PRC_SUB_INSERT('COURSE2', '�ڹٰ��', TO_DATE('2020-6-14', 'YYYY-MM-DD'), TO_DATE('2020-12-30', 'YYYY-MM-DD'), '����ڹٸ�����', 'PRO2');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM SUBJECTS;
--==>> 
/*
SUB1	����Ŭ�߱�	2020-12-24	2021-01-19		����Ŭ�� ����
SUB3	�ڹٰ��	2020-06-14	2020-12-30		����ڹٸ�����
*/

SELECT *
FROM ESTABLISHED_SUB;
--==>> 
/*
ESUB1	PRO1	COURSE1	SUB1			
ESUB2	PRO2	COURSE2	SUB3			
*/

--�� �������� ���� Ʈ���� Ȯ��
SELECT *
FROM PROFESSORS
WHERE PRO_ID = 'PRO2';
--==>> PRO1	���� ��	2813239	840218-2813239

DELETE
FROM PROFESSORS
WHERE PRO_ID = 'PRO2';
--==>> ���� �߻�
/*
���� ���� -
ORA-04091: table HR.PROFESSORS is mutating, trigger/function may not see it
ORA-06512: at "HR.TRG_PROFESSORS_DELETE", line 10
ORA-04088: error during execution of trigger 'HR.TRG_PROFESSORS_DELETE
*/


--�� ���� �߰�(������û �׽�Ʈ�� ����)
EXEC PRC_COR_INSERT('�鿣�尳���ھ缺����', TO_DATE('2021-10-14', 'YYYY-MM-DD'), TO_DATE('2022-3-30', 'YYYY-MM-DD'), '�ڹٰ��ǽ�C');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

EXEC PRC_COR_INSERT('Ǯ���ð����ھ缺����', TO_DATE('2021-12-23', 'YYYY-MM-DD'), TO_DATE('2022-6-15', 'YYYY-MM-DD'), '�ڹٰ��ǽ�D');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM COURSE;
--==>>
/*
COURSE1	�����ھ缺����		2020-11-24	2021-04-18	����Ŭ���ǽ�A1
COURSE2	����������������		2020-06-14	2020-12-30	�ڹٰ��ǽ�B1
COURSE3	�鿣�尳���ھ缺����		2021-10-14	2022-03-30	�ڹٰ��ǽ�C
COURSE5	Ǯ���ð����ھ缺����		2021-12-23	2022-06-15	�ڹٰ��ǽ�D
*/

--�� ���� + �������� INSERT - PRC_SUB_INSERT
EXEC PRC_SUB_INSERT('COURSE3', '������5', TO_DATE('2021-12-24', 'YYYY-MM-DD'),  TO_DATE('2022-1-05', 'YYYY-MM-DD'), '������������', 'PRO2');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

EXEC PRC_SUB_INSERT('COURSE5', 'HTML', TO_DATE('2022-1-15', 'YYYY-MM-DD'),  TO_DATE('2022-3-20', 'YYYY-MM-DD'), '��մ� HTML', 'PRO1');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


SELECT *
FROM SUBJECTS;
--==>> 
/*
SUB1	����Ŭ�߱�	2020-12-24	2021-01-19		����Ŭ�� ����
SUB3	�ڹٰ��	2020-06-14	2020-12-30		����ڹٸ�����
SUB4	������5	2021-12-24	2022-01-05		������������
SUB5	HTML	2022-01-15	2022-03-20		��մ� HTML
*/

--�� ������û INSERT 
--����ó�� �׽�Ʈ 1 - ��������ϰ� ������ - ������û���� ��������Ϻ��� �����ų�, �����Ϻ��� �����ų� ���� �� ����.
EXEC PRC_ENROLL_INSERT('ENROLL1', 'STU1', 'COURSE1', TO_DATE('2020-6-14', 'YYYY-MM-DD'));
--==>> ���� ��û�� �Ұ����մϴ�.
EXEC PRC_ENROLL_INSERT('ENROLL1', 'STU1', 'COURSE1', TO_DATE('2020-11-25', 'YYYY-MM-DD'));
--==>> ���� ��û�� �Ұ����մϴ�.

--���� �Է�
EXEC PRC_ENROLL_INSERT('ENROLL1', 'STU1', 'COURSE3', TO_DATE('2021-9-26', 'YYYY-MM-DD'));
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

EXEC PRC_ENROLL_INSERT('ENROLL2', 'STU2', 'COURSE3', TO_DATE('2021-9-26', 'YYYY-MM-DD'));
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM ENROLL;
--==>> 
/*
ENROLL1	STU1	COURSE3	2021-09-26
ENROLL2	STU2	COURSE3	2021-09-26
*/

--����ó�� �׽�Ʈ 2 - ������ ���� ��û ����- �� �л��� ���� ������ ��û�� �� ����.
EXEC PRC_ENROLL_INSERT('ENROLL3', 'STU1', 'COURSE3', TO_DATE('2021-9-26', 'YYYY-MM-DD'));
--==>> �̹� ��û�� �����Դϴ�.

--����ó�� �׽�Ʈ 3 - ���� ��¥ �ߺ� - �� �л��� ������ ������ ������ ��¥��, ���� �����Ϸ��� ������ ��¥�� ��ĥ �� ����.
EXEC PRC_ENROLL_INSERT('ENROLL3', 'STU1', 'COURSE5', TO_DATE('2021-9-26', 'YYYY-MM-DD'));
--==>> ��¥�� �ߺ��Ǵ� �����Դϴ�.


--�� �ߵ����� INSERT 
--����ó�� �׽�Ʈ - �����Ⱓ ����
EXEC PRC_MID_DROP_INSERT('DROP1', 'ENROLL1', TO_DATE('2021-04-01', 'YYYY-MM-DD'));
--==>> �ߵ����� ��¥�� �߸� �ԷµǾ����ϴ�.

--����ó�� �׽�Ʈ - �����Ⱓ ����
EXEC PRC_MID_DROP_INSERT('DROP1', 'ENROLL1', TO_DATE('2022-04-01', 'YYYY-MM-DD'));
--==>> �ߵ����� ��¥�� �߸� �ԷµǾ����ϴ�.

--���� ó��
EXEC PRC_MID_DROP_INSERT('DROP1', 'ENROLL1', TO_DATE('2022-01-01', 'YYYY-MM-DD'));
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM MID_DROP;
--==>> DROP1	ENROLL1	2022-01-01


--! ������ �׽�Ʈ
--�� ������ �� �䱸�м�

--������ ���� ���� ��� ����
-- ��� �������� ������ ����Ͽ� �� �� �־�� �Ѵ�.(�����ڸ�, ������ �����, ���� �Ⱓ, ���� ��, ���ǽ�, �������࿩��)
-- ������ ���� ��� NULL���� �� ó��
SELECT P.PRO_NAME "�����ڸ�", S.SUB_NAME "������ �����", S.S_START || ' ~ ' || S.S_END "���� �Ⱓ", S.BOOK_NAME"�����", CLASSROOM "���ǽ�", FN_STATUS(S.S_START, S.S_END) "�������࿩��"
FROM PROFESSORS P LEFT JOIN ESTABLISHED_SUB ES
ON P.PRO_ID = ES.PRO_ID
    LEFT JOIN SUBJECTS S
    ON ES.SUB_ID = S.SUB_ID;
--==>> 
/*
���� ��	����Ŭ�߱�	2020-12-24 ~ 2021-01-19	����Ŭ�� ����		���� ��
���� ��	HTML	2022-01-15 ~ 2022-03-20	��մ� HTML		���� ����
������	������5	2021-12-24 ~ 2022-01-05	������������		���� ����
������	�ڹٰ��	2020-06-14 ~ 2020-12-30	����ڹٸ�����		���� ��
*/
    
--�л� ���� ��� ����
-- �����ڴ� ��ϵ� ��� �л��� ������ ����� �� �־�� �Ѵ�. (�л� �̸�, ������, ��������, �������� ����, �ߵ� Ż�� ���)
SELECT STD.ST_NAME "�л� �̸�", C.COURSE_ID "������", S.SUB_NAME "��������", FN_TOTAL_SCORE(STD.ST_ID, ES.SUB_ID) "�������� ����", NVL2(MD.E_ID, '�ߵ�Ż��', '�ߵ�Ż���ƴ�') "�ߵ� Ż�� ���"
FROM STUDENTS STD LEFT JOIN ENROLL E
ON STD.ST_ID = E.ST_ID
    LEFT JOIN COURSE C
    ON E.COURSE_ID = C.COURSE_ID
        LEFT JOIN ESTABLISHED_SUB ES
        ON C.COURSE_ID = ES.COURSE_ID
            LEFT JOIN SUBJECTS S
            ON ES.SUB_ID = S.SUB_ID
                LEFT JOIN MID_DROP MD
                ON E.E_ID = MD.E_ID;
--==>> 
/*
��ȸ��	COURSE3	������5		�ߵ�Ż��
���ʿ�	COURSE3	������5		�ߵ�Ż���ƴ�
*/

--���� + �±�
SELECT STU.ST_ID"�л��̸�", E.COURSE_ID "������", SUB.SUB_NAME "�����", SUB.S_START || ' - ' || SUB.S_END "���� �Ⱓ", SUB.BOOK_NAME "�����"
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
                    ON E.E_ID = MID.E_ID  ;
/*
�л��̸�                           ������                            �����                            ���� �Ⱓ                   �����                                  �������       �Ǳ�����       �ʱ�����         ����         ��� ��
------------------------------ ------------------------------ ------------------------------ ----------------------- ------------------------------ ---------- ---------- ---------- ---------- ---------- -
STU2                           COURSE3                                                        -                                                                                               0          1 N
STU1                           COURSE3                                                        -                                                                                               0          1 Y

*/

--* ��ȸ�Ǵ� �������� �־����ϴ�! �׸��� �ٸ� �е��� �ۼ��� ������ �� �ִ� �� �Ƴ༭ �켱 �̰͵鸸 �׽�Ʈ�߾��.
--------------------------------------------------------------------------------

--���� ���� �־�� �������� �� �־��� �� ���� ��� ��µǴ��� �׽�Ʈ

--�� ���� INSERT 
EXEC PRC_SCORE_INSERT('ENROLL2', 'SUB4', 100, 90, 80 );

SELECT *
FROM ESTABLISHED_SUB;

SELECT *
FROM ENROLL JOIN STUDENTS
ON ENROLL.ST_ID = STUDENTS.ST_ID
JOIN COURSE
ON COURSE.COURSE_ID = ENROLL.COURSE_ID
JOIN ESTABLISHED_SUB ES
ON ES.COURSE_ID = COURSE.COURSE_ID;
--==>> 
/*
ENROLL1	STU1	COURSE3	2021-09-26	STU1	3111111	��ȸ��	111111-3111111	2021-09-25
ENROLL2	STU2	COURSE3	2021-09-26	STU2	4111111	���ʿ�	111111-4111111	2021-09-25
*/

SELECT *
FROM MID_DROP;

SELECT *
FROM SUBJECTS;


--�� ���� ���� INSERT

--�� ���� INSERT 

--�� 