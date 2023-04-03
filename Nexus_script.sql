-----------------����------------------
--���������� ������̺� �� �������� ����
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--���������� ��� ������ ����
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--���������� ��� �� ����
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--���������� ��� Ʈ���� ����
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-- ���̺� ����

---------------------- ȸ�� ���̺� -------------------------
create table tb_member(
    user_no	number primary key,
	user_id	varchar2(50) not null unique,
	user_pwd varchar2(100),
	user_name varchar2(100)	NOT NULL,
	user_nick varchar2(100),
	email varchar2(100),
	profile	varchar2(200),
	gender char(3) check(gender in('M','W','O')),
	social char(3) check(social in('K','G','O')),
	enroll_date	date default sysdate,
	token	varchar2(200),
	status	char(3)	default 'Y' check(status in('Y','N'))
);

create sequence seq_member
nocache;

INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user01','pass01','�ڿ���','�ڹٸ�����','email01@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user02','pass02','������','DB�� ����','email02@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user03','pass03','��ö��','�������Ǳ���','email03@kh.co.kr',null,null,'O',SYSDATE,null,'Y');


COMMENT ON COLUMN TB_MEMBER.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_MEMBER.USER_ID IS '���̵�';
COMMENT ON COLUMN TB_MEMBER.USER_PWD IS '��й�ȣ';
COMMENT ON COLUMN TB_MEMBER.USER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN TB_MEMBER.USER_NICK IS '�г���';
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '�̸���';
COMMENT ON COLUMN TB_MEMBER.PROFILE IS '�������ּ�';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '����';
COMMENT ON COLUMN TB_MEMBER.SOCIAL IS '�Ҽ� ����';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '������';
COMMENT ON COLUMN TB_MEMBER.TOKEN IS '��ū';
COMMENT ON COLUMN TB_MEMBER.STATUS IS 'Ż�𿩺�';


---------------------- ���� ���̺� -------------------------
create table tb_news (
	news_no	number primary key,
	user_no	number references tb_member,
	news_title	varchar2(1000)	NOT NULL,
	news_content varchar2(4000)	NOT NULL,
	create_date date DEFAULT sysdate,
	update_date date DEFAULT sysdate,
	status	char(3) default 'Y'	check(status in('Y','N')),
	origin_name	varchar2(100)	NULL,
	change_name	varchar2(100)	NULL
);

create sequence seq_news
nocache;

insert into tb_news values(seq_news.nextval, 1,'���� �Ϸ� �����','����ö���� ���������µ� ����׿�',sysdate,sysdate,'Y','qwe','qwe');
insert into tb_news values(seq_news.nextval, 2,'�������','���ɽð��ε� �� ���� ���԰� �մϱ�!!!',sysdate,sysdate,'Y','asdf','asdf');
insert into tb_news values(seq_news.nextval, 3,'�ƴ� ����ö���� ������ �׸� �սô�','���ð��� �����ϰ� �;�Ф�',sysdate,sysdate,'Y','qwe','qwe');

comment on column tb_news.news_no is '������ȣ';
comment on column tb_news.user_no is 'ȸ����ȣ';
comment on column tb_news.news_title is '����';
comment on column tb_news.news_content is '����';
comment on column tb_news.create_date is '������';
comment on column tb_news.update_date is '������';
comment on column tb_news.status is '����';
comment on column tb_news.origin_name is '���� ���ϸ�';
comment on column tb_news.change_name is '����� ���ϸ�';


---------------------- ���� ��� -------------------------
create table tb_news_comments(
    news_no number references tb_news,
    comment_writer varchar2(50) not null,
    comment_content varchar2(2000) not null,
    comment_date date default sysdate,
    status char(3) default 'Y' check(status in('Y','N'))
);

insert into tb_news_comments values(1, 'user01','��������',sysdate,'Y');
insert into tb_news_comments values(1, 'user02','��������',sysdate,'Y');
insert into tb_news_comments values(1, 'user03','��������',sysdate,'Y');

