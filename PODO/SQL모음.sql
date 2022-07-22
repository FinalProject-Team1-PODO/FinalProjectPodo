CREATE TABLE "ITEM_BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"UPDATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ITEM_CONDITION"	VARCHAR2(30)		NOT NULL,
	"TRADE_CONDITION"	VARCHAR2(30)		NOT NULL,
	"DELIVERY"	VARCHAR2(30)		NULL,
	"PRICE"	VARCHAR2(100)		NOT NULL,
	"SECESSION_FL"	CHAR(3)	DEFAULT 'N'	NOT NULL,
	"SELL_AREA"	VARCHAR2(600)		NOT NULL,
	"BOARD_CD"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"BUY_MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ITEM_BOARD"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "ITEM_BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "ITEM_BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "ITEM_BOARD"."READ_COUNT" IS '조회 수';

COMMENT ON COLUMN "ITEM_BOARD"."CREATE_DT" IS '작성일';

COMMENT ON COLUMN "ITEM_BOARD"."UPDATE_DT" IS '마지막 수정일(끌올하기??)';

COMMENT ON COLUMN "ITEM_BOARD"."ITEM_CONDITION" IS '상품 상태(미개봉 / 거의 새 것/ 사용감 있음)';

COMMENT ON COLUMN "ITEM_BOARD"."TRADE_CONDITION" IS '거래 상태(예약중 / 판매중 / 판매완료)';

COMMENT ON COLUMN "ITEM_BOARD"."DELIVERY" IS '무료 배송 / 착불 / 빈칸으로 두기 가능';

COMMENT ON COLUMN "ITEM_BOARD"."PRICE" IS '물품 가격';

COMMENT ON COLUMN "ITEM_BOARD"."SECESSION_FL" IS '삭제 여부 (Y : 삭제)';

COMMENT ON COLUMN "ITEM_BOARD"."SELL_AREA" IS '물품 판매 지역';

COMMENT ON COLUMN "ITEM_BOARD"."BOARD_CD" IS '게시판 코드(판매자,/구매자/FAQ 등등)';

COMMENT ON COLUMN "ITEM_BOARD"."MEMBER_NO" IS '판매자 회원번호';

COMMENT ON COLUMN "ITEM_BOARD"."CATEGORY_NO" IS '카테고리 번호(Like 게시글 번호)';

COMMENT ON COLUMN "ITEM_BOARD"."BUY_MEMBER_NO" IS '구매자 회원번호';

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(20)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(100)		NOT NULL,
	"MEMBER_NICK"	VARCHAR2(30)		NOT NULL,
	"MEMBER_TEL"	CHAR(11)		NOT NULL,
	"SECESSION_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_PROFILE"	VARCHAR2(200)		NULL,
	"MEMBER_GRAPE"	NUMBER	DEFAULT 0	NOT NULL,
	"MEMBER_TOWN"	VARCHAR2(300)		NOT NULL,
	"ADMIN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_ADDR"	VARCHAR2(150)		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '로그인 회원아이디';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '로그인 회원비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICK" IS '회원 닉네임';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원 전화번호';

COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '탈퇴 여부';

COMMENT ON COLUMN "MEMBER"."MEMBER_PROFILE" IS '프로필 사진';

COMMENT ON COLUMN "MEMBER"."MEMBER_GRAPE" IS '회원 포도알';

COMMENT ON COLUMN "MEMBER"."MEMBER_TOWN" IS '판매글/구매글 등등에 사용';

COMMENT ON COLUMN "MEMBER"."ADMIN" IS '관리자 식별';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDR" IS '회원 주소';

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CD"	NUMBER		NOT NULL,
	"BOARD_NM"	VARCHAR2(60)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CD" IS '게시판 코드(판매자,/구매자/FAQ 등등)';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NM" IS '게시판 이름';

CREATE TABLE "L_CATEGORY" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"L_CATEGORY_NM"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "L_CATEGORY"."CATEGORY_NO" IS '카테고리 번호(Like 게시글 번호)';

COMMENT ON COLUMN "L_CATEGORY"."L_CATEGORY_NM" IS '대분류 카테고리 이름';

CREATE TABLE "BOARD_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_RENAME"	VARCHAR2(500)		NOT NULL,
	"IMG_ORIGINAL"	VARCHAR2(500)		NOT NULL,
	"IMG_LEVEL"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지번호';

COMMENT ON COLUMN "BOARD_IMG"."IMG_RENAME" IS '이미지 저장 경로 + 이미지 변경명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL" IS '이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_LEVEL" IS '이미지 순서 지정번호';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호';

