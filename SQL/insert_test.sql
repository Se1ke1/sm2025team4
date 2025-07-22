-- cust
insert into cust values ('id01','pwd01','이말숙',now(),now());
insert into cust values ('id02','pwd02','김말숙',now(),now());
insert into cust values ('id03','pwd03','황말숙',now(),now());
insert into cust values ('admin','pwd01','관리자',now(),now());

-- cate
insert into cate values(10,'하의');
insert into cate values(20,'상의');
insert into cate values(30,'신발');

-- cart
insert into cart values(0, 'id01', 1000, 5, now());
insert into cart values(0, 'id01', 1001, 2, now());
insert into cart values(0, 'id02', 1002, 1, now());

INSERT INTO cust_info VALUES (1, 'id01', '이말숙', '서울시 강남구', '010-1234-5678');
INSERT INTO cust_info VALUES (2, 'id02', '김말숙', '부산시 해운대구', '010-2345-6789');
INSERT INTO cust_info VALUES (3, 'id03', '황말숙', '인천시 남동구', '010-3456-7890');

INSERT INTO seller VALUES ('seller01', 'spwd01', '판매자A', '010-1111-2222', '서울시 마포구', NOW(), NOW());
INSERT INTO seller VALUES ('seller02', 'spwd02', '판매자B', '010-2222-3333', '대구시 수성구', NOW(), NOW());
INSERT INTO seller VALUES ('seller03', 'spwd03', '판매자C', '010-3333-4444', '광주시 서구', NOW(), NOW());

INSERT INTO product_img_table VALUES (1, 'img1.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (2, 'img2.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (3, 'img3.jpg', NOW(), NOW());

INSERT INTO qna VALUES (1, 1, NULL, NULL, 'id01', '이 제품 사이즈는 어때요?', NOW(), NOW());
INSERT INTO qna VALUES (2, 2, NULL, NULL, 'id02', '배송은 언제 되나요?', NOW(), NOW());
INSERT INTO qna VALUES (3, 3, NULL, NULL, 'id03', '환불 정책은?', NOW(), NOW());

INSERT INTO fav VALUES (1, 'id01', 1, NOW());
INSERT INTO fav VALUES (2, 'id02', 2, NOW());
INSERT INTO fav VALUES (3, 'id03', 3, NOW());

INSERT INTO order_status VALUES (1, '주문접수', NOW(), NOW());
INSERT INTO order_status VALUES (2, '배송중', NOW(), NOW());
INSERT INTO order_status VALUES (3, '배송완료', NOW(), NOW());

INSERT INTO order_payment_info VALUES (1, 1, 10000, 1, NOW());
INSERT INTO order_payment_info VALUES (2, 2, 20000, 1, NOW());
INSERT INTO order_payment_info VALUES (3, 3, 30000, 1, NOW());

INSERT INTO reliable_table VALUES (1, 0.0, 4.0, '낮음', NOW(), NOW());
INSERT INTO reliable_table VALUES (2, 4.1, 7.0, '중간', NOW(), NOW());
INSERT INTO reliable_table VALUES (3, 7.1, 10.0, '높음', NOW(), NOW());

INSERT INTO order_purchase VALUES (1, 'id01', 1, NOW(), 1, 10000, '서울시 강남구');
INSERT INTO order_purchase VALUES (2, 'id02', 2, NOW(), 2, 20000, '부산시 해운대구');
INSERT INTO order_purchase VALUES (3, 'id03', 3, NOW(), 3, 30000, '인천시 남동구');

INSERT INTO order_info VALUES (1, 1, 2, 20000);
INSERT INTO order_info VALUES (2, 2, 1, 20000);
INSERT INTO order_info VALUES (3, 3, 3, 90000);

INSERT INTO review VALUES (1, 'id01', 1, '좋아요!', 4.5, NOW(), NOW());
INSERT INTO review VALUES (2, 'id02', 2, '가격대비 만족', 4.0, NOW(), NOW());
INSERT INTO review VALUES (3, 'id03', 3, '추천합니다', 5.0, NOW(), NOW());
