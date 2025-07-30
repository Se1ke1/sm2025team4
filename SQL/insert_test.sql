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
INSERT INTO product VALUES (0, '쿨링 와이드 팬츠', 'p1.jpg', 25000, 100, NOW(), NOW(), 10, 'seller01');
INSERT INTO product VALUES (0, '플레인 연청 워싱진', 'p2.jpg', 20000, 130, NOW(), NOW(), 10, 'seller01');
INSERT INTO product VALUES (0, '중청 제님 청바지', 'p3.jpg', 30000, 120, NOW(), NOW(), 10, 'seller02');
INSERT INTO product VALUES (0, '코튼 커브드 투턱 뒤밴딩 팬츠', 'p4.jpg', 15000, 40, NOW(), NOW(), 10, 'seller03');
INSERT INTO product VALUES (0, '원턱 와이드팬츠', 'p5.jpg', 50000, 10, NOW(), NOW(), 10, 'seller04');

INSERT INTO product VALUES (0, '오버핏 반팔 티셔츠', 't1.jpg', 18000, 160, NOW(), NOW(), 20, 'seller02');
INSERT INTO product VALUES (0, '플로리다 캠퍼스 그래픽 반팔', 't2.jpg', 21000, 50, NOW(), NOW(), 20, 'seller02');
INSERT INTO product VALUES (0, '빅로고 레귤러핏 반팔티셔츠', 't3.jpg', 19000, 170, NOW(), NOW(), 20, 'seller01');
INSERT INTO product VALUES (0, '솔리드 후드티 오버핏', 't4.jpg', 50000, 19, NOW(), NOW(), 20, 'seller04');
INSERT INTO product VALUES (0, '헤비 블렌디 블랙 후드티', 't5.jpg', 45000, 15, NOW(), NOW(), 20, 'seller03');

INSERT INTO product VALUES (0, '데일리 운동화', 's1.jpg', 49000, 10, NOW(), NOW(), 30, 'seller03');
INSERT INTO product VALUES (0, '에어포스 1 로우', 's2.jpg', 50000, 40, NOW(), NOW(), 30, 'seller02');
INSERT INTO product VALUES (0, 'SUPERSTAR 런닝화 아디다스 스니커즈', 's3.jpg', 85000, 30, NOW(), NOW(), 30, 'seller02');
INSERT INTO product VALUES (0, '내셔널지오그래픽 도러블 스니커즈 BLACK', 's4.jpg', 69000, 40, NOW(), NOW(), 30, 'seller01');
INSERT INTO product VALUES (0, '뉴비 스니커즈 WHITE', 's5.jpg', 45000, 80, NOW(), NOW(), 30, 'seller04');

-- product_img_table
INSERT INTO product_img_table VALUES (0, 1, 'https://superwhale.co.kr/web/upload/NNEditor/20240322/EC9980ED8E9CECB0B0EB9E91EC9980EC9DB4EB939CEBB094ECA780.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 2, 'https://superwhale.co.kr/web/upload/NNEditor/20240322/EC9980ED8E9CECB0B0EB9E91EC9980EC9DB4EB939CEBB094ECA780.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 3, 'https://superwhale.co.kr/web/upload/NNEditor/20240322/EC9980ED8E9CECB0B0EB9E91EC9980EC9DB4EB939CEBB094ECA780.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 4, 'https://superwhale.co.kr/web/upload/NNEditor/20240322/EC9980ED8E9CECB0B0EB9E91EC9980EC9DB4EB939CEBB094ECA780.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 5, 'https://superwhale.co.kr/web/upload/NNEditor/20240322/EC9980ED8E9CECB0B0EB9E91EC9980EC9DB4EB939CEBB094ECA780.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 6, 'https://item.elandrs.com/r/image/item/2024-08-06/dcfcd56f-a917-4343-bed4-fe011e2a96a8.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 7, 'https://item.elandrs.com/r/image/item/2024-08-06/dcfcd56f-a917-4343-bed4-fe011e2a96a8.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 8, 'https://item.elandrs.com/r/image/item/2024-08-06/dcfcd56f-a917-4343-bed4-fe011e2a96a8.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 9, 'https://item.elandrs.com/r/image/item/2024-08-06/dcfcd56f-a917-4343-bed4-fe011e2a96a8.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 10, 'https://item.elandrs.com/r/image/item/2024-08-06/dcfcd56f-a917-4343-bed4-fe011e2a96a8.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 11, 'https://gi.esmplus.com/mmsfns/kms/update/230215_mk_02-sp.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 12, 'https://gi.esmplus.com/mmsfns/kms/update/230215_mk_02-sp.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 13, 'https://gi.esmplus.com/mmsfns/kms/update/230215_mk_02-sp.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 14, 'https://gi.esmplus.com/mmsfns/kms/update/230215_mk_02-sp.jpg', NOW(), NOW());
INSERT INTO product_img_table VALUES (0, 15, 'https://gi.esmplus.com/mmsfns/kms/update/230215_mk_02-sp.jpg', NOW(), NOW());
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
INSERT INTO order_purchase (cust_id,payment_id,status_id,order_price,delivery_name,delivery_address,delivery_phone)
VALUES ('id01',1, 0, 68000,'이말숙','서울시 강남구','010-1234-5678');
INSERT INTO order_purchase (cust_id,payment_id,status_id,order_price,delivery_name,delivery_address,delivery_phone)
VALUES ('id02',2, 1, 49000,'김말숙','부산시 해운대구','010-2345-6789');
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
INSERT INTO qna (product_id,qna_upper_no,cust_id,qna_article) VALUES (1, NULL,'id01', '이 제품 사이즈는 정사이즈인가요?');
INSERT INTO qna (product_id,qna_upper_no,cust_id,qna_article) VALUES (3, NULL,'id02', '다른 색상은 없나요?');
INSERT INTO qna (product_id,qna_upper_no,cust_id,qna_article) VALUES (1, NULL, 'seller01', '네 고객님, 정사이즈로 나왔습니다.');
-- reliable_table
INSERT INTO reliable_table VALUES (1, 0.0, 4.0, '낮음', NOW(), NOW());
INSERT INTO reliable_table VALUES (2, 4.1, 7.0, '중간', NOW(), NOW());
INSERT INTO reliable_table VALUES (3, 7.1, 10.0, '높음', NOW(), NOW());
