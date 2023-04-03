-----------------肢薦------------------
--羨紗政煽税 乞窮砺戚鷺 貢 薦鉦繕闇 肢薦
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--羨紗政煽税 乞窮 獣碇什 肢薦
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--羨紗政煽税 乞窮 坂 肢薦
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--羨紗政煽税 乞窮 闘軒暗 肢薦
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-- 砺戚鷺 持失

---------------------- 噺据 砺戚鷺 -------------------------
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

INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user01','pass01','酵尻層','切郊原什斗','email01@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user02','pass02','戚駁肯','DB税 含昔','email02@kh.co.kr',null,null,'O',SYSDATE,null,'Y');
INSERT INTO TB_MEMBER VALUES(seq_member.nextval,'user03','pass03','績旦薄','什覗元税瑛仙','email03@kh.co.kr',null,null,'O',SYSDATE,null,'Y');


COMMENT ON COLUMN TB_MEMBER.USER_NO IS '噺据腰硲';
COMMENT ON COLUMN TB_MEMBER.USER_ID IS '焼戚巨';
COMMENT ON COLUMN TB_MEMBER.USER_PWD IS '搾腔腰硲';
COMMENT ON COLUMN TB_MEMBER.USER_NAME IS '噺据 戚硯';
COMMENT ON COLUMN TB_MEMBER.USER_NICK IS '莞革績';
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '戚五析';
COMMENT ON COLUMN TB_MEMBER.PROFILE IS '覗稽琶爽社';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '失紺';
COMMENT ON COLUMN TB_MEMBER.SOCIAL IS '社屡 食採';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '亜脊析';
COMMENT ON COLUMN TB_MEMBER.TOKEN IS '塘笛';
COMMENT ON COLUMN TB_MEMBER.STATUS IS '纏盗食採';


---------------------- 敢什 砺戚鷺 -------------------------
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

insert into tb_news values(seq_news.nextval, 1,'神潅 馬欠 毘級陥','走馬旦拭辞 柵訓幻概澗汽 毘球革推',sysdate,sysdate,'Y','qwe','qwe');
insert into tb_news values(seq_news.nextval, 2,'壕壱覗陥','繊宿獣娃昔汽 訊 剛聖 公股惟 杯艦猿!!!',sysdate,sysdate,'Y','asdf','asdf');
insert into tb_news values(seq_news.nextval, 3,'焼艦 走馬旦拭辞 獣是岨 益幻 杯獣陥','薦獣娃拭 亀鐸馬壱 粛嬢食ばば',sysdate,sysdate,'Y','qwe','qwe');

comment on column tb_news.news_no is '敢什腰硲';
comment on column tb_news.user_no is '噺据腰硲';
comment on column tb_news.news_title is '薦鯉';
comment on column tb_news.news_content is '鎧遂';
comment on column tb_news.create_date is '持失析';
comment on column tb_news.update_date is '呪舛析';
comment on column tb_news.status is '雌殿';
comment on column tb_news.origin_name is '奄糎 督析誤';
comment on column tb_news.change_name is '痕井吉 督析誤';


---------------------- 敢什 奇越 -------------------------
create table tb_news_comments(
    news_no number references tb_news,
    comment_writer varchar2(50) not null,
    comment_content varchar2(2000) not null,
    comment_date date default sysdate,
    status char(3) default 'Y' check(status in('Y','N'))
);

insert into tb_news_comments values(1, 'user01','せせせせ',sysdate,'Y');
insert into tb_news_comments values(1, 'user02','せせせせ',sysdate,'Y');
insert into tb_news_comments values(1, 'user03','せせせせ',sysdate,'Y');

comment on column tb_news_comments.news_no is '敢什腰硲';
comment on column tb_news_comments.comment_writer is '拙失切 焼戚巨';
comment on column tb_news_comments.comment_content is '鎧遂';
comment on column tb_news_comments.comment_date is '拙失析';
comment on column tb_news_comments.status is '雌殿';

---------------------- 得据 -------------------------
create table tb_collaborator(
    repository_no number not null,
    user_no number references tb_member,
    part varchar2(10)
);

insert into tb_collaborator values(1, 1, '得舌');
insert into tb_collaborator values(1,2,'得据');
insert into tb_collaborator values(1,3,'得据');

comment on column tb_collaborator.repository_no is '傾督走塘軒 腰硲';
comment on column tb_collaborator.user_no is '噺据腰硲';
comment on column tb_collaborator.part is '蝕拝';


