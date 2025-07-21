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
    cust_id varchar(20),
    cust_pwd varchar(20),
    cust_name varchar(10),
    cust_regdate datetime,
    cust_update datetime
);
CREATE TABLE cust_info(
	custinfo_no int,
    cust_id varchar(20),
    custinfo_adname varchar(10),
    custinfo_addr varchar(40),
    custinfo_phone varchar(20)
);
CREATE TABLE seller(
	seller_id varchar(20),
	seller_pwd varchar(20),
	seller_name varchar(10),
	seller_phone varchar(20),
	seller_addr varchar(40),
    seller_reliable int,
    seller_regdate datetime,
    seller_update datetime
);
CREATE TABLE product(
	product_id int,
	product_name varchar(30),
	product_price int,
	product_qtt int,
	product_regdate datetime,
	product_update datetime,
	cate_no int,
    seller_id varchar(20)
);

CREATE TABLE product_img_table(
     product_id int,
	 product_img varchar(30),
	 product_img_regdate datetime,
     product_img_update datetime
);


CREATE TABLE cate(
	cate_no int,
    cate_name varchar(30),
	upper_cate int
);


CREATE TABLE qna(
	qna_no int,
    product_id int,
    qua_upper_no int,
    order_id int,
    id varchar(20),
    qna_article text,
    Field datetime,
    Field2 datetime
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

);


CREATE TABLE order_info(

);


CREATE TABLE delivery_info(

);


CREATE TABLE review(

);

