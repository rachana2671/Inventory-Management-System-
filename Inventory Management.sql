use project;
create table brands(
bid varchar(5),
bname varchar(20),
primary key (bid)
);

create table inv_user(
user_id varchar(20),
 name varchar(20),
 password varchar(20),
 last_login timestamp,
 user_type varchar(10) ,
 primary key (user_id));

 create table categories(
 cid varchar(5),
 category_name varchar(20),
 primary key(cid));
 


create table stores(
 sid varchar(5),
 sname varchar(20),
 address varchar(20),
 mobno varchar(10),
 primary key(sid));


create table product(
pid varchar(5),
 cid varchar(5)  references categories(cid) ,
 bid varchar(5)  references brands(bid) ,
 sid varchar(5) references stores(sid),
 pname varchar(20),
 p_stock varchar(5),
 added_date date, 
 price varchar(5),
 primary key (pid));

create table provides(
 bid varchar(5)references brands(bid),
 sid varchar(5)references stores(sid),
 discount varchar(5));

 create table customer_cart(
cust_id varchar(5) primary key,
name varchar(20),
 mobno varchar(10) );
 
create table select_product(
cust_id varchar(5) references customer_cart(cust_id),
pid varchar(5)references product(pid),
quantity varchar(4) );

create table transactions(
id varchar(5) primary key,
total_amount bigint,
 paid bigint,
 due bigint,
 gst varchar(10),
 discount varchar(5),
 payment_method varchar(50),
 cust_id varchar(5) references customer_cart(cust_id) );

create table invoice(
 item_no varchar(5),
 product_name varchar(20),
 quantity varchar(5),
 net_price varchar(5),
 transaction_id varchar(5)references transaction(id) );

 
 
 
/*insertion*/ 
 insert into brands(bid,bname)
 values(1,'apple'),(2,'Samsung'),(3,'Nike'),(4,'Fortune'),(5,'Adiddas'),(6,'PUMA'),
 (7,'oneplus'),(8,'figaro'),(9,'MTR'),(10,'GRB'),
 (11,'Levis'),(12,'only');
select * from brands;



/*INSERT INTO INV_USER:*/
insert into inv_user (user_id,name,password,last_login,user_type)
values('prashant@gmail.com','Prashant','0011tr','2022-10-29 10:20','Accountant'),
('harsh@gmail.com','Harsh Khanelwal','1111re','2022-10-30 10:20','Manager'),
('vikas66@gmail.com','vikas p','6626oiu','2022-10-17 11:20','Manager'),
('ram872@gmail.com','Ram sharma','6574trh','2022-10-21 10:20','Manager');
select * from inv_user;



/*insertion into categories*/
insert into categories(cid,category_name)
values(1,'gadgets'),(2,'Clothing'),(3,'Grocey'),(4,'shoes');
select * from categories;



/*insertion into stores*/
insert into stores (sid,sname,address,mobno)
values(1,'RR super mart','chennai',8888555541),
(2,'SV Super mart','Haryana',7777555541),
(3,'Raj Super mart','Bengaluru',9876543620),
(4,'vishnu Super mart','Hyderabad',7684532190),
(5,'CC super mart','Hubbli',6785436578),
(6,'Iyer super mart','Managaluru',9345654356),
(7,'sonu super mart','bengaluru',7865534256),
(8,'vishal super mart','bengaluru',7659876543),
(9,'v v super mart','bengaluru',9536120009),
(10,'slv super mart','bengaluru',9000870098),
(11,'gg super mart','bengaluru',9777789098),
(12,'veena super mart','bengaluru',8999908890),
(13,'V  super mart','bengaluru',7778889666),
(14,'ss super mart','bengaluru',8888765789),
(15,'qq super mart','bengaluru',7777864445),
(16,'dev super mart','bengaluru',9999876756),
(17,'R V super mart','bengaluru',6666567678),
(18,'jash super mart','bengaluru',6767898009),
(19,'janani super mart','bengaluru',9000008789),
(20,'J J super mart','Bengaluru',8888877690),
(21,'J K super mart','bengaluru',7778889090),
(22,'K K suoer mart','bengaluru',6767898732),
(23,'MM super mart','bengaluru',8888973421),
(24,'N V supeer mart','bengaluru',7767354267);
select * from stores;

