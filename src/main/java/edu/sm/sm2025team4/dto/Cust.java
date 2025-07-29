package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
// 모든 사용자의 로그인 데이터를 관리하는데 사용됨
// 관리자 및 판매자는 별도 테이블과 JOIN 하여 유저타입 결정자를 변동하는 것으로 구분할 것
public class Cust {
//    사용자 ID
    private String cust_id;
//    사용자 비밀번호
    private String cust_pwd;
//    사용자 이름
    private String cust_name;
//    정보 등록일
    private Timestamp cust_regdate;
//    정보 수정일
    private Timestamp cust_update;
//    유저 타입 결정자 (seller 테이블과 JOIN 연산으로 가져옴)
    private String user_type;
}
