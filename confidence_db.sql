DROP TABLE reply;
DROP TABLE board;
DROP TABLE member;


CREATE TABLE board
(
	boardId             NUMBER(8) NOT NULL ,
	nickname             CHAR(18) NULL ,
	writeDate            DATE NULL ,
	content              VARCHAR2(15) NULL ,
	viewCount            NUMBER(8) NULL ,
	title                CHAR(18) NULL ,
	memberId            CHAR(18) NOT NULL 
);
CREATE UNIQUE INDEX XPKboard ON board
(boardId   ASC);
ALTER TABLE board
	ADD CONSTRAINT  XPKboard PRIMARY KEY (boardId);

CREATE TABLE member
(
	memberId            CHAR(18) NOT NULL ,
	name                 CHAR(18) NULL ,
	password             CHAR(18) NULL ,
	birthdate            DATE NULL ,
	phone_number         CHAR(18) NULL ,
	email                CHAR(18) NULL ,
	nickname             CHAR(18) NULL 
);
CREATE UNIQUE INDEX XPKmember ON member
(memberId   ASC);
ALTER TABLE member
	ADD CONSTRAINT  XPKmember PRIMARY KEY (memberId);

CREATE TABLE reply
(
	replyId             NUMBER(8) NOT NULL ,
	content              VARCHAR2(15 CHAR) NULL ,
	replyDate            DATE NULL ,
	nickname             CHAR(18) NULL ,
	boardId             NUMBER(8) NOT NULL 
);
CREATE UNIQUE INDEX XPKreply ON reply
(replyId   ASC);
ALTER TABLE reply
	ADD CONSTRAINT  XPKreply PRIMARY KEY (replyId);
ALTER TABLE board
	ADD (CONSTRAINT R_4 FOREIGN KEY (memberId) REFERENCES member (memberId));

ALTER TABLE reply
	ADD (CONSTRAINT R_3 FOREIGN KEY (boardId) REFERENCES board (boardId));