comment on column tb_news_comments.news_no is '������ȣ';
comment on column tb_news_comments.comment_writer is '�ۼ��� ���̵�';
comment on column tb_news_comments.comment_content is '����';
comment on column tb_news_comments.comment_date is '�ۼ���';
comment on column tb_news_comments.status is '����';

---------------------- ���� -------------------------
create table tb_collaborator(
    repository_no number not null,
    user_no number references tb_member,
    part varchar2(10)
);

insert into tb_collaborator values(1, 1, '����');
insert into tb_collaborator values(1,2,'����');
insert into tb_collaborator values(1,3,'����');

comment on column tb_collaborator.repository_no is '�������丮 ��ȣ';
comment on column tb_collaborator.user_no is 'ȸ����ȣ';
comment on column tb_collaborator.part is '����';


---------------------- Ķ���� ī�װ��� -------------------------
CREATE TABLE TB_CALENDAR_CATEGORY(
   CATEGORY_NO NUMBER PRIMARY KEY,
   CATEGORY_NAME VARCHAR2(30)
);

COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NO IS 'ī�װ��� ��ȣ';
COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NAME IS 'ī�װ��� �̸�';

INSERT INTO TB_CALENDAR_CATEGORY VALUES(1,'����');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(2,'���� ����');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(3,'�Ҽ� ����');

---------------------- Ķ���� -------------------------

CREATE TABLE TB_CALENDAR(
   USER_NO NUMBER REFERENCES TB_MEMBER,
   SCHEDULE_TITLE VARCHAR2(100) NOT NULL,
   START_DATE DATE NOT NULL,
   END_DATE DATE NOT NULL,
   DATE_COLOR VARCHAR2(30),
   SCHEDULE_CONTENT VARCHAR2(1000),
   CATEGORY_NO NUMBER REFERENCES TB_CALENDAR_CATEGORY
);

COMMENT ON COLUMN TB_CALENDAR.USER_NO IS 'ȸ�� ��ȣ';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_TITLE IS '���� ����';
COMMENT ON COLUMN TB_CALENDAR.START_DATE IS '������';
COMMENT ON COLUMN TB_CALENDAR.END_DATE IS '������';
COMMENT ON COLUMN TB_CALENDAR.DATE_COLOR IS '����';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_CONTENT IS '���� ����';
COMMENT ON COLUMN TB_CALENDAR.CATEGORY_NO IS 'ī�װ��� ��ȣ';

INSERT INTO TB_CALENDAR VALUES(1,'������Ʈ ȸ��',SYSDATE,'2023-04-04','����','5�� NEXUS ȸ��',1);
INSERT INTO TB_CALENDAR VALUES(2,'û���ϱ�',SYSDATE,'2023-04-04','�Ķ�','3�� ��û��',2);
INSERT INTO TB_CALENDAR VALUES(3,'��ȣ ����','2023-05-05','2023-05-05','�ʷ�','��ȣ�� ����',3);


---------------------- ä�ù� -------------------------
CREATE TABLE TB_CHAT_ROOM(
   ROOM_NO NUMBER PRIMARY KEY,
   NUMBER_PARTICIPANTS NUMBER NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   STATUS CHAR(3) DEFAULT 'Y' NOT NULL
);
COMMENT ON COLUMN TB_CHAT_ROOM.ROOM_NO IS 'ä�ù� ��ȣ';
COMMENT ON COLUMN TB_CHAT_ROOM.NUMBER_PARTICIPANTS IS '�����ο�';
COMMENT ON COLUMN TB_CHAT_ROOM.CREATE_DATE IS '��������';
COMMENT ON COLUMN TB_CHAT_ROOM.STATUS IS '��������';

