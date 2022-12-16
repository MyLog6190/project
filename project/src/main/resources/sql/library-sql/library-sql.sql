select * from exercise_libraries order by elid


CREATE TABLE bookmark(
	ID
	E_NO
	
)


create table exercise_libraries(
	ID
	E_NO number primary key,
	E_NAME varchar2(50) not null,
	C_NO number not null,
	C_NAME varchar2(50) not null,
	E_IMAGE varchar2(100) not null,
	E_CONTENT varchar2(2000) not null,
)

delete from EXERCISE_LIBRARIES where elid > 0

update EXERCISE_LIBRARIES set cid = 2 where cname='chest'

insert into exercise_libraries(
	E_NO, elname, cid, cname, elimg, eldetail
	)
	values ((select nvl(max(elid),0)+1 from exercise_libraries),
		'바벨 백스쿼트', 2, 'leg', '/images/libimages/leg/1.png', '운동 설명....')

insert into exercise_libraries(
	elid, elname, cid, cname, elimg, eldetail
	)
	values ((select nvl(max(elid),0)+1 from exercise_libraries),
		'인플라인 덤벨 벤치프레스', 1, 'chest', '/images/libimages/chest/1.png', '운동 설명....')

create sequence lib_seq start with 1 INCREMENT BY 1;

update exercise_libraries set bookmark = 1 where elid = 8

 Name                                      Null?    Type
 ----------------------------------------- -------- --------------------
 ELID                                      NOT NULL NUMBER
 ELNAME                                    NOT NULL VARCHAR2(50)
 CID                                       NOT NULL NUMBER
 ELIMG                                     NOT NULL VARCHAR2(100)
 ELDETAIL                                  NOT NULL VARCHAR2(2000)
 CNAME                                     NOT NULL VARCHAR2(50)
 BOOKMARKED

 
 alter table exercise_libraries add (bookmark number(1) default 0) 
 
 drop table exercise_libraries
 
 drop sequence lib_seq
 
 
 
 