package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Getter
@Setter
@ToString
@Builder
public class QnA {
    private int qna_no;
    private int product_id;
    private int qna_upper_no;
    private int order_id;
    private String cust_id;
    private String qna_article;
    private Timestamp qna_regdate;
    private Timestamp qna_update;
}