INSERT INTO TB_CHAT_ROOM VALUES(1,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(2,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(3,2,SYSDATE,'Y');

---------------------- ä�ù� ȸ�� -------------------------
CREATE TABLE TB_CHAT_USER(
   USER_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM 
);
COMMENT ON COLUMN TB_CHAT_USER.USER_NO IS 'ȸ�� ��ȣ';
COMMENT ON COLUMN TB_CHAT_USER.ROOM_NO IS 'ä�ù� ��ȣ';

INSERT INTO TB_CHAT_USER VALUES(1,2);
INSERT INTO TB_CHAT_USER VALUES(2,1);
INSERT INTO TB_CHAT_USER VALUES(3,3);


---------------------- ä�� -------------------------
CREATE TABLE TB_CHATTING(
   CHATTING_NO NUMBER PRIMARY KEY,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM,
   CHATTING_CONTENT VARCHAR2(3000),
   ORIGIN_NAME VARCHAR2(500),
   CHANGE_NAME VARCHAR2(500),
   CHAT_WRITER VARCHAR2(100) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN TB_CHATTING.CHATTING_NO IS 'ä�� ��ȣ';
COMMENT ON COLUMN TB_CHATTING.ROOM_NO IS 'ä�ù� ��ȣ';
COMMENT ON COLUMN TB_CHATTING.CHATTING_CONTENT IS '�޼��� ����';
COMMENT ON COLUMN TB_CHATTING.ORIGIN_NAME IS '���� ���ϸ�';
COMMENT ON COLUMN TB_CHATTING.CHANGE_NAME IS '�ٲ� ���ϸ�';
COMMENT ON COLUMN TB_CHATTING.CHAT_WRITER IS '�ۼ���';
COMMENT ON COLUMN TB_CHATTING.CREATE_DATE IS '�ۼ�����';


INSERT INTO TB_CHATTING VALUES(1,1,'��������',NULL,NULL,'����',SYSDATE);
INSERT INTO TB_CHATTING VALUES(2,1,'��������',NULL,NULL,'����',SYSDATE);
INSERT INTO TB_CHATTING VALUES(3,2,'ö���� �ڵ�����..',NULL,NULL,'ö��',SYSDATE);

--------------------------------------------------
--------------     ISSUE ���� 	------------------	
--------------------------------------------------

CREATE TABLE TB_ISSUE (
	ISSUE_NO	number	NOT NULL,
	LABEL	number	NULL,
	CREATE_DATE	date DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE	date	NULL,
	CLOSE_DATE	date	NULL,
	STATUS	char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) ,
	REPOSITORY_ID	varchar2(100)	NOT NULL,
	MILESTONE_ID	varchar2(100)	NULL,
	ISSUE_TITLE	varchar2(500)	NOT NULL,
	ISSUE_CONTENT	varchar2(1000)	NOT NULL,
	ISSUE_AUTHOR	NUMBER	,
	ISSUE_ASSIGNEE	varchar2(100)	NULL,
	PRIORITY	number	NULL 
);



COMMENT ON COLUMN TB_ISSUE.ISSUE_NO IS '�̽���ȣ(�꿡���޾ƿ�)';
COMMENT ON COLUMN TB_ISSUE.LABEL IS '�̽� ��';
COMMENT ON COLUMN TB_ISSUE.CREATE_DATE IS '�̽� ������';
COMMENT ON COLUMN TB_ISSUE.MODIFY_DATE IS '�̽� ������';
COMMENT ON COLUMN TB_ISSUE.CLOSE_DATE IS '�̽� ������';
COMMENT ON COLUMN TB_ISSUE.STATUS IS '�̽� ���°�';
COMMENT ON COLUMN TB_ISSUE.REPOSITORY_ID IS '�̽��� ���� �������丮';
COMMENT ON COLUMN TB_ISSUE.MILESTONE_ID IS '�̽��� ���� ���Ͻ���';
COMMENT ON COLUMN TB_ISSUE.ISSUE_TITLE IS '�̽� ����';
COMMENT ON COLUMN TB_ISSUE.ISSUE_CONTENT IS '�̽� ����';
COMMENT ON COLUMN TB_ISSUE.ISSUE_AUTHOR IS '�̽� �ۼ���';
COMMENT ON COLUMN TB_ISSUE.ISSUE_ASSIGNEE IS '�̽� �Ҵ� ���� ���';
COMMENT ON COLUMN TB_ISSUE.PRIORITY IS '�̽� �켱����';

-- ������
CREATE SEQUENCE SEQ_ISSUE_NO NOCACHE;




ALTER TABLE TB_ISSUE
  ADD CONSTRAINT PK_ISSUE_NO PRIMARY KEY (ISSUE_NO);


ALTER TABLE TB_ISSUE
ADD CONSTRAINT FK_ISU_AUTHOR FOREIGN KEY(ISSUE_AUTHOR) REFERENCES TB_MEMBER (USER_NO);



-- ��簪 �ֱ� - ����Ʈ
INSERT 
	INTO 	TB_ISSUE
			(
				ISSUE_NO
				, LABEL
				, CREATE_DATE
				, MODIFY_DATE
				, CLOSE_DATE
				, STATUS
				, REPOSITORY_ID
				, MILESTONE_ID
				, ISSUE_TITLE
				, ISSUE_CONTENT
				, ISSUE_AUTHOR
				, ISSUE_ASSIGNEE
				, PRIORITY
			)
	VALUES
			(
				
				SEQ_ISSUE_NO.NEXTVAL
				, 1
				, DEFAULT
				, SYSDATE
				, SYSDATE
				, DEFAULT
				, '�������丮 ID 123'
				, '���Ͻ���ID 123'
				, '���� ���� ���'
				, '��¼����¼�� �������ּ���. ������ ������Ʈ ���� �Ұ�'
				, 1
				, '������ü' -- ������ü�϶��� ��° ����
				, 1
			)
	;
				
				
				

		

-- NULL ���� �ֱ�
INSERT 
	INTO 	TB_ISSUE
			(
				  ISSUE_NO
				, CREATE_DATE
				, STATUS
				, REPOSITORY_ID
				, ISSUE_TITLE
				, ISSUE_CONTENT
				, ISSUE_AUTHOR
				, PRIORITY
			)
	VALUES
			(
				
				 SEQ_ISSUE_NO.NEXTVAL
				, DEFAULT
				, DEFAULT
				, '�������丮 ID 456'
				, '�˶� ��� ����'
				, '�������K �� �ؾ߳����� �Ͽ�'
				, 1 -- ȸ�� ���� ���̵� �־���ؿ�
                , 1

			)
	;

	
-- ��簪 �ֱ� - ��������
INSERT 
	INTO 	TB_ISSUE
			(
				ISSUE_NO
				, LABEL
				, CREATE_DATE
				, MODIFY_DATE
				, CLOSE_DATE
				, STATUS
				, REPOSITORY_ID
				, MILESTONE_ID
				, ISSUE_TITLE
				, ISSUE_CONTENT
				, ISSUE_AUTHOR
				, ISSUE_ASSIGNEE
				, PRIORITY
			)
	VALUES
			(
				
				SEQ_ISSUE_NO.NEXTVAL
				, 3
				, '20230101'
				, '20230110'
				, '20230210'
				, 'N'
				, '�������丮 ID 78910'
				, '���Ͻ���ID 456'
				, '�̽� ����� ��'
				, '���� ���� �����Ѵ� ȫȫȫ'
				, 3
				, 'user02' -- ������ü�϶��� ��° ����
				, 2
			)
	;
	
	
	
--------------------------------------------------
-------------    ISSUE_REPLY ���� 	--------------
--------------------------------------------------

CREATE TABLE TB_ISU_REPLY (
	REPLY_NO	NUMBER	NOT NULL,
	REPLY_CONTENT	VARCHAR2(1000)	NOT NULL,
	REPLY_WRITER	NUMBER,
	CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	STATUS	char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) ,
	REF_ISSUE_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_ISU_REPLY.REPLY_NO IS '��� ��ȣ';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_CONTENT IS '��� ����';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_WRITER IS '��� �ۼ���';
COMMENT ON COLUMN TB_ISU_REPLY.CREATE_DATE IS '��� �ۼ���';
COMMENT ON COLUMN TB_ISU_REPLY.STATUS IS '��� ���°�';
COMMENT ON COLUMN TB_ISU_REPLY.REF_ISSUE_NO IS '���� �̽� ��ȣ';

--������
CREATE SEQUENCE SEQ_ISU_REPLY_NO NOCACHE;



ALTER TABLE TB_ISU_REPLY
  ADD CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_ISSUENO FOREIGN KEY(REF_ISSUE_NO) REFERENCES TB_ISSUE (ISSUE_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(REPLY_WRITER) REFERENCES TB_MEMBER (USER_NO);


-- ��簪 �ֱ�

INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, STATUS
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '�̰� �ϱ�Ⱦ�� ��� �ٲ��ּ���'
				, 1
				, DEFAULT
				, DEFAULT
				, 1
			)
	;


-- NULL ���� �� �ֱ�


INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '�̰� �³� �;��~'
				, 2
				, '20230314'
				, 2
			)
	;
	
	
-- ��簪 �ֱ� - ��������

INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, STATUS
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '�¾ƿ�?? �̰�???'
				, 1
				, SYSDATE
				, 'N'
				, 1
			)
	;
	
