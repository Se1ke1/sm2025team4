package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Order_Purchase {
//    주문 ID. 자동생성 PK
    private int order_id;
//    주문자 ID. FK
    private String cust_id;
//    결제 정보 ID. FK
    private int payment_id;
//    주문 등록 일자
    private Timestamp order_placedate;
//    주문 상태 ID. FK
    private int status_id;
//    주문 상태 정보. order_status 테이블에서 JOIN으로 가져옴
    private String status_desc;
//    주문 총 가격.
    private int  order_price;
//    배송 목적지
    private String delivery_address;
}
