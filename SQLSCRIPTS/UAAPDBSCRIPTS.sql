/**
 * Author:  FV
 * Created: May 5, 2022
 */

<--TABLE INITIALIZATION-->
CREATE SCHEMA UAAP_APPAREL;

CREATE TABLE USER_TABLE(USER_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1),
USER_PASSWORD VARCHAR(1000) NOT NULL,
USER_ROLE VARCHAR(45) NOT NULL,
USER_EMAIL VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE PRODUCT_TABLE (
PRODUCT_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1), 
PRODUCT_NAME VARCHAR(50) NOT NULL, 
PRODUCT_DESC VARCHAR(1000),
PRODUCT_SCHOOL VARCHAR(50) NOT NULL,
PRODUCT_CATEGORY VARCHAR (50) NOT NULL,
PRODUCT_IMG_LINK VARCHAR(1000) NOT NULL
);

CREATE TABLE PRODUCT_SIZE_TABLE(
PRODUCT_SIZE_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (Start with 1, Increment by 1),
PRODUCT_SIZE VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCT_GENDER_TABLE(
PRODUCT_GENDER_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (Start with 1, Increment by 1),
PRODUCT_GENDER VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCT_VARIANT_TABLE (
VARIANT_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1),
PRODUCT_ID INT NOT NULL REFERENCES PRODUCT_TABLE(PRODUCT_ID),
PRODUCT_GENDER_ID INT NOT NULL REFERENCES PRODUCT_GENDER_TABLE(PRODUCT_GENDER_ID),
PRODUCT_SIZE_ID INT NOT NULL REFERENCES PRODUCT_SIZE_TABLE(PRODUCT_SIZE_ID),
PRODUCT_PRICE INT NOT NULL,
PRODUCT_STOCK INT NOT NULL
);

CREATE TABLE ORDER_TABLE (ORDER_ID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1),
USER_ID INTEGER NOT NULL REFERENCES USER_TABLE(USER_ID),
ORDER_NAME VARCHAR(50) NOT NULL,
ORDER_QUANTITY INTEGER NOT NULL,
ORDER_PRICE INTEGER NOT NULL,
ORDER_ADDRESS VARCHAR(1000) NOT NULL,
ORDER_DATE DATE NOT NULL,
ORDER_DATE_COMPLETED DATE,
ORDER_ISPAID BOOLEAN,
ORDER_IMG_LINK VARCHAR(1000)
);

<--END INITIALIZAITON-->

<--ADMIN STATEMENTS-->


<--Orders-->
SELECT * FROM ORDER_TABLE ORDER BY ORDER_ISPAID ASC, ORDER_DATE DESC; 
<--END ORDERS-->

<-- ADMIN VIEW THE STOCK OF ITEMS-->
SELECT DISTINCT
PRODUCT_VARIANT_TABLE.PRODUCT_ID,
PRODUCT_TABLE.PRODUCT_NAME,
PRODUCT_TABLE.PRODUCT_DESC,
PRODUCT_TABLE.PRODUCT_SCHOOL,
PRODUCT_TABLE.PRODUCT_IMG_LINK,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
AND PRODUCT_TABLE.PRODUCT_SCHOOL = 'ADAMSON' 
AND PRODUCT_VARIANT_TABLE.PRODUCT_ID = 1 AND PRODUCT_VARIANT_TABLE.PRODUCT_STOCK > 0
ORDER BY PRODUCT_GENDER_TABLE.PRODUCT_GENDER ASC
AND PRODUCT_TABLE.PRODUCT_SCHOOL LIKE '%ADAMSON%'
AND PRODUCT_TABLE.PRODUCT_CATEGORY LIKE '%CAPS%'

SELECT DISTINCT
PRODUCT_VARIANT_TABLE.PRODUCT_ID,
PRODUCT_TABLE.PRODUCT_NAME,
PRODUCT_TABLE.PRODUCT_DESC,
PRODUCT_TABLE.PRODUCT_SCHOOL,
PRODUCT_TABLE.PRODUCT_IMG_LINK,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
AND PRODUCT_TABLE.PRODUCT_SCHOOL = 'ADAMSON' 
AND PRODUCT_VARIANT_TABLE.PRODUCT_ID = 1 AND PRODUCT_VARIANT_TABLE.PRODUCT_STOCK > 0

--FILTER WITH SIZE
SELECT DISTINCT
PRODUCT_VARIANT_TABLE.PRODUCT_ID,
PRODUCT_TABLE.PRODUCT_NAME,
PRODUCT_TABLE.PRODUCT_DESC,
PRODUCT_TABLE.PRODUCT_SCHOOL,
PRODUCT_TABLE.PRODUCT_IMG_LINK,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
AND PRODUCT_GENDER_TABLE.PRODUCT_GENDER LIKE '%F%' ESCAPE '!'
AND PRODUCT_VARIANT_TABLE.PRODUCT_PRICE BETWEEN 900 AND 1200
AND PRODUCT_TABLE.PRODUCT_SCHOOL LIKE '%ATENEO%'
AND PRODUCT_SIZE_TABLE.PRODUCT_SIZE = 'M'

