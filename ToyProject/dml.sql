-- ToyProject > dml.sql

-- ȸ��

insert into tblUser (id, pw, name, email, lv, pic, intro, ing) values ( 'hong', '1111', 'ȫ�浿', 'hong@gmail.com', '1', default, '�ڹٸ� �����ϴ� �л��Դϴ�.', default);

-- insert into tblUser (id, pw, name, email, lv, pic, intro, ing) values ( 'test', '1111', '�׽�Ʈ', 'test@gmail.com', '1', default, '����Ŭ�� �����ϴ� �л��Դϴ�.', default);

-- insert into tblUser (id, pw, name, email, lv, pic, intro, ing) values ( 'admin', '1111', '������', 'admin@gmail.com', '1', default, '������ �Դϴ�.', default);

drop table tblUser;

select * from tblUser;

commit;

update tblUser set ing = 'y';

select * from vwBoard; --��Ϻ���

select * from vwBoard where subject like '%�Խ���%'; --��Ϻ���




insert into tblBoard (seq, subject, content, regdate, readcount, id) values (seqBoard.nextVal, '�Խ����Դϴ�.', '�����Դϴ�.', default, default, 'hong');

select * from tblBoard;

commit;

select * from vwBoard;

update tblBoard set regdate = regdate - 1 where seq <= 6;

commit;

update tblUser set lv = 2 where id = 'admin';

select * from (select a.*, rownum as rnum from vwBoard a) where rnum between 1 and 10;

