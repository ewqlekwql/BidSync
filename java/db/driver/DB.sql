/* USER ??± (κ΄?λ¦¬μ κ³μ ?Όλ‘? ?€?) */

--CREATE USER CODETREE IDENTIFIED BY CODETREE;
--GRANT CONNECT, RESOURCE TO CODETREE;

<<<<<<< HEAD

/* CODETREE κ³μ μΌλ‘ μ€ν */

=======
/* CODETREE κ³μ ?Όλ‘? ?€? */
>>>>>>> dd444da30f6edca4095cbabfcbdf9b2a62e988dc
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

COMMENT ON COLUMN MEMBER.USER_NO IS '??λ²νΈ';
COMMENT ON COLUMN MEMBER.USER_ID IS '?? ??΄?';
COMMENT ON COLUMN MEMBER.USER_PWD IS '?? λΉλ?λ²νΈ';
COMMENT ON COLUMN MEMBER.USER_NAME IS '??λͺ?';
COMMENT ON COLUMN MEMBER.GENDER IS '?±λ³?(?¨/?¬/NULL)';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '????Ό';
COMMENT ON COLUMN MEMBER.PHONE IS '? ?λ²νΈ';
COMMENT ON COLUMN MEMBER.EMAIL IS '?΄λ©μΌ';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '??κ°???Ό';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '? λ³΄μ? ?Ό';
COMMENT ON COLUMN MEMBER.STATUS IS '?? ??(Y/N)';

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', 'κ΄?λ¦¬μ', NULL, '1999-10-31', '010-1111-2222', 'admin@cd.or.kr', '2022-02-10', '2022-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user1', '1234', '?κΈΈλ', '?¨', '1999-10-31', '010-1131-1978', 'gildong@cd.or.kr', '2023-02-10', '2023-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user2', '1234', 'μ½©μ₯', '?¬', '1999-10-31', NULL, 'congcong@cd.or.kr', '2024-10-02', '2024-10-02', 'Y');


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

<<<<<<< HEAD
COMMENT ON COLUMN BOARD.BOARD_NO IS 'κ²μκΈ? λ²νΈ';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS 'κ²μκΈ? ? λͺ?';
COMMENT ON COLUMN BOARD.BOARD_TYPE IS '?λ§? ???(κ²½λ§€/μ€κ³ κ±°λ)';
COMMENT ON COLUMN BOARD.BOARD_CATEGORY IS 'κ²μκΈ? μΉ΄νκ³ λ¦¬';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS 'κ²μκΈ? ?΄?©';
COMMENT ON COLUMN BOARD.PROD_IMG IS '?? ?΄λ―Έμ?';
COMMENT ON COLUMN BOARD.PRICE IS '?? κ°?κ²?(μ¦μ ?μ°°κ?)';
COMMENT ON COLUMN BOARD.BID_PRICE IS 'κ²½λ§€ κ°?κ²?(??¬ ?μ°°κ?)';
COMMENT ON COLUMN BOARD.STOCK IS '?? ??';
COMMENT ON COLUMN BOARD.SELLER_NO IS '?λ§€μ λ²νΈ';
COMMENT ON COLUMN BOARD.REGISTER_DATE IS '?λ§€λ±λ‘μΌ';
COMMENT ON COLUMN BOARD.STATUS IS '?λ§? ??(Y/N)';
=======
COMMENT ON COLUMN BOARD.BOARD_NO IS 'κ²μκΈ λ²νΈ';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS 'κ²μκΈ μ λͺ©';
COMMENT ON COLUMN BOARD.BOARD_TYPE IS 'νλ§€ νμ(κ²½λ§€/μ€κ³ κ±°λ)';
COMMENT ON COLUMN BOARD.BOARD_CATEGORY IS 'κ²μκΈ μΉ΄νκ³ λ¦¬';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS 'κ²μκΈ λ΄μ©';
COMMENT ON COLUMN BOARD.PROD_IMG IS 'μν μ΄λ―Έμ§';
COMMENT ON COLUMN BOARD.PRICE IS 'μν κ°κ²©(μ¦μ λμ°°κ°)';
COMMENT ON COLUMN BOARD.BID_PRICE IS 'κ²½λ§€ κ°κ²©(νμ¬ μμ°°κ°)';
COMMENT ON COLUMN BOARD.AUCTIONNER IS 'κ²½λ§€μ°Έκ°μ';
COMMENT ON COLUMN BOARD.STOCK IS 'μν μλ';
COMMENT ON COLUMN BOARD.SELLER_NO IS 'νλ§€μ λ²νΈ';
COMMENT ON COLUMN BOARD.REGISTER_DATE IS 'νλ§€λ±λ‘μΌ';
COMMENT ON COLUMN BOARD.END_DATE IS 'νλ§€μ’λ£μΌ';
COMMENT ON COLUMN BOARD.STATUS IS 'νλ§€ μν(Y/N)';
>>>>>>> dc68ab22fada299b30c858580c70962cc8f3c884

