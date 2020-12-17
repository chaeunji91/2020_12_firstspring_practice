drop sequence product_id_seq;
drop table T_Product;

create sequence product_id_seq;

--	id, name, value
create table T_Product (
	id             bigint primary key,  -- 레코드에 대한 유일 식별자. 이름. 중복 불허
	seller_id      bigint,
	name           character varying(500),
	value          bigint,
	CONSTRAINT fk_party FOREIGN KEY(seller_id) REFERENCES T_Party (id)
);

insert into T_Product values(nextval('product_id_seq'), 1, '오징어 땅콩', 2500);	--1, 홍길동
insert into T_Product values(nextval('product_id_seq'), 2, '메가톤바', 500);	--2, 이순신
insert into T_Product values(nextval('product_id_seq'), 2, '메론바', 600);	--3, 이순신