CREATE TABLE "ADMIN_BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"UPDATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_CD"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ADMIN_BOARD"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "ADMIN_BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "ADMIN_BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "ADMIN_BOARD"."READ_COUNT" IS '조회 수';

COMMENT ON COLUMN "ADMIN_BOARD"."CREATE_DT" IS '작성일';

COMMENT ON COLUMN "ADMIN_BOARD"."UPDATE_DT" IS '마지막 수정일(끌올하기??)';

COMMENT ON COLUMN "ADMIN_BOARD"."BOARD_CD" IS '게시판 코드(판매자,/구매자/FAQ 등등)';

COMMENT ON COLUMN "ADMIN_BOARD"."MEMBER_NO" IS '회원번호';

CREATE TABLE "MESSAGE" (
	"MESSAGE_NO"	NUMBER	DEFAULT 1	NOT NULL,
	"MESSAGE_CONTENT"	VARCHAR2(1200)		NOT NULL,
	"MESSAGE_TIME"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CHAT_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MESSAGE"."MESSAGE_NO" IS '채팅방 내 메세지 번호';

COMMENT ON COLUMN "MESSAGE"."MESSAGE_CONTENT" IS '메세지 내용';

COMMENT ON COLUMN "MESSAGE"."MESSAGE_TIME" IS '메세지 보낸 시간';

COMMENT ON COLUMN "MESSAGE"."CHAT_NO" IS '채팅방 번호';

COMMENT ON COLUMN "MESSAGE"."MEMBER_NO" IS '회원번호';

CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"REVIEW_TITLE"	VARCHAR2(300)		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(1200)		NOT NULL,
	"REVIEW_CONDITION"	CHAR(6)		NOT NULL,
	"SECESSION_FL"	CHAR(3)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '후기 번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_TITLE" IS '후기 제목';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '후기 내용';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONDITION" IS '좋은 후기면 (좋음) / 나쁜후기면 (나쁨)';

COMMENT ON COLUMN "REVIEW"."SECESSION_FL" IS '삭제 여부 (Y : 삭제)';

COMMENT ON COLUMN "REVIEW"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "REVIEW"."BOARD_NO" IS '게시글 번호';

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER	DEFAULT 1	NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(600)		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"NOTICE_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '알림 번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '알림 내용';

COMMENT ON COLUMN "NOTICE"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_DT" IS '알림 날짜';

CREATE TABLE "CHAR_ROOM" (
	"CHAT_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BUY_MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CHAR_ROOM"."CHAT_NO" IS '채팅방 번호';

COMMENT ON COLUMN "CHAR_ROOM"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "CHAR_ROOM"."MEMBER_NO" IS '판매자 회원번호';

COMMENT ON COLUMN "CHAR_ROOM"."BUY_MEMBER_NO" IS '구매자 회원번호';

CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(500)		NOT NULL,
	"REPORT_TABLE_NO"	NUMBER		NOT NULL,
	"REPORT_CD"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고 내용';

COMMENT ON COLUMN "REPORT"."REPORT_TABLE_NO" IS '신고된 테이블의 PK 번호';

COMMENT ON COLUMN "REPORT"."REPORT_CD" IS '신고 코드(회원/게시글/후기/메세지)';

COMMENT ON COLUMN "REPORT"."MEMBER_NO" IS '신고한 회원번호';

CREATE TABLE "REPORT_TYPE" (
	"REPORT_CD"	NUMBER		NOT NULL,
	"TABLE_NM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "REPORT_TYPE"."REPORT_CD" IS '신고 코드(회원/게시글/후기/메세지)';

COMMENT ON COLUMN "REPORT_TYPE"."TABLE_NM" IS '신고 테이블이름(회원/게시글/후기/메세지)';

CREATE TABLE "BOOKMARK" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOOKMARK"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "BOOKMARK"."BOARD_NO" IS '게시글 번호';

CREATE TABLE "M_CATEGORY" (
	"M_CATEGORY_NO"	NUMBER		NOT NULL,
	"M_CATEGORY_NM"	VARCHAR2(255)		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "M_CATEGORY"."M_CATEGORY_NO" IS '중분류 카테고리 번호';

COMMENT ON COLUMN "M_CATEGORY"."M_CATEGORY_NM" IS '중분류 카테고리 이름';

COMMENT ON COLUMN "M_CATEGORY"."CATEGORY_NO" IS '카테고리 번호(Like 게시글 번호)';

CREATE TABLE "CHAT_ROOM_JOIN" (
	"MESSAGE_NO"	NUMBER	DEFAULT 1	NOT NULL,
	"CHAT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CHAT_ROOM_JOIN"."MESSAGE_NO" IS '채팅방 내 메세지 번호';

COMMENT ON COLUMN "CHAT_ROOM_JOIN"."CHAT_NO" IS '채팅방 번호';

ALTER TABLE "ITEM_BOARD" ADD CONSTRAINT "PK_ITEM_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_CD"
);

ALTER TABLE "L_CATEGORY" ADD CONSTRAINT "PK_L_CATEGORY" PRIMARY KEY (
	"CATEGORY_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "PK_BOARD_IMG" PRIMARY KEY (
	"IMG_NO"
);

ALTER TABLE "ADMIN_BOARD" ADD CONSTRAINT "PK_ADMIN_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY (
	"MESSAGE_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "CHAR_ROOM" ADD CONSTRAINT "PK_CHAR_ROOM" PRIMARY KEY (
	"CHAT_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "REPORT_TYPE" ADD CONSTRAINT "PK_REPORT_TYPE" PRIMARY KEY (
	"REPORT_CD"
);

ALTER TABLE "BOOKMARK" ADD CONSTRAINT "PK_BOOKMARK" PRIMARY KEY (
	"MEMBER_NO",
	"BOARD_NO"
);

ALTER TABLE "M_CATEGORY" ADD CONSTRAINT "PK_M_CATEGORY" PRIMARY KEY (
	"M_CATEGORY_NO"
);

ALTER TABLE "CHAT_ROOM_JOIN" ADD CONSTRAINT "PK_CHAT_ROOM_JOIN" PRIMARY KEY (
	"MESSAGE_NO",
	"CHAT_NO"
);

ALTER TABLE "ITEM_BOARD" ADD CONSTRAINT "FK_BOARD_TYPE_TO_ITEM_BOARD_1" FOREIGN KEY (
	"BOARD_CD"
)
REFERENCES "BOARD_TYPE" (
	"BOARD_CD"
);

ALTER TABLE "ITEM_BOARD" ADD CONSTRAINT "FK_MEMBER_TO_ITEM_BOARD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "ITEM_BOARD" ADD CONSTRAINT "FK_MEMBER_TO_ITEM_BOARD_2" FOREIGN KEY (
	"BUY_MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "ITEM_BOARD" ADD CONSTRAINT "FK_L_CATEGORY_TO_ITEM_BOARD_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "L_CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "FK_ITEM_BOARD_TO_BOARD_IMG_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "ITEM_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "ADMIN_BOARD" ADD CONSTRAINT "FK_BOARD_TYPE_TO_ADMIN_BOARD_1" FOREIGN KEY (
	"BOARD_CD"
)
REFERENCES "BOARD_TYPE" (
	"BOARD_CD"
);

ALTER TABLE "ADMIN_BOARD" ADD CONSTRAINT "FK_MEMBER_TO_ADMIN_BOARD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_CHAR_ROOM_TO_MESSAGE_1" FOREIGN KEY (
	"CHAT_NO"
)
REFERENCES "CHAR_ROOM" (
	"CHAT_NO"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_MEMBER_TO_MESSAGE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_ITEM_BOARD_TO_REVIEW_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "ITEM_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CHAR_ROOM" ADD CONSTRAINT "FK_ITEM_BOARD_TO_CHAR_ROOM_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "ITEM_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "CHAR_ROOM" ADD CONSTRAINT "FK_MEMBER_TO_CHAR_ROOM_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CHAR_ROOM" ADD CONSTRAINT "FK_MEMBER_TO_CHAR_ROOM_2" FOREIGN KEY (
	"BUY_MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_REPORT_TYPE_TO_REPORT_1" FOREIGN KEY (
	"REPORT_CD"
)
REFERENCES "REPORT_TYPE" (
	"REPORT_CD"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOOKMARK" ADD CONSTRAINT "FK_MEMBER_TO_BOOKMARK_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOOKMARK" ADD CONSTRAINT "FK_ITEM_BOARD_TO_BOOKMARK_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "ITEM_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "M_CATEGORY" ADD CONSTRAINT "FK_L_CATEGORY_TO_M_CATEGORY_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "L_CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "CHAT_ROOM_JOIN" ADD CONSTRAINT "FK_MESSAGE_TO_CHAT_ROOM_JOIN_1" FOREIGN KEY (
	"MESSAGE_NO"
)
REFERENCES "MESSAGE" (
	"MESSAGE_NO"
);

ALTER TABLE "CHAT_ROOM_JOIN" ADD CONSTRAINT "FK_CHAT_ROOM_JOIN_1" FOREIGN KEY (
	"CHAT_NO"
)
REFERENCES "CHAR_ROOM" (
	"CHAT_NO"
);

-- 시퀀스 생성
CREATE SEQUENCE SEQ_ADMIN_BOARD_NO NOCACHE;
CREATE SEQUENCE SEQ_ADMIN_IMG_NO NOCACHE;
CREATE SEQUENCE SEQ_IMG_NO NOCACHE;
CREATE SEQUENCE SEQ_CHAT_NO NOCACHE;
CREATE SEQUENCE SEQ_BOARD_CD NOCACHE;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;
CREATE SEQUENCE SEQ_CATEGORY_NO NOCACHE;
CREATE SEQUENCE SEQ_M_CATEGORY_NO NOCACHE;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
CREATE SEQUENCE SEQ_MESSAGE_NO NOCACHE;
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE;

CREATE SEQUENCE SEQ_REPORT_NO NOCACHE;
CREATE SEQUENCE SEQ_REVIEW_NO NOCACHE;

-- 회원 샘플 데이터 삽입 (1번 관리자, 2번 일반회원)
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL, 'test01', 'test01', '관리자 테스트 계정', 01012341234, DEFAULT, NULL, DEFAULT, DEFAULT, 'Y', '서울시 중구');
INSERT INTO MEMBER VALUES(SEQ_MEMBER_NO.NEXTVAL, 'test02', 'test02', '일반 테스트 계정', 01012341234, DEFAULT, NULL, DEFAULT, DEFAULT, DEFAULT, '서울시 중구');


INSERT INTO BOARD_TYPE VALUES(SEQ_BOARD_CD.NEXTVAL, '구매글');

INSERT INTO ITEM_BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, '아이폰 12 pro 팝니다', '2년 가까이 사용한 아이폰 12 pro 팝니다. 상태 나빠요', DEFAULT, DEFAULT, DEFAULT, '사용감 있음', '판매 중', NULL, '999999999', DEFAULT, '인천시', 1, 4, 13, NULL, NULL);


BEGIN
   FOR I IN 1..25 LOOP
      INSERT INTO ITEM_BOARD 
	  VALUES(SEQ_BOARD_NO.NEXTVAL, 
	  	SEQ_BOARD_NO.CURRVAL || '번째 게시글',
		SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다.',
	   	DEFAULT, DEFAULT, DEFAULT, '사용감 거의 없음', '판매 중', NULL, '23000', DEFAULT, '인천시', 1, 3, 13, NULL, NULL, DEFAULT);
   END LOOP;
END;


-- SELECT A.BOARD_TITLE, A.SELL_AREA, A.UPDATE_DT, A.PRICE
-- FROM ITEM_BOARD A
-- JOIN BOOKMARK B ON A.MEMBER_NO = B.MEMBER_NO

-- WHERE A.BOARD_NO IN (
-- 	SELECT BOARD_NO FROM BOOKMARK
-- 	WHERE MEMBER_NO = 4
-- ); 
-- AND B.MEMBER_NO = 4;

SELECT BOARD_TITLE,SELL_AREA,UPDATE_DT,PRICE
FROM BOOKMARK A
JOIN ITEM_BOARD B USING (BOARD_NO)
WHERE A.MEMBER_NO = 4;

SELECT * FROM BOARD_IMG
		WHERE BOARD_NO = 90
		ORDER BY IMG_LEVEL;

commit;

/* !!!!!!! 절대 삭제 / 수정 금지 (채팅 관련 SQL - 건들면 주빈이 빡침) !!!!!!!!!!!!!! */
SELECT A.MEMBER_NO, A.CHAT_NO, MEMBER_NICK, MEMBER_PROFILE,
        (SELECT MESSAGE_CONTENT FROM MESSAGE WHERE MESSAGE_NO = FN_LAST_MESSAGE_NO1(A.CHAT_NO)) MESSAGE_CONTENT,
        (SELECT MESSAGE_TIME FROM MESSAGE WHERE MESSAGE_NO = FN_LAST_MESSAGE_NO1(A.CHAT_NO)) MESSAGE_TIME
FROM CHAT_ROOM_JOIN A
JOIN MEMBER C ON(A.MEMBER_NO = C.MEMBER_NO)
JOIN CHAT_ROOM B ON(A.CHAT_NO = B.CHAT_NO)
WHERE B.CHAT_NO IN (SELECT CHAT_NO FROM CHAT_ROOM_JOIN WHERE MEMBER_NO = 4)
AND A.MEMBER_NO != 4
AND CHAT_STATUS = 'N'
ORDER BY MESSAGE_TIME;
--------
SELECT MEMBER_NO, A.CHAT_NO, MEMBER_NICK, MEMBER_PROFILE,
	(SELECT MESSAGE_CONTENT FROM MESSAGE WHERE MESSAGE_NO = FN_LAST_MESSAGE_NO(CHAT_ROOM_JOIN.CHAT_NO)) MESSAGE_CONTENT,
	(SELECT MESSAGE_TIME FROM MESSAGE WHERE MESSAGE_NO = FN_LAST_MESSAGE_NO(CHAT_ROOM_JOIN.CHAT_NO)) MESSAGE_TIME
FROM CHAT_ROOM_JOIN A
JOIN MEMBER USING(MEMBER_NO)
JOIN CHAT_ROOM B USING(A.CHAT_NO = B.CHAT_NO)
------------
WHERE CHAT_NO IN (SELECT CHAT_NO FROM CHAT_ROOM_JOIN WHERE MEMBER_NO = 4)
AND MEMBER_NO != 4
AND CHAT_STATUS = 'N';

---------------
CREATE OR REPLACE FUNCTION FN_LAST_MESSAGE_NO1(INPUT_CHAT_NO NUMBER)
RETURN NUMBER
IS M_NO NUMBER;
BEGIN
    SELECT MESSAGE_NO
    INTO M_NO
    FROM(
        SELECT * FROM MESSAGE
        WHERE CHAT_NO = INPUT_CHAT_NO
        ORDER BY MESSAGE_TIME DESC)
    WHERE ROWNUM = 1;
RETURN M_NO;
END;
/
/* !!!!!!! 절대 삭제 / 수정 금지 !!!!!!!!!!!!!! */

SELECT A.MEMBER_NICK, A.MEMBER_PROFILE, B.MESSAGE_CONTENT, B.MESSAGE_TIME, B.MESSAGE_NO
FROM CHAT_ROOM_JOIN C

JOIN MEMBER A ON(A.MEMBER_NO = C.MEMBER_NO)
JOIN MESSAGE B ON(B.CHAT_NO = C.CHAT_NO)

WHERE B.CHAT_NO = 9999
AND B.MEMBER_NO != 4
AND A.MEMBER_NO != 4;

--------------------------------------------------

SELECT MESSAGE_CONTENT, MESSAGE_TIME, MESSAGE_NO
FROM CHAT_ROOM_JOIN B

JOIN MESSAGE A USING(MEMBER_NO)

WHERE A.CHAT_NO = 9999
AND B.CHAT_NO = 9999
AND MEMBER_NO = 4;

--------------------------------------------------

SELECT NVL(
	(SELECT CHAT_NO FROM CHAT_ROOM
	WHERE BOARD_NO = 115
	AND MEMBER_NO = 4
	AND BUY_MEMBER_NO = 1) , 0 ) CHAT_NO
FROM DUAL;
		

SELECT *
  FROM all_sequences
 WHERE sequence_name = 'SEQ_MESSAGE_NO';


 SELECT CHAT_NO FROM CHAT_ROOM


---------------------

INSERT INTO REVIEW VALUES(SEQ_REVIEW_NO.NEXTVAL, 
'좋은 거래였습니다', 
'좋음', DEFAULT, 4, 78, DEFAULT, 1);

SELECT BOARD_TITLE, BOARD_CONTENT, READ_COUNT, BOOKMARK_COUNT, UPDATE_DT, SELL_AREA, ITEM_CONDITION, TRADE_CONDITION
	, PRICE, M_CATEGORY_NM, L_CATEGORY_NM
FROM ITEM_BOARD
JOIN BOARD_IMG USING(BOARD_NO)
JOIN M_CATEGORY USING(M_CATEGORY_NO)
JOIN L_CATEGORY USING(CATEGORY_NO)
WHERE BOARD_NO = 115;

UPDATE CHAT_ROOM SET
CHAT_STATUS = 'N'
WHERE CHAT_NO = 12;

SELECT A.MEMBER_NICK, A.MEMBER_PROFILE, A.MEMBER_NO, B.MESSAGE_CONTENT, B.MESSAGE_TIME, B.MESSAGE_NO
		FROM CHAT_ROOM_JOIN C
		
		JOIN MEMBER A ON(A.MEMBER_NO = C.MEMBER_NO)
		JOIN MESSAGE B ON(B.CHAT_NO = C.CHAT_NO)
		
		WHERE B.CHAT_NO = 10000