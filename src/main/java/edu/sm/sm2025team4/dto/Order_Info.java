package edu.sm.sm2025team4.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Order_Info {
//    주문 세부 정보 개별 ID. 자동 생성 PK
    private int order_info_id;
//    주문 정보 ID. FK
    private int order_id;
//    상품 정보 ID. FK
    private int product_id;
//    상품 개수 스냅샷
    private int order_prod_qtt;
//    상품 가격 스냅샷
    private int order_prod_price;
//    상품명
    private String order_prod_name;
//    상품 대표 이미지
    private String order_prod_img;
}
