package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Delivery_Info {
//    배송 ID. 자동생성 PK
    private int delivery_id;
//    주문 ID. FK
    private int order_id;
//    수신인 이름
    private String delivery_name;
//    수신자 주소
    private String delivery_address;
//    수신자 전화번호
    private String delivery_phone;
//    배송 시작일. 기본값 now()
    private Timestamp delivery_startdate;
//    배송 종료일. 기본값 NULL
    private Timestamp delivery_enddate;
}
