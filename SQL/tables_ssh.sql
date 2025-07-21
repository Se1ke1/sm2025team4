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