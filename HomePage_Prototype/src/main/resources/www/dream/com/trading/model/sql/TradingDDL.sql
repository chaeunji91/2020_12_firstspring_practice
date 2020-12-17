drop sequence traiding_seq;
drop table T_Traiding_Detail;
drop table T_Traiding;

create sequence traiding_seq;

--	id, buyer_id, trading_dateTime
create table T_Traiding (
	id           bigint primary key,  -- 레코드에 대한 유일 식별자. 이름. 중복 불허
	buyer_id     bigint,
	trading_dateTime timestamp,
	CONSTRAINT fk_traiding_party FOREIGN KEY(buyer_id) REFERENCES T_Party(id)
);

--traiding_id, product_id, amount
create table T_Traiding_Detail (
	traiding_id           bigint,  -- 레코드에 대한 유일 식별자. 이름. 중복 불허
	product_id   bigint,
	amount       int,
	primary key(traiding_id, product_id), 
	CONSTRAINT fk_traiding_product FOREIGN KEY(product_id) REFERENCES T_Product(id)
);

insert into T_Traiding(id, buyer_id, trading_dateTime)
    values(nextval('traiding_seq'), 3, now());

insert into T_Traiding_Detail(traiding_id, product_id, amount)
values(1, 1, 2);
insert into T_Traiding_Detail(traiding_id, product_id, amount)
values(1, 3, 3);

--영희가 홍길동이가 판매하는 오징어 땅콩을 장바구니에 두개 넣고 또한
        이순신이 판매하는 메론바를 장바구니에 3개 넣었고
        이를 구매했어요
--총 거래 금액의 10%는 우리 회사 것이거덩        

홍길동이가 얻는 금액은 5000
이순신이 얻는 금액은 1800
영희가 쓴 돈은 6800이어서 잔고는 93200 남아야 해여

--영희가 구매한 내역을 바탕으로 오징어 땅콩 가격과 수량을 곱하여 5000을 계산해 내시오

--홍길동이의 identifier는 ?
select id
  from T_Party p
 where p.login_id = 'hong';
 
--홍길동이가 판매하는 상품의 identifier?
select d.id
  from T_Party p, T_Product d
 where p.login_id = 'hong'
   and p.id = d.seller_id;
 
--영희가 막 구매한 내역을 바탕으로 판매자가 받을 금액은?
select m.id, d.amount * p.value 
  from T_Traiding_Detail d, T_Product p, T_Party m 
 where d.traiding_id = 1
   and d.product_id = p.id
   and p.seller_id = m.id;

--영희의 총 구매 금액은 얼마인가요?
select m.id, -sum(d.amount * p.value) 
  from T_Traiding_Detail d, T_Product p, T_Traiding t, T_Party m  
 where d.traiding_id = 1
   and d.product_id = p.id
   and d.traiding_id = t.id
   and t.buyer_id = m.id
 group by m.id;

--영희가 막 구매한 내역을 바탕으로 구매자에게서 차감할 총 구매 금액과
--각 판매자가 받을 금액을 한꺼번에 조회합니다.
select m.id, d.amount * p.value 
  from T_Traiding_Detail d, T_Product p, T_Party m 
 where d.traiding_id = 1
   and d.product_id = p.id
   and p.seller_id = m.id
 union all
select m.id, -sum(d.amount * p.value) 
  from T_Traiding_Detail d, T_Product p, T_Traiding t, T_Party m  
 where d.traiding_id = 1
   and d.product_id = p.id
   and d.traiding_id = t.id
   and t.buyer_id = m.id
 group by m.id;

--영희가 막 구매한 내역을 바탕으로 구매자에게서 차감할 총 구매 금액을 잔고에서 수정하고
--또한 각 판매자가 받을 금액을 잔고에서 올려주자
update T_Party AS m 
   set balance = balance + b.bal_delta
  from (
	select m.id mid, d.amount * p.value bal_delta 
	  from T_Traiding_Detail d, T_Product p, T_Party m 
	 where d.traiding_id = 1
	   and d.product_id = p.id
	   and p.seller_id = m.id
	 union all
	select m.id mid, -sum(d.amount * p.value) bal_delta
	  from T_Traiding_Detail d, T_Product p, T_Traiding t, T_Party m  
	 where d.traiding_id = 1
	   and d.product_id = p.id
	   and d.traiding_id = t.id
	   and t.buyer_id = m.id
	 group by m.id) AS b
 where b.mid = m.id;












create table T_Traiding_Detail (
	traiding_id           bigint,  -- 레코드에 대한 유일 식별자. 이름. 중복 불허
	product_id   bigint,

T_Traiding_Detail(traiding_id, product_id, amount)
values(1, 1, 2) 
 
T_Product (
	id             bigint primary key,  -- 레코드에 대한 유일 식별자. 이름. 중복 불허
	seller_id 
 
 
T_Party(id, name, birth_date, login_id, pwd)
 	values(nextval('party_id_seq'), '홍길동'