/*insertion into products*/
insert into product(pid,cid,bid,sid,pname,p_stock,added_date,price)
values(1,1,1,1,'iphone',4,'2018-10-30',65000),(2,1,1,1,'Airpods',3,'2018-10-27',12000),
(3,1,1,1,'Smart Watch',3,'2018-10-27',25000),
(4,4,3,2,'Air Max',6,'2018-10-20',35000),(5,3,4,3,'REFINED OIL',6,'2018-10-25',1200),
(6,3,9,3,'sambar powder',100,'2022-10-21',10000),
(7,3,10,3,'gulab jamoon mix',50,'2022-09-1',5000),(8,4,5,6,'adiddas_sneakers',20,'2022-11-1','40000'),
(9,2,11,1,'Regular fit jeans',20,'2022-10-22',50000); 
select * from product;

/*insertion into provides*/
 insert into provides(bid,sid,discount)
 values(1,1,'10%'),(2,2,'10%'),(3,1,'20%'),(4,3,'5%'),(5,4,'15%'),(6,6,'10%'),(7,2,'10%'),(8,3,'5%'),(9,5,'10%'),
 (7,2,'5%');
select * from provides;



/*insertion into customer cart*/
insert into customer_cart (cust_id,name,mobno)
values(1,'Ram',7896547534),(2,'Shyam',7777777777),(3,'Mohan',7777777775),(4,'Mohan',7567777775),(5,'Raghav',9756457689),
(6,'veena',8764534567),(7,'sneha',9875232323);
select * from customer_cart;


insert into select_product (cust_id,pid,quantity)
values(1,3,1),(2,3,3),(3,2,1),(2,6,2),(1,7,3),(7,5,3),(6,1,4),(5,9,3),
(2,3,1),(2,4,3),(3,1,3),(2,6,3),(7,7,3),(7,4,3),(2,1,3),(5,2,3);
select * from select_product;



 insert into transactions (id,total_amount,paid,due,gst,discount,payment_method,cust_id)
 values(1,57000,47000,1000,570,'5%','cash',1),(2,5700,5700,0,570,0,'UPI',2),
(3,19000,17000,2000,190,'5%','cash',3),(4,5700,5700,0,570,0,'UPI',4),
(5,145000,100000,40500,4500,'10%','debit/credit card',6),(6,2000,1800,0,200,'10%','credit/debit card',1);
select * from transactions;


/* Nested queries */
/*display all the product names from produts under a particular category*/
select pname 
from product
where cid in (select cid 
from product
where cid=1);


/*aggregate queries*/
/*count the number of products who's stock is >3*/
select count(pid)
from product
where p_stock>3;

select count(id),payment_method
from transactions
group by payment_method
having sum(due) >0;


/*right outer join*/
SELECT  product.pid,stores.sname
FROM product
RIGHT JOIN stores ON product.sid=stores.sid
ORDER BY product.pid;



/*indexing*/
SELECT  product.*,select_product.*
FROM product
JOIN select_product ON product.pid=select_product.pid
where select_product.quantity=3;


create index inx_sel on select_product(quantity);



/*triggers:*/
CREATE table product_log(
pid int,
pname varchar(25),
p_stock bigint,
modified_time timestamp
);


/*INSERT trigger*/
insert into product(pid,cid,bid,sid,pname,p_stock,added_date,price)
values(12,2,11,4,'skin fit jeans',5,'2018-10-30',12500);
drop trigger product_INSERT;
delimiter //
CREATE TRIGGER product_INSERT before insert on product
for each row
begin
 insert into product_log values(new.pid,new.pname,new.p_stock,now());
 end;//
 delimiter ;
 
select * from product_log;

/*update trigger*/
UPDATE product
SET p_stock = 5
WHERE pid = 1;
drop trigger product_UPDATE;
delimiter //
CREATE TRIGGER product_UPDATE before UPDATE on product
for each row
begin
 insert into product_log values(new.pid,new.pname,new.p_stock,now());
end;//
delimiter ;


