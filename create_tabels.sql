create type status_type as enum ('ORDERED', 'OPEN');

create extension if not exists "uuid-ossp";

create table carts(
	id uuid not null default uuid_generate_v4() primary key,
	user_id uuid not null default uuid_generate_v4(),
	created_at date not null,
	updated_at date not null,
	status status_type
);

create table cart_items(
	cart_id uuid not null references carts(id),
	product_id uuid not null default uuid_generate_v4(),
	count integer
);

insert into carts (created_at, updated_at, status)
    values ('2023-05-21', '2023-05-22', 'ORDERED')

insert into cart_items(cart_id, count)
    values ('3a097c41-b004-4fd9-8d22-85a83f2a606a', 3)

select * from carts;

select * from cart_items;
