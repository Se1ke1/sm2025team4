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
DROP TABLE IF EXISTS reliable_table;


CREATE TABLE cust(
    cust_id varchar(20),
    cust_pwd varchar(40),
    cust_name varchar(10),
    cust_regdate datetime,
    cust_update datetime
);
CREATE TABLE cust_info(
    custinfo_no int,
    cust_id varchar(20),
    custinfo_name varchar(10),
    custinfo_addr varchar(40),
    custinfo_phone varchar(20)
);
CREATE TABLE seller(
    seller_id varchar(20),
	seller_pwd varchar(40),
	seller_name varchar(10),
	seller_phone varchar(20),
	seller_addr varchar(40),
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
  qna_regdate datetime,
  qna_update datetime
);


CREATE TABLE cart(
    cart_id INT,
    cust_id VARCHAR(20),
    product_id INT,
    cart_qtt INT,
    cart_regdate DATETIME,
    cart_update DATETIME
);


CREATE TABLE fav(
    fav_id INT,
    cust_id VARCHAR(20),
    product_id INT,
    fav_update DATETIME
);


CREATE TABLE order_status(
    status_id INT,
    status_info VARCHAR(30),
    status_regdate DATETIME,
    status_update DATETIME
);


CREATE TABLE order_payment_info(
    payment_id INT,
    status_id INT,
    payment_price INT,
    payment_fullfil INT,
    payment_done_date DATETIME
);


CREATE TABLE reliable_table (
    grade_reliable INT,
    grade_low FLOAT,
    grade_hight FLOAT,
    grade_name VARCHAR(20),
    grade_regdate DATETIME,
    grade_update DATETIME
);


CREATE TABLE order_purchase (
  order_id int,
  cust_id varchar(20),
  payment_id int,
  order_placedate datetime default now(),
  status_id int,
  order_price int,
  custinfo_addr varchar(40)
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
  delivery_address varchar(40),
  delivery_phone varchar(20),
  delivery_ondate datetime,
  delivery_date datetime
);


CREATE TABLE review(
	review_no int,
  cust_id varchar(20),
  product_id int,
  review_article TEXT,
  review_score FLOAT,
  review_regdate datetime default now(),
  review_update datetime default now()
);

