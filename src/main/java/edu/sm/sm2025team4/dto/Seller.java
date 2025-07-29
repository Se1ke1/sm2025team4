package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Seller {
//    판매자 ID. PK(=cust_id)
    private String seller_id;
//    판매자 이름 (cust에서 JOIN으로 가져온 값)
    private String seller_name;
//    판매자 전화번호
    private String seller_phone;
//    판매자 주소
    private String seller_address;
//    판매자 신뢰도(신뢰도 테이블과 JOIN 연산)
    private int seller_reliable_rate;
//    판매자 신뢰도 명칭
    private String seller_reliable;
//    정보 등록일
    private Timestamp seller_regdate;
//    정보 수정일
    private Timestamp seller_update;
}
