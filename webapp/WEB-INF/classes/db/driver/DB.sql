/* USER 생성 (관리자 계정으로 실행) */

--CREATE USER CODETREE IDENTIFIED BY CODETREE;
--GRANT CONNECT, RESOURCE TO CODETREE;


/* CODETREE 계정으로 실행 */

DROP TABLE MEMBER;
DROP TABLE BOARD;
DROP TABLE CART;
DROP TABLE WISH;
DROP TABLE BS_ORDER;
DROP TABLE ADDRESS;

DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_CNO;
DROP SEQUENCE SEQ_WNO;
DROP SEQUENCE SEQ_ONO;


/* Member */
CREATE TABLE MEMBER (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(15) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    GENDER  VARCHAR2(3),
    BIRTHDAY    DATE,
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(100) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.GENDER IS '성별(남/여/NULL)';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '생년월일';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';
COMMENT ON COLUMN MEMBER.STATUS IS '회원 상태(Y/N)';

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', NULL, '1999-10-31', '010-1111-2222', 'admin@cd.or.kr', '2022-02-10', '2022-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user1', '1234', '홍길동', '남', '1999-10-31', '010-1131-1978', 'gildong@cd.or.kr', '2023-02-10', '2023-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user2', '1234', '콩쥐', '여', '1999-10-31', NULL, 'congcong@cd.or.kr', '2024-10-02', '2024-10-02', 'Y');


/* Board */
CREATE TABLE BOARD (
    BOARD_NO      NUMBER         PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100)    NOT NULL,
    BOARD_TYPE  VARCHAR(10) NOT NULL,
    BOARD_CATEGORY  VARCHAR2(15),
    BOARD_CONTENT   VARCHAR(500)    NOT NULL,
    PROD_IMG    VARCHAR(300),
    PRICE   INT NOT NULL,
    BID_PRICE   INT,
    AUCTIONNER  INT DEFAULT 0,
    STOCK   INT NOT NULL,
    SELLER_NO  NUMBER,
    REGISTER_DATE DATE    DEFAULT SYSDATE,
    END_DATE    DATE,
    STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN BOARD.BOARD_NO IS '게시글 번호';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글 제목';
COMMENT ON COLUMN BOARD.BOARD_TYPE IS '판매 타입(경매/중고거래)';
COMMENT ON COLUMN BOARD.BOARD_CATEGORY IS '게시글 카테고리';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '게시글 내용';
COMMENT ON COLUMN BOARD.PROD_IMG IS '상품 이미지';
COMMENT ON COLUMN BOARD.PRICE IS '상품 가격(즉시 낙찰가)';
COMMENT ON COLUMN BOARD.BID_PRICE IS '경매 가격(현재 입찰가)';
COMMENT ON COLUMN BOARD.AUCTIONNER IS '경매참가자';
COMMENT ON COLUMN BOARD.STOCK IS '상품 수량';
COMMENT ON COLUMN BOARD.SELLER_NO IS '판매자 번호';
COMMENT ON COLUMN BOARD.REGISTER_DATE IS '판매등록일';
COMMENT ON COLUMN BOARD.END_DATE IS '판매종료일';
COMMENT ON COLUMN BOARD.STATUS IS '판매 상태(Y/N)';

CREATE SEQUENCE SEQ_BNO
NOCACHE;

/* fashion */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion01.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion03.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion04.jpg', 17000000, 20000,  5, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion05.jpg', 10000000, 5000000, 4, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion06.jpg', 17000000, 50000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 6,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 10, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* digitall */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M사 남성용 시계 STMM-293  모델 블랙', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital01.jpg', 10000000, 5000000, 9, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '소니 헤드폰', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital02.jpg', 10000000, 5000000, 0, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '자전거', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital03.jpg', 10000000, 5000000, 4,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '핸드믹서기', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital04.jpg', 10000000, 5000000, 1, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '카메라', '경매', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital05.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M사 남성용 시계 STMM-293  모델 블랙', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital01.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '소니 헤드폰', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital02.jpg', 10000000, 5000000, 11,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '자전거', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital03.jpg', 10000000, 5000000, 5,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '핸드믹서기', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital04.jpg', 10000000, 5000000, 1, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '카메라', '경매', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital05.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M사 남성용 시계 STMM-293  모델 블랙', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital01.jpg', 10000000, 5000000, 6,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '소니 헤드폰', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital02.jpg', 10000000, 5000000, 4,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '자전거', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital03.jpg', 10000000, 5000000, 2,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '핸드믹서기', '중고', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital04.jpg', 10000000, 5000000, 1, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '카메라', '경매', 'digital', 'M사에서 나온 남성용 손목 시계입니다. 액정에 미약하게 흠집이 있습니다. 시계는 잘 돌아갑니다.', '/views/resources/images/prd/prd_digital05.jpg', 10000000, 5000000, 5,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

/* sport */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '실리콘 요가 매트', '중고', 'sport', '실리콘 재질 요가용 매트 4개입니다. 3개월 정도 사용했습니다. 깨끗하게 소독했지만 민감하신 분들은 주의해주세요.', '/views/resources/images/prd/prd_sport01.jpg', 10000000, 5000000, 12, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'sport', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_sport02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'sport', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_sport03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'sport', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_sport04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'sport', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_sport05.jpg', 10000000, 5000000, 5, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'sport', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_sport06.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* deco */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '인센스 세트', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '디자이너 M 리미티드 에디션 778 시리즈 조명', '경매', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '분위기 좋은 조명', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미니 화병', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '거실용 의자 S사 Y2 시리즈', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '인센스 세트', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0,  1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '디자이너 M 리미티드 에디션 778 시리즈 조명', '경매', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '분위기 좋은 조명', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미니 화병', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '거실용 의자 S사 Y2 시리즈', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '인센스 세트', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '디자이너 M 리미티드 에디션 778 시리즈 조명', '경매', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '분위기 좋은 조명', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미니 화병', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '거실용 의자 S사 Y2 시리즈', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '인센스 세트', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '디자이너 M 리미티드 에디션 778 시리즈 조명', '경매', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '분위기 좋은 조명', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0,  0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미니 화병', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '거실용 의자 S사 Y2 시리즈', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '인센스 세트', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '디자이너 M 리미티드 에디션 778 시리즈 조명', '경매', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '분위기 좋은 조명', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미니 화병', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '거실용 의자 S사 Y2 시리즈', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '인센스 세트', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '디자이너 M 리미티드 에디션 778 시리즈 조명', '경매', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '분위기 좋은 조명', '경매', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미니 화병', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '거실용 의자 S사 Y2 시리즈', '중고', 'deco', '인센스 세트.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* toy */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '영유아용 부엌놀이 미니어처 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[나눔] 무지개 미니 클립', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '무지개 뽁뽁이 대형', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '형광펜 6개', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '토끼 인형(D 브랜드 이벤트 한정 상품)', '경매', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미술용품 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[직거래/나눔] 만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '영유아용 부엌놀이 미니어처 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[나눔] 무지개 미니 클립', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '무지개 뽁뽁이 대형', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '형광펜 6개', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '토끼 인형(D 브랜드 이벤트 한정 상품)', '경매', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미술용품 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[직거래/나눔] 만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '영유아용 부엌놀이 미니어처 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[나눔] 무지개 미니 클립', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 10, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '무지개 뽁뽁이 대형', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0,  1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '형광펜 6개', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '토끼 인형(D 브랜드 이벤트 한정 상품)', '경매', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미술용품 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[직거래/나눔] 만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '영유아용 부엌놀이 미니어처 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[나눔] 무지개 미니 클립', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '무지개 뽁뽁이 대형', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '형광펜 6개', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '토끼 인형(D 브랜드 이벤트 한정 상품)', '경매', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미술용품 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[직거래/나눔] 만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '영유아용 부엌놀이 미니어처 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[나눔] 무지개 미니 클립', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '무지개 뽁뽁이 대형', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '형광펜 6개', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '토끼 인형(D 브랜드 이벤트 한정 상품)', '경매', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 3, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미술용품 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[직거래/나눔] 만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '영유아용 부엌놀이 미니어처 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[나눔] 무지개 미니 클립', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '무지개 뽁뽁이 대형', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '형광펜 6개', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '토끼 인형(D 브랜드 이벤트 한정 상품)', '경매', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미술용품 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[직거래/나눔] 만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '영유아용 부엌놀이 미니어처 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[나눔] 무지개 미니 클립', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '무지개 뽁뽁이 대형', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '형광펜 6개', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '토끼 인형(D 브랜드 이벤트 한정 상품)', '경매', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '미술용품 세트', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[직거래/나눔] 만년필', '중고', 'toy', '아기들이 갖고 놀기 좋은 부엌놀이 미니어처 장난감입니다. 깨끗하게 소독했지만 혹시 모르니 애기가 가지고 놀기 전엔 한 번 더 소독하고 사용하시는 걸 추천드려요^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* art */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '아티스트 S 낙엽 액자', '경매', 'art', '명화.', '/views/resources/images/prd/prd_art01.jpg', 10000000, 13000000, 14, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '아티스트 S 압화 액자', '경매', 'art', '명화.', '/views/resources/images/prd/prd_art02.jpg', 2000000, 1240000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '아기 천사 석조상', '경매', 'art', '명화.', '/views/resources/images/prd/prd_art03.jpg', 500000, 219000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'T 화가 2001년 경매출품작', '경매', 'art', '명화.', '/views/resources/images/prd/prd_art04.jpg', 470000000, 23489000, 4, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* jewelry */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'E 브랜드 귀걸이 티파니 920', '경매', 'jewelry', '명화.', '/views/resources/images/prd/prd_jewelry01.jpg', 470000000, 23489000, 5, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '새와 화살 이어링 실버 20', '중고', 'jewelry', '명화.', '/views/resources/images/prd/prd_jewelry02.jpg', 470000000, 23489000, 4, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'G사 블루 토파즈 목걸이', '경매', 'jewelry', '명화.', '/views/resources/images/prd/prd_jewelry03.jpg', 470000000, 23489000, 8, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '하트 목걸이', '중고', 'jewelyr', '명화.', '/views/resources/images/prd/prd_jewelry04.jpg', 470000000, 23489000, 13, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '다이아몬드링 H사 T시리즈 2캐럿 12호', '경매', 'jewelry', '명화.', '/views/resources/images/prd/prd_jewelry05.jpg', 470000000, 23489000, 8, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '다이아몬드링 H사 A시리즈 2캐럿 12호', '경매', 'jewelry', '명화.', '/views/resources/images/prd/prd_jewelry06.jpg', 470000000, 23489000, 9, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 


/* Cart */
CREATE TABLE CART (
    CART_NO NUMBER  PRIMARY KEY,
    USER_NO NUMBER,
    BOARD_NO    NUMBER,
    STOCK   INT,
    PUT_DATE    DATE DEFAULT SYSDATE,
    STATUS CHAR(1)  DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN CART.CART_NO IS '장바구니 번호';
COMMENT ON COLUMN CART.USER_NO IS '회원번호';
COMMENT ON COLUMN CART.BOARD_NO IS '상품 게시글 번호';
COMMENT ON COLUMN CART.STOCK IS '수량';
COMMENT ON COLUMN CART.PUT_DATE IS '카트에 담은 날짜';
COMMENT ON COLUMN CART.STATUS IS '상태(Y/N)';

CREATE SEQUENCE SEQ_CNO
NOCACHE;

INSERT INTO CART
VALUES (SEQ_CNO.NEXTVAL, 1, 2, 1, SYSDATE, 'Y');

INSERT INTO CART
VALUES (SEQ_CNO.NEXTVAL, 1, 25, 1, SYSDATE, 'Y');

INSERT INTO CART
VALUES (SEQ_CNO.NEXTVAL, 1, 114, 2, SYSDATE, 'Y');

INSERT INTO CART
VALUES (SEQ_CNO.NEXTVAL, 1, 134, 1, SYSDATE, 'Y');

INSERT INTO CART
VALUES (SEQ_CNO.NEXTVAL, 1, 115, 1, SYSDATE, 'Y');


/* Wish */
CREATE TABLE WISH  (
    WISH_NO NUMBER  PRIMARY KEY,
    USER_NO NUMBER,
    BOARD_NO    NUMBER,
    WISH_DATE   DATE   DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN WISH.WISH_NO IS '관심번호';
COMMENT ON COLUMN WISH.USER_NO IS '회원번호';
COMMENT ON COLUMN WISH.BOARD_NO IS '상품 게시글 번호';
COMMENT ON COLUMN WISH.WISH_DATE IS '관심 목록 추가일자';
COMMENT ON COLUMN WISH.STATUS IS '주문상태(Y/N)';

CREATE SEQUENCE SEQ_WNO
NOCACHE;


/* Order  */
CREATE TABLE BS_ORDER (
    ORDER_NO    NUMBER PRIMARY KEY,
    USER_NO NUMBER,
    BOARD_NO    NUMBER,
    BOARD_TYPE  VARCHAR(10),
    PROD_IMG    VARCHAR(300),
    PRICE   INT,
    STOCK   INT,
    TOTAL   INT,
    SELLER_NO  NUMBER,
    ORDER_DATE  DATE    DEFAULT SYSDATE,
    UPDATE_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    STATUS_DETAIL   VARCHAR(30)
);

COMMENT ON COLUMN BS_ORDER.ORDER_NO IS '주문번호';
COMMENT ON COLUMN BS_ORDER.USER_NO IS '회원번호';
COMMENT ON COLUMN BS_ORDER.BOARD_NO IS '상품 게시글 번호';
COMMENT ON COLUMN BS_ORDER.BOARD_TYPE IS '상품 유형(경매/중고)';
COMMENT ON COLUMN BS_ORDER.PROD_IMG IS '상품 이미지';
COMMENT ON COLUMN BS_ORDER.PRICE IS ' 상품 가격';
COMMENT ON COLUMN BS_ORDER.STOCK IS '주문 수량';
COMMENT ON COLUMN BS_ORDER.TOTAL IS '총합 금액';
COMMENT ON COLUMN BS_ORDER.SELLER_NO IS '판매자 회원번호';
COMMENT ON COLUMN BS_ORDER.ORDER_DATE IS '주문일';
COMMENT ON COLUMN BS_ORDER.UPDATE_DATE IS '주문 상태 업데이트 일자';
COMMENT ON COLUMN BS_ORDER.STATUS IS '주문상태(Y/N)';
COMMENT ON COLUMN BS_ORDER.STATUS_DETAIL IS '주문상태 상세(취소, 확정, 판매종료 등)';

CREATE SEQUENCE SEQ_ONO
NOCACHE;


/* Address */
CREATE TABLE ADDRESS (
    USER_NO NUMBER ,
    ADDRESS_NAME    VARCHAR2(30)    NOT NULL    UNIQUE,
    RECEIVER    VARCHAR2(30)    NOT NULL,
    DELIVERY_ADDRESS    VARCHAR2(300)   NOT NULL,
    POST_CODE   NUMBER  NOT NULL,
    PHONE   VARCHAR2(13)   NOT NULL
);

COMMENT ON COLUMN ADDRESS.USER_NO IS '회원번호';
COMMENT ON COLUMN ADDRESS.ADDRESS_NAME IS '배송지 이름';
COMMENT ON COLUMN ADDRESS.RECEIVER IS '받는이';
COMMENT ON COLUMN ADDRESS.DELIVERY_ADDRESS IS '배송주소';
COMMENT ON COLUMN ADDRESS.POST_CODE IS '우편번호';
COMMENT ON COLUMN ADDRESS.PHONE IS '전화번호';

COMMIT;