CREATE SEQUENCE SEQ_BNO
NOCACHE;

/* fashion */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion01.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion03.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L λΈλλ ν¬λ‘μ€λ°± MOLRA-505 νμ΄νΈ μμ', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion04.jpg', 17000000, 20000,  5, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion05.jpg', 10000000, 5000000, 4, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion06.jpg', 17000000, 50000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L λΈλλ ν¬λ‘μ€λ°± MOLRA-505 νμ΄νΈ μμ', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L λΈλλ ν¬λ‘μ€λ°± MOLRA-505 νμ΄νΈ μμ', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 6,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L λΈλλ ν¬λ‘μ€λ°± MOLRA-505 νμ΄νΈ μμ', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 10, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L λΈλλ ν¬λ‘μ€λ°± MOLRA-505 νμ΄νΈ μμ', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'fashion', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L λΈλλ ν¬λ‘μ€λ°± MOLRA-505 νμ΄νΈ μμ', 'μ€κ³ ', 'fashion', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* digitall */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'Mμ¬ λ¨μ±μ© μκ³ STMM-293  λͺ¨λΈ λΈλ', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital01.jpg', 10000000, 5000000, 9, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μλ ν€λν°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital02.jpg', 10000000, 5000000, 0, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ κ±°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital03.jpg', 10000000, 5000000, 4,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νΈλλ―ΉμκΈ°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital04.jpg', 10000000, 5000000, 1, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΉ΄λ©λΌ', 'κ²½λ§€', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital05.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'Mμ¬ λ¨μ±μ© μκ³ STMM-293  λͺ¨λΈ λΈλ', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital01.jpg', 10000000, 5000000, 3, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μλ ν€λν°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital02.jpg', 10000000, 5000000, 11,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ κ±°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital03.jpg', 10000000, 5000000, 5,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νΈλλ―ΉμκΈ°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital04.jpg', 10000000, 5000000, 1, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΉ΄λ©λΌ', 'κ²½λ§€', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital05.jpg', 10000000, 5000000, 2, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'Mμ¬ λ¨μ±μ© μκ³ STMM-293  λͺ¨λΈ λΈλ', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital01.jpg', 10000000, 5000000, 6,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μλ ν€λν°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital02.jpg', 10000000, 5000000, 4,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ κ±°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital03.jpg', 10000000, 5000000, 2,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νΈλλ―ΉμκΈ°', 'μ€κ³ ', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital04.jpg', 10000000, 5000000, 1, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΉ΄λ©λΌ', 'κ²½λ§€', 'digital', 'Mμ¬μμ λμ¨ λ¨μ±μ© μλͺ© μκ³μλλ€. μ‘μ μ λ―Έμ½νκ² ν μ§μ΄ μμ΅λλ€. μκ³λ μ λμκ°λλ€.', '/views/resources/images/prd/prd_digital05.jpg', 10000000, 5000000, 5,  1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

