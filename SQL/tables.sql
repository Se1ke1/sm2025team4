DROP TABLE IF EXISTS review_img;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS delivery_info;
DROP TABLE IF EXISTS order_info;
DROP TABLE IF EXISTS order_purchase;
DROP TABLE IF EXISTS order_payment_info;
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
ALTER TABLE cust ADD CONSTRAINT PRIMARY KEY (cust_id);
ALTER TABLE cust ALTER cust_regdate SET DEFAULT (sysdate());
ALTER TABLE cust ALTER cust_update SET DEFAULT (sysdate());

CREATE TABLE cust_info(
    custinfo_no int,
    cust_id varchar(20),
    custinfo_name varchar(10),
    custinfo_addr varchar(40),
    custinfo_phone varchar(20),
    custinfo_regdate DATETIME,
    custinfo_update DATETIME
);
ALTER TABLE cust_info ADD CONSTRAINT PRIMARY KEY(custinfo_no);
ALTER TABLE cust_info MODIFY custinfo_no INT AUTO_INCREMENT;
ALTER TABLE cust_info ALTER custinfo_regdate SET DEFAULT (sysdate());
ALTER TABLE cust_info ALTER custinfo_update SET DEFAULT (sysdate());

CREATE TABLE seller(
    seller_id varchar(20),
	seller_pwd varchar(40),
	seller_name varchar(10),
    seller_address varchar(40),
	seller_phone varchar(20),
    seller_regdate datetime,
    seller_update datetime
);
ALTER TABLE seller ADD CONSTRAINT PRIMARY KEY (seller_id);
ALTER TABLE seller ALTER seller_regdate SET DEFAULT (sysdate());
ALTER TABLE seller ALTER seller_update SET DEFAULT (sysdate());

CREATE TABLE product(
  product_id int,
  product_name varchar(30),
  product_img_main VARCHAR(30),
  product_price int,
  product_qtt int,
  product_regdate datetime,
  product_update datetime,
  cate_no int,
  seller_id varchar(20)
);
ALTER TABLE product ADD CONSTRAINT PRIMARY KEY (product_id);
ALTER TABLE product MODIFY product_id INT AUTO_INCREMENT;
ALTER TABLE product ALTER product_regdate SET DEFAULT (sysdate());
ALTER TABLE product ALTER product_update SET DEFAULT (sysdate());

CREATE TABLE product_img_table(
  product_img_id int,
  product_id int,
  product_img varchar(30),
  product_img_regdate datetime,
  product_img_update datetime
);
ALTER TABLE product_img_table ADD CONSTRAINT PRIMARY KEY (product_img_id);
ALTER TABLE product_img_table MODIFY product_img_id INT AUTO_INCREMENT;
ALTER TABLE product_img_table ALTER product_img_regdate SET DEFAULT (sysdate());
ALTER TABLE product_img_table ALTER product_img_update SET DEFAULT (sysdate());

CREATE TABLE cate(
	cate_no int,
  cate_name varchar(30),
	upper_cate int
);
ALTER TABLE cate ADD CONSTRAINT PRIMARY KEY (cate_no);

CREATE TABLE qna(
	qna_no int,
  product_id int,
  qna_upper_no int,
  order_id int,
  cust_id varchar(20),
  qna_article text,
  qna_regdate datetime,
  qna_update datetime
);
ALTER TABLE qna ADD CONSTRAINT PRIMARY KEY (qna_no);
ALTER TABLE qna MODIFY qna_no INT AUTO_INCREMENT;
ALTER TABLE qna ALTER qna_regdate SET DEFAULT (sysdate());
ALTER TABLE qna ALTER qna_update SET DEFAULT (sysdate());

CREATE TABLE cart(
    cart_id INT,
    cust_id VARCHAR(20),
    product_id INT,
    cart_qtt INT,
    cart_regdate DATETIME,
    cart_update DATETIME
);
ALTER TABLE cart ADD CONSTRAINT PRIMARY KEY (cart_id);
ALTER TABLE cart MODIFY cart_id INT AUTO_INCREMENT;
ALTER TABLE cart ADD CONSTRAINT UNIQUE (cust_id, product_id);
ALTER TABLE cart ALTER cart_regdate SET DEFAULT (sysdate());
ALTER TABLE cart ALTER cart_update SET DEFAULT (sysdate());

