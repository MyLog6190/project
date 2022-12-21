
--- 수정 금지 ---
-- DROP TABLE
DROP TABLE REGISTRATION_USER CASCADE CONSTRAINTS;
DROP TABLE EXERCISE_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE EXERCISE CASCADE CONSTRAINTS;
DROP TABLE BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE VOLUME CASCADE CONSTRAINTS;
DROP TABLE PROGRAM CASCADE CONSTRAINTS;
DROP TABLE PR CASCADE CONSTRAINTS;
DROP TABLE RECODE_EXERCISE_VOLUME CASCADE CONSTRAINTS;
DROP TABLE NOTICE_BOARD CASCADE CONSTRAINTS;

-- DROP SEQUENCE
DROP SEQUENCE CATEGORY_SEQ;
DROP SEQUENCE EXERCISE_SEQ;
DROP SEQUENCE VOLUME_SEQ;
DROP SEQUENCE PR_SEQ;
DROP SEQUENCE NOTICE_BOARD_SEQ;
---------------

<<<<<<< HEAD
=======
delete from REGISTRATION_USER where user_id = 'seralove4@gmail.com' 
>>>>>>> branch 'master' of https://github.com/MyLog6190/project.git

insert into bookmark values('tatelulove4@naver.com', 'E1')


--- 수정 가능 ---
----------- USER ------------
-- USER TABLE CREATE
CREATE TABLE REGISTRATION_USER (
	USER_ID VARCHAR2(30) PRIMARY KEY,
	PASSWORD VARCHAR2(100),
	NAME VARCHAR2(20) NOT NULL,
	WEIGHT NUMBER,
	LOGIN_GROUP VARCHAR2(10),
	SEX VARCHAR2(10),
	PROFILE_IMAGE VARCHAR2(100),
	ROLE VARCHAR2(15)
);

SELECT * FROM registration_user;
-- USER COMMENT
COMMENT ON COLUMN REGISTRATION_USER.USER_ID IS '사용자 ID';
COMMENT ON COLUMN REGISTRATION_USER.PASSWORD IS '비밀번호';
COMMENT ON COLUMN REGISTRATION_USER.NAME IS '이름';
COMMENT ON COLUMN REGISTRATION_USER.WEIGHT IS '몸무게';
COMMENT ON COLUMN REGISTRATION_USER.SEX IS '성별';
COMMENT ON COLUMN REGISTRATION_USER.PROFILE_IMAGE IS '프로필 사진';
COMMENT ON COLUMN REGISTRATION_USER.ROLE IS '권한';




----------- EXERCISE_CATEGORY ------------
-- EXERCISE_CATEGORY TABLE CREATE
CREATE TABLE EXERCISE_CATEGORY(
	C_NO VARCHAR2(10) PRIMARY KEY,
	C_NAME VARCHAR2(20) NOT NULL
);

SELECT * FROM EXERCISE_CATEGORY

-- EXERCISE_CATEGORY SEQUENCE
CREATE SEQUENCE CATEGORY_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- EXERCISE_CATEGORY COMMENT
COMMENT ON COLUMN EXERCISE_CATEGORY.C_NO IS '카테고리ID';
COMMENT ON COLUMN EXERCISE_CATEGORY.C_NAME IS '운동카테고리';

-- EXERCISE_CATEGORY INSERT
INSERT INTO EXERCISE_CATEGORY VALUES('C' || CATEGORY_SEQ.NEXTVAL, '하체');
INSERT INTO EXERCISE_CATEGORY VALUES('C' || CATEGORY_SEQ.NEXTVAL, '가슴');
INSERT INTO EXERCISE_CATEGORY VALUES('C' || CATEGORY_SEQ.NEXTVAL, '등');
INSERT INTO EXERCISE_CATEGORY VALUES('C' || CATEGORY_SEQ.NEXTVAL, '어깨');
INSERT INTO EXERCISE_CATEGORY VALUES('C' || CATEGORY_SEQ.NEXTVAL, '팔');
INSERT INTO EXERCISE_CATEGORY VALUES('C' || CATEGORY_SEQ.NEXTVAL, '복근');