/* sport */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μ€λ¦¬μ½ μκ° λ§€νΈ', 'μ€κ³ ', 'sport', 'μ€λ¦¬μ½ μ¬μ§ μκ°μ© λ§€νΈ 4κ°μλλ€. 3κ°μ μ λ μ¬μ©νμ΅λλ€. κΉ¨λνκ² μλνμ§λ§ λ―Όκ°νμ  λΆλ€μ μ£Όμν΄μ£ΌμΈμ.', '/views/resources/images/prd/prd_sport01.jpg', 10000000, 5000000, 12, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'sport', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_sport02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'sport', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_sport03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L λΈλλ ν¬λ‘μ€λ°± MOLRA-505 νμ΄νΈ μμ', 'μ€κ³ ', 'sport', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_sport04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M λΈλλ κ°λ°© μ μ', 'κ²½λ§€', 'sport', 'M λΈλλμμ μ΄λ²μ λμ¨ μ μμλλ€. μ€μ°© νμ 1ν. μ¬μ§λ§ μ°κ³  λ£μ΄λ¨μ΄μ.', '/views/resources/images/prd/prd_sport05.jpg', 10000000, 5000000, 5, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S λΈλλ λ°± νν¬λ² μ΄μ§', 'μ€κ³ ', 'sport', 'μμ μ μλ κ°λ°©μΈλ° μ μ¨μ νμμ. λ°λ₯μ κΈ°μ€κ° μ‘°κΈ μκΈ΄νλ° κΉ¨λν΄μ.', '/views/resources/images/prd/prd_sport06.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* deco */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΈμΌμ€ μΈνΈ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λμμ΄λ M λ¦¬λ―Έν°λ μλμ 778 μλ¦¬μ¦ μ‘°λͺ', 'κ²½λ§€', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λΆμκΈ° μ’μ μ‘°λͺ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έλ νλ³', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'κ±°μ€μ© μμ Sμ¬ Y2 μλ¦¬μ¦', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΈμΌμ€ μΈνΈ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0,  1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λμμ΄λ M λ¦¬λ―Έν°λ μλμ 778 μλ¦¬μ¦ μ‘°λͺ', 'κ²½λ§€', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λΆμκΈ° μ’μ μ‘°λͺ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έλ νλ³', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'κ±°μ€μ© μμ Sμ¬ Y2 μλ¦¬μ¦', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΈμΌμ€ μΈνΈ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λμμ΄λ M λ¦¬λ―Έν°λ μλμ 778 μλ¦¬μ¦ μ‘°λͺ', 'κ²½λ§€', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λΆμκΈ° μ’μ μ‘°λͺ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έλ νλ³', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'κ±°μ€μ© μμ Sμ¬ Y2 μλ¦¬μ¦', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΈμΌμ€ μΈνΈ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λμμ΄λ M λ¦¬λ―Έν°λ μλμ 778 μλ¦¬μ¦ μ‘°λͺ', 'κ²½λ§€', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λΆμκΈ° μ’μ μ‘°λͺ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0,  0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έλ νλ³', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'κ±°μ€μ© μμ Sμ¬ Y2 μλ¦¬μ¦', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΈμΌμ€ μΈνΈ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λμμ΄λ M λ¦¬λ―Έν°λ μλμ 778 μλ¦¬μ¦ μ‘°λͺ', 'κ²½λ§€', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λΆμκΈ° μ’μ μ‘°λͺ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έλ νλ³', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'κ±°μ€μ© μμ Sμ¬ Y2 μλ¦¬μ¦', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μΈμΌμ€ μΈνΈ', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λμμ΄λ M λ¦¬λ―Έν°λ μλμ 778 μλ¦¬μ¦ μ‘°λͺ', 'κ²½λ§€', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco02.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λΆμκΈ° μ’μ μ‘°λͺ', 'κ²½λ§€', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco03.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έλ νλ³', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco04.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'κ±°μ€μ© μμ Sμ¬ Y2 μλ¦¬μ¦', 'μ€κ³ ', 'deco', 'μΈμΌμ€ μΈνΈ.', '/views/resources/images/prd/prd_deco05.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* toy */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ μμ© λΆμλμ΄ λ―Έλμ΄μ² μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[λλ] λ¬΄μ§κ° λ―Έλ ν΄λ¦½', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ¬΄μ§κ° λ½λ½μ΄ λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νκ΄ν 6κ°', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ν λΌ μΈν(D λΈλλ μ΄λ²€νΈ νμ  μν)', 'κ²½λ§€', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έμ μ©ν μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[μ§κ±°λ/λλ] λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ μμ© λΆμλμ΄ λ―Έλμ΄μ² μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[λλ] λ¬΄μ§κ° λ―Έλ ν΄λ¦½', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ¬΄μ§κ° λ½λ½μ΄ λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νκ΄ν 6κ°', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ν λΌ μΈν(D λΈλλ μ΄λ²€νΈ νμ  μν)', 'κ²½λ§€', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έμ μ©ν μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[μ§κ±°λ/λλ] λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ μμ© λΆμλμ΄ λ―Έλμ΄μ² μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[λλ] λ¬΄μ§κ° λ―Έλ ν΄λ¦½', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 10, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ¬΄μ§κ° λ½λ½μ΄ λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0,  1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νκ΄ν 6κ°', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ν λΌ μΈν(D λΈλλ μ΄λ²€νΈ νμ  μν)', 'κ²½λ§€', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έμ μ©ν μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[μ§κ±°λ/λλ] λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ μμ© λΆμλμ΄ λ―Έλμ΄μ² μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[λλ] λ¬΄μ§κ° λ―Έλ ν΄λ¦½', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ¬΄μ§κ° λ½λ½μ΄ λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νκ΄ν 6κ°', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ν λΌ μΈν(D λΈλλ μ΄λ²€νΈ νμ  μν)', 'κ²½λ§€', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έμ μ©ν μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[μ§κ±°λ/λλ] λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ μμ© λΆμλμ΄ λ―Έλμ΄μ² μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[λλ] λ¬΄μ§κ° λ―Έλ ν΄λ¦½', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ¬΄μ§κ° λ½λ½μ΄ λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νκ΄ν 6κ°', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ν λΌ μΈν(D λΈλλ μ΄λ²€νΈ νμ  μν)', 'κ²½λ§€', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 3, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έμ μ©ν μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[μ§κ±°λ/λλ] λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ μμ© λΆμλμ΄ λ―Έλμ΄μ² μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[λλ] λ¬΄μ§κ° λ―Έλ ν΄λ¦½', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ¬΄μ§κ° λ½λ½μ΄ λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νκ΄ν 6κ°', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ν λΌ μΈν(D λΈλλ μ΄λ²€νΈ νμ  μν)', 'κ²½λ§€', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έμ μ©ν μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[μ§κ±°λ/λλ] λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ μμ© λΆμλμ΄ λ―Έλμ΄μ² μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy01.jpg', 17000000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[λλ] λ¬΄μ§κ° λ―Έλ ν΄λ¦½', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy02.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ¬΄μ§κ° λ½λ½μ΄ λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy03.jpg', 1000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'νκ΄ν 6κ°', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy04.jpg', 2000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ν λΌ μΈν(D λΈλλ μ΄λ²€νΈ νμ  μν)', 'κ²½λ§€', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy05.jpg', 30000, 15000, 1, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'N'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ―Έμ μ©ν μΈνΈ', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy06.jpg', 10000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy07.jpg', 13000, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '[μ§κ±°λ/λλ] λ§λν', 'μ€κ³ ', 'toy', 'μκΈ°λ€μ΄ κ°κ³  λκΈ° μ’μ λΆμλμ΄ λ―Έλμ΄μ² μ₯λκ°μλλ€. κΉ¨λνκ² μλνμ§λ§ νΉμ λͺ¨λ₯΄λ μ κΈ°κ° κ°μ§κ³  λκΈ° μ μ ν λ² λ μλνκ³  μ¬μ©νμλ κ±Έ μΆμ²λλ €μ^^.', '/views/resources/images/prd/prd_toy08.jpg', 0, 0, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* art */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μν°μ€νΈ S λμ½ μ‘μ', 'κ²½λ§€', 'art', 'λͺν.', '/views/resources/images/prd/prd_art01.jpg', 10000000, 13000000, 14, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μν°μ€νΈ S μν μ‘μ', 'κ²½λ§€', 'art', 'λͺν.', '/views/resources/images/prd/prd_art02.jpg', 2000000, 1240000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μκΈ° μ²μ¬ μμ‘°μ', 'κ²½λ§€', 'art', 'λͺν.', '/views/resources/images/prd/prd_art03.jpg', 500000, 219000, 2, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'T νκ° 2001λ κ²½λ§€μΆνμ', 'κ²½λ§€', 'art', 'λͺν.', '/views/resources/images/prd/prd_art04.jpg', 470000000, 23489000, 4, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

