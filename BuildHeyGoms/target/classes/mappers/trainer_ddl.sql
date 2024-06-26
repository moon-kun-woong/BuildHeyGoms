#CREATE DATABASE BUILDHEYGOMS;

USE BUILDHEYGOMS;

CREATE TABLE TRAINER (
    TRAINER_ID 				VARCHAR(20) 			PRIMARY KEY,
    PASSWD 					VARCHAR(200) 			NOT NULL,
    TRAINER_NM 				VARCHAR(50)  			NOT NULL,
	SEX 					CHAR(1)					NOT NULL,
	BIRTH_DT 				CHAR(10)				NOT NULL,
	HP 						VARCHAR(200)			NOT NULL,
	SMSSTS_YN 				CHAR(1)					NOT NULL,
	EMAIL 					VARCHAR(50)				NOT NULL,
	EMAILSTS_YN 			CHAR(1)					NOT NULL,
	ZIPCODE_TRAINER 		VARCHAR(10),
	ROAD_ADDRESS_TRAINER 	VARCHAR(500),
	JIBUN_ADDRESS_TRAINER 	VARCHAR(500),
	NAMUJI_ADDRESS 			VARCHAR(500),
	CAREER_BOOK				VARCHAR(200),
	JOIN_DT 				TIMESTAMP,
    INTRODUCTION			VARCHAR(500),
	ACTIVEACCOUNT_YN 		VARCHAR(500)
	);

