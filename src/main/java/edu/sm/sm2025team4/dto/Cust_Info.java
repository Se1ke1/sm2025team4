package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Cust_Info {
//    주소록 ID. 자동생성 PK
    private int custinfo_no;
//    사용자 ID. FK
    private String cust_id;
//    주소록 이름.
    private String custinfo_name;
//    고객 주소
    private String custinfo_addr;
//    고객 전화번호
    private String custinfo_phone;
//    주소록 등록일자
    private Timestamp custinfo_regdate;
//    주소록 갱신일자
    private Timestamp custinfo_update;
}