-- ��簪 �ֱ� - ��������2

INSERT 
	INTO 	TB_ISU_REPLY
			(
				REPLY_NO
				, REPLY_CONTENT
				, REPLY_WRITER
				, CREATE_DATE
				, STATUS
				, REF_ISSUE_NO
			)
	VALUES
			(
				
				SEQ_ISU_REPLY_NO.NEXTVAL
				, '�ι�°��� �׽�Ʈ���Դψ�'
				, 1
				, SYSDATE
				, DEFAULT
				, 2
			)
	;
	



--------------------------------------------------
-------------    �ǽð� �˸� ���� ���� 	--------------
--------------------------------------------------	


CREATE TABLE TB_NOTIFICATIONS (
	user_no	number	NOT NULL,
	category_no	number	CHECK (category_no IN (1,2,3,4,5,6)),
	noti_content	varchar2(1000)	NOT NULL,
	ocu_time	date	NOT NULL,
	post_no 	number	NOT NULL,
	STATUS char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) 
);

-- �ǽð� �˸� �� �����ٰ� ���� �� Nó��? �ƴ� ���� X �����Ǹ� N ó��??

COMMENT ON COLUMN TB_NOTIFICATIONS.user_no IS 'ȸ�� ��ȣ';
COMMENT ON COLUMN TB_NOTIFICATIONS.category_no IS 'ī�װ��� ��ȣ (�̽�,ģ��,����,����ȫ��,������Ʈ,���Ͻ���)';
COMMENT ON COLUMN TB_NOTIFICATIONS.noti_content IS '�ǽð� �˸� ����';
COMMENT ON COLUMN TB_NOTIFICATIONS.ocu_time IS '�ǽð� �˸� �߻� �ð�';
COMMENT ON COLUMN TB_NOTIFICATIONS.post_no IS '�̽� ��ȣ';
COMMENT ON COLUMN TB_NOTIFICATIONS.STATUS IS '�ǽð� �˸� ���°�';

