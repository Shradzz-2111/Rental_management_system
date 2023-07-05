CREATE DATABASE RENTALS_NEW;

USE RENTALS_NEW;

CREATE TABLE USERS(
	ADHAR_ID INT PRIMARY KEY,
    NAME_USER VARCHAR(30),
    AGE_USER INT,
    EMAIL_USER VARCHAR(50),
    H_No INT NOT NULL,
    PLOTNo_USER VARCHAR(20),
    STREET_USER VARCHAR(30),
    CITY_USER VARCHAR(20),
    STATE_USER VARCHAR(20),
    PINCODE_USER INT,
    ISADMIN BOOL DEFAULT FALSE,
    ISMANAGER BOOL DEFAULT FALSE,
    ISOWNER BOOL,
    ISTENANT BOOL
    
);

CREATE TABLE PHONENO_USER(
	ADHAR_ID INT,
    PHONE_1 VARCHAR(10),
    PHONE_2 VARCHAR(10),
    PHONE_3 VARCHAR(10)
);

ALTER TABLE PHONENO_USER ADD CONSTRAINT FK_PHONENO_USER FOREIGN KEY(ADHAR_ID) REFERENCES USERS(ADHAR_ID);

CREATE TABLE PROPERTY(
	PROPERTY_ID INT PRIMARY KEY,
    ADHAR_ID INT,
    RENT INT,
    HIKE DECIMAL(5,2),
    TOTAL_AREA INT,
    PLINTH_AREA INT,
    START_DATE DATE,
    END_DATE DATE,
    CONSTRUCTION_YEAR INT,
    H_NO INT,
    PLOTNo_PROPERTY VARCHAR(20) NOT NULL,
    STREET_PROPERTY VARCHAR(50) NOT NULL,
    CITY_PROPERTY VARCHAR(20) NOT NULL,
    STATE_PROPERTY VARCHAR(20) NOT NULL,
    PINCODE_PROPERTY INT,
    ISCOMMERCIAL BOOL,
    ISRESIDENTIAL BOOL,
    FLOOR INT,
    BEDROOMS INT
);

CREATE TABLE LOG_BOOK(
	PROPERTY_ID INT,
    TENANT_ID INT,
    START_DATE DATE,
    END_DATE DATE
    
);

ALTER TABLE PROPERTY ADD CONSTRAINT FK_PROPERTY FOREIGN KEY(ADHAR_ID) REFERENCES USERS(ADHAR_ID);
ALTER TABLE LOG_BOOK ADD CONSTRAINT FK_LOGBOOK FOREIGN KEY(PROPERTY_ID) REFERENCES PROPERTY(PROPERTY_ID);

