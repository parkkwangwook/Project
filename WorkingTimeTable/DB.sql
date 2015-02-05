
/* Drop Triggers */

DROP TRIGGER TRI_bComment_comment_number;
DROP TRIGGER TRI_company_company_code;
DROP TRIGGER TRI_company_person_member_id;
DROP TRIGGER TRI_Reply_reply_number;
DROP TRIGGER TRI_time_table_time_key;



/* Drop Tables */

DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE bComment CASCADE CONSTRAINTS;
DROP TABLE time_table CASCADE CONSTRAINTS;
DROP TABLE company_person CASCADE CONSTRAINTS;
DROP TABLE company CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_bComment_comment_number;
DROP SEQUENCE SEQ_company_company_code;
DROP SEQUENCE SEQ_company_person_member_id;
DROP SEQUENCE SEQ_Reply_reply_number;
DROP SEQUENCE SEQ_time_table_time_key;




/* Create Sequences */

CREATE SEQUENCE SEQ_bComment_comment_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_company_company_code INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_company_person_member_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reply_reply_number INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_time_table_time_key INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE bComment
(
	comment_number number NOT NULL,
	user_id varchar2(20) NOT NULL,
	comment_content varchar2(300) NOT NULL,
	reg_date date DEFAULT sysdate,
	flag number NOT NULL,
	PRIMARY KEY (comment_number)
);


CREATE TABLE company
(
	company_code number NOT NULL,
	company_name varchar2(20) NOT NULL,
	company_tel varchar2(10),
	holiday_comm float,
	night_comm float,
	PRIMARY KEY (company_code)
);


CREATE TABLE company_person
(
	member_id number NOT NULL,
	company_code number NOT NULL,
	user_id varchar2(20) NOT NULL,
	salary number,
	grade varchar2(10) NOT NULL,
	hire_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (member_id)
);


CREATE TABLE Reply
(
	reply_number number NOT NULL,
	user_id varchar2(20) NOT NULL,
	comment_number number NOT NULL,
	reply_content varchar2(100) NOT NULL,
	reg_date date DEFAULT sysdate,
	PRIMARY KEY (reply_number)
);


CREATE TABLE time_table
(
	time_key number NOT NULL,
	company_code number NOT NULL,
	member_id number NOT NULL,
	working_date date NOT NULL,
	working_start number NOT NULL,
	working_end number,
	PRIMARY KEY (time_key)
);


CREATE TABLE Users
(
	user_id varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	password2 varchar2(20) NOT NULL,
	user_name varchar2(10) NOT NULL,
	tel varchar2(20),
	email varchar2(30) NOT NULL,
	birth date NOT NULL,
	grade varchar2(10) NOT NULL,
	join_date date DEFAULT sysdate NOT NULL,
	question varchar2(50) NOT NULL,
	answer varchar2(20) NOT NULL,
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE Reply
	ADD FOREIGN KEY (comment_number)
	REFERENCES bComment (comment_number)
;


ALTER TABLE company_person
	ADD FOREIGN KEY (company_code)
	REFERENCES company (company_code)
;


ALTER TABLE time_table
	ADD FOREIGN KEY (company_code)
	REFERENCES company (company_code)
;


ALTER TABLE time_table
	ADD FOREIGN KEY (member_id)
	REFERENCES company_person (member_id)
;


ALTER TABLE Reply
	ADD FOREIGN KEY (user_id)
	REFERENCES Users (user_id)
;


ALTER TABLE company_person
	ADD FOREIGN KEY (user_id)
	REFERENCES Users (user_id)
;


ALTER TABLE bComment
	ADD FOREIGN KEY (user_id)
	REFERENCES Users (user_id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_bComment_comment_number BEFORE INSERT ON bComment
FOR EACH ROW
BEGIN
	SELECT SEQ_bComment_comment_number.nextval
	INTO :new.comment_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_company_company_code BEFORE INSERT ON company
FOR EACH ROW
BEGIN
	SELECT SEQ_company_company_code.nextval
	INTO :new.company_code
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_company_person_member_id BEFORE INSERT ON company_person
FOR EACH ROW
BEGIN
	SELECT SEQ_company_person_member_id.nextval
	INTO :new.member_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reply_reply_number BEFORE INSERT ON Reply
FOR EACH ROW
BEGIN
	SELECT SEQ_Reply_reply_number.nextval
	INTO :new.reply_number
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_time_table_time_key BEFORE INSERT ON time_table
FOR EACH ROW
BEGIN
	SELECT SEQ_time_table_time_key.nextval
	INTO :new.time_key
	FROM dual;
END;

/


insert into users(user_id, password, password2, user_name, tel, email, birth, grade, question, answer) 
values ('park', '1', '1', 'kwangwook', '010-', 'p@naver.com', '1987-06-08', '사장', '몇살?', '20살');

