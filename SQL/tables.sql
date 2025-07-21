DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS delivery_info;
DROP TABLE IF EXISTS order_info;
DROP TABLE IF EXISTS order_purchase;
DROP TABLE IF EXISTS order_paymnet_info;
DROP TABLE IF EXISTS order_status;
DROP TABLE IF EXISTS fav;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS qna;
DROP TABLE IF EXISTS cate;
DROP TABLE IF EXISTS product_img_table;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS seller;
DROP TABLE IF EXISTS cust_info;
DROP TABLE IF EXISTS cust;


CREATE TABLE cust(
    
);


CREATE TABLE cust_info(

);


CREATE TABLE seller(

);


CREATE TABLE product(

);


CREATE TABLE product_img_table(

);


CREATE TABLE cate(

);


CREATE TABLE qna(

);


CREATE TABLE cart(

);


CREATE TABLE fav(

);


CREATE TABLE order_status(

);


CREATE TABLE order_payment_info(

);


CREATE TABLE order_purchase(
	order_id int,
    cust_id varchar(20),
    payment_id int,
    order_placedate datetime default now(),
    status_id int,
    order_price int,
    custinfo_addr varchar(30)
);


CREATE TABLE order_info(
	order_id int,
    product_id int,
    order_prod_qtt int,
    order_prod_price int
);


CREATE TABLE delivery_info(
	delivery_id int,
    order_id int,
    delivery_name varchar(10),
    delivery_address varchar(30),
    delivery_phone varchar(20),
    delivery_ondate datetime,
    delivery_date datetime
);


CREATE TABLE review(
	review_no int,
    cust_id varchar(10),
    product_id int,
    review_article varchar(100),
    review_regdate datetime default now(),
    review_update datetime default now()
);

