DROP TABLE board;
DROP TABLE member;
DROP TABLE reply;

CREATE TABLE board
(
	board_ID             NUMBER(8) NOT NULL ,
	nickname             CHAR(18) NULL ,
	writedate            DATE NULL ,
	content              VARCHAR2(15) NULL ,
	viewcount            NUMBER(8) NULL ,
	title                CHAR(18) NULL ,
	member_ID            CHAR(18) NOT NULL 
);
CREATE UNIQUE INDEX XPKboard ON board
(board_ID   ASC);
ALTER TABLE board
	ADD CONSTRAINT  XPKboard PRIMARY KEY (board_ID);

CREATE TABLE member
(
	member_ID            CHAR(18) NOT NULL ,
	name                 CHAR(18) NULL ,
	password             CHAR(18) NULL ,
	birthdate            DATE NULL ,
	phone_number         CHAR(18) NULL ,
	email                CHAR(18) NULL ,
	nickname             CHAR(18) NULL 
);
CREATE UNIQUE INDEX XPKmember ON member
(member_ID   ASC);
ALTER TABLE member
	ADD CONSTRAINT  XPKmember PRIMARY KEY (member_ID);

CREATE TABLE reply
(
	reply_ID             NUMBER(8) NOT NULL ,
	content              VARCHAR2(15 CHAR) NULL ,
	replydate            DATE NULL ,
	nickname             CHAR(18) NULL ,
	board_ID             NUMBER(8) NOT NULL 
);
CREATE UNIQUE INDEX XPKreply ON reply
(reply_ID   ASC);
ALTER TABLE reply
	ADD CONSTRAINT  XPKreply PRIMARY KEY (reply_ID);
ALTER TABLE board
	ADD (CONSTRAINT R_4 FOREIGN KEY (member_ID) REFERENCES member (member_ID));



ALTER TABLE reply
	ADD (CONSTRAINT R_3 FOREIGN KEY (board_ID) REFERENCES board (board_ID));