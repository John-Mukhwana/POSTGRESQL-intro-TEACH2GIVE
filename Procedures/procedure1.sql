--create table

create table accounts (
    id int generated by default as identity,
    name varchar(100) not null,
    balance dec(15, 2) not null,
    primary key(id)
);

insert into accounts(name, balance)
values('Raju', 10000);

insert into accounts(name, balance)
values('Nikhil', 10000);

-- create a procedure
CREATE OR REPLACE PROCEDURE transfers(
    sender int,
    receiver int,
    amount dec
)
language plpgsql
AS $$
BEGIN
---subtracting the amount from sender account
update accounts
set balance =balance-amount
where id = sender;

--adding amount to receiver account
update accounts
set balance= balance + amount
where id = receiver;

commit;
END; $$;

Call transfers(1, 2, 2000);
SELECT * FROM accounts;