/* USER 생성 (관리자 계정으로 실행) */

--CREATE USER CODETREE IDENTIFIED BY CODETREE;
--GRANT CONNECT, RESOURCE TO CODETREE;

/* CODETREE 계정으로 실행 */

DROP TABLE MEMBER;
DROP TABLE ADDRESS;

DROP SEQUENCE SEQ_UNO;



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
COMMENT ON COLUMN MEMBER.USER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.GENDER IS '성별(남/여/NULL)';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '생년월일';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', NULL, '1999-10-31', '010-1111-2222', 'admin@cd.or.kr', '2022-02-10', '2022-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user1', '1234', '홍길동', '남', '1999-10-31', '010-1131-1978', 'gildong@cd.or.kr', '2023-02-10', '2023-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user2', '1234', '콩쥐', '여', '1999-10-31', NULL, 'congcong@cd.or.kr', '2024-10-02', '2024-10-02', 'Y');

/* address */
CREATE TABLE ADDRESS (
    USER_NO NUMBER ,
    ADDRESS_NAME    VARCHAR2(30)    NOT NULL    UNIQUE,
    RECEIVER    VARCHAR2(30)    NOT NULL,
    DELIVERY_ADDRESS    VARCHAR2(300)   NOT NULL,
    POST_CODE   NUMBER  NOT NULL,
    PHONE   VARCHAR2(13)   NOT NULL
);

COMMIT;