---------------------- 超鍵希 朝砺壱軒 -------------------------
CREATE TABLE TB_CALENDAR_CATEGORY(
   CATEGORY_NO NUMBER PRIMARY KEY,
   CATEGORY_NAME VARCHAR2(30)
);

COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NO IS '朝砺壱軒 腰硲';
COMMENT ON COLUMN TB_CALENDAR_CATEGORY.CATEGORY_NAME IS '朝砺壱軒 戚硯';

INSERT INTO TB_CALENDAR_CATEGORY VALUES(1,'穣巷');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(2,'鯵昔 析舛');
INSERT INTO TB_CALENDAR_CATEGORY VALUES(3,'社屡 析舛');

---------------------- 超鍵希 -------------------------

CREATE TABLE TB_CALENDAR(
   USER_NO NUMBER REFERENCES TB_MEMBER,
   SCHEDULE_TITLE VARCHAR2(100) NOT NULL,
   START_DATE DATE NOT NULL,
   END_DATE DATE NOT NULL,
   DATE_COLOR VARCHAR2(30),
   SCHEDULE_CONTENT VARCHAR2(1000),
   CATEGORY_NO NUMBER REFERENCES TB_CALENDAR_CATEGORY
);

COMMENT ON COLUMN TB_CALENDAR.USER_NO IS '噺据 腰硲';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_TITLE IS '析舛 薦鯉';
COMMENT ON COLUMN TB_CALENDAR.START_DATE IS '獣拙析';
COMMENT ON COLUMN TB_CALENDAR.END_DATE IS '原姶析';
COMMENT ON COLUMN TB_CALENDAR.DATE_COLOR IS '事雌';
COMMENT ON COLUMN TB_CALENDAR.SCHEDULE_CONTENT IS '析舛 鎧遂';
COMMENT ON COLUMN TB_CALENDAR.CATEGORY_NO IS '朝砺壱軒 腰硲';

INSERT INTO TB_CALENDAR VALUES(1,'覗稽詮闘 噺税',SYSDATE,'2023-04-04','察悪','5獣 NEXUS 噺税',1);
INSERT INTO TB_CALENDAR VALUES(2,'短社馬奄',SYSDATE,'2023-04-04','督櫛','3獣 増短社',2);
INSERT INTO TB_CALENDAR VALUES(3,'層硲 持析','2023-05-05','2023-05-05','段系','層硲税 持析',3);


---------------------- 辰特号 -------------------------
CREATE TABLE TB_CHAT_ROOM(
   ROOM_NO NUMBER PRIMARY KEY,
   NUMBER_PARTICIPANTS NUMBER NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   STATUS CHAR(3) DEFAULT 'Y' NOT NULL
);
COMMENT ON COLUMN TB_CHAT_ROOM.ROOM_NO IS '辰特号 腰硲';
COMMENT ON COLUMN TB_CHAT_ROOM.NUMBER_PARTICIPANTS IS '凧食昔据';
COMMENT ON COLUMN TB_CHAT_ROOM.CREATE_DATE IS '持失析切';
COMMENT ON COLUMN TB_CHAT_ROOM.STATUS IS '肢薦食採';

