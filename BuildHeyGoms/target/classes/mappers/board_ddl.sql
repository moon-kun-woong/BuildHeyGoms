CREATE DATABASE BUILDHEYGOMS;
USE BUILDHEYGOMS;

CREATE TABLE BOARD(
	BOARD_ID 	BIGINT 			PRIMARY KEY AUTO_INCREMENT,
    PASSWD 		VARCHAR(200)	NOT NULL,
    WRITER 		VARCHAR(50)		NOT NULL,
    SUBJECT 	VARCHAR(50)		NOT NULL,
   	CONTENT 	VARCHAR(2000)	NOT NULL,
    READ_CNT  	BIGINT			DEFAULT 0,
    ENROLL_DT 	TIMESTAMP		DEFAULT NOW(),
    MODIFY_DT 	TIMESTAMP		DEFAULT NOW()
);

ALTER TABLE BOARD AUTO_INCREMENT = 100000;
