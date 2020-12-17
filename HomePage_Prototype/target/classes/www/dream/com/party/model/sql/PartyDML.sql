--기본 데이터 만들기
insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '홍길동', '1605.01.01', 'hong', 'hong');			--1
insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '이순신', '1705.01.01', 'lee', 'lee');			--2
insert into T_Party(id, name, birth_date, login_id, pwd, balance)
 	values(nextval('party_id_seq'), '영희', '1960.01.01', 'young', 'young', 100000);	--3

insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '철수', '1950.10.05', 'chul', 'chul');

   -- 각자에 대한 연락처 정보 입력하기
--id, contact_point_type, contact_point
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(1, 'address', '조선 한양');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(2, 'address', '전라도 좌수영');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(2, 'email', 'lee@naver,com');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(3, 'address', '대한민국 국어');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(3, 'phone number', '010-2222-9999');

--쓰레기성 data 양산하기
insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '철수', '1950.10.05', 'chul', 'chul');

insert into T_Party
select nextval('party_id_seq'), name, birth_date, login_id, pwd, balance
  from T_Party
 where name = '철수';
 
--각종 조회하기
select *
  from T_Party
 where birth_date < '1700.01.01';

select *
  from T_Party
 where birth_date < '1900.01.01'
   and id < 500;

select *
  from T_Party
 where birth_date < '1900.01.01'
    or name like '%희%';

select id, name
  from T_Party
 where birth_date < '1900.01.01'
    or name like '%희%';

select *
  from T_Party
 where id in (22, 24);

--집계 정보, rolling, group by
--생일을 기준으로 1900년 이전 및 이후 탄생자의 잔고 총계
-- 양수면 0 로 조회, 음수면 1으로 조회할거야. 오래된 사람인가요
select case when birth_date <= '1900.01.01' then 1
            else 0
       end as is_old
  from T_Party;
  
select case when birth_date <= '1900.01.01' then 1
            else 0
       end as is_old, balance
  from T_Party;

select is_old, sum(balance) tot
from (select case when birth_date <= '1900.01.01' then 1
            else 0
       end as is_old, balance
  from T_Party) X
 group by is_old;

-- 정보 변경하기
update T_Party
   set balance = balance + 100000
 where id = 22;
 	
--정보 삭제하기
insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '철쑥', '1950.10.05', 'chul', 'chul');

delete 
  from T_Party
 where name like '%쑥%';
  