--filter WITHOUT SIZE
SELECT DISTINCT
PRODUCT_VARIANT_TABLE.PRODUCT_ID,
PRODUCT_TABLE.PRODUCT_NAME,
PRODUCT_TABLE.PRODUCT_DESC,
PRODUCT_TABLE.PRODUCT_SCHOOL,
PRODUCT_TABLE.PRODUCT_IMG_LINK,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
AND PRODUCT_GENDER_TABLE.PRODUCT_GENDER LIKE '%%'
AND PRODUCT_VARIANT_TABLE.PRODUCT_PRICE BETWEEN 0 AND 999999
AND PRODUCT_TABLE.PRODUCT_SCHOOL LIKE '%%'

SELECT DISTINCT
PRODUCT_VARIANT_TABLE.PRODUCT_ID,
PRODUCT_TABLE.PRODUCT_NAME,
PRODUCT_TABLE.PRODUCT_DESC,
PRODUCT_TABLE.PRODUCT_SCHOOL,
PRODUCT_TABLE.PRODUCT_IMG_LINK,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
OR PRODUCT_TABLE.PRODUCT_SCHOOL LIKE '%ADAMSON%'
OR PRODUCT_TABLE.PRODUCT_NAME LIKE '%ADAMSON%'
OR PRODUCT_TABLE.PRODUCT_CATEGORY LIKE '%ADAMSON%'
OR PRODUCT_GENDER_TABLE.PRODUCT_GENDER LIKE '%ADAMSON%'
AND PRODUCT_VARIANT_TABLE.PRODUCT_PRICE BETWEEN 0 AND 999999
AND PRODUCT_TABLE.PRODUCT_SCHOOL LIKE '%%'

SELECT DISTINCT
PRODUCT_VARIANT_TABLE.PRODUCT_ID,
PRODUCT_TABLE.PRODUCT_NAME,
PRODUCT_TABLE.PRODUCT_DESC,
PRODUCT_TABLE.PRODUCT_SCHOOL,
PRODUCT_TABLE.PRODUCT_IMG_LINK,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
OR PRODUCT_TABLE.PRODUCT_SCHOOL LIKE '%ADAMSON%'
OR PRODUCT_TABLE.PRODUCT_NAME LIKE '%ADAMSON%'
OR PRODUCT_TABLE.PRODUCT_CATEGORY LIKE '%ADAMSON%'
OR PRODUCT_GENDER_TABLE.PRODUCT_GENDER LIKE '%ADAMSON%'

SELECT DISTINCT
PRODUCT_VARIANT_TABLE.VARIANT_ID,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
AND PRODUCT_VARIANT_TABLE.PRODUCT_ID = 1
AND PRODUCT_VARIANT_TABLE.PRODUCT_STOCK > 0;

SELECT 
SELECT DISTINCT
PRODUCT_VARIANT_TABLE.VARIANT_ID,
PRODUCT_GENDER_TABLE.PRODUCT_GENDER,
PRODUCT_SIZE_TABLE.PRODUCT_SIZE,
PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,
PRODUCT_VARIANT_TABLE.PRODUCT_STOCK
FROM PRODUCT_VARIANT_TABLE
JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID
JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID
JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID
AND PRODUCT_GENDER_TABLE.PRODUCT_GENDER = 'F' 
AND PRODUCT_SIZE_TABLE.PRODUCT_SIZE = 'XS'
AND PRODUCT_VARIANT_TABLE.PRODUCT_ID = 1;

SELECT 
USER_TABLE.USER_EMAIL AS EMAIL,
ORDER_TABLE.ORDER_NAME AS "ORDER NAME",
ORDER_TABLE.ORDER_QUANTITY AS QUANTITY,
ORDER_TABLE.ORDER_PRICE AS PRICE,
ORDER_TABLE.ORDER_DATE AS "ORDER CREATED",
ORDER_TABLE.ORDER_DATE_COMPLETED AS "ORDER COMPLETED",
ORDER_TABLE.ORDER_ISPAID AS ISPAID
FROM ORDER_TABLE JOIN USER_TABLE ON USER_TABLE.USER_ID = ORDER_TABLE.USER_ID


SELECT 
ORDER_TABLE.ORDER_ID,
USER_TABLE.USER_EMAIL,
ORDER_TABLE.ORDER_NAME,
ORDER_TABLE.ORDER_QUANTITY,
ORDER_TABLE.ORDER_PRICE,
ORDER_TABLE.ORDER_ADDRESS,
ORDER_TABLE.ORDER_DATE,
ORDER_TABLE.ORDER_DATE_COMPLETED,
ORDER_TABLE.ORDER_ISPAID,
ORDER_TABLE.ORDER_IMG_LINK
FROM ORDER_TABLE 
JOIN USER_TABLE ON USER_TABLE.USER_ID = ORDER_TABLE.USER_ID
AND ORDER_TABLE.ORDER_DATE_COMPLETED IS NULL
FETCH FIRST 100 ROWS ONLY;

