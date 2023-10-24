-- Memo > script.sql

create table tblMemo (
    seq number primary key,                 -- ��ȣ(PK)
    name varchar2(30) not null,             -- �̸�
    pw varchar2(30) not null,               -- �޸� ��ȣ
    memo varchar2(2000) not null,           -- �޸�
    regdate date default sysdate not null   -- ��¥
);

create sequence seqMemo;

-- �޸� ����
insert into tblMemo (seq, name, pw, memo, regdate)
    values (seqMemo.nextval, 'ȫ�浿', '1111', '�޸��Դϴ�.', default);

-- �޸� ���
select * from tblMemo order by seq desc;

-- �޸� �б�
select * from tblMemo where seq = 1;

-- �޸� ����
update tblMemo set memo = '���� ����' where seq = 1;

-- �޸� ����
delete from tblMemo where seq = 1;

commit;
