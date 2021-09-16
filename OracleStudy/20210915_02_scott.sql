SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 생성한 함수(FN_GENDER())가 제대로 작동하는지의 여부 확인
SELECT NAME, SSN, FN_GENDER(SSN)"함수호출결과"
FROM TBL_INSA;
--==>>
/*
홍길동	771212-1022432	남자
이순신	801007-1544236	남자
이순애	770922-2312547	여자
김정훈	790304-1788896	남자
한석봉	811112-1566789	남자
이기자	780505-2978541	여자
장인철	780506-1625148	남자
김영년	821011-2362514	여자
나윤균	810810-1552147	남자
김종서	751010-1122233	남자
유관순	801010-2987897	여자
정한국	760909-1333333	남자
조미숙	790102-2777777	여자
황진이	810707-2574812	여자
이현숙	800606-2954687	여자
이상헌	781010-1666678	남자
엄용수	820507-1452365	남자
이성길	801028-1849534	남자
박문수	780710-1985632	남자
유영희	800304-2741258	여자
홍길남	801010-1111111	남자
이영숙	800501-2312456	여자
김인수	731211-1214576	남자
김말자	830225-2633334	여자
우재옥	801103-1654442	남자
김숙남	810907-2015457	여자
김영길	801216-1898752	남자
이남신	810101-1010101	남자
김말숙	800301-2020202	여자
정정해	790210-2101010	여자
지재환	771115-1687988	남자
심심해	810206-2222222	여자
김미나	780505-2999999	여자
이정석	820505-1325468	남자
정영희	831010-2153252	여자
이재영	701126-2852147	여자
최석규	770129-1456987	남자
손인수	791009-2321456	여자
고순정	800504-2000032	여자
박세열	790509-1635214	남자
문길수	721217-1951357	남자
채정희	810709-2000054	여자
양미옥	830504-2471523	여자
지수환	820305-1475286	남자
홍원신	690906-1985214	남자
허경운	760105-1458752	남자
산마루	780505-1234567	남자
이기상	790604-1415141	남자
이미성	830908-2456548	여자
이미인	810403-2828287	여자
권영미	790303-2155554	여자
권옥경	820406-2000456	여자
김싱식	800715-1313131	남자
정상호	810705-1212141	남자
정한나	820506-2425153	여자
전용재	800605-1456987	남자
이미경	780406-2003214	여자
김신제	800709-1321456	남자
임수봉	810809-2121244	여자
김신애	810809-2111111	여자
*/

--○ 생성한 함수(FN_POW())가 제대로 작동하는지의 여부 확인
SELECT FN_POW(10,3)"A의 B승"
FROM DUAL;
--==>> 1000

SELECT FN_POW(2,8)"함수호출결과"
FROM DUAL;
--==>>256

SELECT FN_POW(3,3)"함수호출결과"
FROM DUAL;
--==>> 27

--○ 생성한 함수(FN_POW()2)가 제대로 작동하는지의 여부 확인
SELECT FN_POW2(2,8) "2의 8승"
FROM DUAL;
--==>> 256

SELECT FN_POW2(12,12) "2의 8승"
FROM DUAL;
--==>> 8916100448256

-- 프로시저 관련 실습

-- 실습 테이블 생성(TBL_STUDENTS)
CREATE TABLE TBL_STUDENTS
( ID    VARCHAR2(10)
, NAME  VARCHAR2(40)
, TEL   VARCHAR2(20)
, ADDR  VARCHAR2(100)
);
--==>> Table TBL_STUDENTS이(가) 생성되었습니다.

-- 실습 테이블 생성(TBL_IDPW)
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_IDPW이(가) 생성되었습니다.


-- 두 테이블에 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman', '손범석', '010-1111-1111', '서울 강남구...');
INSERT INTO TBL_IDPW(ID, PW)
VALUES('superman', 'java006$');
--==>> 1 행 이(가) 삽입되었습니다. * 2


SELECT *
FROM TBL_STUDENTS;
--==>> superman	손범석	010-1111-1111	서울 강남구...

SELECT *
FROM TBL_IDPW;
--==>> superman	java006$


