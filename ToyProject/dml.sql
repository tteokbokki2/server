-- ToyProject > dml.sql

-- 회원

insert into tblUser (id, pw, name, email, lv, pic, intro, ing) values ( 'hong', '1111', '홍길동', 'hong@gmail.com', '1', default, '자바를 공부하는 학생입니다.', default);

-- insert into tblUser (id, pw, name, email, lv, pic, intro, ing) values ( 'test', '1111', '테스트', 'test@gmail.com', '1', default, '오라클을 공부하는 학생입니다.', default);

-- insert into tblUser (id, pw, name, email, lv, pic, intro, ing) values ( 'admin', '1111', '관리자', 'admin@gmail.com', '1', default, '관리자 입니다.', default);

drop table tblUser;

select * from tblUser;

commit;

update tblUser set ing = 'y';





insert into tblBoard (seq, subject, content, regdate, readcount, id) values (seqBoard.nextVal, '게시판입니다.', '내용입니다.', default, default, 'hong');

select * from tblBoard;

commit;

select * from vwBoard;

update tblBoard set regdate = regdate - 1 where seq <= 6;

commit;