----------- EXERCISE ------------
-- EXERCISE TABLE CREATE
CREATE TABLE EXERCISE(
	E_NO VARCHAR2(10) PRIMARY KEY,
	E_NAME VARCHAR2(90) NOT NULL,
	C_NO VARCHAR2(20) NOT NULL REFERENCES EXERCISE_CATEGORY(C_NO),
	E_IMG VARCHAR2(100),
	E_CONTENT VARCHAR2(4000) NOT NULL
);

<<<<<<< HEAD
=======
SELECT * FROM BOOKMARK

>>>>>>> branch 'master' of https://github.com/MyLog6190/project.git

-- EXERCISE SEQUENCE
CREATE SEQUENCE EXERCISE_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- EXERCISE COMMENT
COMMENT ON COLUMN EXERCISE.E_NO IS '운동ID';
COMMENT ON COLUMN EXERCISE.E_NAME IS '운동이름';
COMMENT ON COLUMN EXERCISE.C_NO IS 'CATEGORY ID';
COMMENT ON COLUMN EXERCISE.E_IMG IS '사진경로';
COMMENT ON COLUMN EXERCISE.E_CONTENT IS '운동설명';

-- EXERCISE INSERT
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'핵 스쿼트', 'C1', '/views/images/libimages/leg/hsqt.png',
'1. 머신에 허리를 붙인 상태에서 기본 스쿼트 보폭으로 곧게 섭니다.
2. 허리가 굽지 않도록 배에 힘을 준 상태로 다리가 ㄱ자 모양이 될 때까지 내려갑니다.
3. 대퇴사두(허벅지)와 힙의 자극을 느끼면서, 양발바닥을 지긋이 누르며 올라옵니다.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'런지', 'C1', '/views/images/libimages/leg/lg.png',
'1. 양발을 골반 너비만큼 벌리고 상체를 곧게 펴고 섭니다.
2. 한쪽 다리를 뻗어 앞으로 나가면서 두 무릎이 90도 각도를 이룰 때까지 엉덩이를 낮춰줍니다. 이때 상체와 등은 곧게 편 자세를 유지합니다.
3. 양발의 뒤꿈치에 무게 중심을 실어서 몸을 위쪽으로 밀어주며 원래 시작 자세로 돌아옵니다.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'컨벤셔널 데드리프트', 'C1', '/views/images/libimages/leg/barbell-deadlift.jpg',
'1. 양발을 골반보다 약간 넓게 벌리고, 바벨의 그립을 어깨보다 조금 넓게 하여 무릎과 팔이 겹치지 않도록 합니다.
2. 등이 굽지 않도록 상체를 곧게 유지하면서, 발바닥으로 지면을 밀어올린다는 느낌으로 바벨을 들어 올립니다. (이때, 복압을 단단하게 유지한채로 바벨을 몸에 붙여서 들어올립니다.)
3. 몸을 완전히 쭉 피고 엉덩이 근육을 수축합니다.
4. 바벨을 들어올린 역순서대로 바닥으로 내려 시작 자세로 돌아갑니다.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'레그 익스텐션', 'C1', '/views/images/libimages/leg/lget.jpg',
'1. 의자는 무릎 바로 아래에 올 수 있게, 패드는 발목 살짝 위에 위치할 수 있도록 머신을 조정합니다.
2. 엉덩이가 떨어지지 않게 유지하면서, 허벅지의 힘으로 고정부위를 지긋이 밀어올립니다.
3. 근육의 긴장을 유지하면서 천천히 무릎을 굽혀줍니다.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'레그 컬', 'C1', '/views/images/libimages/leg/lgcl.png',
'1. 머신에 엎드린 상태에서, 종아리 쪽의 패드가 아킬레스건 바로 위쪽에 위치하도록 머신을 조정합니다.
2. 발목을 세운 상태에서, 무릎을 굽혀 기구를 올려줍니다.
3. 허리, 엉덩이, 햄스트링에 긴장감을 유지하면서 기구를 천천히 내립니다.');


INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'벤치 프레스', 'C2', '/views/images/libimages/chest/benchpress.png',