INSERT INTO TB_CHAT_ROOM VALUES(1,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(2,2,SYSDATE,'Y');
INSERT INTO TB_CHAT_ROOM VALUES(3,2,SYSDATE,'Y');

---------------------- 辰特号 噺据 -------------------------
CREATE TABLE TB_CHAT_USER(
   USER_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM 
);
COMMENT ON COLUMN TB_CHAT_USER.USER_NO IS '噺据 腰硲';
COMMENT ON COLUMN TB_CHAT_USER.ROOM_NO IS '辰特号 腰硲';

INSERT INTO TB_CHAT_USER VALUES(1,2);
INSERT INTO TB_CHAT_USER VALUES(2,1);
INSERT INTO TB_CHAT_USER VALUES(3,3);


---------------------- 辰特 -------------------------
CREATE TABLE TB_CHATTING(
   CHATTING_NO NUMBER PRIMARY KEY,
   ROOM_NO NUMBER NOT NULL REFERENCES TB_CHAT_ROOM,
   CHATTING_CONTENT VARCHAR2(3000),
   ORIGIN_NAME VARCHAR2(500),
   CHANGE_NAME VARCHAR2(500),
   CHAT_WRITER VARCHAR2(100) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN TB_CHATTING.CHATTING_NO IS '辰特 腰硲';
COMMENT ON COLUMN TB_CHATTING.ROOM_NO IS '辰特号 腰硲';
COMMENT ON COLUMN TB_CHATTING.CHATTING_CONTENT IS '五室走 鎧遂';
COMMENT ON COLUMN TB_CHATTING.ORIGIN_NAME IS '据沙 督析誤';
COMMENT ON COLUMN TB_CHATTING.CHANGE_NAME IS '郊駕 督析誤';
COMMENT ON COLUMN TB_CHATTING.CHAT_WRITER IS '拙失切';
COMMENT ON COLUMN TB_CHATTING.CREATE_DATE IS '拙失析切';


INSERT INTO TB_CHATTING VALUES(1,1,'ぞしぞし',NULL,NULL,'尻層',SYSDATE);
INSERT INTO TB_CHATTING VALUES(2,1,'せせせせ',NULL,NULL,'駁肯',SYSDATE);
INSERT INTO TB_CHATTING VALUES(3,2,'旦薄税 坪漁析走..',NULL,NULL,'旦薄',SYSDATE);

--------------------------------------------------
--------------     ISSUE 淫恵 	------------------	
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



COMMENT ON COLUMN TB_ISSUE.ISSUE_NO IS '戚輯腰硲(炎拭辞閤焼身)';
COMMENT ON COLUMN TB_ISSUE.LABEL IS '戚輯 虞婚';
COMMENT ON COLUMN TB_ISSUE.CREATE_DATE IS '戚輯 持失析';
COMMENT ON COLUMN TB_ISSUE.MODIFY_DATE IS '戚輯 呪舛析';
COMMENT ON COLUMN TB_ISSUE.CLOSE_DATE IS '戚輯 曽戟析';
COMMENT ON COLUMN TB_ISSUE.STATUS IS '戚輯 雌殿葵';
COMMENT ON COLUMN TB_ISSUE.REPOSITORY_ID IS '戚輯亜 紗廃 傾督走塘軒';
COMMENT ON COLUMN TB_ISSUE.MILESTONE_ID IS '戚輯亜 紗廃 原析什宕';
COMMENT ON COLUMN TB_ISSUE.ISSUE_TITLE IS '戚輯 薦鯉';
COMMENT ON COLUMN TB_ISSUE.ISSUE_CONTENT IS '戚輯 鎧遂';
COMMENT ON COLUMN TB_ISSUE.ISSUE_AUTHOR IS '戚輯 拙失切';
COMMENT ON COLUMN TB_ISSUE.ISSUE_ASSIGNEE IS '戚輯 拝雁 閤精 紫寓';
COMMENT ON COLUMN TB_ISSUE.PRIORITY IS '戚輯 酔識授是';

-- 獣碇什
CREATE SEQUENCE SEQ_ISSUE_NO NOCACHE;




ALTER TABLE TB_ISSUE
  ADD CONSTRAINT PK_ISSUE_NO PRIMARY KEY (ISSUE_NO);


ALTER TABLE TB_ISSUE
ADD CONSTRAINT FK_ISU_AUTHOR FOREIGN KEY(ISSUE_AUTHOR) REFERENCES TB_MEMBER (USER_NO);



-- 乞窮葵 隔奄 - 巨虹闘
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
				, '傾督走塘軒 ID 123'
				, '原析什宕ID 123'
				, '獄益 呪舛 推諺'
				, '嬢村姥煽村姥 呪舛背爽室推. 察軒推 覗稽詮闘 遭楳 災亜'
				, 1
				, '得据穿端' -- 得据穿端析凶澗 酔属 拝走
				, 1
			)
	;
				
				
				

		

-- NULL 皐壱 隔奄
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
				, '傾督走塘軒 ID 456'
				, '硝寓 奄管 姥薄'
				, '馬馬馬�K 設 背醤鎧醤走 章推'
				, 1 -- 噺据 幻窮 焼戚巨 隔嬢醤背唇
                , 1

			)
	;

	
-- 乞窮葵 隔奄 - 呪舛獄穿
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
				, '傾督走塘軒 ID 78910'
				, '原析什宕ID 456'
				, '戚輯 嬢形雀 美'
				, '美美 披披 窪聖廃陥 畠畠畠'
				, 3
				, 'user02' -- 得据穿端析凶澗 酔属 拝走
				, 2
			)
	;
	
	
	
--------------------------------------------------
-------------    ISSUE_REPLY 淫恵 	--------------
--------------------------------------------------

CREATE TABLE TB_ISU_REPLY (
	REPLY_NO	NUMBER	NOT NULL,
	REPLY_CONTENT	VARCHAR2(1000)	NOT NULL,
	REPLY_WRITER	NUMBER,
	CREATE_DATE 	DATE DEFAULT SYSDATE NOT NULL,
	STATUS	char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) ,
	REF_ISSUE_NO	NUMBER	NOT NULL
);

