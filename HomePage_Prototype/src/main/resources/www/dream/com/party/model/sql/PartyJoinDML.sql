--기본 데이터 만들기
select *		--15건이 나오는 마구 연결. 업무적 의미는 없죠
  from T_Party, T_Contact_Point;

--Full scan 전체 읽기 -> 성능에 있어 최악이 발생하는 원인은 Full scan되는 테이블이 여러개 되면
select *
  from T_Party p, T_Contact_Point c
 where p.id = c.id;

--Partial Range scan 원하는 해당 부분만 읽기 -> 성능이 좋아져요
select *
  from T_Party p, T_Contact_Point c
 where p.id = c.id
   and p.birth_date < '1900.01.01';

--연락처 정보를 기입하지 않았어도 Party 정보는 출력 되어야 합니다.
--Outer Join - 외부 조인
select *
  from T_Party p left outer join T_Contact_Point c on p.id = c.id
 where p.birth_date < '2000.01.01';
 








insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '홍길동', '1605.01.01', 'hong', 'hong');
insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '이순신', '1705.01.01', 'lee', 'lee');
insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '영희', '1960.01.01', 'young', 'young');
insert into T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '철수', '1950.10.05', 'chul', 'chul');

   -- 각자에 대한 연락처 정보 입력하기
--id, contact_point_type, contact_point
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(22, 'address', '조선 한양');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(23, 'address', '전라도 좌수영');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(23, 'email', 'lee@naver,com');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(24, 'address', '대한민국 국어');
insert into T_Contact_Point (id, contact_point_type, contact_point)
 	values(24, 'phone number', '010-2222-9999');

   
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
 	