'1. 벤치에 평평하게 눕습니다.
2. 바벨을 어깨 너비보다 넓게 팔을 벌리고 들어 올리십시오.
3. 바벨을 가슴 위로 가져 와서 몸에 닿기 직전까지 천천히 내립니다.
4. 팔을 위로 올려 바벨을 곧게 올리십시오.
5. 잠시 멈추고 천천히 반복합니다.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'인클라인 벤치 프레스', 'C2', '/views/images/libimages/chest/inclinebenchpress.png',
'1. 다리를 어깨 너비를 벌리고 45도 각도로 기울어진 인클라인벤치에 평평하게 눕습니다.
2. 어깨 너비보다 약간 넓게 바벨바를 잡으십시오.
3. 몸 위에 바벨을 올리고 가슴 중앙으로 옮기십시오. 이것이 출발점입니다.
4. 바벨이 가슴에 닿을 때까지 아래로 내립니다.
5. 팔이 완전히 펴질때까지 바벨을 똑바로 들어 올리십시오.
6. 시작 위치로 돌아갑니다.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'딥스', 'C2', '/views/images/libimages/chest/dips.png',
'1. 평행봉 사이에 서십시오.
2. 평행봉의 손잡이를 잡고 몸을 밀어 올립니다.
3. 몸을 앞으로 기울리고 팔꿈치를 굽혀 몸을 내리면서 숨을 들이 마시십시오.
4. 다시 팔을 펴면서 숨을 내쉬십시오.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'덤벨 플라이', 'C2', '/views/images/libimages/chest/chestfly.png',
'1. 팔꿈치를 약간 구부리고 손바닥이 서로 마주보게 덤벨을 잡고 벤치에 누워 팔을 올립니다.
2. 팔꿈치에 약간의 굽힘을 유지하면서 덤벨을 바닥쪽으로 내리면서 숨을 들이 마십니다.
3. 다시 팔을 올리면서 숨을 내쉽니다.');

INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'덤벨 프레스', 'C2', '/views/images/libimages/chest/dumbellpress.png',
'1. 각 손에 덤벨을 잡고 바닥에 발을 단단히 고정하십시오.
2. 오버그립으로 덤벨을 잡고 가슴 위로 팔을 완전히 핍니다.
4. 팔꿈치를 90도 각도로 구부리면서 숨을 들이 마시고 삼두근이 바닥과 평행하도록하십시오.
5. 다시 팔을 펴면서 숨을 내쉬십시오.');

	
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'랫 풀 다운', 'C3', '/views/images/libimages/back/lpdw.jpg',
'1. 케이블 기계에 앉는다.
2. 타겟 근육에 맞춰 그립 너비를 정하고, 손바닥이 앞으로 향한 상태로 바를 잡으십시오.
3. 허리를 피고 바를 가슴 위쪽으로 당기며 상체를 약간 뒤로 젖힙니다.
4. 잠시 멈추고 바를 시작 위치로 되돌립니다.
5. 반복.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'바벨 로우', 'C3', '/views/images/libimages/back/barbellrow.png',
'1. 오버 그립으로 바벨을 잡고 몸통을 곧게 유지한 채 엉덩이를 뒤로 빼면서 상체를 구부리며 숨을 들이 마십니다.
2. 숨을 내쉬면서 바벨을 복부 쪽으로 당깁니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'덤벨 로우', 'C3', '/views/images/libimages/back/dbrow.jpg',
'1. 오른발을 바닥에 놓고 왼쪽 무릎을 굽혀 평평한 벤치 위에 올립니다.
2. 앞으로 몸을 기울이면 왼쪽 팔과 무릎에서 몸의 무게를 지탱할 수 있습니다.
3. 허리를 펴고 오른손으로 덤벨을 듭니다.
4. 가능한 한 가슴 가까이에 오른팔을 올리십시오.
5. 상단에서 잠시 멈추고 천천히 덤벨을 시작 위치로 내립니다.
6. 반대로하여 덤벨를 드십시오.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'풀 업', 'C3', '/views/images/libimages/back/pu.jpg',
'1. 어깨 너비로 팔을 뻗어 언더그립 또는 오버 그립으로 풀업바를 잡습니다.
2. 풀업바가 가슴 위쪽에 닿을때까지 몸통을 당깁니다. 이때 숨을 내쉬십시오.
3. 팔을 완전히 펴고 등이 완전히 펴질 때 숨을 들어 마십니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'암 풀 다운', 'C3', '/views/images/libimages/back/apd.jpg',
'1. 양 팔을 어깨너비만큼 벌린 상태로 케이블을 바라보고 섭니다.
2. 양손을 어깨너비보다 살짝 넓게 벌려 케이블에 연결한 바를 잡습니다. (엄지가 올라가는 썸리스그립으로 잡으면 광배근에 더 큰 자극을 줄 수 있습니다.)
3. 무릎을 살짝 굽히고 상체를 45도 각도로 숙인 상태에서 광배근의 자극을 느끼며 팔을 아래로 당깁니다. 이 때 팔이 굽혀지지 않게 힘을 준 상태로 삼두를 광배에 붙여준다 생각하며 등을 수축합니다.
4. 가슴을 활짝 편 상태로 광배에 자극을 느끼면서 천천히 시작 자세로 돌아갑니다.');


INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'오버 헤드 프레스', 'C4', '/views/images/libimages/shoulder/ohp.png',
'1. 바벨을 어깨너비로 잡고 쇄골 위에 올려둡니다.
2. 등에 힘을 주고 가슴을 피면서 바벨을 위로 밀어올립니다.
3. 바벨이 올라간 동선을 따라 천천히 내려 시작 자세로 돌아옵니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'덤벨 숄더 프레스', 'C4', '/views/images/libimages/shoulder/dsp.jpg',
'1. 벤치에 앉아 허리를 피고 손바닥을 앞쪽으로 향하게 한 상태에서 각손에 덤벨을 잡습니다.
2. 어깨 높이에서 팔을 들고 시작하십시오.
3. 팔을 펴고 덤벨을 머리 위로 들어 올리십시오.
4. 팔을 끝까지 올리고 팔을 가까이 가져 가십시오.
5. 잠시 멈추고 천천히 덤벨을 시작 위치로 내립니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'사이드 레터럴 레이즈', 'C4', '/views/images/libimages/shoulder/slr.jpg',
'1. 손바닥 안쪽을 몸쪽으로 향하게하고 양손에 덤벨을 듭니다.
2. 다리를 어깨 넓이로 벌리고, 허리를 펴고, 무릎을 약간 구부리십시오.
3. 팔꿈치를 약간 구부린 상태에서 팔을 어깨 높이까지 들어 올리십시오.
4. 잠시 동안 자세를 유지 한 다음 천천히 팔을 시작 위치로 내립니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'리버스 펙덱 플라이', 'C4', '/views/images/libimages/shoulder/rpdf.png',
'1. 머신을 마주보고 앉아 가슴을 지지하는 패드에 가슴을 기대고 앉습니다.
2. 팔꿈치를 자연스럽게 구부린 상태로 양손으로 손잡이를 잡아줍니다. 이 때 어깨와 팔꿈치 손이 수평이 되도록 합니다.
3. 후면 삼각근의 자극을 느끼며 팔꿈치를 최대한 뒤로 밀어줍니다.
4. 팔꿈치가 움직이지 않게 제한하면서 시작 자세로 돌아옵니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'페이스 풀', 'C4', '/views/images/libimages/shoulder/fp.jpg',
'1. 케이블을 머리 높이에 고정한 뒤, 케이블을 바라보고 섭니다.
2. 손바닥이 바닥을 보도록 양손으로 로프를 잡습니다.
3. 가슴을 편 상태로 로프를 얼굴 방향으로 귀 옆까지 힘껏 당깁니다.
4. 팔을 펴먼서 시작 자세로 돌아갑니다.');


INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'케이블 푸쉬 다운', 'C5', '/views/images/libimages/arm/cbpd.jpg',
'1. 케이블 앞에 서서 높은 풀리에 스트레이트 바를 연결하십시오.
2. 손바닥을 아래로 향하게하여 손잡이를 잡습니다.
3. 복근에 힘을 주고 등을 똑바로 세웁니다.
4. 접혀있는 팔꿉치를 펴서 손잡이을 허벅지쪽으로 내립니다.
5. 잠시 멈추고 시작 위치로 돌아갑니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'덤벨 컬', 'C5', '/views/images/libimages/arm/dbc.jpg',
'1. 다리를 어깨 너비로 벌리고 등을 곱게 펴고 손바닥이 앞을 향하도록 덤벨을 잡고 숨을 들어 마십니다
2. 덤벨을 들어올리면서 손목을 외회전시키면서 숨을 내쉽니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'케이블 트라이셉스 익스텐션', 'C5', '/views/images/libimages/arm/cbte.png',
'1. 다리를 어깨 너비로 벌리고, 등을 직선으로 펴되, 편한만큼 굽힙니다.
2. 손등을 바깥으로 향하게 하여 양손으로 케이블을 잡습니다.
3. 케이블을 머리 앞으로 당기십시오.
4. 천천히 케이블을 시작 위치까지 올리십시오.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'스컬 크러셔', 'C5', '/views/images/libimages/arm/skcs.png',
'1. 벤치에 눕습니다.
2. 손등을 바깥으로 향하게 하여 바벨을 잡으십시오.
3. 팔들 들어 몸과 수직을 유지하십시오.
4. 팔꿈치만 구부리면서 천천히 낮추고 바벨을 올리십시오.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'해머 컬', 'C5', '/views/images/libimages/arm/hmcrl.jpg',
'1. 어깨 너비로 다리를 벌리고 등을 공게 펴고, 패러럴 그립으로 덤벨을 잡고 숨을 들어 마십니다.
2. 팔을 들어 올리면서 숨을 내쉽니다.');


INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'크런치', 'C6', '/views/images/libimages/abs/crunch.jpg',
'1. 벤치 위에 발을 올려 놓고 허리를 굽히고 무릎을 90도 각도로 구부립니다.
2. 가슴이나 귀에에 손을 얹으십시오.
3. 숨을 내쉬면서 등을 둥글게 구부립니다.
4. 잠시 동안 멈춘후 시작 위치로 내려가며 숨을 들이쉽니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'행잉 레그레이즈', 'C6', '/views/images/libimages/abs/hlr.png',
'1. 바를 잡고 받침대에 기대 매달립니다.
2. 아랫배에 힘을 주어 양다리를 위로 말아 올려줍니다.
3. 복근에 자극을 느끼며 천천히 양다리를 내려줍니다.');
INSERT INTO EXERCISE VALUES('E' || EXERCISE_SEQ.NEXTVAL,'레그레이즈', 'C6', '/views/images/libimages/abs/lr.png',
'1. 엉덩이 아래에 손을 넣고 평평한 벤치 위에 눕습니다.
2. 무릎을 약간 구부리고 다리를 똑바로 유지하고 엉덩이를 90도 전방까지 다리를 들어 올리면서 숨을 내쉽니다.
3. 정상에서 잠시 멈추고 천천히 다리를 시작 위치로 되돌리면서 숨을 들이 마십니다.');




----------- MARK ------------
-- BOOKMARK TABLE CTEATE
CREATE TABLE BOOKMARK (
	USER_ID VARCHAR2(30) NOT NULL REFERENCES REGISTRATION_USER(USER_ID) ,
	E_NO VARCHAR2(10) NOT NULL REFERENCES EXERCISE(E_NO)
);


-- BOOKMARK COMMENT
COMMENT ON COLUMN BOOKMARK.USER_ID IS '사용자 ID';
COMMENT ON COLUMN BOOKMARK.E_NO IS '북마크된 운동';



<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/MyLog6190/project.git
----------- PROGRAM ------------
--PROGRAM TABLE CREATE
CREATE TABLE PROGRAM(
<<<<<<< HEAD
	P_NO VARCHAR2(40) PRIMARY KEY,
	P_NAME VARCHAR2(20) NOT NULL,
	P_CYCLE VARCHAR2(20) NOT NULL,
	P_CONTENTS VARCHAR2(4000) NOT NULL,
	P_IMG VARCHAR2(100) NOT NULL,
	
);

-- PROGRAM COMMENT
COMMENT ON COLUMN PROGRAM.P_NO IS '프로그램 ID';
COMMENT ON COLUMN PROGRAM.P_NAME IS '프로그램 이름';
COMMENT ON COLUMN PROGRAM.P_CYCLE IS '운동주기';
COMMENT ON COLUMN PROGRAM.P_CONTENTS IS '주의사항 및 중량설정방법'
COMMENT ON COLUMN PROGRAM.P_IMG IS '사진경로';


-- PROGRAM INSERT
INSERT INTO PROGRAM VALUES('P1', 'Strong Lift 5 by 5', '주 3회',
'메인 운동 모든 세트 성공 시 다음 워크 아웃마다 과부하하여 진행. 메인 운동 수행 중 연속 3세트 5회 실패 시 10%씩 중량 감소 시켜 디로딩.',
'/views/images/progimges/stl.png'
);

INSERT INTO PROGRAM VALUES('P2', 'Golden Six', '주 3회',
'마지막 세트 실패지점까지, 마지막 세트 13개 이상 성공하면 다음 워크아웃 최소 과부하',
'/views/images/progimges/golden six.png'
);

INSERT INTO PROGRAM VALUES('P3', 'GVT', '주 3회',
'이완 4초, 수축 2초. 10*10 수행 성공할 때까지 기록, 성공 시 해당 종목 다음 워크아웃 때 5% 증량.',
'/views/images/progimges/gvt.jpg'
);


----------- PROGRAM_EXERCISE -------
--PROGRAM_EXERCISE TABLE CREATE
CREATE TABLE PROGRAM_EXERCISE(
	P_NO VARCHAR2(40) NOT NULL REFERENCES PROGRAM(P_NO),
	E_NO VARCHAR2(100) NOT NULL REFERENCES EXERCISE(E_NO);
	P_TYPE VARCHAR2(20) NOT NULL,
	P_SET VARCHAR2(200) NOT NULL,
	P_REPS VARCHAR2(200) NOT NULL,
	P_KG VARCHAR2(200) NOT NULL,
	P_REST NUMBER NOT NULL
);	


-- PROGRAM_EXERCISE COMMENT
COMMENT ON COLUMN PROGRAM_EXERCISE.P_NO IS '프로그램 구성 운동';
COMMENT ON COLUMN PROGRAM_EXERCISE.E_NO IS '운동 종목';
COMMENT ON COLUMN PROGRAM_EXERCISE.P_TYPE IS '타입';
COMMENT ON COLUMN PROGRAM_EXERCISE.P_SET IS '세트수';
COMMENT ON COLUMN PROGRAM_EXERCISE.P_REPS IS '반복 수';
COMMENT ON COLUMN PROGRAM_EXERCISE.P_KG IS '중량';
COMMENT ON COLUMN PROGRAM_EXERCISE.P_REST IS '휴식 시간';

-- PROGRAM INSERT
INSERT INTO PROGRAM VALUES('P1','E1','A','5','5','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E6','A','5','5','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E12','A','5','5','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E8','A','5','3','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E24','A','8','2','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E26','A','15','2','자유','90,180,300 택 1'
);

INSERT INTO PROGRAM VALUES('P1','E1','B','5','5','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E16','B','5','5','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E3','B','1','5','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E14','B','5','3','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E22','B','8','2','자유','90,180,300 택 1'
);
INSERT INTO PROGRAM VALUES('P1','E28','B','8','2','자유','90,180,300 택 1'
);


INSERT INTO PROGRAM VALUES('P2', 'E1','A', '4', '10', '타겟 근육 컨트롤 가능한 무게', '120'
);
INSERT INTO PROGRAM VALUES('P2', 'E6','A', '3', '10', '타겟 근육 컨트롤 가능한 무게', '90'
);
INSERT INTO PROGRAM VALUES('P2', 'E14','A', '3', '실패 지점', '타겟 근육 컨트롤 가능한 무게', '90'
);
INSERT INTO PROGRAM VALUES('P2', 'E17','A', '4', '10', '타겟 근육 컨트롤 가능한 무게', '90'
);
INSERT INTO PROGRAM VALUES('P2', 'E22','A', '3', '10', '타겟 근육 컨트롤 가능한 무게', '90'
);
INSERT INTO PROGRAM VALUES('P2', 'E26','A', '4', '실패 지점', '타겟 근육 컨트롤 가능한 무게', '90'
=======
	P_NO VARCHAR2(10) NOT NULL,
	E_NO VARCHAR2(10) NOT NULL,
	P_SET NUMBER NOT NULL,
	P_REPS NUMBER NOT NULL,
	P_KG NUMBER NOT NULL
>>>>>>> branch 'master' of https://github.com/MyLog6190/project.git
);



INSERT INTO PROGRAM VALUES('P3', 'E10','A', '10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E14','A','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E9','A','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E11','A','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E1','B','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E5','B','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E28','B','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E16','C','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E22','C','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E18','C','10', '10', '20RM', '40,60,90 택 1'
);
INSERT INTO PROGRAM VALUES('P3', 'E25','C','10', '10', '20RM', '40,60,90 택 1'
);


----------- VOLUME ------------
-- VOLUME TABLE CTEATE
CREATE TABLE VOLUME(
	R_NO VARCHAR2(10) REFERENCES PR(R_NO),
	V_NO VARCHAR2(10),
	V_REPS NUMBER,
	V_SET NUMBER,
	V_KG NUMBER,
	DO_CHECK NUMBER NOT NULL
);

-- VOLUME SEQUENCE
CREATE SEQUENCE VOLUME_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- VOLUME COMMNET
COMMENT ON COLUMN VOLUME.V_NO IS '볼륨ID';
COMMENT ON COLUMN VOLUME.V_REPS IS '운동 횟수';
COMMENT ON COLUMN VOLUME.V_SET IS '운동 세트 수';
COMMENT ON COLUMN VOLUME.V_KG IS '킬로그람';
COMMENT ON COLUMN VOLUME.DO_CHECK IS '운동 여부 체크';





----------- PR ------------
-- PR TABLE CTEATE
CREATE TABLE PR(
	R_NO VARCHAR2(10) NOT NULL,
	R_DATE VARCHAR2(20) NOT NULL,
	C_NAME VARCHAR2(10) NOT NULL,
	E_NO VARCHAR2(10) NOT NULL,
	E_NAME VARCHAR2(10) NOT NULL,
);

-- PR SEQUENCE
CREATE SEQUENCE PR_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- PR COMMNET
COMMENT ON COLUMN PR.R_NO IS '운동기록 ID';
COMMENT ON COLUMN PR.R_DATE IS '기록 날짜';





----------- RECODE_EXERCISE_VOLUME ------------
-- RECODE_EXERCISE_VOLUME TABLE CREATE
CREATE TABLE RECODE_EXERCISE_VOLUME(
	R_NO NUMBER NOT NULL REFERENCES PR(R_NO),
	E_NO VARCHAR2(20) NOT NULL REFERENCES EXERCISE(E_NO),
	V_NO NUMBER NOT NULL REFERENCES VOLUME(V_NO)
);


-- PR COMMNET
COMMENT ON COLUMN RECODE_EXERCISE_VOLUME.R_NO IS '운동기록 ID';
COMMENT ON COLUMN RECODE_EXERCISE_VOLUME.E_NO IS '기록된 운동 ID';
COMMENT ON COLUMN RECODE_EXERCISE_VOLUME.V_NO IS '기록된 운동 볼륨 ID';



----------- NOTICE_BOARD ------------
-- NOTICE_BOARD TABLE CREATE
CREATE TABLE NOTICE_BOARD(
	B_NO NUMBER NOT NULL PRIMARY KEY,
	B_TAG VARCHAR2(20),
	B_TITLE VARCHAR2(200) NOT NULL,
	B_CONTENT VARCHAR2(4000) NOT NULL	
);

-- NOTICE_BOARD SEQUENCE
CREATE SEQUENCE NOTICE_BOARD_SEQ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- NOTICE_BOARD COMMENT
COMMENT ON COLUMN NOTICE_BOARD.B_NO IS '글 번호';
COMMENT ON COLUMN NOTICE_BOARD.B_TAG IS '글 말머리';
COMMENT ON COLUMN NOTICE_BOARD.B_TITLE IS '글 제목';
COMMENT ON COLUMN NOTICE_BOARD.B_CONTENT IS '글 내용';

INSERT INTO NOTICE_BOARD(b_no, b_tag, b_title, b_content)
 VALUES (1, '', '제목1', '내용1');

INSERT INTO NOTICE_BOARD(b_no, b_tag, b_title, b_content)
 VALUES (2, '', '제목2', '내용2');
 
INSERT INTO NOTICE_BOARD(b_no, b_tag, b_title, b_content)
 VALUES (3, '', '제목3', '내용3');

INSERT INTO NOTICE_BOARD(b_no, b_tag, b_title, b_content)
 VALUES (4, '', '제목4', '내용4');
 
INSERT INTO NOTICE_BOARD(b_no, b_tag, b_title, b_content)
 VALUES (5, '', '제목5', '내용5')
 ;
 
SELECT * FROM NOTICE_BOARD




SELECT * FROM EXERCISE;
SELECT E_NO, E_NAME, E.C_NO AS C_NO, C_NAME, E_IMG, E_CONTENT FROM EXERCISE E JOIN EXERCISE_CATEGORY EC ON E.C_NO = EC.C_NO;

