#CREATE DATABASE BUILDHEYGOMS;

USE BUILDHEYGOMS;

CREATE TABLE CLASS (
    CLASS_ID 			VARCHAR(20) 	PRIMARY KEY,
    CLASS_NM 			VARCHAR(50) 	NOT NULL,
	TRAINER_ID 			VARCHAR(20) 	NOT NULL,
	SELECTED_DATE		DATE			NOT NULL,
	CREATE_CLASS_DT 	TIMESTAMP,
	CLASS_LOCATION		VARCHAR(200)		NOT NULL,
	CLASS_CONTENT		VARCHAR(200),
	ACTIVE_ACCOUNT_YN 	VARCHAR(20)
);