COMMENT ON COLUMN TB_ISU_REPLY.REPLY_NO IS '奇越 腰硲';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_CONTENT IS '奇越 鎧遂';
COMMENT ON COLUMN TB_ISU_REPLY.REPLY_WRITER IS '奇越 拙失切';
COMMENT ON COLUMN TB_ISU_REPLY.CREATE_DATE IS '奇越 拙失析';
COMMENT ON COLUMN TB_ISU_REPLY.STATUS IS '奇越 雌殿葵';
COMMENT ON COLUMN TB_ISU_REPLY.REF_ISSUE_NO IS '凧繕 戚輯 腰硲';

--獣碇什
CREATE SEQUENCE SEQ_ISU_REPLY_NO NOCACHE;



ALTER TABLE TB_ISU_REPLY
  ADD CONSTRAINT PK_REPLY_NO PRIMARY KEY (REPLY_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_ISSUENO FOREIGN KEY(REF_ISSUE_NO) REFERENCES TB_ISSUE (ISSUE_NO);


ALTER TABLE TB_ISU_REPLY
ADD CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(REPLY_WRITER) REFERENCES TB_MEMBER (USER_NO);


-- 乞窮葵 隔奄

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
				, '戚暗 馬奄夙嬢遂 眼雁 郊蚊爽室遂'
				, 1
				, DEFAULT
				, DEFAULT
				, 1
			)
	;


-- NULL 薦須 葵 隔奄


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
				, '戚惟 限蟹 粛嬢遂~'
				, 2
				, '20230314'
				, 2
			)
	;
	
	
-- 乞窮葵 隔奄 - 呪舛獄穿

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
				, '限焼唇?? 戚惟???'
				, 1
				, SYSDATE
				, 'N'
				, 1
			)
	;
	
-- 乞窮葵 隔奄 - 呪舛獄穿2

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
				, '砧腰属奇越 砺什闘掻脊艦��'
				, 1
				, SYSDATE
				, DEFAULT
				, 2
			)
	;
	



--------------------------------------------------
-------------    叔獣娃 硝顕 辞搾什 淫恵 	--------------
--------------------------------------------------	


CREATE TABLE TB_NOTIFICATIONS (
	user_no	number	NOT NULL,
	category_no	number	CHECK (category_no IN (1,2,3,4,5,6)),
	noti_content	varchar2(1000)	NOT NULL,
	ocu_time	date	NOT NULL,
	post_no 	number	NOT NULL,
	STATUS char(1)	DEFAULT 'Y'	CHECK (STATUS IN ('Y','N')) 
);

-- 叔獣娃 硝顕 曽 喚袈陥亜 脅檎 陥 N坦軒? 焼還 送羨 X 刊献闇幻 N 坦軒??

COMMENT ON COLUMN TB_NOTIFICATIONS.user_no IS '噺据 腰硲';
COMMENT ON COLUMN TB_NOTIFICATIONS.category_no IS '朝砺壱軒 腰硲 (戚輯,庁姥,敢什,鯵昔畠左,覗稽詮闘,原析什宕)';
COMMENT ON COLUMN TB_NOTIFICATIONS.noti_content IS '叔獣娃 硝顕 鎧遂';
COMMENT ON COLUMN TB_NOTIFICATIONS.ocu_time IS '叔獣娃 硝顕 降持 獣娃';
COMMENT ON COLUMN TB_NOTIFICATIONS.post_no IS '戚輯 腰硲';
COMMENT ON COLUMN TB_NOTIFICATIONS.STATUS IS '叔獣娃 硝顕 雌殿葵';

ALTER TABLE TB_NOTIFICATIONS
  ADD CONSTRAINT PK_USER_NO PRIMARY KEY (user_no);
  
  
 -- 乞窮葵隔奄 
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
				, 'XXX還戚 庁姥 重短聖 梅柔艦陥'
				, SYSDATE
				, 2 -- 益 噺据税 朝砺壱軒拭 背雁鞠澗 戚輯研 嬢胸惟 亜閃神走? 鎮軍拭 隔澗惟 限蟹?
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
				, 'XXX還戚 噺据還聖 @@@ 覗稽詮闘 戚輯拭 去系梅柔艦陥'
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
				, '### 覗稽詮闘拭 凧亜鞠醸柔艦陥.'
				, '20230403'
				, 1
				, 'N'
			)
	;
COMMIT;






