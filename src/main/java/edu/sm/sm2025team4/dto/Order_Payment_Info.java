package edu.sm.sm2025team4.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Order_Payment_Info {
//    결제 정보 ID. 자동생성 PK
    private int payment_id;
//    상태 ID. FK
    private int status_id;
//    상태 정보. order_status 테이블에서 JOIN으로 가져옴
    private String status_info;
//    결제해야할 금액
    private int payment_price;
//    결제한 금액. 기본값 0
    private int payment_fullfil;
//    결제 완료 시점. 기본값 NULL
    private int payment_done_date;
}