-- 위의 업무를 프로시저(INSERT 프로시저, 입력 프로시저)를 생성하게 되면
EXEC PRC_STUDENTS_INSERT('batman','java006$', '송해덕', '010-2222-2222','경기도 고양시');
-- 이와같은 구문 한줄로 양쪽 테이블에 데이터를 모두 제대로 입력할 수 있다.

-- 이렇게 적고 다시 PL/SQL가서 구문작성

--데이터타입을 위해 다시 검색
DESC TBL_STUDENTS;
DESC TBL_IDPW;


--○ 생성한 프로시저(PRC_STUDENTS_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_STUDENTS_INSERT('batman','java006$', '송해덕', '010-2222-2222','경기도 고양시');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	손범석	010-1111-1111	서울 강남구...
batman	    송해덕	010-2222-2222	경기도 고양시
*/

SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	java006$
batman	    java006$
*/

-- ○ 학번, 이름, 국어점수, 영어점수, 수학점수 데이터를
--    입력받을 수 있는 실습 테이블 생성(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK이(가) 생성되었습니다.
-- 총점같은경우 추가하는 것이 아니라 
-- 있는값 조합해서 쿼리문 얻어낼 수 있는건 컬럼화시키면 안된다!!!
-- 평균, 등급은요? --> 계산하면됨! 컬럼있으면 안됨!

--○ 생성된 테이블에 컬럼 구조 추가
--      (총점→TOT, 평균→AVG, 등급→GRADE)
ALTER TABLE TBL_SUNGJUK
ADD( TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR );
--==>> Table TBL_SUNGJUK이(가) 변경되었습니다.

--※ 여기서 추가한 컬럼에 대한 항목들은
--   프로시저 실습을 위해 추가한 것일 뿐
--   실제 테이블 구조에 적합하지도, 바람직하지도 않은 내용이다.

--○ 변경된 테이블 구조 확인
DESC TBL_SUNGJUK;
--==>> 
/*
이름     널?       유형           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)   
*/

--○ 생성한 프로시저(PRC_SUNGJUK_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_SUNGJUK_INSERT(1, '김진희', 90, 80, 70);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	김진희	90	80	70	240	80	B

EXEC PRC_SUNGJUK_INSERT(2, '김소연', 98, 88, 77);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	김진희	90	80	70	240	80	    B
2	김소연	98	88	77	263	87.7	B
*/



EXEC PRC_SUNGJUK_UPDATE(2,100,100,100);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	김진희	90	80	70	240	80	B
2	김소연	100	100	100	300	100	A
*/

EXEC PRC_SUNGJUK_UPDATE(1,55,66,77);

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	김진희	55	66	77	198	66	D
2	김소연	100	100	100	300	100	A
*/

SELECT *
FROM TBL_STUDENTS;
SELECT *
FROM TBL_IDPW;

SELECT I.ID, I.PW, S.TEL, S.ADDR
FROM TBL_IDPW I JOIN TBL_STUDENTS S
ON I.ID = S.ID;
--==>> 
/*
superman	java006$	010-1111-1111	서울 강남구...
batman	    java006$	010-2222-2222	경기도 고양시
*/  




--○ 생성한 프로시저(PRC_STUDENT_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_STUDENTS_UPDATE('superman','java006$','010-9999-9999','인천');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	손범석	010-9999-9999	인천
batman	    송해덕	010-2222-2222	경기도 고양시
*/
SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	java006$
batman	    java006$
*/

--○ 생성한 프로시저(PRC_STUDENT_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_STUDENTS_UPDATE('superman','java001$','010-8888-8888','서울');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
-- 패스워드 안맞지만 프로시저는 실행됨!

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	손범석	010-9999-9999	인천
batman	    송해덕	010-2222-2222	경기도 고양시
*/
SELECT *
FROM TBL_IDPW;
/*
superman	java006$
batman	    java006$
*/
--==>> 둘다 변경 안됨!


SELECT *
FROM TBL_INSA;


--○ 과제1 테스트
SELECT NAME "이름",BASICPAY "기본급", SUDANG "수당",FN_PAY(BASICPAY,SUDANG)"연봉"
FROM TBL_INSA;
--==>>
/*
홍길동	2610000	200000	31520000
이순신	1320000	200000	16040000
이순애	2550000	160000	30760000
김정훈	1954200	170000	23620400
한석봉	1420000	160000	17200000
이기자	2265000	150000	27330000
장인철	1250000	150000	15150000
김영년	950000	145000	11545000
나윤균	840000	220400	10300400
김종서	2540000	130000	30610000
유관순	1020000	140000	12380000
정한국	880000	114000	10674000
조미숙	1601000	103000	19315000
황진이	1100000	130000	13330000
이현숙	1050000	104000	12704000
이상헌	2350000	150000	28350000
엄용수	950000	210000	11610000
이성길	880000	123000	10683000
박문수	2300000	165000	27765000
유영희	880000	140000	10700000
홍길남	875000	120000	10620000
이영숙	1960000	180000	23700000
김인수	2500000	170000	30170000
김말자	1900000	170000	22970000
우재옥	1100000	160000	13360000
김숙남	1050000	150000	12750000
김영길	2340000	170000	28250000
이남신	892000	110000	10814000
김말숙	920000	124000	11164000
정정해	2304000	124000	27772000
지재환	2450000	160000	29560000
심심해	880000	108000	10668000
김미나	1020000	104000	12344000
이정석	1100000	160000	13360000
정영희	1050000	140000	12740000
이재영	960400	190000	11714800
최석규	2350000	187000	28387000
손인수	2000000	150000	24150000
고순정	2010000	160000	24280000
박세열	2100000	130000	25330000
문길수	2300000	150000	27750000
채정희	1020000	200000	12440000
양미옥	1100000	210000	13410000
지수환	1060000	220000	12940000
홍원신	960000	152000	11672000
허경운	2650000	150000	31950000
산마루	2100000	112000	25312000
이기상	2050000	106000	24706000
이미성	1300000	130000	15730000
이미인	1950000	103000	23503000
권영미	2260000	104000	27224000
권옥경	1020000	105000	12345000
김싱식	960000	108000	11628000
정상호	980000	114000	11874000
정한나	1000000	104000	12104000
전용재	1950000	200000	23600000
이미경	2520000	160000	30400000
김신제	1950000	180000	23580000
임수봉	890000	102000	10782000
김신애	900000	102000	10902000
*/

--○ 과제2 테스트
SELECT NAME"이름", IBSADATE"입사일",FN_WORKYEAR(IBSADATE)"근무년수"
FROM TBL_INSA;
--==>>
/*
홍길동	98/10/11	22.9
이순신	00/11/29	20.7
이순애	99/02/25	22.5
김정훈	00/10/01	20.9
한석봉	04/08/13	17
이기자	02/02/11	19.5
장인철	98/03/16	23.4
김영년	02/04/30	19.3
나윤균	03/10/10	17.9
김종서	97/08/08	24.1
유관순	00/07/07	21.1
정한국	99/10/16	21.9
조미숙	98/06/07	23.2
황진이	02/02/15	19.5
이현숙	99/07/26	22.1
이상헌	01/11/29	19.7
엄용수	00/08/28	21
이성길	04/08/08	17.1
박문수	99/12/10	21.7
유영희	03/10/10	17.9
홍길남	01/09/07	20
이영숙	03/02/25	18.5
김인수	95/02/23	26.5
김말자	99/08/28	22
우재옥	00/10/01	20.9
김숙남	02/08/28	19
김영길	00/10/18	20.9
이남신	01/09/07	20
김말숙	00/09/08	21
정정해	99/10/17	21.9
지재환	01/01/21	20.6
심심해	00/05/05	21.3
김미나	98/06/07	23.2
이정석	05/09/26	15.9
정영희	02/05/16	19.3
이재영	03/08/10	18
최석규	98/10/15	22.9
손인수	99/11/15	21.8
고순정	03/12/28	17.7
박세열	00/09/10	21
문길수	01/12/10	19.7
채정희	03/10/17	17.9
양미옥	03/09/24	17.9
지수환	04/01/21	17.6
홍원신	03/03/16	18.4
허경운	99/05/04	22.3
산마루	01/07/15	20.1
이기상	01/06/07	20.2
이미성	00/04/07	21.4
이미인	03/06/07	18.2
권영미	00/06/04	21.2
권옥경	00/10/10	20.9
김싱식	99/12/12	21.7
정상호	99/10/16	21.9
정한나	04/06/07	17.2
전용재	04/08/13	17
이미경	98/02/11	23.5
김신제	03/08/08	18.1
임수봉	01/10/10	19.9
김신애	01/10/10	19.9
*/

SELECT *
FROM TBL_INSA;


--○ 생성한 프로시저(PRC_INSA_INSERT())가 제대로 작동하는지의 여부 확인
EXEC PRC_INSA_INSERT('이다영', '951027-2234567', SYSDATE, '서울', '010-4113-2353', '영업부', '대리', 10000000, 2000000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_INSA_INSERT('박혜진', '941013-2234567', SYSDATE, '경기', '010-6331-3939', '개발부', '대리', 10000000, 2000000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_INSA;
--==>>
/*
1061	이다영	951027-2234567	2021-09-17	서울	010-4113-2353	영업부	대리	10000000	2000000
1062	박혜진	941013-2234567	2021-09-17	경기	010-6331-3939	개발부	대리	10000000	2000000
1001	홍길동	771212-1022432	1998-10-11	서울	011-2356-4528	기획부	부장	2610000	200000
1002	이순신	801007-1544236	2000-11-29	경기	010-4758-6532	총무부	사원	1320000	200000
1003	이순애	770922-2312547	1999-02-25	인천	010-4231-1236	개발부	부장	2550000	160000
1004	김정훈	790304-1788896	2000-10-01	전북	019-5236-4221	영업부	대리	1954200	170000
1005	한석봉	811112-1566789	2004-08-13	서울	018-5211-3542	총무부	사원	1420000	160000
1006	이기자	780505-2978541	2002-02-11	인천	010-3214-5357	개발부	과장	2265000	150000
1007	장인철	780506-1625148	1998-03-16	제주	011-2345-2525	개발부	대리	1250000	150000
1008	김영년	821011-2362514	2002-04-30	서울	016-2222-4444	홍보부	사원	950000	145000
1009	나윤균	810810-1552147	2003-10-10	경기	019-1111-2222	인사부	사원	840000	220400
1010	김종서	751010-1122233	1997-08-08	부산	011-3214-5555	영업부	부장	2540000	130000
1011	유관순	801010-2987897	2000-07-07	서울	010-8888-4422	영업부	사원	1020000	140000
1012	정한국	760909-1333333	1999-10-16	강원	018-2222-4242	홍보부	사원	880000	114000
1013	조미숙	790102-2777777	1998-06-07	경기	019-6666-4444	홍보부	대리	1601000	103000
1014	황진이	810707-2574812	2002-02-15	인천	010-3214-5467	개발부	사원	1100000	130000
1015	이현숙	800606-2954687	1999-07-26	경기	016-2548-3365	총무부	사원	1050000	104000
1016	이상헌	781010-1666678	2001-11-29	경기	010-4526-1234	개발부	과장	2350000	150000
1017	엄용수	820507-1452365	2000-08-28	인천	010-3254-2542	개발부	사원	950000	210000
1018	이성길	801028-1849534	2004-08-08	전북	018-1333-3333	개발부	사원	880000	123000
1019	박문수	780710-1985632	1999-12-10	서울	017-4747-4848	인사부	과장	2300000	165000
1020	유영희	800304-2741258	2003-10-10	전남	011-9595-8585	자재부	사원	880000	140000
1021	홍길남	801010-1111111	2001-09-07	경기	011-9999-7575	개발부	사원	875000	120000
1022	이영숙	800501-2312456	2003-02-25	전남	017-5214-5282	기획부	대리	1960000	180000
1023	김인수	731211-1214576	1995-02-23	서울		영업부	부장	2500000	170000
1024	김말자	830225-2633334	1999-08-28	서울	011-5248-7789	기획부	대리	1900000	170000
1025	우재옥	801103-1654442	2000-10-01	서울	010-4563-2587	영업부	사원	1100000	160000
1026	김숙남	810907-2015457	2002-08-28	경기	010-2112-5225	영업부	사원	1050000	150000
1027	김영길	801216-1898752	2000-10-18	서울	019-8523-1478	총무부	과장	2340000	170000
1028	이남신	810101-1010101	2001-09-07	제주	016-1818-4848	인사부	사원	892000	110000
1029	김말숙	800301-2020202	2000-09-08	서울	016-3535-3636	총무부	사원	920000	124000
1030	정정해	790210-2101010	1999-10-17	부산	019-6564-6752	총무부	과장	2304000	124000
1031	지재환	771115-1687988	2001-01-21	서울	019-5552-7511	기획부	부장	2450000	160000
1032	심심해	810206-2222222	2000-05-05	전북	016-8888-7474	자재부	사원	880000	108000
1033	김미나	780505-2999999	1998-06-07	서울	011-2444-4444	영업부	사원	1020000	104000
1034	이정석	820505-1325468	2005-09-26	경기	011-3697-7412	기획부	사원	1100000	160000
1035	정영희	831010-2153252	2002-05-16	인천		개발부	사원	1050000	140000
1036	이재영	701126-2852147	2003-08-10	서울	011-9999-9999	자재부	사원	960400	190000
1037	최석규	770129-1456987	1998-10-15	인천	011-7777-7777	홍보부	과장	2350000	187000
1038	손인수	791009-2321456	1999-11-15	부산	010-6542-7412	영업부	대리	2000000	150000
1039	고순정	800504-2000032	2003-12-28	경기	010-2587-7895	영업부	대리	2010000	160000
1040	박세열	790509-1635214	2000-09-10	경북	016-4444-7777	인사부	대리	2100000	130000
1041	문길수	721217-1951357	2001-12-10	충남	016-4444-5555	자재부	과장	2300000	150000
1042	채정희	810709-2000054	2003-10-17	경기	011-5125-5511	개발부	사원	1020000	200000
1043	양미옥	830504-2471523	2003-09-24	서울	016-8548-6547	영업부	사원	1100000	210000
1044	지수환	820305-1475286	2004-01-21	서울	011-5555-7548	영업부	사원	1060000	220000
1045	홍원신	690906-1985214	2003-03-16	전북	011-7777-7777	영업부	사원	960000	152000
1046	허경운	760105-1458752	1999-05-04	경남	017-3333-3333	총무부	부장	2650000	150000
1047	산마루	780505-1234567	2001-07-15	서울	018-0505-0505	영업부	대리	2100000	112000
1048	이기상	790604-1415141	2001-06-07	전남		개발부	대리	2050000	106000
1049	이미성	830908-2456548	2000-04-07	인천	010-6654-8854	개발부	사원	1300000	130000
1050	이미인	810403-2828287	2003-06-07	경기	011-8585-5252	홍보부	대리	1950000	103000
1051	권영미	790303-2155554	2000-06-04	서울	011-5555-7548	영업부	과장	2260000	104000
1052	권옥경	820406-2000456	2000-10-10	경기	010-3644-5577	기획부	사원	1020000	105000
1053	김싱식	800715-1313131	1999-12-12	전북	011-7585-7474	자재부	사원	960000	108000
1054	정상호	810705-1212141	1999-10-16	강원	016-1919-4242	홍보부	사원	980000	114000
1055	정한나	820506-2425153	2004-06-07	서울	016-2424-4242	영업부	사원	1000000	104000
1056	전용재	800605-1456987	2004-08-13	인천	010-7549-8654	영업부	대리	1950000	200000
1057	이미경	780406-2003214	1998-02-11	경기	016-6542-7546	자재부	부장	2520000	160000
1058	김신제	800709-1321456	2003-08-08	인천	010-2415-5444	기획부	대리	1950000	180000
1059	임수봉	810809-2121244	2001-10-10	서울	011-4151-4154	개발부	사원	890000	102000
1060	김신애	810809-2111111	2001-10-10	서울	011-4151-4444	개발부	사원	900000	102000
*/


