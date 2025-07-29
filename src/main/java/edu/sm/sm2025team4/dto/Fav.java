package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Fav {
//    관심상품 ID. 자동 생성 PK
    private int fav_id;
//    사용자 ID. FK
    private String cust_id;
//    상품 ID. FK
    private int product_id;
//    관심상품 등록일
    private Timestamp fav_update;
//    상품명
    private String product_name;
//    상품 대표 사진
    private String product_img_main;
//    상품 가격
    private int product_price;
}
