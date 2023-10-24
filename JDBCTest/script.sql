-- script.sql

-- hr

select * from tblAddress;

drop table tblAddress;

create table tblAddress (
    seq number primary key,
    name varchar2(30) not null,
    age number not null,
    gender char(1) not null,
    address varchar2(300) not null,
    regdate date default sysdate not null
);

create sequence seqAddress;

insert into tblAddress (seq, name, age, gender, address, regdate)
    values (seqAddress.nextval, 'ȫ�浿', 20, 'm', '����� ������ ���ﵿ', default);
    
commit;

-- Ex05.java

-- m1();
create or replace procedure procM1
is
begin
    update tblAddress set age = age + 1;
end procM1;

-- m2(); ���ڰ�(O), ��ȯ��(X)
create or replace procedure procM2(
    pname tblAddress.name%type,
    page tblAddress.age%type,
    pgender tblAddress.gender%type,
    paddress tblAddress.address%type
)
is
begin
    insert into tblAddress values (seqAddress.nextVal, pname, page, pgender, paddress, default);
end procM2;

-- m3(); ���ڰ�(X), ��ȯ��(O)
create or replace procedure procM3 (
    pcnt out number
)
is
begin
    select count(*)into pcnt from tblAddress;
end procM3;

-- m4(); ���ڰ�(X), ��ȯ��(O, ������)
create or replace procedure procM4 (
    pname out varchar2,
    page out number,
    paddress out varchar2
)
is
begin
    select name, age, address into pname, page, paddress from tblAddress where rownum = 1;
end procM4;

-- m5(); �ּҷϿ� �ִ� ��� ��, ��
create or replace procedure procM5 (
    pcursor out sys_refcursor
)
is
begin
    open pcursor
    for
        select * from tblAddress;
end procM5;

