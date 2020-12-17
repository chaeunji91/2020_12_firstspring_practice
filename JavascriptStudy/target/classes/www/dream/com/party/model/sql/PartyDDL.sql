drop sequence party_id_seq;
drop table T_Contact_Point_Type;
drop table T_Contact_Point;
drop view V_BAL_ONLY;
drop table T_Party;

create sequence party_id_seq;

--	id, name, birth_date, login_id, pwd, balance
create table T_Party (
	id           bigint primary key,  -- 레코드에 대한 유일 식별자. 이름. 중복 불허
	name         character varying(500),
	birth_date   date,
	login_id     character varying(10),
	pwd          character varying(500),
	balance bigint default 0
);
--alter table T_Party add column balance bigint default 0;
create index idx_party_login_id on T_Party(login_id);

--Party에 대한 연락처 정보
create table T_Contact_Point_Type (
	contact_point_type character varying(50) primary key,
	description character varying(1000)
);
insert into T_Contact_Point_Type values('address', '주소');
insert into T_Contact_Point_Type values('phone number', '전화번호');
insert into T_Contact_Point_Type values('email', '이메일번호');


--id, contact_point_type, contact_point
create table T_Contact_Point (
	id           bigint,
	contact_point_type character varying(50),
	contact_point character varying(100),
	primary key(id, contact_point_type)
);

create view V_BAL_ONLY as
select id, balance
  from T_Party;
  
select * 
  from V_BAL_ONLY;  