ALTER TABLE TB_NOTIFICATIONS
  ADD CONSTRAINT PK_USER_NO PRIMARY KEY (user_no);
  
  
 -- ��簪�ֱ� 
 INSERT 
	INTO 	TB_NOTIFICATIONS
			(
				user_no
				, category_no
				, noti_content
				, ocu_time
				, post_no
				, STATUS
			)
	VALUES
			(
				
				1
				, 2
				, 'XXX���� ģ�� ��û�� �߽��ϴ�'
				, SYSDATE
				, 2 -- �� ȸ���� ī�װ����� �ش�Ǵ� �̽��� ��� ��������? �÷��� �ִ°� �³�?
				, DEFAULT
			)
	;
	

 INSERT 
	INTO 	TB_NOTIFICATIONS
			(
				user_no
				, category_no
				, noti_content
				, ocu_time
				, post_no
				, STATUS
			)
	VALUES
			(
				
				2
				, 1
				, 'XXX���� ȸ������ @@@ ������Ʈ �̽��� ����߽��ϴ�'
				, '20230401'
				, 1
				, 'Y'
			)
	;
	
 INSERT 
	INTO 	TB_NOTIFICATIONS
			(
				user_no
				, category_no
				, noti_content
				, ocu_time
				, post_no
				, STATUS
			)
	VALUES
			(
				
				3
				, 5
				, '### ������Ʈ�� �����Ǿ����ϴ�.'
				, '20230403'
				, 1
				, 'N'
			)
	;
COMMIT;





