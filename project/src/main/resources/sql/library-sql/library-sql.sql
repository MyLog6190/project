select * from exercise_libraries


create table exercise_libraries(
	elid number primary key,
	elname varchar2(50) not null,
	cid number not null,
	elimg varchar2(100) not null,
	eldetail varchar2(2000) not null
)

insert into exercise_libraries(
	elid, elname, cid, elimg, eldetail
	)
	values (lib_seq.nextVal, '스쿼트4', 1, '/images/libimages/leg/1.png', '운동 설명....')



create sequence lib_seq start with 1 INCREMENT BY 1;



select * from user_sequences

 ELID                                      NOT NULL NUMBER
 ELNAME                                    NOT NULL VARCHAR2(50)
 CID                                       NOT NULL NUMBER
 ELIMG                                              VARCHAR2(100)
 ELDETAIL                                           VARCHAR2(2000)

 
 alter table exercise_libraries modify( eldetail varchar2(2000)) 
 
 drop table exercise_libraries
 
 drop sequence lib_seq
 
 
 
 