CREATE TABLE fav(
    fav_id INT,
    cust_id VARCHAR(20),
    product_id INT,
    fav_update DATETIME
);
ALTER TABLE fav ADD CONSTRAINT PRIMARY KEY (fav_id);
ALTER TABLE fav MODIFY fav_id INT AUTO_INCREMENT;
ALTER TABLE fav ALTER fav_update SET DEFAULT (sysdate());

CREATE TABLE order_status(
    status_id INT,
    status_info VARCHAR(30),
    status_regdate DATETIME,
    status_update DATETIME
);
ALTER TABLE order_status ADD CONSTRAINT PRIMARY KEY (status_id);
ALTER TABLE order_status ALTER status_regdate SET DEFAULT (sysdate());
ALTER TABLE order_status ALTER status_update SET DEFAULT (sysdate());


CREATE TABLE order_payment_info(
    payment_id INT,
    status_id INT,
    payment_price INT,
    payment_fullfil INT,
    payment_done_date DATETIME
);
ALTER TABLE order_payment_info ADD CONSTRAINT PRIMARY KEY (payment_id);
ALTER TABLE order_payment_info MODIFY payment_id INT AUTO_INCREMENT;
ALTER TABLE order_payment_info ALTER payment_done_date SET DEFAULT (sysdate());

CREATE TABLE reliable_table (
    grade_reliable INT,
    grade_low FLOAT,
    grade_hight FLOAT,
    grade_name VARCHAR(20),
    grade_regdate DATETIME,
    grade_update DATETIME
);
ALTER TABLE reliable_table ADD CONSTRAINT PRIMARY KEY (grade_reliable);
ALTER TABLE reliable_table ALTER grade_regdate SET DEFAULT (sysdate());
ALTER TABLE reliable_table ALTER grade_update SET DEFAULT (sysdate());


CREATE TABLE order_purchase (
  order_id int,
  cust_id varchar(20),
  payment_id int,
  order_placedate datetime default now(),
  status_id int,
  order_price int,
  delivery_address varchar(40)
);
ALTER TABLE order_purchase ADD CONSTRAINT PRIMARY KEY (order_id);
ALTER TABLE order_purchase MODIFY order_id INT AUTO_INCREMENT;
ALTER TABLE order_purchase ALTER order_placedate SET DEFAULT (sysdate());

CREATE TABLE order_info(
  order_info_id INT,
	order_id int,
  product_id int,
  order_prod_qtt int,
  order_prod_price int
);
ALTER TABLE order_info ADD CONSTRAINT PRIMARY KEY (order_info_id);
ALTER TABLE order_info MODIFY order_info_id INT AUTO_INCREMENT;

CREATE TABLE delivery_info(
  delivery_id int,
  order_id int,
  delivery_name varchar(10),
  delivery_address varchar(40),
  delivery_phone varchar(20),
  delivery_ondate datetime,
  delivery_date datetime
);
ALTER TABLE delivery_info ADD CONSTRAINT PRIMARY KEY (delivery_id);
ALTER TABLE delivery_info MODIFY delivery_id INT AUTO_INCREMENT;
ALTER TABLE delivery_info ALTER delivery_ondate SET DEFAULT (sysdate());
ALTER TABLE delivery_info ALTER delivery_date SET DEFAULT (sysdate());

CREATE TABLE review(
  review_no int,
  cust_id varchar(20),
  product_id int,
  review_article TEXT,
  review_score FLOAT,
  review_regdate datetime default now(),
  review_update datetime default now()
);
ALTER TABLE review ADD CONSTRAINT PRIMARY KEY (review_no);
ALTER TABLE review MODIFY review_no INT AUTO_INCREMENT;
ALTER TABLE review ALTER review_regdate SET DEFAULT (sysdate());
ALTER TABLE review ALTER review_update SET DEFAULT (sysdate());

CREATE TABLE review_img (
    review_img_id INT,
    review_no INT,
    review_img VARCHAR(30),
    review_img_regdate DATETIME,
    review_img_update DATETIME
);
ALTER TABLE review_img ADD CONSTRAINT PRIMARY KEY (review_img_id);
ALTER TABLE review_img MODIFY review_img_id INT AUTO_INCREMENT;
ALTER TABLE review_img ALTER review_img_regdate SET DEFAULT (sysdate());
ALTER TABLE review_img ALTER review_img_update SET DEFAULT (sysdate());