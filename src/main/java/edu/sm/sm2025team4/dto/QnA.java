package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class QnA {
//    QnA 번호. 자동생성 PK
    private int qna_no;
//    상품 ID. FK
    private int product_id;
//    상위 QnA 번호(SELF JOIN)
    private int qna_upper_no;
//    사용자 ID
    private String cust_id;
//    QnA 내용
    private String qna_article;
//    QnA 등록일
    private Timestamp qna_regdate;
//    QnA 수정일
    private Timestamp qna_update;
}