/* jewelry */
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'E λΈλλ κ·κ±Έμ΄ ν°νλ 920', 'κ²½λ§€', 'jewelry', 'λͺν.', '/views/resources/images/prd/prd_jewelry01.jpg', 470000000, 23489000, 5, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'μμ νμ΄ μ΄μ΄λ§ μ€λ² 20', 'μ€κ³ ', 'jewelry', 'λͺν.', '/views/resources/images/prd/prd_jewelry02.jpg', 470000000, 23489000, 4, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'Gμ¬ λΈλ£¨ ν νμ¦ λͺ©κ±Έμ΄', 'κ²½λ§€', 'jewelry', 'λͺν.', '/views/resources/images/prd/prd_jewelry03.jpg', 470000000, 23489000, 8, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'ννΈ λͺ©κ±Έμ΄', 'μ€κ³ ', 'jewelyr', 'λͺν.', '/views/resources/images/prd/prd_jewelry04.jpg', 470000000, 23489000, 13, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ€μ΄μλͺ¬λλ§ Hμ¬ Tμλ¦¬μ¦ 2μΊλΏ 12νΈ', 'κ²½λ§€', 'jewelry', 'λͺν.', '/views/resources/images/prd/prd_jewelry05.jpg', 470000000, 23489000, 8, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'λ€μ΄μλͺ¬λλ§ Hμ¬ Aμλ¦¬μ¦ 2μΊλΏ 12νΈ', 'κ²½λ§€', 'jewelry', 'λͺν.', '/views/resources/images/prd/prd_jewelry06.jpg', 470000000, 23489000, 9, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 


