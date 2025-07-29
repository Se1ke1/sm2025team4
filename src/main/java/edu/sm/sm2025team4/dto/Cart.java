package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Cart {
//    장바구니 ID. 자동생성 PK
    private int cart_id;
//    사용자 ID. FK
    private String cust_id;
//    상품 ID. FK
    private int product_id;
//    구매 희망 개수
    private int cart_qtt;
//    장바구니 등록일
    private Timestamp cust_regdate;
//    장바구니 갱신일
    private Timestamp cust_update;
//    상품명
    private String product_name;
//    상품 가격
    private int product_price;
//    상품 대표 사진
    private String product_img_main;
//    장바구니 가격 소계 (상품가격 * 구매 희망 개수)
    private int cart_price;
}
