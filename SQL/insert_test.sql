-- cust
INSERT INTO cust VALUES ('id01', 'pwd01', '이말숙', NOW(), NOW());
INSERT INTO cust VALUES ('id02', 'pwd02', '김말숙', NOW(), NOW());
INSERT INTO cust VALUES ('id03', 'pwd03', '황말숙', NOW(), NOW());
INSERT INTO cust VALUES ('admin', 'pwd01', '관리자', NOW(), NOW());

INSERT INTO cust (cust_id,cust_pwd,cust_name) VALUES ('seller01', 'spwd01', '판매자A');
INSERT INTO cust (cust_id,cust_pwd,cust_name) VALUES ('seller02', 'spwd02', '판매자A');
INSERT INTO cust (cust_id,cust_pwd,cust_name) VALUES ('seller03', 'spwd03', '판매자A');

-- cust_info
INSERT INTO cust_info VALUES (0, 'id01', '이말숙', '서울시 강남구', '010-1234-5678', NOW(), NOW());
INSERT INTO cust_info VALUES (0, 'id02', '김말숙', '부산시 해운대구', '010-2345-6789', NOW(), NOW());
INSERT INTO cust_info VALUES (0, 'id03', '황말숙', '인천시 남동구', '010-3456-7890', NOW(), NOW());

-- seller
INSERT INTO seller (seller_id, seller_address, seller_phone) VALUES ('seller01', '서울시 마포구', '010-1111-2222');
INSERT INTO seller (seller_id, seller_address, seller_phone) VALUES ('seller02', '대구시 수성구', '010-2222-3333');
INSERT INTO seller (seller_id, seller_address, seller_phone) VALUES ('seller03', '광주시 서구', '010-3333-4444');

-- cate
INSERT INTO cate VALUES (10, '하의', NULL);
INSERT INTO cate VALUES (20, '상의', NULL);
INSERT INTO cate VALUES (30, '신발', NULL);
-- product
INSERT INTO product (product_name,product_img_main,product_price,product_qtt,cate_no,seller_id) 
VALUES ('쿨링 와이드 팬츠', 'p1.jpg', 25000, 100, 10, 'seller01');
INSERT INTO product (product_name,product_img_main,product_price,product_qtt,cate_no,seller_id) 
VALUES ('오버핏 반팔 티셔츠', 't1.jpg', 18000, 150, 20, 'seller02');
INSERT INTO product (product_name,product_img_main,product_price,product_qtt,cate_no,seller_id) 
VALUES ('데일리 운동화', 's1.jpg', 49000, 80, 30, 'seller03');
-- product_img_table
INSERT INTO product_img_table VALUES (0, 1, 'pants_detail1.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 2, 'tshirt_detail1.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 3, 'shoes_detail1.jpg', NOW(), NOW());
-- cart
INSERT INTO cart VALUES (0, 'id01', 1, 2, NOW(), NOW());
INSERT INTO cart VALUES (0, 'id01', 2, 1, NOW(), NOW());
INSERT INTO cart VALUES (0, 'id02', 3, 1, NOW(), NOW());
-- fav
INSERT INTO fav VALUES (0, 'id01', 3, NOW());
INSERT INTO fav VALUES (0, 'id01', 2, NOW());
INSERT INTO fav VALUES (0, 'id02', 1, NOW());
INSERT INTO fav VALUES (0, 'id03', 2, NOW());
-- order_status
INSERT INTO order_status VALUES (1, '주문접수', NOW(), NOW());
INSERT INTO order_status VALUES (2, '결제완료', NOW(), NOW());
INSERT INTO order_status VALUES (3, '배송중', NOW(), NOW());
-- order_payment_info
INSERT INTO order_payment_info VALUES (0, 2, 68000, 1, NOW());
INSERT INTO order_payment_info VALUES (0, 2, 49000, 1, NOW());
-- order_purchase
INSERT INTO order_purchase VALUES (0, 'id01', 1, NOW(), 2, 68000, '서울시 강남구');
INSERT INTO order_purchase VALUES (0, 'id02', 2, NOW(), 2, 49000, '부산시 해운대구');
-- order_info
INSERT INTO order_info VALUES (0, 1, 1, 2, 50000);
INSERT INTO order_info VALUES (0, 1, 2, 1, 18000);
INSERT INTO order_info VALUES (0, 2, 3, 1, 49000);
-- delivery_info
INSERT INTO delivery_info VALUES (0, 1, '이말숙', '서울시 강남구', '010-1234-5678', NULL, NULL);
INSERT INTO delivery_info VALUES (0, 2, '김말숙', '부산시 해운대구', '010-2345-6789', NULL, NULL);
-- review
INSERT INTO review VALUES (0, 'id01', 1, '바지가 시원하고 편해요!', 4.5, NOW(), NOW());
INSERT INTO review VALUES (0, 'id02', 3, '신발 디자인이 예쁩니다.', 5.0, NOW(), NOW());

-- review_img
INSERT INTO review_img VALUES (0, 1, 'review_pants.jpg', NOW(), NOW());
-- qna
INSERT INTO qna VALUES (0, 1, NULL, 1, 'id01', '이 제품 사이즈는 정사이즈인가요?', NOW(), NOW());
INSERT INTO qna VALUES (0, 3, NULL, 2, 'id02', '다른 색상은 없나요?', NOW(), NOW());
INSERT INTO qna VALUES (0, 1, 1, NULL, 'seller01', '네 고객님, 정사이즈로 나왔습니다.', NOW(), NOW());
-- reliable_table
INSERT INTO reliable_table VALUES (1, 0.0, 4.0, '낮음', NOW(), NOW());
INSERT INTO reliable_table VALUES (2, 4.1, 7.0, '중간', NOW(), NOW());
INSERT INTO reliable_table VALUES (3, 7.1, 10.0, '높음', NOW(), NOW());
