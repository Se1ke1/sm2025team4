package edu.sm.sm2025team4.dto;

import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class Review {
    private int review_no;
    private String cust_id;
    private int product_id;
    private String review_article;
    private float review_score;
    private Timestamp review_regdate;
    private Timestamp review_update;
}