<--END-->

SELECT * FROM PRODUCT_VARIANT_TABLE;
SELECT * FROM PRODUCT_TABLE;



<--UPDATE A PRODUCT-->
UPDATE PRODUCT_TABLE SET 
"PRODUCT_NAME"= ?
"PRODUCT_DESC"= ?
"PRODUCT_SCHOOL" = ?
"PRODUCT_IMG_LINK" = ?
WHERE PRODUCT_ID = ?

    <--UPDATE VARIANT OF PRODUCT-->
    UPDATE PRODUCT_VARIANT_TABLE SET 
    "PRODUCT_GENDER_ID"= ?
    "PRODUCT_SIZE_ID"= ?
    "PRODUCT_PRICE" = ?
    "PRODUCT_STOCK" = ?
    WHERE PRODUCT_ID = ?
<--UPDATE A PRODUCT END-->

<--DELETE PRODUCT-->
DELETE FROM PRODUCT_TABLE WHERE PRODUCT_ID = ?
DELETE FROM PRODUCT_VARIANT_TABLE WHERE PRODUCT_ID = ?
<--DELETE PRODUCT END-->

<--VIEW ALL USERS-->
SELECT 
USER_EMAIL AS EMAIL,
USER_ROLE AS ROLE
FROM USER_TABLE; 
<--END-->

SELECT * FROM ORDER_TABLE WHERE ORDER_DATE_COMPLETED BETWEEN '2022-01-08' AND '2022-02-15' 
ORDER BY ORDER_DATE ASC; --FOR ADMIN ONLY

<--USER STATMENTS-->
SELECT * FROM ORDER_TABLE WHERE USER_ID=3 AND ORDER BY ORDER_ISPAID ASC, ORDER_DATE DESC; 
--ORDERED ITEMS BY USERS
--THAT HAVE NOT BEEN FULFILLED --FOR USERS

SELECT * FROM PRODUCT_TABLE WHERE PRODUCT_SCHOOL = 'UST';

SELECT DISTINCT * FROM PRODUCT_TABLE WHERE 
PRODUCT_SCHOOL LIKE '%ADAMSON%' AND
PRODUCT_CATEGORY LIKE '%CAPS%'; --UNIFIED SEARCH QUERY

-- search query for any item in the database regardless of lower or uppercase just choose one of the 
-- two queries below
SELECT DISTINCT * FROM PRODUCT_TABLE WHERE UPPER(PRODUCT_NAME) LIKE UPPER('%UST%')  OR
UPPER(PRODUCT_SCHOOL) LIKE UPPER('%UST%') 

SELECT DISTINCT * FROM PRODUCT_TABLE WHERE LOWER(PRODUCT_IMG_LINK) LIKE LOWER('%do%')

DELETE FROM ORDER_TABLE;
DELETE FROM CART_TABLE;

DELETE FROM PRODUCT_VARIANT_TABLE;
DELETE FROM PRODUCT_TABLE;

DELETE FROM USER_TABLE;
DELETE FROM USER_TABLE WHERE ID=3



INSERT INTO USER_TABLE (USER_FNAME, USER_LNAME, USER_PASSWORD, USER_ROLE, USER_EMAIL) 
	VALUES ('James', 'Cruz', '123', 'Customer', 'xd.gamil.om')
INSERT INTO USER_TABLE (USER_FNAME, USER_LNAME, USER_PASSWORD, USER_ROLE, USER_EMAIL) 
	VALUES ('May', 'Mambog', '123', 'Admin', 'Hatdog.gmail.com')
INSERT INTO USER_TABLE (USER_FNAME, USER_LNAME, USER_PASSWORD, USER_ROLE, USER_EMAIL) 
	VALUES ('Jared', 'Ruckel', '125', 'Customer', 'customer.gamil.com')

INSERT INTO PRODUCT_TABLE (PRODUCT_NAME, PRODUCT_DESC, PRODUCT_SCHOOL, PRODUCT_CATEGORY, PRODUCT_IMG_LINK) 
	VALUES (?, ?, ?, ?, ?)

INSERT INTO APP.ORDER_TABLE (USER_ID, ORDER_NAME, ORDER_QUANTITY, ORDER_PRICE, ORDER_ADDRESS, ORDER_DATE, ORDER_DATE_COMPLETED, ORDER_ISPAID, ORDER_IMG_LINK) 
	VALUES (5, 'test', 2, 200, 'somewhere', '2022-05-23', '2022-05-23', false, 'somewhere.com')

UPDATE PRODUCT_TABLE SET "PRODUCT_NAME" = 'B1P', "PRODUCT_DESC" = 'One of our classic cap desig1ns for UAAP Adamson Soaring Falcons. 65% Polyester, 35% Cotton', "PRODUCT_SCHOOL" = 'ADAMSON1', "PRODUCT_CATEGORY" = 'CAPS1' WHERE PRODUCT_ID = 1;

call SYSCS_UTIL.SYSCS_SET_DATABASE_PROPERTY('derby.user.app', 'app') --reset password