/* Cart */
CREATE TABLE CART (
    CART_NO NUMBER  PRIMARY KEY,
    USER_NO NUMBER,
    BOARD_NO    NUMBER,
    STOCK   INT,
    PUT_DATE    DATE DEFAULT SYSDATE,
    STATUS CHAR(1)  DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN CART.CART_NO IS 'μ₯λ°κ΅¬λ λ²νΈ';
COMMENT ON COLUMN CART.USER_NO IS 'νμλ²νΈ';
COMMENT ON COLUMN CART.BOARD_NO IS 'μν κ²μκΈ λ²νΈ';
COMMENT ON COLUMN CART.STOCK IS 'μλ';
COMMENT ON COLUMN CART.PUT_DATE IS 'μΉ΄νΈμ λ΄μ λ μ§';
COMMENT ON COLUMN CART.STATUS IS 'μν(Y/N)';

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
    BOARD_NO    NUMBER UNIQUE,
    WISH_DATE   DATE   DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN WISH.WISH_NO IS 'κ΄μ¬λ²νΈ';
COMMENT ON COLUMN WISH.USER_NO IS 'νμλ²νΈ';
COMMENT ON COLUMN WISH.BOARD_NO IS 'μν κ²μκΈ λ²νΈ';
COMMENT ON COLUMN WISH.WISH_DATE IS 'κ΄μ¬ λͺ©λ‘ μΆκ°μΌμ';
COMMENT ON COLUMN WISH.STATUS IS 'μν(Y/N)';

CREATE SEQUENCE SEQ_WNO
NOCACHE;

INSERT INTO WISH
VALUES (SEQ_WNO.NEXTVAL, 1, 4, SYSDATE, 'Y');

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

COMMENT ON COLUMN BS_ORDER.ORDER_NO IS 'μ£Όλ¬Έλ²νΈ';
COMMENT ON COLUMN BS_ORDER.USER_NO IS 'νμλ²νΈ';
COMMENT ON COLUMN BS_ORDER.BOARD_NO IS 'μν κ²μκΈ λ²νΈ';
COMMENT ON COLUMN BS_ORDER.BOARD_TYPE IS 'μν μ ν(κ²½λ§€/μ€κ³ )';
COMMENT ON COLUMN BS_ORDER.PROD_IMG IS 'μν μ΄λ―Έμ§';
COMMENT ON COLUMN BS_ORDER.PRICE IS ' μν κ°κ²©';
COMMENT ON COLUMN BS_ORDER.STOCK IS 'μ£Όλ¬Έ μλ';
COMMENT ON COLUMN BS_ORDER.TOTAL IS 'μ΄ν© κΈμ‘';
COMMENT ON COLUMN BS_ORDER.SELLER_NO IS 'νλ§€μ νμλ²νΈ';
COMMENT ON COLUMN BS_ORDER.ORDER_DATE IS 'μ£Όλ¬ΈμΌ';
COMMENT ON COLUMN BS_ORDER.UPDATE_DATE IS 'μ£Όλ¬Έ μν μλ°μ΄νΈ μΌμ';
COMMENT ON COLUMN BS_ORDER.STATUS IS 'μ£Όλ¬Έμν(Y/N)';
COMMENT ON COLUMN BS_ORDER.STATUS_DETAIL IS 'μ£Όλ¬Έμν μμΈ(μ·¨μ, νμ , νλ§€μ’λ£ λ±)';

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

COMMENT ON COLUMN ADDRESS.USER_NO IS '??λ²νΈ';
COMMENT ON COLUMN ADDRESS.ADDRESS_NAME IS 'λ°°μ‘μ§? ?΄λ¦?';
COMMENT ON COLUMN ADDRESS.RECEIVER IS 'λ°λ?΄';
COMMENT ON COLUMN ADDRESS.DELIVERY_ADDRESS IS 'λ°°μ‘μ£Όμ';
COMMENT ON COLUMN ADDRESS.POST_CODE IS '?°?Έλ²νΈ';
COMMENT ON COLUMN ADDRESS.PHONE IS '? ?λ²νΈ';

COMMIT;